# Idempotent Processing

This pattern is governed by the root [Fabric Engineering OS Constitution](../CONSTITUTION.md).

## Context

Data operations can be retried after transient failure, replay, or operator action.

## Problem

Retries can duplicate records, regress watermarks, or partially publish inconsistent output.

## Forces

- Sources may not provide stable keys or ordered events.
- Exactly-once behavior is rarely end-to-end.
- Large rewrites are expensive.
- Late and corrected data must remain possible.

## Solution

Choose a deterministic processing identity from source key, partition, offset, or content hash. Stage work, deduplicate or merge deterministically, commit output and checkpoint together where possible, and expose safe replay boundaries. Never advance a watermark before durable publication.

## Consequences

Recovery becomes routine, at the cost of state, keys, and explicit conflict policy.

## Validation

- Execute the same input twice and compare row counts and checksums.
- Fail between staging, publication, and checkpoint updates.
- Replay late or corrected data.
- Verify concurrent runs cannot overwrite newer state.

## Related guidance

[Metadata-driven ELT](../golden-paths/metadata-driven-elt.md) · [Medallion data product](medallion-data-product.md) · [Real-time event processing](real-time-event-processing.md)
