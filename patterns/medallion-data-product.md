# Medallion Data Product

This pattern is governed by the root [Fabric Engineering OS Constitution](../CONSTITUTION.md).

## Context

Source data needs progressive quality improvement while preserving lineage and replayability.

## Problem

Mixing raw ingestion, conformance, and consumer-facing data makes defects hard to isolate and contracts hard to protect.

## Forces

- Raw evidence must remain recoverable.
- Quality rules and business transformations change at different rates.
- Consumers need stable, documented gold interfaces.
- Extra layers add storage, latency, and operating cost.

## Solution

Land immutable or append-oriented source data in bronze with ingestion metadata. Standardize types, keys, deduplication, and quality outcomes in silver. Publish only contract-approved tables, aggregates, or views in gold. Give each layer an owner, retention policy, access boundary, and quality threshold. Skip a physical layer only when the decision and equivalent controls are documented.

## Consequences

Failures are localized and replay is practical, but teams operate more artifacts and must prevent consumers from bypassing gold.

## Validation

- Trace one source record through all applicable layers.
- Re-run a partition and confirm an identical result.
- Quarantine invalid records without losing raw input.
- Verify gold schema, freshness, owner, and access against its contract.

## Related guidance

[Data product golden path](../golden-paths/data-product.md) · [Data product architecture](../reference-architectures/data-product.md) · [Contract-first data product](contract-first-data-product.md) · [Idempotent processing](idempotent-processing.md) · [Lakehouse capability](../capabilities/lakehouse.md)
