# Real-Time Event Processing

This pattern is governed by the root [Fabric Engineering OS Constitution](../CONSTITUTION.md).

## Context

Events must be ingested, analyzed, and acted upon within a defined latency objective.

## Problem

Unbounded streams, duplicates, late events, and schema changes undermine trustworthy real-time outcomes.

## Forces

- Throughput and latency compete with cost and retention.
- Event-time differs from processing-time.
- Consumers may need both hot analytics and historical reuse.
- Real-Time Intelligence features and limits evolve.

## Solution

Define an event contract and partition key, retain source time and ingestion time, establish duplicate and late-arrival policy, route through Eventstream into Eventhouse/KQL databases, and expose governed query or activation outputs. Add dead-letter handling, lag telemetry, retention, and replay from the earliest practical boundary.

## Consequences

Operational insight is timely, but capacity, ordering, retention, and schema governance become continuous concerns.

## Validation

- Load-test target throughput and end-to-end latency.
- Inject duplicate, late, malformed, and out-of-order events.
- Prove retention and replay behavior.
- Verify alerts and downstream actions use approved fields and thresholds.

## Related guidance

[Eventhouse RTI golden path](../golden-paths/eventhouse-rti.md) · [Eventhouse RTI architecture](../reference-architectures/eventhouse-rti.md) · [Idempotent processing](idempotent-processing.md) · [Real-Time Intelligence capability](../capabilities/real-time-intelligence.md)
