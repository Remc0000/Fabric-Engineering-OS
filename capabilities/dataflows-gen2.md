This guide is governed by the [Fabric Engineering OS Constitution](../CONSTITUTION.md).

> **Scope/status:** Validate current Dataflows Gen2, connector, gateway, refresh, security, capacity, and Power Query behavior in Microsoft Learn and the target tenant.

## Purpose

Select Dataflows Gen2 when low-code Power Query ingestion or transformation should create reusable Fabric data preparation logic for governed analytical workloads.

## When To Use

- Power Query is the preferred authoring experience for source shaping, cleansing, and repeatable transformation.
- Business or data teams need low-code preparation before landing curated data into Fabric destinations.
- The data preparation step must fit a Fabric delivery path without requiring every transformation to be code-first.

## When NOT To Use

- The need is activity orchestration, dependency control, scheduling, or copy coordination; evaluate [Pipeline](./pipeline.md).
- Complex engineering, custom libraries, or code-first Spark logic dominates; evaluate [Notebook](./notebook.md).
- The workload needs a governed analytical store decision first; evaluate [Lakehouse](./lakehouse.md) or [Warehouse](./warehouse.md).

## Pros

- Provides a low-code transformation path familiar to Power Query users.
- Can reduce custom code for repeatable ingestion and shaping scenarios.
- Fits source onboarding and data product paths when transformation logic remains understandable and governed.

## Cons

- Complex transformations can become difficult to review, test, and operate compared with code-first assets.
- Connector, refresh, gateway, capacity, and destination behavior must be validated for the tenant and source.
- It does not replace orchestration, engineering standards, semantic modeling, or release controls.

## Alternatives

- [Pipeline](./pipeline.md) for orchestration, dependencies, schedules, and copy activities.
- [Notebook](./notebook.md) for code-first Spark, Python, SQL, or R transformation.
- [Lakehouse](./lakehouse.md) or [Warehouse](./warehouse.md) when the main decision is analytical storage and serving.

## Decision Drivers

- Team skills and need for low-code versus code-first transformation.
- Source support, gateway needs, refresh expectations, and destination compatibility.
- Reviewability, testing, lineage, and operational ownership of transformation logic.
- Current Microsoft Learn support, tenant settings, and capacity behavior at decision time.

## Related Patterns

- Select ingestion, transformation, data-quality, and data-product guidance from the [patterns catalog](../patterns/README.md).

## Related Golden Paths

- [Source onboarding](../golden-paths/source-onboarding.md)
- [Data product](../golden-paths/data-product.md)
- [Metadata-driven ELT](../golden-paths/metadata-driven-elt.md)
