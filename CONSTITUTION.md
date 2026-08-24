# Fabric Engineering OS Constitution

This file is the canonical [`CONSTITUTION.md`](CONSTITUTION.md) for Fabric Engineering OS.

## Purpose

Fabric Engineering OS enables governed, repeatable, AI-assisted engineering for Microsoft Fabric while keeping people accountable for consequential decisions.

## Core principles

1. **Fabric first.** Microsoft Fabric is the primary platform for supported architectures, engineering patterns, and deployment paths.
2. **GitHub first.** Source, review, automation, decisions, and reusable assets live in GitHub.
3. **Grounded engineering.** Microsoft Learn is the authoritative source for Microsoft product behavior. Assumptions must be identified and validated.
4. **Human accountability.** AI agents may propose and implement changes, but people approve merges and production releases.
5. **Secure by default.** Never commit secrets. Apply least privilege, protect sensitive data, and make governance explicit.
6. **Automation with evidence.** Changes must be reviewable, reproducible, and validated by appropriate automated checks.
7. **Reusable paths over one-offs.** Prefer documented golden paths, composable capabilities, and reference architectures.
8. **Small, auditable changes.** Keep changes focused and preserve a clear link between intent, implementation, and validation.

## Strategic sources

1. Microsoft Fabric is the only supported data platform.
2. GitHub Copilot is the agent runtime.
3. GitHub MCP is the repository interface.
4. Microsoft Learn MCP is authoritative for Microsoft product behavior.
5. Skills for Fabric is the preferred source of Fabric expertise.
6. Fabric Accelerator is the primary architecture reference.
7. FMD Framework is the primary implementation reference.
8. ELT Framework is a secondary implementation reference.
9. Fabric Toolbox is optional for discovery.

These upstream sources are read-only references. Fabric Engineering OS does not synchronize with or modify them automatically.

## Governance

- Changes to `main` go through a pull request.
- At least one human approval is required.
- Required status checks must pass before merge.
- Humans approve architecture, pull requests, merges, and production actions.
- Agents may create issues, branches, commits, and pull requests.
- Agents may deploy to DEV and TEST only through approved, auditable workflows.
- Agents may never merge, self-approve, deploy to PROD, modify this OS automatically, or modify upstream repositories automatically.
- Exceptions must be documented in the pull request with their rationale and risk.

## Evolution

This constitution may evolve only through a human-approved pull request. A change must explain why the principle or governance model needs to change, how existing consumers are affected, and how compatibility or migration is handled. Agents may propose a change but must not apply or merge constitutional changes autonomously.
