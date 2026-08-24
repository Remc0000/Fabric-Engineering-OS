# Reference Architectures

These architectures are governed by the root [Fabric Engineering OS Constitution](../CONSTITUTION.md). [Fabric Accelerator](https://github.com/microsoft/fabric-accelerator) is the primary architecture reference; this repository uses it as a read-only source of architectural insight, does not copy it, and does not claim automatic synchronization. Validate Microsoft Fabric product behavior against [Microsoft Learn](https://learn.microsoft.com/fabric/) before implementation.

| Architecture | Primary outcome |
| --- | --- |
| [Data product](data-product.md) | Governed medallion product in OneLake |
| [Mirroring to gold](mirroring-to-gold.md) | Low-copy source replication refined for consumers |
| [Eventhouse RTI](eventhouse-rti.md) | Governed real-time event analytics |
| [Data agent](data-agent.md) | Natural-language access grounded in approved data |
| [Metadata-driven ELT](metadata-driven-elt.md) | Repeatable multi-source ingestion and transformation |

Architectures are baselines, not automatic deployments. Agents may implement and deploy approved candidates to DEV and TEST; humans approve architecture, pull requests, merges, and PROD actions.
