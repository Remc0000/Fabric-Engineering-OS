[CmdletBinding()]
param(
    [string]$RepositoryRoot = (Resolve-Path (Join-Path $PSScriptRoot "..\.."))
)

$ErrorActionPreference = "Stop"
$helper = Join-Path $RepositoryRoot "bootstrap\Initialize-FabricProject.ps1"
$testBase = [IO.Path]::GetFullPath((Join-Path $RepositoryRoot ".test-artifacts"))
$testRoot = [IO.Path]::GetFullPath((Join-Path $testBase "bootstrap-helper"))

if (-not $testRoot.StartsWith($testBase.TrimEnd([IO.Path]::DirectorySeparatorChar) + [IO.Path]::DirectorySeparatorChar)) {
    throw "Unsafe bootstrap test path."
}

function Invoke-Helper {
    param(
        [string]$Slug,
        [string]$Mode = "Plan",
        [string]$OutputRoot = "consumer",
        [string]$ProjectName = "Test Project",
        [string]$SpecKitRelease = "v1.2.3"
    )

    $output = & pwsh -NoProfile -File $helper `
        -RepositoryRoot $testRoot `
        -ProjectName $ProjectName `
        -ProjectSlug $Slug `
        -Sponsor "Test Sponsor" `
        -SpecificationOwner "Test Spec Owner" `
        -RepositoryOwner "Test Repo Owner" `
        -SpecKitRelease $SpecKitRelease `
        -OutputRoot $OutputRoot `
        -Mode $Mode 2>&1 | Out-String

    return @{
        ExitCode = $LASTEXITCODE
        Output = $output
    }
}

try {
    if (Test-Path $testRoot) {
        Remove-Item -LiteralPath $testRoot -Recurse -Force
    }
    [IO.Directory]::CreateDirectory((Join-Path $testRoot "standards")) | Out-Null
    [IO.Directory]::CreateDirectory((Join-Path $testRoot "bootstrap")) | Out-Null
    [IO.File]::WriteAllText((Join-Path $testRoot "CONSTITUTION.md"), "# Test")
    [IO.File]::WriteAllText((Join-Path $testRoot "standards\spec-kit.md"), "# Test")
    [IO.File]::WriteAllText((Join-Path $testRoot "bootstrap\new-project.md"), "# Test")
    & git -C $testRoot init --quiet
    & git -C $testRoot config user.name "Bootstrap Test"
    & git -C $testRoot config user.email "bootstrap-test@example.invalid"
    & git -C $testRoot add . 2>$null
    & git -C $testRoot commit --quiet -m "test fixture"
    if ($LASTEXITCODE -ne 0) {
        throw "Unable to initialize clean Git test repository."
    }

    $plan = Invoke-Helper -Slug "fresh-project"
    if ($plan.ExitCode -ne 0 -or $plan.Output -notmatch "CREATE" -or (Test-Path (Join-Path $testRoot "consumer\fresh-project"))) {
        throw "Plan mode was not deterministic and write-free."
    }

    $apply = Invoke-Helper -Slug "fresh-project" -Mode "Apply"
    $freshProject = Join-Path $testRoot "consumer\fresh-project"
    if (
        $apply.ExitCode -ne 0 -or
        @((Get-ChildItem $freshProject -File -Force)).Count -ne 4 -or
        -not (Test-Path (Join-Path $freshProject ".fabric-bootstrap-manifest.json"))
    ) {
        $createdFiles = if (Test-Path $freshProject -PathType Container) {
            @((Get-ChildItem $freshProject -Force | ForEach-Object Name)) -join ", "
        }
        else {
            "<project directory absent>"
        }
        throw "Fresh apply did not create the expected files and ownership manifest. Exit code: $($apply.ExitCode). Files: $createdFiles. Output: $($apply.Output)"
    }
    $generatedEvidence = [IO.File]::ReadAllText((Join-Path $freshProject "bootstrap-evidence.md"))
    $generatedReadme = [IO.File]::ReadAllText((Join-Path $freshProject "README.md"))
    if (
        $generatedEvidence -notmatch '- Spec Kit release: `v1\.2\.3`' -or
        $generatedEvidence -notmatch '```powershell' -or
        $generatedEvidence -match '\$SpecKitRelease' -or
        $generatedReadme -notmatch '\.\./\.\./CONSTITUTION\.md' -or
        $generatedReadme -notmatch '`<define measurable outcome>`' -or
        $generatedReadme -match '\]\(/CONSTITUTION\.md\)'
    ) {
        throw "Generated Markdown did not preserve release, fences, placeholders, and relative links."
    }

    $rerun = Invoke-Helper -Slug "fresh-project" -Mode "Apply"
    if ($rerun.ExitCode -ne 0 -or ([regex]::Matches($rerun.Output, "UNCHANGED")).Count -ne 3) {
        throw "Identical rerun was not idempotent."
    }

    Remove-Item -LiteralPath (Join-Path $testRoot "consumer\fresh-project\bootstrap-evidence.md")
    $partial = Invoke-Helper -Slug "fresh-project" -Mode "Apply"
    if ($partial.ExitCode -ne 0 -or $partial.Output -notmatch "CREATED.*bootstrap-evidence\.md") {
        throw "Partial setup was not completed safely."
    }

    & git -C $testRoot add . 2>$null
    & git -C $testRoot commit --quiet -m "generated project"
    if ($LASTEXITCODE -ne 0) {
        throw "Unable to commit generated test project."
    }

    [IO.File]::WriteAllText((Join-Path $testRoot "unrelated.txt"), "unrelated")
    $dirty = Invoke-Helper -Slug "dirty-project" -Mode "Apply"
    if ($dirty.ExitCode -eq 0 -or $dirty.Output -notmatch "unrelated changes") {
        throw "Unrelated dirty working-tree content was not rejected."
    }
    Remove-Item -LiteralPath (Join-Path $testRoot "unrelated.txt")

    $invalid = Invoke-Helper -Slug "unsafe-project" -OutputRoot "..\outside"
    if ($invalid.ExitCode -eq 0 -or $invalid.Output -notmatch "::error::") {
        throw "Unsafe output path was not rejected."
    }
    $uppercaseRoot = Invoke-Helper -Slug "uppercase-root" -OutputRoot "Consumer"
    $uppercaseSlug = Invoke-Helper -Slug "UpperCase"
    $trailingDotRoot = Invoke-Helper -Slug "trailing-dot-root" -OutputRoot "consumer\team."
    $reservedToken = Invoke-Helper -Slug "reserved-token" -ProjectName "Literal {{SPONSOR}}"
    $newlineRelease = Invoke-Helper -Slug "newline-release" -SpecKitRelease "v1.2.3`n"
    if (
        $uppercaseRoot.ExitCode -eq 0 -or
        $uppercaseSlug.ExitCode -eq 0 -or
        $trailingDotRoot.ExitCode -eq 0 -or
        $reservedToken.ExitCode -eq 0 -or
        $newlineRelease.ExitCode -eq 0
    ) {
        throw "Case-sensitive paths, reserved template tokens, or multiline release input were accepted."
    }

    $directoryConflict = Join-Path $testRoot "consumer\directory-conflict\README.md"
    [IO.Directory]::CreateDirectory($directoryConflict) | Out-Null
    $failedApply = Invoke-Helper -Slug "directory-conflict" -Mode "Apply"
    if (
        $failedApply.ExitCode -eq 0 -or
        $failedApply.Output -notmatch "Refusing to overwrite" -or
        (Test-Path (Join-Path $testRoot "consumer\directory-conflict\.fabric-bootstrap-manifest.json"))
    ) {
        throw "A directory conflict created an inaccurate ownership manifest."
    }
    Remove-Item -LiteralPath (Join-Path $testRoot "consumer\directory-conflict") -Recurse

    [IO.File]::AppendAllText((Join-Path $freshProject "README.md"), "modified")
    $conflict = Invoke-Helper -Slug "fresh-project" -Mode "Apply"
    if ($conflict.ExitCode -eq 0 -or $conflict.Output -notmatch "Refusing to overwrite") {
        throw "Conflicting content was not rejected."
    }
    & git -C $testRoot restore "consumer/fresh-project/README.md"

    $rollbackApply = Invoke-Helper -Slug "rollback-project" -Mode "Apply"
    $rollback = Invoke-Helper -Slug "rollback-project" -Mode "Rollback"
    if (
        $rollbackApply.ExitCode -ne 0 -or
        $rollback.ExitCode -ne 0 -or
        (Test-Path (Join-Path $testRoot "consumer\rollback-project"))
    ) {
        $rollbackProject = Join-Path $testRoot "consumer\rollback-project"
        $remainingFiles = if (Test-Path $rollbackProject -PathType Container) {
            @((Get-ChildItem $rollbackProject -Force | ForEach-Object Name)) -join ", "
        }
        else {
            "<project directory absent>"
        }
        throw "Rollback did not remove only the generated project. Apply exit: $($rollbackApply.ExitCode). Apply output: $($rollbackApply.Output). Rollback exit: $($rollback.ExitCode). Rollback output: $($rollback.Output). Remaining: $remainingFiles"
    }

    $ownedApply = Invoke-Helper -Slug "partial-owner" -Mode "Apply"
    $partialOwner = Join-Path $testRoot "consumer\partial-owner"
    Remove-Item -LiteralPath (Join-Path $partialOwner ".fabric-bootstrap-manifest.json") -Force
    Remove-Item -LiteralPath (Join-Path $partialOwner "bootstrap-evidence.md")
    Remove-Item -LiteralPath (Join-Path $partialOwner "specification-approval.md")
    $ownedReapply = Invoke-Helper -Slug "partial-owner" -Mode "Apply"
    $ownedRollback = Invoke-Helper -Slug "partial-owner" -Mode "Rollback"
    if (
        $ownedApply.ExitCode -ne 0 -or
        $ownedReapply.ExitCode -ne 0 -or
        $ownedRollback.ExitCode -ne 0 -or
        -not (Test-Path (Join-Path $partialOwner "README.md")) -or
        (Test-Path (Join-Path $partialOwner "bootstrap-evidence.md")) -or
        (Test-Path (Join-Path $partialOwner "specification-approval.md"))
    ) {
        throw "Rollback removed a matching file that was not recorded as helper-created."
    }
    Remove-Item -LiteralPath (Join-Path $partialOwner "README.md")
    Remove-Item -LiteralPath $partialOwner

    $nested = Invoke-Helper -Slug "nested-project" -OutputRoot "consumer\team"
    $nestedExpected = [regex]::Escape((Join-Path $testRoot "consumer\team\nested-project"))
    if ($nested.ExitCode -ne 0 -or $nested.Output -notmatch "PROJECT_ROOT $nestedExpected") {
        throw "Backslash OutputRoot was not normalized to platform-native nested segments."
    }

    $outside = Join-Path $testBase "bootstrap-helper-outside"
    if (Test-Path $outside) {
        Remove-Item -LiteralPath $outside -Recurse -Force
    }
    [IO.Directory]::CreateDirectory($outside) | Out-Null
    $linkPath = Join-Path $testRoot "examples"
    if ($IsWindows) {
        New-Item -ItemType Junction -Path $linkPath -Target $outside | Out-Null
    }
    else {
        New-Item -ItemType SymbolicLink -Path $linkPath -Target $outside | Out-Null
    }
    $linked = Invoke-Helper -Slug "linked-project" -OutputRoot "examples" -Mode "Apply"
    if ($linked.ExitCode -eq 0 -or $linked.Output -notmatch "symbolic link or reparse point") {
        throw "Linked output directory was not rejected."
    }
    Remove-Item -LiteralPath $linkPath
    if (Test-Path (Join-Path $outside "linked-project")) {
        throw "Linked output directory allowed a write outside RepositoryRoot."
    }
    Remove-Item -LiteralPath $outside

    if (-not $IsWindows) {
        $danglingProject = Join-Path $testRoot "consumer\dangling-project"
        [IO.Directory]::CreateDirectory($danglingProject) | Out-Null
        $danglingTarget = Join-Path $testBase "missing-external-readme.md"
        $danglingLink = Join-Path $danglingProject "README.md"
        New-Item -ItemType SymbolicLink -Path $danglingLink -Target $danglingTarget | Out-Null
        $dangling = Invoke-Helper -Slug "dangling-project" -Mode "Apply"
        if (
            $dangling.ExitCode -eq 0 -or
            $dangling.Output -notmatch "symbolic link or reparse point" -or
            (Test-Path $danglingTarget)
        ) {
            throw "Dangling symlink was not rejected before an external write."
        }
        Remove-Item -LiteralPath $danglingLink
        Remove-Item -LiteralPath $danglingProject
    }

    Write-Host "Project bootstrap helper tests passed."
    exit 0
}
catch {
    Write-Host "::error::$($_.Exception.Message)"
    exit 1
}
finally {
    if (Test-Path $testRoot) {
        Remove-Item -LiteralPath $testRoot -Recurse -Force
    }
}
