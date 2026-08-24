# Eventhouse Real-Time Intelligence Golden Path

This guide is governed by the root [Fabric Engineering OS Constitution](../CONSTITUTION.md).

## Outcome

A production-ready Eventstream-to-Eventhouse solution meets an explicit latency objective, governs event contracts, and provides safe query, alerting, and optional action paths.

## Prerequisites

- Named producer, data, security, and service owners.
- Event purpose, contract, expected rate/burst, partition key, event time, classification, retention, and latency objective.
- DEV/TEST producer or replayable representative stream.
- Current [Microsoft Learn RTI documentation](https://learn.microsoft.com/fabric/real-time-intelligence/overview) for supported sources, features, and limits.

## Decision points

- Confirm real-time value justifies streaming complexity versus batch.
- Choose routing, partitioning, retention/hot-cache, update policy, query surface, and historical handoff.
- Define duplicate, late, out-of-order, malformed, and schema-version behavior.
- Use automated actions only when a human owner accepts the operational risk and disable path.

## Phased steps

1. **Contract:** version event fields, semantics, keys, timestamps, schema evolution, producer SLO, and consumer commitments.
2. **Architecture:** design Eventstream routes, Eventhouse/KQL objects, dead-letter/replay, security, capacity, monitoring, and optional actions; obtain human approval.
3. **Build in DEV:** implement routes, mappings/functions, diagnostics, dashboards, alerts, and correlation metadata.
4. **Load-test in TEST:** exercise target/burst throughput, latency, duplicate/late/order/schema failures, retention, replay, query concurrency, and action failure.
5. **Release:** publish producer/consumer instructions, SLO dashboard, runbook, capacity baseline, action controls, and immutable release manifest.

## Required evidence and tests

- Versioned event contract and product-support assumptions.
- Throughput plus p50/p95/p99 end-to-end latency measurements.
- Duplicate, late, out-of-order, malformed, schema-evolution, replay, and retention results.
- Least-privilege query/publish/action tests, alert delivery, and TEST rollback/disable evidence.

## Approval gates

Humans approve event/architecture design, sensitive data, capacity budget, and automated actions. Agents may deploy approved DEV/TEST changes. Humans approve PR, merge, producer production change, and PROD.

## Rollback and exit strategy

Disable actions first, stop or divert routes without discarding replayable evidence, restore prior mappings/functions, and replay from the last safe boundary. Exit to batch when measured latency value no longer justifies streaming cost/operations.

## Related guidance

[Real-Time Intelligence capability](../capabilities/real-time-intelligence.md) · [Eventhouse architecture](../reference-architectures/eventhouse-rti.md) · [Real-time event pattern](../patterns/real-time-event-processing.md) · [Observability pattern](../patterns/observability-by-default.md)
