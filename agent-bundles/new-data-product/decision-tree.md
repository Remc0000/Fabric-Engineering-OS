# New Data Product Decision Tree

This tree follows the [Fabric Engineering OS Constitution](../../CONSTITUTION.md) and [data-product golden path](../../golden-paths/data-product.md).

```mermaid
flowchart TD
    A[Named owner, consumers, decisions?] -->|No| X[Stop: establish product accountability]
    A -->|Yes| B[Define grain, keys, semantics, SLOs]
    B --> C{Primary consumption}
    C -->|Open files, Spark, mixed data| D[Evaluate Lakehouse]
    C -->|Relational SQL, governed BI serving| E[Evaluate Warehouse]
    C -->|Both| F[Choose one gold authority; document projections]
    D --> G{Existing governed bronze contract?}
    E --> G
    F --> G
    G -->|No| H[Run source-onboarding bundle]
    G -->|Yes| I[Design silver conformance and history]
    H --> I
    I --> J{Shared enterprise definition disputed?}
    J -->|Yes| K[Human domain decision]
    J -->|No| L[Define versioned gold contract]
    K --> L
    L --> M{Sensitive or cross-domain sharing?}
    M -->|Yes| N[Governance/security approval]
    M -->|No| O[Standard least-privilege review]
    N --> P[DEV/TEST implementation and tests]
    O --> P
    P --> Q{SLO, quality, compatibility, acceptance pass?}
    Q -->|No| R[Fix or escalate; do not release]
    Q -->|Yes| S[Human production release handoff]
```

Use [Lakehouse](../../capabilities/lakehouse.md) and [Warehouse](../../capabilities/warehouse.md) guidance to make the serving decision. Avoid dual authorities for the same gold contract.
