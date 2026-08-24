# Ingestion Decision Tree

Use this tree under the [Fabric Engineering OS Constitution](../CONSTITUTION.md) to select a bounded Fabric ingestion approach.

```mermaid
flowchart TD
    A[Characterize source, volume, latency, change pattern, and security] --> B{Continuous events required?}
    B -->|Yes| C[Evaluate Eventstream or supported real-time connector]
    B -->|No| D{Can Fabric reference or replicate data without custom movement?}
    D -->|Yes| E[Evaluate shortcut, mirroring, or supported native access]
    D -->|No| F{Orchestration-first copy or transformation?}
    F -->|Copy and coordinate| G[Evaluate Data Factory pipeline or Dataflow Gen2]
    F -->|Code-first or large-scale transformation| H[Evaluate notebook or Spark job]
    C & E & G & H --> I[Define checkpointing, retries, idempotency, schema handling, and observability]
    I --> J[Validate connector support and target tenant constraints]
```

## Decision criteria

- Prefer the least data movement that meets freshness, isolation, governance, and recovery needs.
- Choose scheduled batch when the outcome does not justify continuous processing.
- Treat change-data behavior, ordering, duplicates, deletes, late arrivals, and schema drift as explicit contracts.
- Separate ingestion from business transformation when ownership, retry, or lineage differs.

## Stop conditions

Stop if credentials, network path, data classification, source impact, egress, connector support, recovery objective, or data owner approval is unresolved. Do not infer exactly-once behavior or connector guarantees without authoritative evidence.

## Record

Document source and destination, chosen capability, cadence, volume assumptions, failure and replay behavior, schema contract, security boundary, and validation evidence.
