# Real-Time Intelligence

This guide is governed by the [Fabric Engineering OS Constitution](../CONSTITUTION.md).

> **Scope/status:** Real-Time Intelligence experiences, integrations, and automation features evolve independently and may be preview or tenant-specific. Validate each selected component in Microsoft Learn.

## Purpose

Select Real-Time Intelligence (RTI) as an end-to-end Fabric workload when continuous events must be ingested, analyzed, monitored, visualized, and acted on as one governed operational solution.

## When To Use

- Business value depends on detecting and responding to events within a defined time window.
- Event ingestion, KQL analytics, live monitoring, and rule-based action need coordinated ownership.
- Operations teams require an explicit path from signal to investigation and response.

## When NOT To Use

- A bounded [Eventstream](eventstream.md) or [Eventhouse](eventhouse.md) decision solves the requirement.
- The source and consumer operate adequately on scheduled batch data.
- Response actions, escalation ownership, and acceptable false-positive behavior are undefined.

## Pros

- Provides a coherent Fabric workload for event-driven operational scenarios.
- Connects event movement, analysis, visualization, and action without treating each as an isolated project.
- Encourages latency and operational-response requirements to be designed together.

## Cons

- More components increase governance, monitoring, capacity, and incident-response responsibilities.
- Real-time expectations can be costly or misleading unless latency is measured end to end.
- Automated actions require strong human ownership, safety controls, and failure handling.

## Alternatives

- [Pipeline](pipeline.md) with [Lakehouse](lakehouse.md) or [Warehouse](warehouse.md) for batch analytics.
- [Eventstream](eventstream.md) when only continuous routing is required.
- [Eventhouse](eventhouse.md) when the scope is KQL-based event analytics.

## Decision Drivers

- Measurable event-to-insight and event-to-action latency.
- Event volume, retention, replay, and ordering needs.
- Operational ownership, alert quality, and response safety.
- Capacity, source, destination, and action integration support.

## Related Patterns

- Select event-driven architecture, alerting, human-in-the-loop, dead-letter, and observability guidance from the [patterns catalog](../patterns/README.md).

## Related Golden Paths

- [Eventhouse RTI](../golden-paths/eventhouse-rti.md)
- [Production incident](../golden-paths/production-incident.md)
- [Source onboarding](../golden-paths/source-onboarding.md)
