# Operating Model

This navigation page is governed by the [Fabric Engineering OS Constitution](../CONSTITUTION.md).

The canonical accountability model is [Governance](../GOVERNANCE.md). The summary below helps adopters find the right process without replacing that policy.

## Working loop

1. Capture intent, owner, scope, risk, and acceptance criteria in an issue.
2. Choose a [Bootstrap Guide](../bootstrap/README.md) and record architecture/security decisions.
3. Implement a focused branch using GitHub Copilot through GitHub MCP.
4. Ground Microsoft product behavior in Microsoft Learn and preserve upstream sources as read-only.
5. Collect reviewable validation evidence.
6. Use human-authorized, auditable workflows for DEV and TEST only.
7. Open a pull request, pass checks, and obtain human approval.
8. A human performs merge; humans separately approve releases and all production actions.

## Decision routing

| Concern | Human decision owner | Canonical detail |
| --- | --- | --- |
| Architecture and material trade-offs | Architecture owner | [Governance](../GOVERNANCE.md) |
| Contract, classification, retention, access | Data owner | [Governance](../GOVERNANCE.md) |
| Identity, network, secrets, exceptions | Security owner | [Governance](../GOVERNANCE.md) |
| Reliability, support, cost, rollback | Service owner | [Governance](../GOVERNANCE.md) |
| Repository quality and merge | Maintainer | [Maintainers](../community/MAINTAINERS.md) |
| Version and publication | Release owner | [Release Strategy](../community/RELEASE-STRATEGY.md) |
| Production approval and execution | Authorized production owner | [Governance](../GOVERNANCE.md) |

## Source precedence

Do not restate or fork upstream guidance. Apply the canonical precedence in the [Constitution](../CONSTITUTION.md): Microsoft Learn for product truth; the [Microsoft data engineering playbook](https://learn.microsoft.com/en-us/data-engineering/playbook/understanding-data-playbook) for methodology; Skills for Fabric for preferred expertise; Fabric Accelerator (unified data foundation, Fabric-only Option 1) for architecture; FMD for primary implementation; ELT as secondary; Project Osmos as an agentic-execution reference; Fabric Toolbox for optional discovery. Concrete source locations are listed in the [Source-Grounding registry](../standards/source-grounding.md). None may be automatically modified by this repository.

For contribution mechanics, use [Contributing](../community/CONTRIBUTING.md). For common interpretations, use the [FAQ](FAQ.md).
