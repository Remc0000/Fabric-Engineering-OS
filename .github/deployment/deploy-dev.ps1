[CmdletBinding()]
param(
    [Parameter(Mandatory)]
    [string]$ArtifactPath,
    [Parameter(Mandatory)]
    [string]$ChangeId
)

throw "DEV deployment adapter is not configured. Implement .github/deployment/deploy-dev.ps1 for the generated project before enabling deployment."
