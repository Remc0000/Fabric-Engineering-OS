# Getting Started

Getting started is governed by the [Fabric Engineering OS Constitution](../CONSTITUTION.md).

This page routes adopters to canonical instructions rather than reproducing them.

## Adoption checklist

- [ ] Read the root [README](../README.md), [Constitution](../CONSTITUTION.md), and [Governance](../GOVERNANCE.md).
- [ ] Confirm Microsoft Fabric is the only data platform in scope.
- [ ] Confirm GitHub Copilot runtime and GitHub MCP repository access.
- [ ] Identify accountable human architecture, data, security, service, repository, and release owners.
- [ ] Validate tenant, region, capacity, licensing, and product assumptions against Microsoft Learn.
- [ ] Treat Skills for Fabric, Fabric Accelerator, FMD, ELT, and Fabric Toolbox according to the source precedence in the Constitution.
- [ ] Treat all upstream repositories and sources as read-only.
- [ ] Select an immediately usable [Bootstrap Guide](../bootstrap/README.md).
- [ ] Create a governing issue, focused branch, evidence plan, and human approval gates.
- [ ] Use only approved, auditable DEV and TEST workflows; leave merge, release, and production actions to humans.

## Choose a bootstrap path

| Scenario | Template |
| --- | --- |
| New repository or delivery boundary | [New Project](../bootstrap/new-project.md) |
| Bounded change | [New Feature](../bootstrap/new-feature.md) |
| Reusable governed dataset | [New Data Product](../bootstrap/new-data-product.md) |
| Grounded conversational experience | [New Data Agent](../bootstrap/new-data-agent.md) |
| Real-time events and analytics | [New RTI Project](../bootstrap/new-rti-project.md) |
| Read-only replication into Fabric | [New Mirroring Project](../bootstrap/new-mirroring-project.md) |

Before opening a pull request, follow the canonical [Contribution Guide](../community/CONTRIBUTING.md). For role boundaries and evidence flow, use [Operating Model](Operating-Model.md).
