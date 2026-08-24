# Microsoft Fabric Capability Catalog

This catalog is governed by the [Fabric Engineering OS Constitution](../CONSTITUTION.md).

Use these guides to select and combine Microsoft Fabric capabilities for a defined outcome. They are decision aids, not product documentation, implementation specifications, or substitutes for current [Microsoft Learn documentation](https://learn.microsoft.com/fabric/). Microsoft Learn is authoritative for product behavior, availability, limits, licensing, and prerequisites. Skills for Fabric is the preferred source of implementation expertise.

> **Scope/status:** This catalog targets the v0.9.0 preview. Validate every selection against the target tenant, region, capacity, licensing, enabled settings, source support, and current Microsoft Learn guidance.

## Decision catalog

| Capability | Primary decision | Choose it when | Reconsider when |
| --- | --- | --- | --- |
| [Lakehouse](lakehouse.md) | Open data engineering store | Spark, Delta tables, and files must coexist | The workload is primarily governed T-SQL analytics |
| [Warehouse](warehouse.md) | Relational analytical store | Dimensional modeling and T-SQL are primary | File-level or Spark-first engineering is required |
| [OneLake](onelake.md) | Shared Fabric data plane | Data must be organized or referenced across Fabric domains | Compute, transformation, or serving is the actual need |
| [Dataflows Gen2](dataflows-gen2.md) | Low-code ingestion and transformation | Power Query preparation should create reusable Fabric data flows | Code-first engineering or orchestration is the primary need |
| [Mirroring](mirroring.md) | Managed source replication | A supported operational source must land in Fabric with low pipeline ownership | Custom transformation or unsupported source behavior is required |
| [Eventstream](eventstream.md) | Streaming ingress and routing | Events need continuous ingestion, filtering, or routing | The main need is durable historical analysis |
| [Eventhouse](eventhouse.md) | Event and time-series analytical store | High-volume append-oriented data needs KQL analysis | Transactional relational behavior is required |
| [Activator](activator.md) | Event-driven alerting and action | Conditions over events or signals must trigger governed response | Action authority or operational controls are unclear |
| [Real-Time Intelligence](real-time-intelligence.md) | End-to-end event-driven workload | Ingestion, analysis, monitoring, and action form one operational scenario | A single component solves the bounded need |
| [Semantic model](semantic-model.md) | Governed business meaning | Reusable measures, relationships, and security must serve Power BI | Consumers need raw engineering tables rather than business semantics |
| [Data agent](data-agent.md) | Natural-language data access | Users need governed conversational exploration over supported Fabric data | Deterministic application behavior or pixel-perfect reporting is required |
| [Fabric SQL database](fabric-sql-database.md) | Transactional relational store | A Fabric-native operational SQL workload needs transactions | The workload is analytical, append-heavy, or Spark-first |
| [Notebook](notebook.md) | Code-first engineering and data science | Spark, Python, SQL, or R logic needs an interactive, reusable artifact | Declarative copy or simple orchestration is sufficient |
| [Pipeline](pipeline.md) | Orchestration and data movement | Activities, dependencies, schedules, and copy operations must be coordinated | The requirement is source control or environment promotion |
| [Deployment pipeline](deployment-pipeline.md) | Controlled stage promotion | Fabric items must move through defined lifecycle stages | Git history or a complete CI/CD system is the primary requirement |
| [Git integration](git-integration.md) | Workspace source control | Supported Fabric item definitions need reviewable version history | Data, secrets, or production approval must be managed |
| [Variable Libraries](variable-libraries.md) | Environment-specific parameterization | Deployment and promotion need governed per-environment values | Secrets, approvals, or source control are the actual need |

## How to use the catalog

1. Start with the business outcome and non-functional constraints, not a preferred Fabric item.
2. Use the capability guide's decision drivers and exclusions to narrow the choice.
3. Follow linked [patterns](../patterns/README.md) and [golden paths](../golden-paths/README.md) for reusable delivery guidance.
4. Confirm current product behavior in Microsoft Learn and validate the design in the target tenant before implementation.

Capability pages intentionally avoid repeating canonical product definitions. Follow their links when a neighboring capability, reusable pattern, or delivery path owns the next decision.
