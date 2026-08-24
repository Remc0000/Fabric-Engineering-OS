# Semantic Layer Decision Tree

Use this tree under the [Fabric Engineering OS Constitution](../CONSTITUTION.md) to shape a governed Power BI semantic layer in Microsoft Fabric.

```mermaid
flowchart TD
    A[Identify business questions, consumers, grain, and metric owners] --> B{Are shared governed metrics required?}
    B -->|No| C[Keep analysis local and document its boundary]
    B -->|Yes| D[Create or extend a governed semantic model]
    D --> E{Can an existing certified model satisfy the need?}
    E -->|Yes| F[Reuse or compose within supported boundaries]
    E -->|No| G[Design a star schema and explicit measures]
    F & G --> H{Data access mode fits freshness and scale?}
    H -->|Needs validation| I[Benchmark supported mode with representative queries]
    H -->|Yes| J[Define security, refresh, endorsement, lineage, and ownership]
    I --> J
    J --> K[Human metric-owner and architecture review]
```

## Decision criteria

- Establish grain, dimensions, facts, relationships, and measure definitions before report-specific optimization.
- Reuse governed models and measures; avoid duplicating business logic across reports.
- Treat row-level and object-level security as designed controls with explicit identity tests.
- Select storage and connectivity modes only after validating freshness, scale, concurrency, and operational constraints.

## Stop conditions

Stop if metric ownership, semantic definitions, data lineage, security identity, refresh responsibility, or representative performance evidence is missing. Do not claim a model is certified or authoritative without human governance.

## Record

Document metric owners, grain, source lineage, model boundaries, security, refresh, endorsement target, performance evidence, and known limitations.
