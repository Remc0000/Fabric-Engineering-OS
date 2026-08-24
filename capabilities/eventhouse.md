# Eventhouse

This guide is governed by the [Fabric Engineering OS Constitution](../CONSTITUTION.md).

> **Scope/status:** Validate current KQL database, ingestion, retention, caching, security, capacity, and integration behavior in Microsoft Learn and the target tenant.

## Purpose

Select Eventhouse as the KQL-first analytical store for high-volume event, log, telemetry, and time-series data.

## When To Use

- Data is append-oriented and queried by time, entity, sequence, or event attributes.
- KQL exploration and low-latency operational analytics are central to the workload.
- Retention and hot-data policies must be designed around event access patterns.

## When NOT To Use

- The workload requires OLTP transactions; evaluate [Fabric SQL database](fabric-sql-database.md).
- Dimensional T-SQL analytics is the dominant model; evaluate [Warehouse](warehouse.md).
- Only event routing is needed; start with [Eventstream](eventstream.md).

## Pros

- Fits high-volume telemetry and time-oriented exploration.
- Supports KQL-native analysis and operational investigation.
- Forms a durable analytical destination for Real-Time Intelligence solutions.

## Cons

- KQL skills and event-specific modeling practices are required.
- It is not a general substitute for relational or Delta-based analytical stores.
- Retention, caching, ingestion, and query design directly affect cost and performance.

## Alternatives

- [Lakehouse](lakehouse.md) for Delta-based engineering and broader file workflows.
- [Warehouse](warehouse.md) for relational dimensional serving.
- [Eventstream](eventstream.md) for ingress and routing without a KQL analytical store.

## Decision Drivers

- Event volume, velocity, retention, and query latency.
- KQL competency and consumer tooling.
- Hot versus historical access patterns.
- Ingestion, update, governance, and cost requirements.

## Related Patterns

- Select event modeling, retention, streaming ingestion, and operational observability guidance from the [patterns catalog](../patterns/README.md).

## Related Golden Paths

- [Eventhouse RTI](../golden-paths/eventhouse-rti.md)
- [Production incident](../golden-paths/production-incident.md)
- [Data product](../golden-paths/data-product.md)
