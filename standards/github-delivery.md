# GitHub Delivery Standard

This standard implements the [Fabric Engineering OS Constitution](../CONSTITUTION.md) for GitHub-first delivery.

## Runtime and interface

Agents operate through GitHub Copilot and use GitHub MCP for repository interaction. Repository access must be least-privileged, attributable, and auditable.

## Delivery flow

1. **Issue:** record outcome, scope, exclusions, acceptance criteria, risks, accountable human, and target environment.
2. **Branch:** create a short-lived branch from the approved base using the naming standard.
3. **Commit:** make focused commits that explain intent and avoid generated noise, secrets, and unrelated changes.
4. **Pull request:** link the issue and describe problem, approach, validation, operational impact, assumptions, and rollback.
5. **Review:** require passing checks and at least one human approval; use additional owners for architecture, security, or data risk.
6. **Merge:** only an authorized human or human-approved protected workflow may merge.

## Agent permissions

Agents may create issues, branches, commits, and pull requests. They may respond to review findings and invoke approved DEV/TEST workflows. Agents may never merge, self-approve, bypass protection, modify this OS automatically, modify upstream repositories automatically, or trigger PROD deployment.

## Traceability

Keep the chain from issue to decisions, commits, pull request, checks, deployments, and release evidence intact. Force pushes, deleted evidence, and direct changes to protected branches require explicit policy and human authorization.
