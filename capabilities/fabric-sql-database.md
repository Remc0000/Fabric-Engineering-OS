# Fabric SQL Database

This guide is governed by the [Fabric Engineering OS Constitution](../CONSTITUTION.md).

> **Scope/status:** SQL database in Fabric capabilities, source-control support, replication behavior, limits, and regional or tenant availability may evolve. Confirm them in Microsoft Learn.

## Purpose

Select Fabric SQL database for a Fabric-native relational operational workload that requires transactional SQL behavior and close integration with Fabric analytics.

## When To Use

- An application or operational process needs relational transactions and SQL access in Fabric.
- Operational data should participate in downstream Fabric analytics without treating an analytical store as the system of record.
- The supported security, connectivity, resilience, and lifecycle model meets the application requirement.

## When NOT To Use

- The workload is primarily analytical and dimensional; evaluate [Warehouse](warehouse.md).
- Spark, Delta, or file engineering is primary; evaluate [Lakehouse](lakehouse.md).
- High-volume telemetry and KQL exploration dominate; evaluate [Eventhouse](eventhouse.md).

## Pros

- Separates transactional responsibilities from analytical serving while remaining in Fabric.
- Uses relational SQL concepts familiar to application and database teams.
- Can simplify approved operational-to-analytics scenarios within Fabric.

## Cons

- Operational availability, recovery, and performance requirements demand workload-specific validation.
- It is not a substitute for Warehouse, Lakehouse, or Eventhouse design.
- Preview or evolving lifecycle integrations can constrain production adoption.

## Alternatives

- [Warehouse](warehouse.md) for T-SQL analytical serving.
- [Lakehouse](lakehouse.md) for Delta-based data engineering.
- [Mirroring](mirroring.md) when an existing supported operational database should remain the source of record.

## Decision Drivers

- Transaction, consistency, concurrency, and application latency needs.
- Connectivity, identity, resilience, backup, and recovery requirements.
- Operational versus analytical ownership boundaries.
- Current availability, lifecycle, and deployment support.

## Related Patterns

- Select operational-store separation, transactional outbox, least-privilege, and recovery guidance from the [patterns catalog](../patterns/README.md).

## Related Golden Paths

- [Source onboarding](../golden-paths/source-onboarding.md)
- [Data product](../golden-paths/data-product.md)
- [Release management](../golden-paths/release-management.md)
