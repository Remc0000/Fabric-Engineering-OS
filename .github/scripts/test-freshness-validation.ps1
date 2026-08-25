[CmdletBinding()]
param(
    [string]$RepositoryRoot = (Resolve-Path (Join-Path $PSScriptRoot "..\.."))
)

$ErrorActionPreference = "Stop"
$validator = Join-Path $PSScriptRoot "validate-freshness.ps1"
$fixtureRoot = Join-Path $RepositoryRoot ".github\tests\freshness"

foreach ($invalidFixture in @("invalid.json", "invalid-entries-scalar.json", "invalid-path.json", "invalid-scalar.json")) {
    $invalidOutput = & pwsh -NoProfile -File $validator `
        -RepositoryRoot $RepositoryRoot `
        -ManifestPath (Join-Path $fixtureRoot $invalidFixture) 2>&1 | Out-String
    if ($LASTEXITCODE -eq 0 -or $invalidOutput -notmatch "::error::") {
        Write-Host "::error::Invalid freshness fixture did not fail: $invalidFixture"
        exit 1
    }
}

$overdueOutput = & pwsh -NoProfile -File $validator `
    -RepositoryRoot $RepositoryRoot `
    -ManifestPath (Join-Path $fixtureRoot "overdue.json") `
    -AsOfDate "2026-08-25" 2>&1 | Out-String
if ($LASTEXITCODE -ne 0) {
    Write-Host "::error::Overdue freshness fixture failed unexpectedly"
    Write-Host $overdueOutput
    exit 1
}
if ($overdueOutput -notmatch "::warning.*Guidance review overdue") {
    Write-Host "::error::Overdue freshness fixture did not emit a review-due warning"
    exit 1
}

Write-Host "Guidance freshness validation tests passed."
