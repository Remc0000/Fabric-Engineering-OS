[CmdletBinding()]
param(
    [string]$RepositoryRoot = (Resolve-Path (Join-Path $PSScriptRoot "..\..")),
    [string]$ManifestPath = (Join-Path $RepositoryRoot "metadata\os-catalog.json"),
    [string]$FreshnessManifestPath = (Join-Path $RepositoryRoot "metadata\guidance-freshness.json")
)

$ErrorActionPreference = "Stop"
$failures = [System.Collections.Generic.List[string]]::new()
$allowedTypes = @("capability", "pattern", "golden-path", "reference-architecture", "agent-bundle")
$allowedStatuses = @("preview", "stable", "deprecated")
$requiredRootProperties = @("schemaVersion", "entries")
$allowedRootProperties = @('$schema', "schemaVersion", "entries")
$requiredEntryProperties = @("id", "type", "title", "status", "path", "dependencies", "related")
$allowedEntryProperties = @("id", "type", "title", "status", "path", "dependencies", "related", "freshnessRef", "extensions")
$idPattern = "^(capability|pattern|golden-path|reference-architecture|agent-bundle):[a-z0-9]+(?:-[a-z0-9]+)*$"
$pathPattern = "^(capabilities|patterns|golden-paths|reference-architectures)/[a-z0-9][a-z0-9-]*\.md$|^agent-bundles/[a-z0-9][a-z0-9-]*/charter\.md$"
$extensionPattern = "^[a-z][a-z0-9]*(?:\.[a-z0-9-]+)+$"
$seenIds = [System.Collections.Generic.HashSet[string]]::new([StringComparer]::Ordinal)
$seenPaths = [System.Collections.Generic.HashSet[string]]::new([StringComparer]::Ordinal)
$entriesById = @{}

function Read-JsonObject {
    param(
        [string]$Path,
        [string]$Description
    )

    if (-not (Test-Path $Path -PathType Leaf)) {
        throw "Missing ${Description}: $Path"
    }

    try {
        $document = Get-Content $Path -Raw | ConvertFrom-Json -Depth 30
    }
    catch {
        throw "Invalid ${Description} JSON: $($_.Exception.Message)"
    }

    if ($null -eq $document -or $document -isnot [pscustomobject]) {
        throw "$Description root must be a JSON object"
    }
    return $document
}

function Test-PathContainsLink {
    param(
        [string]$RootPath,
        [string]$RelativePath
    )

    $currentPath = $RootPath
    foreach ($segment in $RelativePath.Split([IO.Path]::DirectorySeparatorChar, [StringSplitOptions]::RemoveEmptyEntries)) {
        $currentPath = Join-Path $currentPath $segment
        $item = Get-Item -LiteralPath $currentPath -Force -ErrorAction SilentlyContinue
        if (
            $null -ne $item -and (
                ($item.Attributes -band [IO.FileAttributes]::ReparsePoint) -ne 0 -or
                -not [string]::IsNullOrWhiteSpace([string]$item.LinkType)
            )
        ) {
            return $true
        }
    }
    return $false
}

try {
    $manifest = Read-JsonObject -Path $ManifestPath -Description "OS catalog"
    $freshnessManifest = Read-JsonObject -Path $FreshnessManifestPath -Description "guidance freshness manifest"
}
catch {
    Write-Host "::error::$($_.Exception.Message)"
    exit 1
}

if ($manifest.schemaVersion -isnot [string] -or $manifest.schemaVersion -cne "1.0.0") {
    $failures.Add("Unsupported OS catalog schemaVersion: $($manifest.schemaVersion)")
}

$rootProperties = @($manifest.PSObject.Properties.Name)
foreach ($property in $requiredRootProperties) {
    if ($rootProperties -notcontains $property) {
        $failures.Add("Missing required OS catalog root property: $property")
    }
}
foreach ($property in $rootProperties) {
    if ($allowedRootProperties -notcontains $property) {
        $failures.Add("Unsupported OS catalog root property: $property")
    }
}
if ($rootProperties -contains '$schema' -and $manifest.'$schema' -isnot [string]) {
    $failures.Add("OS catalog `$schema must be a JSON string")
}

$entriesAreArray = $manifest.entries -is [System.Array]
if (-not $entriesAreArray) {
    $failures.Add("OS catalog entries must be a JSON array")
}
$entries = if ($entriesAreArray) { @($manifest.entries) } else { @() }
if ($entries.Count -eq 0) {
    $failures.Add("OS catalog must contain at least one entry")
}

$freshnessPaths = [System.Collections.Generic.HashSet[string]]::new([StringComparer]::Ordinal)
if ($freshnessManifest.entries -isnot [System.Array]) {
    $failures.Add("Guidance freshness entries must be a JSON array before catalog references can be validated")
}
else {
    foreach ($freshnessEntry in $freshnessManifest.entries) {
        if (-not [string]::IsNullOrWhiteSpace([string]$freshnessEntry.path)) {
            $null = $freshnessPaths.Add([string]$freshnessEntry.path)
        }
    }
}

$repositoryPath = [IO.Path]::GetFullPath($RepositoryRoot)
$repositoryPrefix = $repositoryPath.TrimEnd([IO.Path]::DirectorySeparatorChar) + [IO.Path]::DirectorySeparatorChar
$pathComparison = if ($IsWindows) { [StringComparison]::OrdinalIgnoreCase } else { [StringComparison]::Ordinal }

foreach ($entry in $entries) {
    if ($null -eq $entry -or $entry -isnot [pscustomobject]) {
        $failures.Add("Every OS catalog entry must be a JSON object")
        continue
    }

    $entryProperties = @($entry.PSObject.Properties.Name)
    foreach ($property in $requiredEntryProperties) {
        if ($entryProperties -notcontains $property) {
            $failures.Add("Missing required OS catalog property '$property'")
        }
    }
    foreach ($property in $entryProperties) {
        if ($allowedEntryProperties -notcontains $property) {
            $failures.Add("Unsupported OS catalog entry property: $property")
        }
    }

    $idIsString = $entry.id -is [string]
    $typeIsString = $entry.type -is [string]
    $pathIsString = $entry.path -is [string]
    $id = if ($idIsString) { [string]$entry.id } else { "" }
    $type = if ($typeIsString) { [string]$entry.type } else { "" }
    $path = if ($pathIsString) { [string]$entry.path } else { "" }
    if (-not $idIsString) {
        $failures.Add("OS catalog ID must be a JSON string")
    }
    if ($id -cnotmatch $idPattern) {
        $failures.Add("Invalid OS catalog ID: $id")
    }
    if (-not $seenIds.Add($id)) {
        $failures.Add("Duplicate OS catalog ID: $id")
    }
    else {
        $entriesById[$id] = $entry
    }

    if (-not $typeIsString) {
        $failures.Add("OS catalog type must be a JSON string for: $id")
    }
    if ($allowedTypes -notcontains $type) {
        $failures.Add("Unsupported OS catalog type for ${id}: $type")
    }
    elseif (-not $id.StartsWith("${type}:", [StringComparison]::Ordinal)) {
        $failures.Add("OS catalog ID prefix does not match type for ${id}: $type")
    }

    if ($entry.title -isnot [string] -or [string]::IsNullOrWhiteSpace([string]$entry.title)) {
        $failures.Add("Missing OS catalog title for: $id")
    }
    if ($entry.status -isnot [string]) {
        $failures.Add("OS catalog status must be a JSON string for: $id")
    }
    if ($allowedStatuses -notcontains [string]$entry.status) {
        $failures.Add("Unsupported OS catalog status for ${id}: $($entry.status)")
    }

    if (-not $pathIsString) {
        $failures.Add("OS catalog path must be a JSON string for: $id")
    }
    if ($path -cnotmatch $pathPattern) {
        $failures.Add("Invalid OS catalog path for ${id}: $path")
    }
    if (-not $seenPaths.Add($path)) {
        $failures.Add("Duplicate OS catalog path: $path")
    }

    $expectedPathPrefix = switch ($type) {
        "capability" { "capabilities/" }
        "pattern" { "patterns/" }
        "golden-path" { "golden-paths/" }
        "reference-architecture" { "reference-architectures/" }
        "agent-bundle" { "agent-bundles/" }
        default { $null }
    }
    if ($null -ne $expectedPathPrefix -and -not $path.StartsWith($expectedPathPrefix, [StringComparison]::Ordinal)) {
        $failures.Add("OS catalog path does not match type for ${id}: $path")
    }

    $relativePath = $path.Replace("/", [IO.Path]::DirectorySeparatorChar)
    $resolvedPath = [IO.Path]::GetFullPath([IO.Path]::Combine($repositoryPath, $relativePath))
    if (-not $resolvedPath.StartsWith($repositoryPrefix, $pathComparison)) {
        $failures.Add("OS catalog target escapes RepositoryRoot for ${id}: $path")
    }
    elseif (Test-PathContainsLink -RootPath $repositoryPath -RelativePath $relativePath) {
        $failures.Add("OS catalog target uses a symbolic link or reparse point for ${id}: $path")
    }
    elseif (-not (Test-Path $resolvedPath -PathType Leaf)) {
        $failures.Add("OS catalog target does not exist for ${id}: $path")
    }

    foreach ($arrayProperty in @("dependencies", "related")) {
        $valuesAreArray = $entry.$arrayProperty -is [System.Array]
        if (-not $valuesAreArray) {
            $failures.Add("OS catalog $arrayProperty must be a JSON array for: $id")
            continue
        }
        $seenValues = [System.Collections.Generic.HashSet[string]]::new([StringComparer]::Ordinal)
        foreach ($value in @($entry.$arrayProperty)) {
            if ($value -isnot [string]) {
                $failures.Add("OS catalog $arrayProperty items must be JSON strings for: $id")
                continue
            }
            $relationshipId = [string]$value
            if ($relationshipId -cnotmatch $idPattern) {
                $failures.Add("Invalid $arrayProperty ID for ${id}: $relationshipId")
            }
            if (-not $seenValues.Add($relationshipId)) {
                $failures.Add("Duplicate $arrayProperty ID for ${id}: $relationshipId")
            }
        }
    }

    if ($entryProperties -contains "freshnessRef") {
        if ($entry.freshnessRef -isnot [string]) {
            $failures.Add("OS catalog freshnessRef must be a JSON string for: $id")
        }
        $freshnessRef = if ($entry.freshnessRef -is [string]) { [string]$entry.freshnessRef } else { "" }
        if ($freshnessRef -cne $path) {
            $failures.Add("freshnessRef must match the canonical path for ${id}: $freshnessRef")
        }
        if (-not $freshnessPaths.Contains($freshnessRef)) {
            $failures.Add("Unknown guidance freshness reference for ${id}: $freshnessRef")
        }
    }

    if ($entryProperties -contains "extensions") {
        if ($null -eq $entry.extensions -or $entry.extensions -isnot [pscustomobject]) {
            $failures.Add("OS catalog extensions must be a JSON object for: $id")
        }
        else {
            foreach ($namespace in @($entry.extensions.PSObject.Properties.Name)) {
                if ($namespace -cnotmatch $extensionPattern) {
                    $failures.Add("Invalid OS catalog extension namespace for ${id}: $namespace")
                }
            }
        }
    }
}

foreach ($entry in $entries) {
    if ($null -eq $entry -or $entry -isnot [pscustomobject]) {
        continue
    }
    $id = [string]$entry.id
    if ($entry.dependencies -is [System.Array] -and $entry.related -is [System.Array]) {
        $dependencies = [System.Collections.Generic.HashSet[string]]::new([StringComparer]::Ordinal)
        foreach ($dependency in @($entry.dependencies)) {
            $dependencyId = [string]$dependency
            $null = $dependencies.Add($dependencyId)
            if ($dependencyId -ceq $id) {
                $failures.Add("OS catalog entry cannot depend on itself: $id")
            }
            elseif (-not $entriesById.ContainsKey($dependencyId)) {
                $failures.Add("Unknown dependency ID for ${id}: $dependencyId")
            }
        }
        foreach ($related in @($entry.related)) {
            $relatedId = [string]$related
            if ($relatedId -ceq $id) {
                $failures.Add("OS catalog entry cannot relate to itself: $id")
            }
            elseif (-not $entriesById.ContainsKey($relatedId)) {
                $failures.Add("Unknown related ID for ${id}: $relatedId")
            }
            if ($dependencies.Contains($relatedId)) {
                $failures.Add("OS catalog relationship is both dependency and related for ${id}: $relatedId")
            }
        }
    }
}

$expectedPaths = [System.Collections.Generic.HashSet[string]]::new([StringComparer]::Ordinal)
foreach ($definition in @(
        @{ Directory = "capabilities"; Pattern = "*.md"; Type = "flat" },
        @{ Directory = "patterns"; Pattern = "*.md"; Type = "flat" },
        @{ Directory = "golden-paths"; Pattern = "*.md"; Type = "flat" },
        @{ Directory = "reference-architectures"; Pattern = "*.md"; Type = "flat" }
    )) {
    $directoryPath = Join-Path $repositoryPath $definition.Directory
    foreach ($file in @(Get-ChildItem -LiteralPath $directoryPath -File -Filter $definition.Pattern)) {
        if ($file.Name -cne "README.md") {
            $null = $expectedPaths.Add("$($definition.Directory)/$($file.Name)")
        }
    }
}
$bundleRoot = Join-Path $repositoryPath "agent-bundles"
foreach ($bundleDirectory in @(Get-ChildItem -LiteralPath $bundleRoot -Directory)) {
    if (Test-Path (Join-Path $bundleDirectory.FullName "charter.md") -PathType Leaf) {
        $null = $expectedPaths.Add("agent-bundles/$($bundleDirectory.Name)/charter.md")
    }
}

foreach ($expectedPath in $expectedPaths) {
    if (-not $seenPaths.Contains($expectedPath)) {
        $failures.Add("Canonical OS catalog artifact is not indexed: $expectedPath")
    }
}
foreach ($catalogPath in $seenPaths) {
    if (-not $expectedPaths.Contains($catalogPath)) {
        $failures.Add("OS catalog path is not a canonical catalog artifact: $catalogPath")
    }
}

if ($failures.Count -gt 0) {
    $failures | Sort-Object -Unique | ForEach-Object { Write-Host "::error::$_" }
    exit 1
}

Write-Host "Validated $($entries.Count) OS catalog entries across $($allowedTypes.Count) catalog types."
