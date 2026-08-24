# Metadata-Driven ELT Decision Tree

This tree follows the [Fabric Engineering OS Constitution](../../CONSTITUTION.md), [metadata-driven ELT golden path](../../golden-paths/metadata-driven-elt.md), and [reference architecture](../../reference-architectures/metadata-driven-elt.md).

```mermaid
flowchart TD
    A[At least two approved sources with similar lifecycle needs?] -->|No| X[Stop: use source-specific path or source-onboarding]
    A -->|Yes| B[Name platform, source, data, security, and operations owners]
    B --> C{Shared metadata contract can describe source behavior safely?}
    C -->|No| D[Use bounded dedicated adapter or dedicated pipeline]
    C -->|Yes| E[Define versioned control tables and prohibited fields]
    D --> E
    E --> F{Metadata contains secrets or executable logic?}
    F -->|Yes| Y[Stop: move secrets to governed connections and remove executable metadata]
    F -->|No| G[Validate with Microsoft Learn and FMD implementation pattern]
    G --> H{Primary orchestration need}
    H -->|Scheduling, parameters, dependencies| I[Use Pipeline orchestration]
    H -->|Complex transforms or libraries| J[Use parameterized Notebook]
    H -->|Both| K[Pipeline orchestrates Notebook execution]
    I --> L[Define bronze landing, checkpoint, retry, and quarantine state]
    J --> L
    K --> L
    L --> M{Serving and transformation target}
    M -->|Open files/Spark medallion| N[Lakehouse path]
    M -->|SQL serving/governed relational marts| O[Warehouse path]
    M -->|Both| P[Choose one gold authority; document projections]
    N --> Q[Implement DEV control plane and adapters]
    O --> Q
    P --> Q
    Q --> R{Initial, incremental, duplicate, replay, and backfill pass for two sources?}
    R -->|No| S[Fix state, validation, or adapter; do not release]
    R -->|Yes| T{Security, quality, observability, rollback, and cost evidence pass?}
    T -->|No| U[Fix or escalate with assigned risk]
    T -->|Yes| V[Human architecture/release review for production proposal]
```

Use [Pipeline](../../capabilities/pipeline.md), [Notebook](../../capabilities/notebook.md), [Lakehouse](../../capabilities/lakehouse.md), and [Warehouse](../../capabilities/warehouse.md) guidance to keep orchestration, transformation, and serving decisions explicit.
