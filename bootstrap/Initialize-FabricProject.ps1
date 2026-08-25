[CmdletBinding()]
param(
    [Parameter(Mandatory)]
    [string]$ProjectName,

    [Parameter(Mandatory)]
    [string]$Sponsor,

    [Parameter(Mandatory)]
    [string]$SpecificationOwner,

    [Parameter(Mandatory)]
    [string]$RepositoryOwner,

    [Parameter(Mandatory)]
    [ValidatePattern("^v[0-9]+\.[0-9]+\.[0-9]+(?:-[A-Za-z0-9.-]+)?\z")]
    [string]$SpecKitRelease,

    [string]$ProjectSlug,
    [string]$OutputRoot = "consumer",
    [string]$RepositoryRoot = (Resolve-Path (Join-Path $PSScriptRoot "..")),

    [ValidateSet("Plan", "Apply", "Rollback")]
    [string]$Mode = "Plan",

    [switch]$AllowDirtyWorkingTree
)

$ErrorActionPreference = "Stop"

function Assert-SingleLineValue {
    param(
        [string]$Name,
        [string]$Value
    )

    if (
        [string]::IsNullOrWhiteSpace($Value) -or
        $Value.Length -gt 120 -or
        $Value -match "[\r\n\p{Cc}]" -or
        $Value.Contains("{{") -or
        $Value.Contains("}}")
    ) {
        throw "$Name must be a non-empty single-line value of at most 120 characters without reserved template tokens."
    }
}

function Normalize-Text {
    param([string]$Value)
    return (($Value -replace "`r`n", "`n").TrimEnd("`r", "`n") + "`n")
}

function Get-ContentHash {
    param([string]$Value)

    $bytes = [Text.Encoding]::UTF8.GetBytes((Normalize-Text $Value))
    $hash = [Security.Cryptography.SHA256]::HashData($bytes)
    return [Convert]::ToHexString($hash).ToLowerInvariant()
}

function Get-MarkdownTarget {
    param(
        [string]$FromDirectory,
        [string]$TargetPath
    )

    return [IO.Path]::GetRelativePath($FromDirectory, $TargetPath).Replace("\", "/")
}

function Assert-NoReparsePoint {
    param([string]$Path)

    $parent = Split-Path $Path -Parent
    $leaf = Split-Path $Path -Leaf
    if (-not (Test-Path $parent -PathType Container)) {
        return
    }

    $comparison = if ($IsWindows) { [StringComparison]::OrdinalIgnoreCase } else { [StringComparison]::Ordinal }
    $item = Get-ChildItem -LiteralPath $parent -Force |
        Where-Object { [string]::Equals($_.Name, $leaf, $comparison) } |
        Select-Object -First 1
    if (
        $null -ne $item -and (
            ($item.Attributes -band [IO.FileAttributes]::ReparsePoint) -ne 0 -or
            -not [string]::IsNullOrWhiteSpace([string]$item.LinkType)
        )
    ) {
        throw "Refusing to use symbolic link or reparse point: $Path"
    }
}

function Get-FileState {
    param(
        [string]$Path,
        [string]$ExpectedContent
    )

    if (-not (Test-Path $Path)) {
        return "CREATE"
    }

    if (-not (Test-Path $Path -PathType Leaf)) {
        return "CONFLICT"
    }

    $actual = Normalize-Text ([IO.File]::ReadAllText($Path))
    if ($actual -eq $ExpectedContent) {
        return "UNCHANGED"
    }

    return "CONFLICT"
}

try {
    Assert-SingleLineValue "ProjectName" $ProjectName
    Assert-SingleLineValue "Sponsor" $Sponsor
    Assert-SingleLineValue "SpecificationOwner" $SpecificationOwner
    Assert-SingleLineValue "RepositoryOwner" $RepositoryOwner
    Assert-SingleLineValue "SpecKitRelease" $SpecKitRelease

    $repositoryPath = [IO.Path]::GetFullPath([string]$RepositoryRoot)
    if (-not (Test-Path $repositoryPath -PathType Container)) {
        throw "RepositoryRoot does not exist: $repositoryPath"
    }
    foreach ($requiredPath in @("CONSTITUTION.md", "standards\spec-kit.md", "bootstrap\new-project.md")) {
        if (-not (Test-Path (Join-Path $repositoryPath $requiredPath) -PathType Leaf)) {
            throw "RepositoryRoot is missing required bootstrap input: $requiredPath"
        }
    }

    if ([string]::IsNullOrWhiteSpace($ProjectSlug)) {
        $ProjectSlug = $ProjectName.ToLowerInvariant() -replace "[^a-z0-9]+", "-"
        $ProjectSlug = $ProjectSlug.Trim("-")
    }
    if ($ProjectSlug -cnotmatch "^[a-z0-9]+(?:-[a-z0-9]+)*$" -or $ProjectSlug.Length -gt 64) {
        throw "ProjectSlug must contain 1-64 lowercase letters, digits, or single hyphens."
    }

    if ([IO.Path]::IsPathRooted($OutputRoot)) {
        throw "OutputRoot must be repository-relative."
    }
    $outputSegments = @($OutputRoot.Replace("\", "/").Split("/", [StringSplitOptions]::RemoveEmptyEntries))
    if (
        $outputSegments.Count -eq 0 -or
        -not ($outputSegments[0] -ceq "consumer" -or $outputSegments[0] -ceq "examples") -or
        @($outputSegments | Where-Object {
                $_ -in @(".", "..") -or
                $_ -cnotmatch "^[a-z0-9][a-z0-9._-]*$" -or
                $_.EndsWith(".") -or
                $_.EndsWith(" ")
            }).Count -gt 0
    ) {
        throw "OutputRoot must stay under consumer/ or examples/ and use safe path segments."
    }

    $outputPath = $repositoryPath
    foreach ($segment in $outputSegments) {
        $outputPath = Join-Path $outputPath $segment
        Assert-NoReparsePoint $outputPath
    }
    $outputPath = [IO.Path]::GetFullPath($outputPath)
    $projectPath = [IO.Path]::GetFullPath((Join-Path $outputPath $ProjectSlug))
    Assert-NoReparsePoint $projectPath
    $repositoryPrefix = $repositoryPath.TrimEnd([IO.Path]::DirectorySeparatorChar) + [IO.Path]::DirectorySeparatorChar
    if (-not $projectPath.StartsWith($repositoryPrefix, [StringComparison]::OrdinalIgnoreCase)) {
        throw "Resolved project path escapes RepositoryRoot."
    }

    $constitutionTarget = Get-MarkdownTarget $projectPath (Join-Path $repositoryPath "CONSTITUTION.md")
    $newProjectTarget = Get-MarkdownTarget $projectPath (Join-Path $repositoryPath "bootstrap\new-project.md")
    $specKitTarget = Get-MarkdownTarget $projectPath (Join-Path $repositoryPath "standards\spec-kit.md")

    $readmeTemplate = @'
# {{PROJECT_NAME}}

This consumer project is governed by the root [Fabric Engineering OS Constitution]({{CONSTITUTION_TARGET}}).

## Accountable owners

- Sponsor: {{SPONSOR}}
- Human specification owner: {{SPECIFICATION_OWNER}}
- Repository owner: {{REPOSITORY_OWNER}}

## Outcome and scope

- Business outcome: `<define measurable outcome>`
- Microsoft Fabric workloads: `<select supported workloads>`
- Consumers and data owners: `<name roles>`
- Explicitly out of scope: `<define exclusions>`

## Start

1. Complete the [new-project checklist]({{NEW_PROJECT_TARGET}}).
2. Follow the [Spec Kit delivery standard]({{SPEC_KIT_TARGET}}).
3. Record architecture, security, data, cost, environment, and operational decisions.
4. Deliver through a human-reviewed pull request; production remains human-only.
'@
    $readme = $readmeTemplate
    $readme = $readme.Replace("{{PROJECT_NAME}}", $ProjectName)
    $readme = $readme.Replace("{{CONSTITUTION_TARGET}}", $constitutionTarget)
    $readme = $readme.Replace("{{SPONSOR}}", $Sponsor)
    $readme = $readme.Replace("{{SPECIFICATION_OWNER}}", $SpecificationOwner)
    $readme = $readme.Replace("{{REPOSITORY_OWNER}}", $RepositoryOwner)
    $readme = $readme.Replace("{{NEW_PROJECT_TARGET}}", $newProjectTarget)
    $readme = Normalize-Text $readme.Replace("{{SPEC_KIT_TARGET}}", $specKitTarget)

    $evidenceTemplate = @'
# {{PROJECT_NAME}} Bootstrap Evidence

This evidence record is governed by the root [Fabric Engineering OS Constitution]({{CONSTITUTION_TARGET}}).

## Recorded inputs

- Sponsor: {{SPONSOR}}
- Human specification owner: {{SPECIFICATION_OWNER}}
- Repository owner: {{REPOSITORY_OWNER}}
- Spec Kit release: `{{SPEC_KIT_RELEASE}}`

## Spec Kit preparation

Review and run these commands manually from the repository root:

```powershell
uv tool install specify-cli --from git+https://github.com/github/spec-kit.git@{{SPEC_KIT_RELEASE}}
specify init --here --force --non-interactive --integration copilot --integration-options="--skills"
```

Expected managed paths:

- Constitution: `.specify/memory/constitution.md`
- Native Copilot skills: `.github/skills/speckit-*/SKILL.md`
- Specification: `<record actual immutable repository path>`
- Plan and tasks: `<record actual paths after approval and planning>`

## Manual repository prerequisites

- [ ] Replace inherited CODEOWNERS with accountable humans.
- [ ] Configure required branch protection and status checks.
- [ ] Configure protected DEV, TEST, and PROD environments.
- [ ] Implement fail-closed deployment adapters before environment use.
- [ ] Confirm GitHub Copilot, GitHub MCP, Microsoft Learn, and Skills for Fabric access.
- [ ] Confirm no secrets, tenant identifiers, or customer data enter Git.

## Evidence to complete

- [ ] Exact Spec Kit release and generated paths verified.
- [ ] Repository settings evidence linked.
- [ ] DEV/TEST prerequisites linked.
- [ ] Open assumptions and Microsoft Learn sources recorded.
'@
    $evidence = $evidenceTemplate
    $evidence = $evidence.Replace("{{PROJECT_NAME}}", $ProjectName)
    $evidence = $evidence.Replace("{{CONSTITUTION_TARGET}}", $constitutionTarget)
    $evidence = $evidence.Replace("{{SPONSOR}}", $Sponsor)
    $evidence = $evidence.Replace("{{SPECIFICATION_OWNER}}", $SpecificationOwner)
    $evidence = $evidence.Replace("{{REPOSITORY_OWNER}}", $RepositoryOwner)
    $evidence = Normalize-Text $evidence.Replace("{{SPEC_KIT_RELEASE}}", $SpecKitRelease)

    $specificationApprovalTemplate = @'
# {{PROJECT_NAME}} Specification Approval

This approval record is governed by the root [Fabric Engineering OS Constitution]({{CONSTITUTION_TARGET}}) and the [Spec Kit delivery standard]({{SPEC_KIT_TARGET}}).

- Human specification owner: {{SPECIFICATION_OWNER}}
- Specification commit SHA: `<immutable commit SHA>`
- Specification repository path: `<path>`
- Specification permalink: `<commit-and-path URL>`
- Decision: `<Approved for planning | Revision assigned>`
- Decision date: `<YYYY-MM-DD>`
- Required adjustments when revision is assigned: `<details>`

Any specification content change invalidates prior approval. This decision does not replace architecture, pull-request, merge, environment, release, or production approval.
'@
    $specificationApproval = $specificationApprovalTemplate
    $specificationApproval = $specificationApproval.Replace("{{PROJECT_NAME}}", $ProjectName)
    $specificationApproval = $specificationApproval.Replace("{{CONSTITUTION_TARGET}}", $constitutionTarget)
    $specificationApproval = $specificationApproval.Replace("{{SPEC_KIT_TARGET}}", $specKitTarget)
    $specificationApproval = Normalize-Text $specificationApproval.Replace("{{SPECIFICATION_OWNER}}", $SpecificationOwner)

    $files = [ordered]@{
        (Join-Path $projectPath "README.md") = $readme
        (Join-Path $projectPath "bootstrap-evidence.md") = $evidence
        (Join-Path $projectPath "specification-approval.md") = $specificationApproval
    }
    $manifestPath = Join-Path $projectPath ".fabric-bootstrap-manifest.json"
    foreach ($managedPath in @($files.Keys) + $manifestPath) {
        Assert-NoReparsePoint $managedPath
    }

    $states = [ordered]@{}
    $relativeFiles = @{}
    foreach ($file in $files.GetEnumerator()) {
        $states[$file.Key] = Get-FileState -Path $file.Key -ExpectedContent $file.Value
        $relativePath = [IO.Path]::GetRelativePath($repositoryPath, $file.Key).Replace("\", "/")
        $relativeFiles[$relativePath] = $file
    }

    if ($Mode -in @("Plan", "Apply") -and $states.Values -contains "CONFLICT") {
        $conflicts = @($states.GetEnumerator() | Where-Object Value -eq "CONFLICT" | ForEach-Object Key)
        throw "Refusing to overwrite conflicting files: $($conflicts -join ', ')"
    }

    $ownedPaths = [System.Collections.Generic.HashSet[string]]::new([StringComparer]::OrdinalIgnoreCase)
    $ownedHashes = @{}
    if (Test-Path $manifestPath -PathType Leaf) {
        try {
            $manifest = Get-Content $manifestPath -Raw | ConvertFrom-Json -Depth 10
        }
        catch {
            throw "Bootstrap manifest is invalid JSON: $manifestPath"
        }
        $manifestProperties = @($manifest.PSObject.Properties.Name)
        if (
            $manifestProperties.Count -ne 3 -or
            $manifestProperties -notcontains "schemaVersion" -or
            $manifestProperties -notcontains "projectSlug" -or
            $manifestProperties -notcontains "createdFiles" -or
            $manifest.schemaVersion -ne "1.0.0" -or
            $manifest.projectSlug -ne $ProjectSlug -or
            $manifest.createdFiles -isnot [System.Array]
        ) {
            throw "Bootstrap manifest does not match the supported contract: $manifestPath"
        }
        foreach ($entry in @($manifest.createdFiles)) {
            $entryProperties = @($entry.PSObject.Properties.Name)
            $relativePath = [string]$entry.path
            $hash = [string]$entry.sha256
            if (
                $entryProperties.Count -ne 2 -or
                $entryProperties -notcontains "path" -or
                $entryProperties -notcontains "sha256" -or
                -not $relativeFiles.ContainsKey($relativePath) -or
                $hash -notmatch "^[a-f0-9]{64}$" -or
                -not $ownedPaths.Add($relativePath)
            ) {
                throw "Bootstrap manifest contains an invalid or duplicate created-file entry."
            }
            $ownedHashes[$relativePath] = $hash
            $ownedFile = $relativeFiles[$relativePath].Key
            Assert-NoReparsePoint $ownedFile
            if ((Test-Path $ownedFile -PathType Leaf) -and (Get-ContentHash ([IO.File]::ReadAllText($ownedFile))) -ne $hash) {
                throw "Bootstrap-owned file was modified and requires human review: $ownedFile"
            }
        }
    }
    elseif ($Mode -eq "Rollback") {
        throw "No bootstrap apply manifest exists; rollback cannot identify helper-created files safely."
    }

    if ($Mode -in @("Apply", "Rollback") -and -not $AllowDirtyWorkingTree -and (Test-Path (Join-Path $repositoryPath ".git"))) {
        $allowedDirtyPaths = [System.Collections.Generic.HashSet[string]]::new([StringComparer]::OrdinalIgnoreCase)
        foreach ($relativePath in $relativeFiles.Keys) {
            $null = $allowedDirtyPaths.Add($relativePath)
        }
        $manifestRelativePath = [IO.Path]::GetRelativePath($repositoryPath, $manifestPath).Replace("\", "/")
        $null = $allowedDirtyPaths.Add($manifestRelativePath)

        $dirty = @(& git -C $repositoryPath status --porcelain --untracked-files=all)
        if ($LASTEXITCODE -ne 0) {
            throw "Unable to inspect the Git working tree."
        }
        $unrelatedDirtyPaths = @()
        foreach ($line in $dirty) {
            if ($line.Length -lt 4) {
                $unrelatedDirtyPaths += $line
                continue
            }
            $dirtyPath = $line.Substring(3)
            if ($dirtyPath -match " -> ") {
                $renamePaths = @($dirtyPath -split " -> ", 2)
                foreach ($renamePath in $renamePaths) {
                    $normalizedRenamePath = $renamePath.Trim('"').Replace("\", "/")
                    if (-not $allowedDirtyPaths.Contains($normalizedRenamePath)) {
                        $unrelatedDirtyPaths += $normalizedRenamePath
                    }
                }
                continue
            }
            $dirtyPath = $dirtyPath.Trim('"').Replace("\", "/")
            if (-not $allowedDirtyPaths.Contains($dirtyPath)) {
                $unrelatedDirtyPaths += $dirtyPath
            }
        }
        if ($unrelatedDirtyPaths.Count -gt 0) {
            throw "Git working tree has unrelated changes: $($unrelatedDirtyPaths -join ', '). Commit or stash them, or pass -AllowDirtyWorkingTree after review."
        }
    }

    Write-Output "MODE $Mode"
    Write-Output "PROJECT_ROOT $projectPath"

    if ($Mode -eq "Plan") {
        foreach ($state in $states.GetEnumerator()) {
            Write-Output "$($state.Value) $($state.Key)"
        }
    }
    elseif ($Mode -eq "Apply") {
        $createdThisRun = [System.Collections.Generic.HashSet[string]]::new([StringComparer]::OrdinalIgnoreCase)
        foreach ($file in $files.GetEnumerator()) {
            Assert-NoReparsePoint $projectPath
            Assert-NoReparsePoint $file.Key
            if ($states[$file.Key] -eq "CREATE") {
                $parent = Split-Path $file.Key -Parent
                [IO.Directory]::CreateDirectory($parent) | Out-Null
                Assert-NoReparsePoint $parent
                Assert-NoReparsePoint $file.Key
                [IO.File]::WriteAllText($file.Key, $file.Value, [Text.UTF8Encoding]::new($false))
                $relativePath = [IO.Path]::GetRelativePath($repositoryPath, $file.Key).Replace("\", "/")
                $null = $createdThisRun.Add($relativePath)
                Write-Output "CREATED $($file.Key)"
            }
            else {
                Write-Output "UNCHANGED $($file.Key)"
            }
        }

        foreach ($relativePath in $createdThisRun) {
            $null = $ownedPaths.Add($relativePath)
        }
        if ($ownedPaths.Count -gt 0) {
            $createdFiles = @(
                $ownedPaths |
                    Sort-Object |
                    ForEach-Object {
                        [ordered]@{
                            path = $_
                            sha256 = Get-ContentHash $relativeFiles[$_].Value
                        }
                    }
            )
            $manifestContent = Normalize-Text ([ordered]@{
                    schemaVersion = "1.0.0"
                    projectSlug = $ProjectSlug
                    createdFiles = $createdFiles
                } | ConvertTo-Json -Depth 5)
            [IO.Directory]::CreateDirectory($projectPath) | Out-Null
            Assert-NoReparsePoint $projectPath
            Assert-NoReparsePoint $manifestPath
            [IO.File]::WriteAllText($manifestPath, $manifestContent, [Text.UTF8Encoding]::new($false))
            Write-Output "RECORDED $manifestPath"
        }
    }
    else {
        foreach ($relativePath in $ownedPaths) {
            $ownedFile = $relativeFiles[$relativePath].Key
            Assert-NoReparsePoint $projectPath
            Assert-NoReparsePoint $ownedFile
            if (Test-Path $ownedFile -PathType Leaf) {
                Remove-Item -LiteralPath $ownedFile
                Write-Output "REMOVED $ownedFile"
            }
            else {
                Write-Output "ABSENT $ownedFile"
            }
        }
        Assert-NoReparsePoint $projectPath
        Assert-NoReparsePoint $manifestPath
        Remove-Item -LiteralPath $manifestPath -Force
        Write-Output "REMOVED $manifestPath"
        Assert-NoReparsePoint $projectPath
        if ((Test-Path $projectPath -PathType Container) -and @((Get-ChildItem -LiteralPath $projectPath -Force)).Count -eq 0) {
            Remove-Item -LiteralPath $projectPath
            Write-Output "REMOVED_DIRECTORY $projectPath"
        }
    }

    Write-Output "MANUAL Configure CODEOWNERS, branch protection, required checks, and protected environments."
    Write-Output "MANUAL Review and run the pinned Spec Kit commands; record generated paths and exact-revision approval."
    Write-Output "MANUAL Human approval remains required for architecture, pull requests, merges, environments, releases, and production."
}
catch {
    Write-Host "::error::$($_.Exception.Message)"
    exit 1
}
