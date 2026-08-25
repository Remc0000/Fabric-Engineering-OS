[CmdletBinding()]
param(
    [string]$RepositoryRoot = (Resolve-Path (Join-Path $PSScriptRoot "..\..")),
    [string]$ManifestPath = (Join-Path $RepositoryRoot "metadata\guidance-freshness.json"),
    [datetime]$AsOfDate = (Get-Date).Date
)

$ErrorActionPreference = "Stop"
$failures = [System.Collections.Generic.List[string]]::new()
$allowedContentTypes = @("capability", "pattern", "golden-path", "reference-architecture")
$allowedStatuses = @("preview", "stable", "deprecated")
$requiredRootProperties = @("schemaVersion", "entries")
$allowedRootProperties = @('$schema', "schemaVersion", "entries")
$requiredEntryProperties = @("path", "contentType", "status", "owner", "lastValidated", "reviewBy", "sources")
$seenPaths = [System.Collections.Generic.HashSet[string]]::new([StringComparer]::OrdinalIgnoreCase)

if (-not (Test-Path $ManifestPath -PathType Leaf)) {
    Write-Host "::error::Missing guidance freshness manifest: $ManifestPath"
    exit 1
}

try {
    $manifest = Get-Content $ManifestPath -Raw | ConvertFrom-Json -Depth 20
}
catch {
    Write-Host "::error::Invalid guidance freshness JSON: $($_.Exception.Message)"
    exit 1
}

if ($manifest.schemaVersion -ne "1.0.0") {
    $failures.Add("Unsupported guidance freshness schemaVersion: $($manifest.schemaVersion)")
}

$rootProperties = @($manifest.PSObject.Properties.Name)
foreach ($property in $requiredRootProperties) {
    if ($rootProperties -notcontains $property) {
        $failures.Add("Missing required guidance freshness root property: $property")
    }
}
foreach ($property in $rootProperties) {
    if ($allowedRootProperties -notcontains $property) {
        $failures.Add("Unsupported guidance freshness root property: $property")
    }
}

$entriesAreArray = $manifest.entries -is [System.Array]
if (-not $entriesAreArray) {
    $failures.Add("Guidance freshness entries must be a JSON array")
}
$entries = if ($entriesAreArray) { @($manifest.entries) } else { @() }
if ($entries.Count -eq 0) {
    $failures.Add("Guidance freshness manifest must contain at least one entry")
}

$reviewDueCount = 0
foreach ($entry in $entries) {
    $entryProperties = @($entry.PSObject.Properties.Name)
    foreach ($property in $requiredEntryProperties) {
        if ($entryProperties -notcontains $property) {
            $failures.Add("Missing required guidance freshness property '$property'")
        }
    }
    foreach ($property in $entryProperties) {
        if ($requiredEntryProperties -notcontains $property) {
            $failures.Add("Unsupported guidance freshness entry property: $property")
        }
    }

    $path = [string]$entry.path
    if ([string]::IsNullOrWhiteSpace($path)) {
        $failures.Add("Guidance freshness entry has an empty path")
        continue
    }
    if ($path -notmatch "^(capabilities|patterns|golden-paths|reference-architectures)/[A-Za-z0-9][A-Za-z0-9._-]*\.md$") {
        $failures.Add("Unsupported guidance freshness path format: $path")
    }

    if (-not $seenPaths.Add($path)) {
        $failures.Add("Duplicate guidance freshness path: $path")
    }

    $expectedPrefix = switch ([string]$entry.contentType) {
        "capability" { "capabilities/" }
        "pattern" { "patterns/" }
        "golden-path" { "golden-paths/" }
        "reference-architecture" { "reference-architectures/" }
        default { $null }
    }

    if ($allowedContentTypes -notcontains [string]$entry.contentType) {
        $failures.Add("Unsupported contentType for ${path}: $($entry.contentType)")
    }
    elseif (-not $path.StartsWith($expectedPrefix, [StringComparison]::OrdinalIgnoreCase)) {
        $failures.Add("Path does not match contentType for ${path}: $($entry.contentType)")
    }

    if ($allowedStatuses -notcontains [string]$entry.status) {
        $failures.Add("Unsupported status for ${path}: $($entry.status)")
    }

    if ([string]::IsNullOrWhiteSpace([string]$entry.owner)) {
        $failures.Add("Missing owner for guidance freshness path: $path")
    }

    $relativePath = $path.Replace("/", [IO.Path]::DirectorySeparatorChar)
    $resolvedPath = [IO.Path]::GetFullPath([IO.Path]::Combine($RepositoryRoot, $relativePath))
    if ($null -ne $expectedPrefix) {
        $expectedDirectory = [IO.Path]::GetFullPath(
            [IO.Path]::Combine($RepositoryRoot, $expectedPrefix.TrimEnd("/"))
        )
        if ([IO.Path]::GetDirectoryName($resolvedPath) -ne $expectedDirectory) {
            $failures.Add("Guidance freshness target escapes its content directory: $path")
        }
    }
    if (-not (Test-Path $resolvedPath -PathType Leaf)) {
        $failures.Add("Guidance freshness target does not exist: $path")
    }

    $lastValidated = [datetime]::MinValue
    $reviewBy = [datetime]::MinValue
    $validLastValidated = [datetime]::TryParseExact(
        [string]$entry.lastValidated,
        "yyyy-MM-dd",
        [Globalization.CultureInfo]::InvariantCulture,
        [Globalization.DateTimeStyles]::None,
        [ref]$lastValidated
    )
    $validReviewBy = [datetime]::TryParseExact(
        [string]$entry.reviewBy,
        "yyyy-MM-dd",
        [Globalization.CultureInfo]::InvariantCulture,
        [Globalization.DateTimeStyles]::None,
        [ref]$reviewBy
    )

    if (-not $validLastValidated) {
        $failures.Add("Invalid lastValidated date for ${path}: $($entry.lastValidated)")
    }
    if (-not $validReviewBy) {
        $failures.Add("Invalid reviewBy date for ${path}: $($entry.reviewBy)")
    }
    if ($validLastValidated -and $lastValidated.Date -gt $AsOfDate.Date) {
        $failures.Add("lastValidated is in the future for guidance freshness path: $path")
    }
    if ($validLastValidated -and $validReviewBy -and $reviewBy -lt $lastValidated) {
        $failures.Add("reviewBy precedes lastValidated for guidance freshness path: $path")
    }
    if ($validReviewBy -and $reviewBy.Date -lt $AsOfDate.Date) {
        $reviewDueCount++
        Write-Host "::warning file=$path::Guidance review overdue since $($reviewBy.ToString('yyyy-MM-dd')); Microsoft Learn remains authoritative"
    }

    $sourcesAreArray = $entry.sources -is [System.Array]
    if (-not $sourcesAreArray) {
        $failures.Add("Microsoft Learn sources must be a JSON array for guidance freshness path: $path")
    }
    $sources = if ($sourcesAreArray) { @($entry.sources) } else { @() }
    if ($sources.Count -eq 0) {
        $failures.Add("Missing Microsoft Learn source for guidance freshness path: $path")
    }
    $seenSources = [System.Collections.Generic.HashSet[string]]::new([StringComparer]::OrdinalIgnoreCase)
    foreach ($source in $sources) {
        if (-not $seenSources.Add([string]$source)) {
            $failures.Add("Duplicate Microsoft Learn source for ${path}: $source")
        }
        $sourceUri = $null
        if (
            -not [uri]::TryCreate([string]$source, [UriKind]::Absolute, [ref]$sourceUri) -or
            $sourceUri.Scheme -ne "https" -or
            $sourceUri.Host -ne "learn.microsoft.com"
        ) {
            $failures.Add("Invalid Microsoft Learn source for ${path}: $source")
        }
    }
}

if ($failures.Count -gt 0) {
    $failures | Sort-Object -Unique | ForEach-Object { Write-Host "::error::$_" }
    exit 1
}

Write-Host "Validated $($entries.Count) guidance freshness entries; $reviewDueCount review(s) overdue."
