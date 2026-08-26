[CmdletBinding()]
param(
    [string]$RepositoryRoot = (Resolve-Path (Join-Path $PSScriptRoot "..\.."))
)

$ErrorActionPreference = "Stop"
$validator = Join-Path $PSScriptRoot "validate-os-catalog.ps1"
$canonicalManifest = Join-Path $RepositoryRoot "metadata\os-catalog.json"
$testRoot = Join-Path $RepositoryRoot ".test-artifacts\os-catalog"

function Copy-Catalog {
    return (Get-Content $canonicalManifest -Raw | ConvertFrom-Json -Depth 30)
}

function Assert-InvalidCatalog {
    param(
        [string]$Name,
        [scriptblock]$Mutate,
        [string]$ExpectedError
    )

    $catalog = Copy-Catalog
    & $Mutate $catalog
    $fixturePath = Join-Path $testRoot "$Name.json"
    [IO.File]::WriteAllText(
        $fixturePath,
        ($catalog | ConvertTo-Json -Depth 30),
        [Text.UTF8Encoding]::new($false)
    )
    $output = & pwsh -NoProfile -File $validator `
        -RepositoryRoot $RepositoryRoot `
        -ManifestPath $fixturePath 2>&1 | Out-String
    if ($LASTEXITCODE -eq 0 -or $output -notmatch [regex]::Escape($ExpectedError)) {
        throw "Invalid OS catalog case '$Name' did not report '$ExpectedError'. Output: $output"
    }
}

try {
    if (Test-Path $testRoot) {
        Remove-Item -LiteralPath $testRoot -Recurse -Force
    }
    [IO.Directory]::CreateDirectory($testRoot) | Out-Null

    $validOutput = & pwsh -NoProfile -File $validator -RepositoryRoot $RepositoryRoot 2>&1 | Out-String
    if ($LASTEXITCODE -ne 0 -or $validOutput -notmatch "Validated \d+ OS catalog entries") {
        throw "Canonical OS catalog failed validation. Output: $validOutput"
    }

    Assert-InvalidCatalog -Name "duplicate-id" -ExpectedError "Duplicate OS catalog ID" -Mutate {
        param($catalog)
        $catalog.entries[1].id = $catalog.entries[0].id
    }
    Assert-InvalidCatalog -Name "array-schema-version" -ExpectedError "Unsupported OS catalog schemaVersion" -Mutate {
        param($catalog)
        $catalog.schemaVersion = @("1.0.0")
    }
    Assert-InvalidCatalog -Name "unknown-type" -ExpectedError "Unsupported OS catalog type" -Mutate {
        param($catalog)
        $catalog.entries[0].type = "unknown"
    }
    Assert-InvalidCatalog -Name "numeric-title" -ExpectedError "Missing OS catalog title" -Mutate {
        param($catalog)
        $catalog.entries[0].title = 123
    }
    Assert-InvalidCatalog -Name "array-id" -ExpectedError "OS catalog ID must be a JSON string" -Mutate {
        param($catalog)
        $catalog.entries[0].id = @("capability:activator")
    }
    Assert-InvalidCatalog -Name "broken-target" -ExpectedError "OS catalog target does not exist" -Mutate {
        param($catalog)
        $catalog.entries[0].path = "capabilities/not-a-real-capability.md"
    }
    Assert-InvalidCatalog -Name "invalid-relationship" -ExpectedError "Unknown related ID" -Mutate {
        param($catalog)
        $catalog.entries[0].related = @("capability:not-real")
    }
    Assert-InvalidCatalog -Name "scalar-relationship" -ExpectedError "OS catalog related must be a JSON array" -Mutate {
        param($catalog)
        $catalog.entries[0].related = "capability:eventstream"
    }
    Assert-InvalidCatalog -Name "array-relationship-item" -ExpectedError "OS catalog related items must be JSON strings" -Mutate {
        param($catalog)
        $catalog.entries[0].related = @(, @("capability:eventstream"))
    }
    Assert-InvalidCatalog -Name "invalid-freshness-reference" -ExpectedError "freshnessRef must match the canonical path" -Mutate {
        param($catalog)
        $freshEntry = $catalog.entries | Where-Object { $_.PSObject.Properties.Name -contains "freshnessRef" } | Select-Object -First 1
        $freshEntry.freshnessRef = "patterns/shortcut-before-copy.md"
    }

    $externalBundle = Join-Path $testRoot "linked-bundle-target"
    [IO.Directory]::CreateDirectory($externalBundle) | Out-Null
    [IO.File]::WriteAllText((Join-Path $externalBundle "charter.md"), "# Linked test charter")
    $linkedBundle = Join-Path $RepositoryRoot "agent-bundles\catalog-link-test"
    if ($IsWindows) {
        New-Item -ItemType Junction -Path $linkedBundle -Target $externalBundle | Out-Null
    }
    else {
        New-Item -ItemType SymbolicLink -Path $linkedBundle -Target $externalBundle | Out-Null
    }
    Assert-InvalidCatalog -Name "linked-target" -ExpectedError "OS catalog target uses a symbolic link or reparse point" -Mutate {
        param($catalog)
        $catalog.entries += [pscustomobject]@{
            id = "agent-bundle:catalog-link-test"
            type = "agent-bundle"
            title = "Catalog Link Test"
            status = "preview"
            path = "agent-bundles/catalog-link-test/charter.md"
            dependencies = @()
            related = @()
        }
    }
    Remove-Item -LiteralPath $linkedBundle -Force

    Write-Host "OS catalog validation tests passed."
    exit 0
}
catch {
    Write-Host "::error::$($_.Exception.Message)"
    exit 1
}
finally {
    $linkedBundle = Join-Path $RepositoryRoot "agent-bundles\catalog-link-test"
    if (Test-Path $linkedBundle) {
        Remove-Item -LiteralPath $linkedBundle -Force
    }
    if (Test-Path $testRoot) {
        Remove-Item -LiteralPath $testRoot -Recurse -Force
    }
}
