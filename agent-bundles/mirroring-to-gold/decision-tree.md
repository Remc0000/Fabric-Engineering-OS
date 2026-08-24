# Mirroring to Gold Decision Tree

This tree follows the [Fabric Engineering OS Constitution](../../CONSTITUTION.md) and [mirroring-to-gold golden path](../../golden-paths/mirroring-to-gold.md).

```mermaid
flowchart TD
    A[Source/database owner approves assessment?] -->|No| X[Stop]
    A -->|Yes| B{Source, region, object types supported now?}
    B -->|No| C[Use another Fabric ingestion path or escalate]
    B -->|Yes| D{Keys and change/delete semantics understood?}
    D -->|No| E[Resolve contract; do not enable mirror]
    D -->|Yes| F{Source load and latency acceptable in TEST?}
    F -->|No| G[Tune scope or choose alternate Fabric path]
    F -->|Yes| H[Define reconciliation, monitoring, pause/reseed]
    H --> I{Is mirrored shape a governed consumer contract?}
    I -->|No| J[Build silver conformance and gold product]
    I -->|Yes| K[Still publish versioned gold boundary]
    J --> L{Gold consumption pattern}
    K --> L
    L -->|Relational serving| M[Warehouse evaluation]
    L -->|Spark/open data| N[Lakehouse evaluation]
    M --> O[DEV/TEST insert-update-delete-schema-recovery tests]
    N --> O
    O --> P{Reconciliation, SLO, access, recovery pass?}
    P -->|No| Q[Fix/escalate; no production]
    P -->|Yes| R[Human architecture and PROD handoff]
```

Use [Mirroring](../../capabilities/mirroring.md) only after current eligibility validation. A mirrored replica is neither a backup nor automatically a gold data product.
