# Fabric Engineering OS Constitution

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

## Governance

- Changes to `main` go through a pull request.
- At least one human approval is required.
- Required status checks must pass before merge.
- Production actions require explicit human approval.
- Exceptions must be documented in the pull request with their rationale and risk.

## Evolution

This constitution may evolve through pull requests. A change must explain why the principle or governance model needs to change and how existing consumers are affected.
