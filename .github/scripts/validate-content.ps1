[CmdletBinding()]
param(
    [string]$RepositoryRoot = (Resolve-Path (Join-Path $PSScriptRoot "..\.."))
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
    "README-FOR-GITHUB-COPILOT.md",
    "README-FOR-MAINTAINER.md",
    "ROADMAP.md",
    "LICENSE.md",
    "DISCLAIMER.md",
    "GOVERNANCE.md",
    "CODEOWNERS"
)

# Documentation under these top-level directories is exempt from the
# Constitution-reference requirement so repositories created from this template
# can add their own docs without editing every file. Structural and link checks
# still apply everywhere. Consumers may extend this list. See TEMPLATE-USAGE.md.
$constitutionExemptTopDirs = @("consumer", "examples")

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

$markdownFiles = Get-ChildItem $RepositoryRoot -Recurse -File -Filter "*.md" |
    Where-Object { $_.FullName -notmatch "[\\/]\.git[\\/]" }

foreach ($file in $markdownFiles) {
    $content = Get-Content $file.FullName -Raw
    $relativeFile = [IO.Path]::GetRelativePath($RepositoryRoot, $file.FullName)
    $topSegment = ($relativeFile -split "[\\/]")[0]
    $constitutionExempt = $constitutionExemptTopDirs -contains $topSegment

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

Write-Host "Validated $($markdownFiles.Count) Markdown files and repository structure."
