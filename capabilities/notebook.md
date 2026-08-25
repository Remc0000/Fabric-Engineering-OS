# Notebook

This guide is governed by the [Fabric Engineering OS Constitution](../CONSTITUTION.md).

> **Scope/status:** Runtime versions, libraries, language support, session behavior, source control, and capacity characteristics vary over time; pin and validate them using Microsoft Learn and target environments. Use a [Fabric environment](https://learn.microsoft.com/fabric/data-engineering/create-and-use-environment) when reusable Spark runtime, compute, library, or resource configuration is required.

## Purpose

Select a Fabric notebook as a code-first artifact for interactive exploration, Spark transformations, data science, and reusable engineering logic.

## When To Use

- The task needs Python, Spark SQL, Scala, or R capabilities supported by the selected runtime.
- Transformations or analysis are clearer and more testable in code than in declarative activities.
- Engineers need an interactive development loop that can later run through governed orchestration.

## When NOT To Use

- A supported copy activity or simple declarative transformation is sufficient.
- The notebook would become a hidden orchestrator for unrelated operational steps; use [Pipeline](pipeline.md).
- Runtime, dependency, parameter, and test behavior cannot be made reproducible.

## Pros

- Supports expressive engineering, exploration, and data-science workflows.
- Can package reusable logic around Lakehouse and other supported Fabric data.
- Enables incremental development before automation.

## Cons

- Interactive success does not guarantee repeatable scheduled execution.
- Environment, library, Spark, and data-state dependencies require explicit control.
- Large monolithic notebooks are difficult to review, test, and operate.

## Alternatives

- [Pipeline](pipeline.md) for declarative orchestration and copy.
- [Warehouse](warehouse.md) for SQL-first transformations and serving.
- [Eventstream](eventstream.md) for supported low-code continuous event processing.

## Decision Drivers

- Language, runtime, library, and compute requirements.
- Whether a governed Fabric environment or workspace default must make Spark configuration reproducible across notebooks and Spark job definitions.
- Reproducibility, modularity, parameterization, and testing.
- Interactive versus scheduled execution.
- Data locality, security, performance, and cost.

## Related Patterns

- Select notebook modularity, dependency management, parameterization, testing, and observability guidance from the [patterns catalog](../patterns/README.md).

## Related Golden Paths

- [Metadata-driven ELT](../golden-paths/metadata-driven-elt.md)
- [Data product](../golden-paths/data-product.md)
- [Production incident](../golden-paths/production-incident.md)
