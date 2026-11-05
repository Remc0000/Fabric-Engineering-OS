[CmdletBinding()]
param(
    [string]$RepositoryRoot = (Resolve-Path (Join-Path $PSScriptRoot "..\..")),
    [string[]]$ConstitutionExemptTopDirs = @("consumer", "examples"),
    [switch]$SkipFreshnessValidation,
    [switch]$SkipCatalogValidation
)

$ErrorActionPreference = "Stop"
$failures = [System.Collections.Generic.List[string]]::new()

$requiredDirectories = @(
    "agents",
    "agent-bundles",
    "capabilities",
    "golden-paths",
    "patterns",
    "reference-architectures",
    "bootstrap",
    "standards",
    "community",
    "decision-trees",
    "wiki",
    ".github"
)

$requiredFiles = @(
    "README.md",
    "CONSTITUTION.md",
    "AGENTS.md",
    "bootstrap\Initialize-FabricProject.ps1",
    "README-FOR-GITHUB-COPILOT.md",
    "README-FOR-MAINTAINER.md",
    "ROADMAP.md",
    "LICENSE.md",
    "DISCLAIMER.md",
    "GOVERNANCE.md",
    "CODEOWNERS",
    "standards\spec-kit.md"
)

if (-not $SkipFreshnessValidation) {
    $requiredDirectories += "metadata"
    $requiredFiles += @(
        "metadata\guidance-freshness.json",
        "metadata\guidance-freshness.schema.json",
        "standards\guidance-freshness.md"
    )
}

if (-not $SkipCatalogValidation) {
    $requiredFiles += @(
        "metadata\os-catalog.json",
        "metadata\os-catalog.schema.json",
        "standards\machine-readable-catalog.md"
    )
}

# Documentation under these top-level directories is exempt from the
# Constitution-reference requirement so repositories created from this template
# can add their own docs without editing every file. Structural and link checks
# still apply everywhere. Consumers may override the parameter. See TEMPLATE-USAGE.md.

foreach ($directory in $requiredDirectories) {
    if (-not (Test-Path (Join-Path $RepositoryRoot $directory) -PathType Container)) {
        $failures.Add("Missing required directory: $directory")
    }
}

foreach ($file in $requiredFiles) {
    $path = Join-Path $RepositoryRoot $file
    if (-not (Test-Path $path -PathType Leaf) -or (Get-Item $path).Length -eq 0) {
        $failures.Add("Missing or empty required file: $file")
    }
}

$requiredContent = @{
    "standards\spec-kit.md" = @(
        "/speckit-specify",
        "/speckit-plan",
        "Approved for planning",
        "Revision assigned",
        "exact specification revision",
        "specify integration upgrade copilot --integration-options"
    )
    "agents\ontdekker.md" = @(
        "/speckit-specify",
        "/speckit-clarify",
        "/speckit-checklist",
        "exact specification revision"
    )
    "agents\architect.md" = @(
        "/speckit-plan",
        "exact Spec Kit specification revision"
    )
    "GOVERNANCE.md" = @(
        "at least one human approval",
        "CODEOWNERS review",
        "dismissal of stale approvals",
        "approval of the most recent push",
        "agent merge disabled"
    )
    "TEMPLATE-USAGE.md" = @(
        "dismissal of stale approvals",
        "approval of the most recent push",
        "agent merge disabled"
    )
    "standards\github-delivery.md" = @(
        "dismiss stale approvals",
        "approval of the most recent push"
    )
    ".github\agents\ontdekker.agent.md" = @(
        "/speckit-specify",
        "/speckit-clarify",
        "/speckit-checklist",
        "Approved for planning",
        "Revision assigned"
    )
    ".github\agents\architect.agent.md" = @(
        "../../agents/architect.md",
        "Microsoft Learn",
        "Approved for build",
        "Approved for planning",
        "immutable commit SHA"
    )
    ".github\agents\maker.agent.md" = @(
        "../../agents/maker.md",
        "Approved for build",
        "stale",
        "Never merge"
    )
    ".github\agents\inspecteur.agent.md" = @(
        "../../agents/inspecteur.md",
        "expected and actual results",
        "before/after comparison",
        "humans decide acceptance"
    )
    ".github\agents\criticus.agent.md" = @(
        "../../agents/criticus.md",
        "failure scenario",
        "do not approve work"
    )
    ".github\agents\chronicler.agent.md" = @(
        "../../agents/chronicler.md",
        "commit SHA",
        "proposal issue",
        "Do not assume production deployment"
    )
    ".github\ISSUE_TEMPLATE\data-defect.yml" = @(
        "Accountable data or service owner",
        "Fabric report or table",
        "What do you see\?",
        "What did you expect\?",
        "Date and filter context",
        "Urgency",
        "sanitized evidence",
        "untrusted input"
    )
    ".github\workflows\maintainer-triage.yml" = @(
        "issues:",
        "agent-triage",
        "getCollaboratorPermissionLevel",
        'permission === "admin"',
        "removeLabel"
    )
    ".github\workflows\data-defect-gate.yml" = @(
        "pull_request_target:",
        "issue_comment:",
        "data-defect",
        "verifyGateOne",
        "data-defect-gate.js",
        "setGateStatus"
    )
    ".github\scripts\data-defect-gate.js" = @(
        "Approved for build",
        "Revision assigned",
        "latestProposal",
        "repos.getContent"
    )
    ".github\scripts\data-defect-gate.test.js" = @(
        "accepts an owner approval",
        "rejects approval of an older proposal revision",
        "rejects the issue until a maintainer authorizes agent triage"
    )
    ".github\PULL_REQUEST_TEMPLATE.md" = @(
        "Data-defect evidence",
        "Before/after comparison",
        "Exact PR commit SHA"
    )
    "golden-paths\data-defect.md" = @(
        "Approved for build",
        "Revision assigned",
        "immutable commit SHA",
        "Gate 2",
        "feature workspace",
        "fail closed"
    )
    "bootstrap\new-project.md" = @(
        "specify init --here --force --non-interactive --integration copilot",
        "integration-options",
        "Approved for planning",
        "Revision assigned",
        "/speckit-plan"
    )
    "capabilities\README.md" = @(
        "## Coverage boundaries",
        "Fabric Environment",
        "Shortcut Before Copy"
    )
    "decision-trees\ingestion.md" = @(
        "dataflows-gen2\.md",
        "shortcut-before-copy\.md"
    )
    "decision-trees\environment-promotion.md" = @(
        "variable-libraries\.md"
    )
    "community\README.md" = @(
        "SECURITY\.md"
    )
    ".github\ISSUE_TEMPLATE\production-incident.yml" = @(
        "SECURITY\.md"
    )
}

foreach ($relativePath in $requiredContent.Keys) {
    $path = Join-Path $RepositoryRoot $relativePath
    if (-not (Test-Path $path -PathType Leaf)) {
        $failures.Add("Missing governed content file: $relativePath")
        continue
    }

    $content = Get-Content $path -Raw
    foreach ($pattern in $requiredContent[$relativePath]) {
        if ($content -notmatch $pattern) {
            $failures.Add("Missing governed content in ${relativePath}: $pattern")
        }
    }
}

$markdownFiles = Get-ChildItem $RepositoryRoot -Recurse -File -Filter "*.md" |
    Where-Object { $_.FullName -notmatch "[\\/]\.git[\\/]" }

foreach ($file in $markdownFiles) {
    $content = Get-Content $file.FullName -Raw
    $relativeFile = [IO.Path]::GetRelativePath($RepositoryRoot, $file.FullName)
    $topSegment = ($relativeFile -split "[\\/]")[0]
    $constitutionExempt = $ConstitutionExemptTopDirs -contains $topSegment

    if (-not $constitutionExempt -and $content -notmatch "CONSTITUTION\.md") {
        $failures.Add("Missing Constitution reference: $relativeFile")
    }

    $links = [regex]::Matches($content, "!?\[[^\]]*\]\(([^)]+)\)")
    foreach ($link in $links) {
        $target = $link.Groups[1].Value.Trim()
        if ($target -match "^(https?://|mailto:|#)") {
            continue
        }

        $target = ($target -split "\s+")[0]
        $target = ($target -split "#")[0]
        if ([string]::IsNullOrWhiteSpace($target)) {
            continue
        }

        if ($target.StartsWith("/")) {
            $resolved = Join-Path $RepositoryRoot $target.TrimStart("/")
        }
        else {
            $resolved = Join-Path $file.DirectoryName $target
        }

        if (-not (Test-Path $resolved)) {
            $failures.Add("Broken local link in ${relativeFile}: $($link.Groups[1].Value)")
        }
    }
}

if ($failures.Count -gt 0) {
    $failures | Sort-Object -Unique | ForEach-Object { Write-Host "::error::$_" }
    exit 1
}

if (-not $SkipFreshnessValidation) {
    & pwsh -NoProfile -File (Join-Path $PSScriptRoot "validate-freshness.ps1") -RepositoryRoot $RepositoryRoot
    if ($LASTEXITCODE -ne 0) {
        exit $LASTEXITCODE
    }
}

if (-not $SkipCatalogValidation) {
    & pwsh -NoProfile -File (Join-Path $PSScriptRoot "validate-os-catalog.ps1") -RepositoryRoot $RepositoryRoot
    if ($LASTEXITCODE -ne 0) {
        exit $LASTEXITCODE
    }
}

Write-Host "Validated $($markdownFiles.Count) Markdown files and repository structure."
