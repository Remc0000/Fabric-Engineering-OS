This guide is governed by the [Fabric Engineering OS Constitution](../CONSTITUTION.md).

> **Scope/status:** Validate current Activator, Real-Time Intelligence, trigger, action, security, and integration behavior in Microsoft Learn and the target tenant.

## Purpose

Select Microsoft Fabric Activator when Real-Time Intelligence conditions must trigger governed alerts or actions from events, operational signals, or analytical observations.

## When To Use

- Event or metric conditions need business-owned alerting or action without building a separate custom monitoring application.
- The action boundary can be explicitly governed with ownership, identity, audit, retry, and escalation controls.
- Activator complements an event-driven Fabric design using [Eventstream](./eventstream.md), [Eventhouse](./eventhouse.md), or [Real-Time Intelligence](./real-time-intelligence.md).

## When NOT To Use

- The primary need is event ingestion or routing; evaluate [Eventstream](./eventstream.md).
- The primary need is KQL-first event and time-series analysis; evaluate [Eventhouse](./eventhouse.md).
- Automated action authority, ownership, testing, and rollback cannot be approved before production use.

## Pros

- Connects detection logic to governed operational response in a Fabric-first real-time scenario.
- Helps separate condition monitoring from downstream action handling and runbook ownership.
- Fits alerting and activation scenarios where business latency expectations justify event-driven operation.

## Cons

- Poorly bounded actions can create noise, duplicate work, or unintended operational impact.
- Source reliability, condition design, identity, retry, and escalation behavior require validation.
- It does not replace event ingestion, durable event storage, KQL investigation, or incident management process.

## Alternatives

- [Eventstream](./eventstream.md) for continuous event ingress, filtering, and routing.
- [Eventhouse](./eventhouse.md) for durable KQL analytics over event and time-series data.
- [Real-Time Intelligence](./real-time-intelligence.md) when the complete workload spans ingestion, analysis, monitoring, and action.

## Decision Drivers

- Required event-to-action latency and tolerance for false positives or missed conditions.
- Action authority, approval model, identity, audit, retry, throttling, and rollback requirements.
- Event source quality, schema stability, replay needs, and degradation path.
- Current Microsoft Learn support, tenant settings, and integration behavior at decision time.

## Related Patterns

- Select real-time event processing, observability, alerting, and operational response guidance from the [patterns catalog](../patterns/README.md).

## Related Golden Paths

- [Eventhouse RTI](../golden-paths/eventhouse-rti.md)
