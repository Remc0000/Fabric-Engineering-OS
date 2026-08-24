# Maintainers

Maintainership operates under the [Fabric Engineering OS Constitution](../CONSTITUTION.md).

## Responsibilities

Maintainers:

- keep scope Fabric-only and preserve the GitHub Copilot/GitHub MCP operating model;
- require Microsoft Learn grounding for product behavior;
- prefer Skills for Fabric, Fabric Accelerator, and FMD before secondary or optional sources;
- protect upstream sources from automated modification;
- triage issues and distinguish ideas, accepted direction, active work, and released work;
- require focused changes, evidence, compatibility notes, and clear ownership;
- enforce required checks, CODEOWNERS, branch protection, and release gates;
- maintain navigation, contributor guidance, and support expectations;
- escalate architecture, security, data, compliance, cost, and production decisions to accountable humans.

## Decision model

| Decision | Required human owner |
| --- | --- |
| Contribution scope and merge | Maintainer/reviewer |
| Material architecture | Architecture owner |
| Data contract and governance | Data owner |
| Identity, privacy, or security | Security owner |
| Support, reliability, cost, rollback | Service owner |
| Version and release publication | Release owner |
| Production action | Authorized production owner |

An individual may hold several roles, but an agent cannot fulfill a human approval role.

## Joining and leaving

Maintainers are added through a human-approved pull request that records scope, expected availability, and CODEOWNERS impact. Inactive maintainers may be moved to emeritus status through the same process. Access removal follows organizational policy and must not depend solely on a documentation change.

## Review and conduct

Review the change, not the contributor. Give actionable reasons, declare conflicts of interest, and recuse when independence is impaired. Security-sensitive reports should use the repository's approved private reporting path rather than a public issue.

Release and merge responsibilities are detailed in the [Release Strategy](RELEASE-STRATEGY.md); canonical authority remains in [Governance](../GOVERNANCE.md).

