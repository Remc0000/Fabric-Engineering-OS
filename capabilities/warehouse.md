# Warehouse

This guide is governed by the [Fabric Engineering OS Constitution](../CONSTITUTION.md).

> **Scope/status:** Validate supported T-SQL surface area, ingestion options, security features, capacity behavior, and regional availability in current Microsoft Learn guidance.

## Purpose

Select Fabric Warehouse for a relational, T-SQL-first analytical store that serves governed dimensional models and SQL-centric consumers.

## When To Use

- Data is curated into relational fact and dimension structures.
- SQL developers need a familiar analytical authoring and serving experience.
- Central schema, permissions, and SQL workload management are more important than direct file manipulation.

## When NOT To Use

- Spark-first processing, open file access, or mixed structured and unstructured data is central; evaluate [Lakehouse](lakehouse.md).
- The workload needs application transactions; evaluate [Fabric SQL database](fabric-sql-database.md).
- Append-heavy telemetry requires KQL-native exploration; evaluate [Eventhouse](eventhouse.md).

## Pros

- Aligns well with dimensional modeling and SQL-based BI engineering.
- Provides a clear curated serving boundary for analytical data products.
- Reduces the need for consumers to understand file layout and Spark operations.

## Cons

- Relational modeling can add work before exploratory or semi-structured data becomes usable.
- It is not a replacement for code-first Spark or data-science workflows.
- Performance and concurrency still depend on model design, capacity, and workload patterns.

## Alternatives

- [Lakehouse](lakehouse.md) for Delta and file-oriented engineering.
- [Semantic model](semantic-model.md) when the unmet need is reusable business logic rather than storage.
- [Fabric SQL database](fabric-sql-database.md) for operational relational workloads.

## Decision Drivers

- SQL versus Spark ownership.
- Dimensional maturity and schema governance.
- Query concurrency and serving expectations.
- Required ingestion, transformation, and deployment practices.

## Related Patterns

- Select dimensional modeling, data contracts, quality gates, and workload-isolation guidance from the [patterns catalog](../patterns/README.md).

## Related Golden Paths

- [Data product](../golden-paths/data-product.md)
- [Semantic model](../golden-paths/semantic-model.md)
- [Metadata-driven ELT](../golden-paths/metadata-driven-elt.md)
