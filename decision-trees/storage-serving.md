# Storage and Serving Decision Tree

Use this tree under the [Fabric Engineering OS Constitution](../CONSTITUTION.md) to choose storage and serving candidates in Microsoft Fabric.

```mermaid
flowchart TD
    A[Define consumers, access patterns, data shape, latency, and governance] --> B{Dominant serving interface?}
    B -->|Files, Delta tables, Spark, or open analytical storage| C[Candidate: Lakehouse]
    B -->|Relational SQL model, dimensional serving, or governed SQL endpoint| D[Candidate: Warehouse]
    B -->|High-volume event exploration and time-series analytics| E[Candidate: Eventhouse]
    B -->|Business metrics and interactive BI| F[Candidate: Semantic model over governed storage]
    C & D & E --> G{Multiple consumers need the same governed data?}
    G -->|Yes| H[Define OneLake reuse and serving boundaries]
    G -->|No| I[Keep the minimum viable serving surface]
    F --> J[Use semantic-layer tree]
    H & I & J --> K[Validate security, performance, lifecycle, recovery, and cost]
```

## Decision criteria

- Separate system-of-record responsibility from analytical serving responsibility.
- Optimize for the dominant query and maintenance pattern; do not duplicate data solely for tool familiarity.
- Define table format, partitioning, retention, history, schema evolution, and quality ownership before implementation.
- Add a serving surface only when it has a named consumer, service expectation, and owner.

## Stop conditions

Stop if data residency, sensitivity, recovery, retention, concurrency, workload isolation, or authoritative product limits are unknown. Benchmark representative data in DEV/TEST before making performance commitments.

## Record

Capture storage owner, serving interfaces, data contracts, expected scale, lifecycle, security model, rejected candidates, and benchmark limitations.
