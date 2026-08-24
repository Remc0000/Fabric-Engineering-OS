[CmdletBinding()]
param(
    [Parameter(Mandatory)]
    [string]$ArtifactPath,
    [Parameter(Mandatory)]
    [string]$ChangeId
)

throw "TEST deployment adapter is not configured. Implement .github/deployment/deploy-test.ps1 for the generated project before enabling deployment."
