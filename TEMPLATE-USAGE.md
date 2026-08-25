# Template Usage

This guide is governed by the [Fabric Engineering OS Constitution](CONSTITUTION.md).

Fabric Engineering OS is published as a GitHub Template Repository. It is both the **canonical OS** and the **starting scaffolding** a new repository inherits. This guide explains what to keep, what to configure, and what to remove after selecting **Use this template**.

## Canonical OS content

Treat the following as canonical guidance. Keep it, and prefer proposing improvements upstream (as a proposal issue) rather than diverging silently:

- `CONSTITUTION.md`, `GOVERNANCE.md`, `AGENTS.md`, `DISCLAIMER.md`, `SECURITY.md`
- `README-FOR-GITHUB-COPILOT.md`, `.github/copilot-instructions.md`
- `agents/`, `agent-bundles/`, `capabilities/`, `patterns/`, `reference-architectures/`, `golden-paths/`, `decision-trees/`, `standards/`, `decision-records/`
- `bootstrap/` and `wiki/`

## Consumer content

Create your solution's own content and keep it separate from OS canon:

- Place solution documentation under a `consumer/` or `examples/` directory. These directories are exempt from the Constitution-reference check in `.github/scripts/validate-content.ps1`.
- Keep source, notebooks, pipelines, and item definitions in your solution's own folders.

## Validation gate behavior

The content validator keeps canonical OS guidance governed without forcing the same header into ordinary solution documentation:

- It requires a `CONSTITUTION.md` reference in Markdown outside the configured exempt top-level directories.
- It checks local Markdown links in all directories, including exempt consumer content. Relative targets must exist in the checked-out repository; web, email, and same-page anchor links are not resolved locally.
- It validates the required OS directory/file structure and selected governance invariants.
- It does not validate external URL availability or Markdown syntax beyond the local-link patterns it recognizes.

The default exempt directories are `consumer/` and `examples/`. Override the complete list in a consumer repository without editing the script:

```powershell
.\.github\scripts\validate-content.ps1 -ConstitutionExemptTopDirs @("consumer", "examples", "docs")
```

Keep canonical OS directories out of the exemption list. Run the command locally after changing documentation; the same default invocation runs in the quality gate.

## Required configuration after templating

Some controls are enforced only by GitHub settings, not by files. Configure them and re-verify:

1. Replace `CODEOWNERS` with your repository's real owners.
2. Set branch protection on the default branch: require a pull request, the `Required repository files` status check, and — unless you consciously accept the risk — at least one human approval and CODEOWNERS review.
3. Create protected `DEV`, `TEST`, and `PROD` environments and configure the human authorization appropriate to each. The DEV/TEST workflows only run from the default branch, but environment protection is still recommended.
4. Implement the deployment adapters in `.github/deployment/`. They fail closed until you do.
5. Install the MCP servers and Skills for Fabric your team uses, and confirm Microsoft Learn access.
6. Initialize the native GitHub Copilot Spec Kit skills as described in the [Spec Kit delivery standard](standards/spec-kit.md). Keep the scheduled update workflow enabled; it proposes managed updates through pull requests and never merges them.

## Content to remove or regenerate

- `community/repository-inventory.md` is a point-in-time maintainer snapshot of the canonical OS; delete or regenerate it for your repository.
- Prune agent bundles, capabilities, and golden paths you do not need, but keep the governance core intact.

## Next steps

Start from a GitHub issue, follow a [bootstrap guide](bootstrap/README.md), and deliver through a governed pull request. Production deployment remains a human-approved, human-executed action.
