# Real-Time Decision Tree

Use this tree under the [Fabric Engineering OS Constitution](../CONSTITUTION.md) to determine whether Real-Time Intelligence is justified.

```mermaid
flowchart TD
    A[State the decision latency the outcome actually needs] --> B{Would scheduled batch meet it?}
    B -->|Yes| C[Use a simpler batch path]
    B -->|No| D{Is the source event-oriented and supported?}
    D -->|No| E[Revisit source contract or bounded micro-batch]
    D -->|Yes| F{Primary action?}
    F -->|Ingest and transform event streams| G[Evaluate Eventstream]
    F -->|Explore or query time-series/event data| H[Evaluate Eventhouse and KQL]
    F -->|Detect conditions and trigger governed action| I[Evaluate Activator with explicit action controls]
    G & H & I --> J[Design ordering, lateness, replay, retention, alerting, and backpressure handling]
    J --> K[Validate supported behavior and operational load]
```

## Decision criteria

- Define measurable event-to-insight or event-to-action latency; avoid using “real time” as a vague preference.
- Model late, duplicated, missing, and out-of-order events.
- Bound automated actions with identity, rate, retry, idempotency, audit, and human intervention controls.
- Provide replay and degradation paths where the business outcome requires them.

## Stop conditions

Stop if the source contract, connector support, acceptable data loss, action authority, capacity behavior, or on-call ownership is unknown. Do not promise latency or delivery semantics without representative testing and current documentation.

## Record

Record the latency objective, event contract, selected capability, action boundary, failure modes, retention, replay, and tested operating envelope.
