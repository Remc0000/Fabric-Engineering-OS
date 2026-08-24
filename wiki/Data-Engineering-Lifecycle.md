# Data Engineering Lifecycle

This navigation page is governed by the [Fabric Engineering OS Constitution](../CONSTITUTION.md). It maps the [Microsoft data engineering playbook](https://learn.microsoft.com/en-us/data-engineering/playbook/understanding-data-playbook) onto the Fabric-only, governed lifecycle of this OS. It does not fork or restate the playbook; the playbook remains an authoritative external methodology and Microsoft Learn remains authoritative for product behavior.

## How to read the playbook here

The playbook promotes shared engineering knowledge, automation of repetitive tasks, secure and observable deployments, and security across the whole lifecycle. Fabric Engineering OS adopts those engineering practices, with two boundaries from the [Constitution](../CONSTITUTION.md):

- Microsoft Fabric is the only supported data platform. Where the playbook discusses portability across clouds or edge, this OS applies the underlying practice inside Fabric only.
- Humans approve specifications, architecture, merges, releases, and every production action. Agents may prepare and deploy to DEV and TEST only after a human-approved merge.

## Lifecycle phases and canonical destinations

| Phase | Playbook theme | Canonical destination in this OS |
| --- | --- | --- |
| Frame the outcome | Solve a real, validated problem | Governing issue and [Bootstrap Guides](../bootstrap/README.md) |
| Choose the approach | Shared, expert-validated solutions | [Golden Paths](../golden-paths/README.md), [Decision Trees](../decision-trees/README.md), [Capabilities](../capabilities/README.md) |
| Ground the design | Reuse proven references | [Source-Grounding registry](../standards/source-grounding.md) and [Fabric Decision Records](../decision-records/README.md) |
| Build | Sharing code and developer productivity | [Agent Bundles](../agent-bundles/README.md) and [Patterns](../patterns/README.md) |
| Automate and validate | Automation that is faster, reliable, and auditable | [Standards](../standards/README.md) and repository quality gates |
| Secure and observe | Security at all stages; observable operations | [Governance](../GOVERNANCE.md) approval gates and [Security Policy](../SECURITY.md) |
| Deploy and release | Secure, observable deployment | Human-approved DEV and TEST workflows; humans own merge, release, and PROD |

## Reference sources

Ground methodology in the [data engineering playbook](https://learn.microsoft.com/en-us/data-engineering/playbook/understanding-data-playbook) and concrete implementations in the [Source-Grounding registry](../standards/source-grounding.md): the Fabric-only unified data foundation accelerator (Option 1), FMD Framework, Skills for Fabric, and Project Osmos as a governed agentic-execution reference. All are read-only; validate product behavior against Microsoft Learn.

For the working loop and role boundaries, use the [Operating Model](Operating-Model.md); to choose a starting path, use [Getting Started](Getting-Started.md).
