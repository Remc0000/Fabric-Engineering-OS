# Lakehouse

This guide is governed by the [Fabric Engineering OS Constitution](../CONSTITUTION.md).

> **Scope/status:** Validate current Lakehouse, Delta, SQL analytics endpoint, security, and capacity behavior in Microsoft Learn and the target tenant.

## Purpose

Select a Fabric Lakehouse when one governed item must combine OneLake files with Delta tables for code-first data engineering, data science, and downstream analytics.

## When To Use

- Spark or notebooks are primary transformation tools.
- Raw, semi-structured, and curated data must coexist without forcing every asset into a relational warehouse model.
- Delta tables should be reused by multiple Fabric engines while retaining a file-oriented engineering workflow.

## When NOT To Use

- T-SQL-first dimensional modeling, relational governance, and SQL serving dominate; evaluate [Warehouse](warehouse.md).
- The need is transactional application storage; evaluate [Fabric SQL database](fabric-sql-database.md).
- The requirement is only shared storage or cross-domain references; start with [OneLake](onelake.md).

## Pros

- Supports file and table workflows in one Fabric item.
- Fits medallion-style engineering and notebook-based transformation.
- Reduces unnecessary copies when compatible Fabric engines can use the same OneLake data.

## Cons

- File layout, table maintenance, schema evolution, and workload concurrency require explicit engineering.
- SQL and Spark experiences have different capabilities and operational characteristics.
- A Lakehouse alone does not create governed business measures or release controls.

## Alternatives

- [Warehouse](warehouse.md) for a T-SQL-first analytical store.
- [Eventhouse](eventhouse.md) for KQL-first event and time-series analytics.
- [Semantic model](semantic-model.md) for the governed business consumption layer.

## Decision Drivers

- Primary authoring engine and team skills.
- Data shape, file access needs, and Delta compatibility.
- Concurrency, latency, governance, and serving expectations.
- Ownership of table optimization and schema change.

## Related Patterns

- Select reusable ingestion, medallion, partitioning, and data-quality guidance from the [patterns catalog](../patterns/README.md).

## Related Golden Paths

- [Source onboarding](../golden-paths/source-onboarding.md)
- [Data product](../golden-paths/data-product.md)
- [Metadata-driven ELT](../golden-paths/metadata-driven-elt.md)
