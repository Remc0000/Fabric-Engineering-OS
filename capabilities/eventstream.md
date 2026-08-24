# Eventstream

This guide is governed by the [Fabric Engineering OS Constitution](../CONSTITUTION.md).

> **Scope/status:** Connector support, transformations, event-processing behavior, retention, throughput, and capacity constraints can change; validate the complete route in Microsoft Learn and the target tenant.

## Purpose

Select Eventstream for continuous ingestion, lightweight processing, and routing of supported event sources to Fabric destinations.

## When To Use

- Events must be captured and routed continuously rather than copied in periodic batches.
- Supported no-code or low-code transformations are sufficient before delivery.
- Multiple supported destinations need a visible, managed event flow.

## When NOT To Use

- Complex stateful processing or transformations exceed the supported event operations.
- Durable historical analytics is the primary unmet need; pair with or select [Eventhouse](eventhouse.md).
- Batch dependencies and file movement dominate; evaluate [Pipeline](pipeline.md).

## Pros

- Makes streaming sources, transformations, and destinations visible in one flow.
- Reduces custom plumbing for supported connectors and routing scenarios.
- Integrates naturally into Real-Time Intelligence solutions.

## Cons

- Connector and transformation boundaries can constrain complex processing.
- End-to-end reliability still requires monitoring, replay, reconciliation, and destination design.
- Streaming increases operational sensitivity to schema drift, backpressure, and malformed events.

## Alternatives

- [Pipeline](pipeline.md) for scheduled batch orchestration.
- [Mirroring](mirroring.md) for managed replication from a supported operational source.
- [Notebook](notebook.md) when code-first processing is required and supported by the chosen streaming design.

## Decision Drivers

- Event rate, size, order, lateness, and schema behavior.
- Connector and destination support.
- Transformation complexity and replay strategy.
- Monitoring, alerting, and failure-handling ownership.

## Related Patterns

- Select streaming ingestion, dead-letter, schema-evolution, and observability guidance from the [patterns catalog](../patterns/README.md).

## Related Golden Paths

- [Eventhouse RTI](../golden-paths/eventhouse-rti.md)
- [Source onboarding](../golden-paths/source-onboarding.md)
- [Production incident](../golden-paths/production-incident.md)
