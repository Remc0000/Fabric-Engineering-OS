# Source Onboarding Decision Tree

This decision tree is subordinate to the [Fabric Engineering OS Constitution](../../CONSTITUTION.md) and the [source-onboarding golden path](../../golden-paths/source-onboarding.md).

```mermaid
flowchart TD
    A[Source contract and owner confirmed?] -->|No| X[Stop: obtain owner, purpose, classification]
    A -->|Yes| B{Latency requirement}
    B -->|Seconds or continuous| C{Fabric Eventstream connector and semantics fit?}
    C -->|Yes| D[Use Eventstream capability]
    C -->|No| E[Escalate architecture; do not improvise external platform]
    B -->|Minutes, hourly, batch| F{Supported Fabric Data Factory connector?}
    F -->|No| E
    F -->|Yes| G{Reliable change marker or CDC available?}
    G -->|Yes| H[Incremental load with persisted checkpoint]
    G -->|No| I{Bounded full snapshot acceptable?}
    I -->|No| E
    I -->|Yes| J[Snapshot with reconciliation and replacement strategy]
    D --> K[Define quarantine, replay, schema evolution]
    H --> K
    J --> K
    K --> L{Sensitive or regulated data?}
    L -->|Yes| M[Governance review, least privilege, protected test data]
    L -->|No| N[Standard access review]
    M --> O[DEV tests then TEST evidence]
    N --> O
    O --> P{Reconciliation, replay, recovery pass?}
    P -->|No| Q[Fix or escalate; no production handoff]
    P -->|Yes| R[Human production go/no-go handoff]
```

Use [Data Factory pipelines](../../capabilities/pipeline.md) for scheduled/orchestrated ingestion and [Eventstream](../../capabilities/eventstream.md) for supported streaming ingestion. A connector's existence does not establish suitability: validate regional availability, authentication, limits, and semantics in current Microsoft Learn documentation.
