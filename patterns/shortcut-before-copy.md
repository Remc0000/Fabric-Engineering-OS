# Shortcut Before Copy

This pattern is governed by the root [Fabric Engineering OS Constitution](../CONSTITUTION.md).

## Context

Required data already exists in OneLake or a supported external location and can be referenced by a Fabric shortcut.

## Problem

Defaulting to physical copies increases latency, cost, reconciliation work, and duplicate security surfaces.

## Forces

- Consumers need predictable performance and availability.
- Source ownership and lifecycle remain external.
- Some transformations, retention rules, or region constraints require materialization.
- Shortcut support and behavior must be verified against current Microsoft Learn documentation.

## Solution

Evaluate a shortcut first. Record source owner, supported path, identity, region, schema-change behavior, availability expectation, and performance test. Materialize only when a measured requirement—such as isolation, retention, transformation, performance, or unsupported connectivity—justifies the copy.

## Consequences

Shortcuts reduce duplication and improve freshness, but create runtime dependency on the source and require explicit ownership boundaries.

## Validation

- Confirm least-privilege access from the consuming workspace.
- Test schema change and source unavailability behavior.
- Measure representative query performance.
- Document the reason when copying is selected.

## Related guidance

[Source onboarding](../golden-paths/source-onboarding.md) · [Mirroring to gold](../golden-paths/mirroring-to-gold.md) · [Mirroring architecture](../reference-architectures/mirroring-to-gold.md) · [OneLake capability](../capabilities/onelake.md)
