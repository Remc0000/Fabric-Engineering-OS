# Eventhouse RTI Decision Tree

This tree follows the [Fabric Engineering OS Constitution](../../CONSTITUTION.md) and [eventhouse-rti golden path](../../golden-paths/eventhouse-rti.md).

```mermaid
flowchart TD
    A[Named producer, consumer, event contract?] -->|No| X[Stop and establish ownership]
    A -->|Yes| B{Required insight latency}
    B -->|Batch latency acceptable| C[Use source/data-product path instead]
    B -->|Seconds or continuous| D{Supported Eventstream source and region?}
    D -->|No| E[Architecture escalation; remain Fabric-only]
    D -->|Yes| F[Define event time, key, ordering, duplicate semantics]
    F --> G{Durable KQL analysis required?}
    G -->|Yes| H[Eventhouse table, mapping, retention, update policies]
    G -->|No| I[Validate direct routing requirement and durability risk]
    H --> J{Late/out-of-order events expected?}
    I --> J
    J -->|Yes| K[Windowing, watermark, correction, replay design]
    J -->|No| L[Still define deduplication and replay]
    K --> M{Automated action?}
    L --> M
    M -->|Consequential| N[Human approval, bounds, kill switch, audit]
    M -->|Informational/reversible| O[Rate limit, dedupe, observe]
    N --> P[DEV/TEST load, failure, security, action tests]
    O --> P
    P --> Q{Latency, loss, replay, controls pass?}
    Q -->|No| R[Fix/escalate; no production handoff]
    Q -->|Yes| S[Human PROD go/no-go]
```

Confirm current feature availability in Microsoft Learn and the [Real-Time Intelligence capability](../../capabilities/real-time-intelligence.md); preview or regional availability must never be assumed.
