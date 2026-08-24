# Reusable Patterns

These patterns are governed by the root [Fabric Engineering OS Constitution](../CONSTITUTION.md). They capture repeatable decisions; scenario sequencing belongs in [golden paths](../golden-paths/README.md), and system topology belongs in [reference architectures](../reference-architectures/README.md).

| Pattern | Use when |
| --- | --- |
| [Medallion data product](medallion-data-product.md) | Refining source data into governed bronze, silver, and gold products |
| [Shortcut before copy](shortcut-before-copy.md) | Reusing OneLake data without unnecessary replication |
| [Metadata-driven orchestration](metadata-driven-orchestration.md) | Applying one controlled pipeline design to many sources |
| [Environment promotion](environment-promotion.md) | Moving reviewed artifacts from DEV through TEST to PROD |
| [Human approval gate](human-approval-gate.md) | A consequential decision or action needs accountable approval |
| [Observability by default](observability-by-default.md) | Building operability into every workload |
| [Least-privilege access](least-privilege-access.md) | Assigning identities and data access |
| [Idempotent processing](idempotent-processing.md) | Safely retrying batch or streaming work |
| [Contract-first data product](contract-first-data-product.md) | Publishing data for independent consumers |
| [Real-time event processing](real-time-event-processing.md) | Ingesting, transforming, and serving event streams |
| [Governed semantic layer](governed-semantic-layer.md) | Publishing reusable business meaning and measures |
| [Grounded data agent](grounded-data-agent.md) | Providing natural-language access to governed Fabric data |

Agents may implement and deploy approved changes to DEV and TEST. Humans approve architecture, pull requests, merges, and every PROD action.
