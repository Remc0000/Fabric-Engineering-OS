# OneLake

This guide is governed by the [Fabric Engineering OS Constitution](../CONSTITUTION.md).

> **Scope/status:** Shortcut targets, security propagation, caching, residency, and cross-tenant or cross-region behavior are source- and tenant-dependent; verify them in Microsoft Learn.

## Purpose

Use OneLake as Fabric's shared data plane and namespace for organizing, governing, and referencing data used by Fabric workloads.

## When To Use

- Multiple Fabric workloads need governed access to the same logical data estate.
- Shortcuts can reference supported data without introducing an avoidable managed copy.
- Domains and workspaces need a deliberate ownership and discoverability model.

## When NOT To Use

- The requirement is compute, transformation, orchestration, or business semantics; select the capability that performs that work.
- A shortcut is assumed to provide identical security, performance, or feature behavior for every source.
- Data placement, sovereignty, or source availability rules have not been validated.

## Pros

- Creates a common storage and discovery boundary across Fabric.
- Can reduce duplicate data through supported shortcut and reuse scenarios.
- Separates logical data access decisions from a single compute engine.

## Cons

- It does not remove the need for data ownership, access design, lifecycle management, or cost controls.
- Source characteristics can affect shortcut performance and supported operations.
- Poor namespace and domain design can make shared data harder to govern.

## Alternatives

- [Mirroring](mirroring.md) when a managed replicated copy from a supported operational source is required.
- [Pipeline](pipeline.md) when controlled movement and transformation are required.
- [Lakehouse](lakehouse.md) or [Warehouse](warehouse.md) when a managed analytical store is the actual decision.

## Decision Drivers

- Copy versus reference requirements.
- Data ownership, locality, residency, and access boundaries.
- Source compatibility and expected read/write behavior.
- Performance, freshness, lineage, and cost expectations.

## Related Patterns

- Select shortcut, domain ownership, data-product boundary, and least-privilege guidance from the [patterns catalog](../patterns/README.md).

## Related Golden Paths

- [Source onboarding](../golden-paths/source-onboarding.md)
- [Data product](../golden-paths/data-product.md)
- [Mirroring to gold](../golden-paths/mirroring-to-gold.md)
