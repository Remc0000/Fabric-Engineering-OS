# Semantic Model

This guide is governed by the [Fabric Engineering OS Constitution](../CONSTITUTION.md).

> **Scope/status:** Validate storage mode, Direct Lake behavior, refresh, security, model limits, and capacity requirements in current Microsoft Learn guidance and the target tenant.

## Purpose

Select a Fabric semantic model to provide reusable business measures, relationships, hierarchies, formatting, and security for Power BI consumption.

## When To Use

- Multiple reports or users need consistent business definitions.
- Analytical tables must be translated into governed measures and navigation structures.
- Row-level or object-level access belongs in the consumption model, subject to end-to-end security design.

## When NOT To Use

- Data ingestion, cleansing, or conformance is still unresolved in the source layers.
- Consumers require raw file or engineering-table access rather than business semantics.
- A model is being used to hide unstable ownership or poor source contracts.

## Pros

- Centralizes reusable analytical logic and business terminology.
- Reduces report-level duplication and inconsistent measures.
- Creates a governed contract between curated data and Power BI reports.

## Cons

- Model quality depends on stable grain, relationships, and upstream data contracts.
- Refresh, query, and storage-mode choices require capacity-aware validation.
- Security must be tested across source, model, workspace, and consumer paths.

## Alternatives

- [Warehouse](warehouse.md) or [Lakehouse](lakehouse.md) when the primary gap is curated data storage.
- [Data agent](data-agent.md) for governed natural-language exploration over supported data.
- Report-local modeling only when reuse and centralized governance are intentionally out of scope.

## Decision Drivers

- Reuse of measures and dimensions across consumers.
- Data volume, freshness, concurrency, and storage mode.
- Security and certification requirements.
- Ownership, deployment, compatibility, and change management.

## Related Patterns

- Select star-schema, measure governance, semantic security, and model-testing guidance from the [patterns catalog](../patterns/README.md).

## Related Golden Paths

- [Semantic model](../golden-paths/semantic-model.md)
- [Data product](../golden-paths/data-product.md)
- [Data agent](../golden-paths/data-agent.md)
