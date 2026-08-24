# Agent Instructions

These instructions implement the [Fabric Engineering OS Constitution](CONSTITUTION.md).

These instructions apply to the entire repository.

## Operating model

- Read `README.md` and `CONSTITUTION.md` before making changes.
- Treat Microsoft Fabric as the primary platform and Microsoft Learn as the authoritative product documentation source.
- Prefer Skills for Fabric for Fabric expertise, Fabric Accelerator for architecture, and FMD Framework for implementation.
- Use ELT Framework as a secondary implementation reference and Fabric Toolbox only for optional discovery.
- Treat all upstream sources as read-only; never modify or synchronize them automatically.
- Use GitHub issues and pull requests to make intent, decisions, and review evidence visible.
- Keep changes focused; do not generate large structures speculatively.
- Reuse existing capability catalogs, golden paths, and reference architectures before creating new patterns.

## Engineering requirements

- Never commit secrets, credentials, tenant identifiers, or customer data.
- State assumptions and validate product-specific claims against authoritative documentation.
- Add the smallest meaningful automated validation for changed behavior.
- Preserve human approval for merges and production operations.
- Document consequential architecture and governance decisions.
- Agents may create issues, branches, commits, and pull requests, and use approved workflows for DEV and TEST deployments.
- Agents must never merge, self-approve, deploy to PROD, change this OS autonomously, or modify upstream repositories.

## Pull requests

- Explain the problem, approach, validation, and operational impact.
- Link the relevant issue when one exists.
- Do not bypass required reviews or status checks.
- Escalate architecture, security, data-loss, compliance, cost, and production decisions to a human owner.
