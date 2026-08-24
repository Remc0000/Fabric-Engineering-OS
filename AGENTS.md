# Agent Instructions

These instructions apply to the entire repository.

## Operating model

- Read `README.md` and `CONSTITUTION.md` before making changes.
- Treat Microsoft Fabric as the primary platform and Microsoft Learn as the authoritative product documentation source.
- Use GitHub issues and pull requests to make intent, decisions, and review evidence visible.
- Keep changes focused; do not generate large structures speculatively.
- Reuse existing capability catalogs, golden paths, and reference architectures before creating new patterns.

## Engineering requirements

- Never commit secrets, credentials, tenant identifiers, or customer data.
- State assumptions and validate product-specific claims against authoritative documentation.
- Add the smallest meaningful automated validation for changed behavior.
- Preserve human approval for merges and production operations.
- Document consequential architecture and governance decisions.

## Pull requests

- Explain the problem, approach, validation, and operational impact.
- Link the relevant issue when one exists.
- Do not bypass required reviews or status checks.
