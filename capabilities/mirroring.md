# Mirroring

This guide is governed by the [Fabric Engineering OS Constitution](../CONSTITUTION.md).

> **Scope/status:** Mirroring source coverage, setup modes, limitations, latency, billing, and preview status vary. Confirm the exact source and tenant combination in Microsoft Learn before selection.

## Purpose

Select Fabric Mirroring to maintain a managed, continuously refreshed replica of a supported source in OneLake with less custom ingestion ownership.

## When To Use

- The source is explicitly supported and change replication meets the freshness need.
- The goal is to land operational data for downstream Fabric analytics with minimal custom copy orchestration.
- Source permissions, network access, and operational impact can be validated and governed.

## When NOT To Use

- Transformations, enrichment, complex routing, or custom recovery logic must occur during ingestion.
- The source, data type, topology, or required operation is unsupported.
- The design assumes zero latency, zero source impact, or guaranteed lossless behavior without source-specific evidence.

## Pros

- Reduces custom pipeline and watermark logic for supported sources.
- Makes replicated data available for downstream Fabric processing.
- Can shorten source-onboarding time when prerequisites are already met.

## Cons

- Capability and limitations differ by mirrored source.
- Replication does not replace data quality, conformance, or gold-layer modeling.
- Troubleshooting and recovery remain dependent on source health, connectivity, capacity, and service behavior.

## Alternatives

- [Pipeline](pipeline.md) for controlled batch copy, transformation, or unsupported sources.
- [Eventstream](eventstream.md) for event-native continuous ingestion and routing.
- [OneLake](onelake.md) shortcuts when reference-in-place is supported and preferable to replication.

## Decision Drivers

- Exact source support and change-capture semantics.
- Required freshness, recovery, and reconciliation evidence.
- Network, identity, source-load, and cost constraints.
- Ownership of downstream bronze-to-gold processing.

## Related Patterns

- Select change-data-capture, reconciliation, schema-evolution, and medallion guidance from the [patterns catalog](../patterns/README.md).

## Related Golden Paths

- [Mirroring to gold](../golden-paths/mirroring-to-gold.md)
- [Source onboarding](../golden-paths/source-onboarding.md)
- [Production incident](../golden-paths/production-incident.md)
