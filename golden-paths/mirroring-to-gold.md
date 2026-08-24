# Mirroring-to-Gold Golden Path

This guide is governed by the root [Fabric Engineering OS Constitution](../CONSTITUTION.md).

## Outcome

A Microsoft Learn-supported source is mirrored into OneLake and transformed into governed gold without exposing source-aligned replication as an unstable consumer contract.

## Prerequisites

- Approved source onboarding, source owner, and non-production connection.
- Current [Microsoft Learn Mirroring documentation](https://learn.microsoft.com/fabric/database/mirrored-database/overview) confirming source, region, and feature support.
- Known tables, keys, delete behavior, expected volume/latency, classification, and initial-load constraints.
- Gold data contract and DEV/TEST capacity.

## Decision points

- Confirm Mirroring rather than shortcut or pipeline copy provides the required freshness and control.
- Select only approved source objects/columns; reject broad replication by convenience.
- Decide Lakehouse or Warehouse gold based on consumer and transformation requirements.
- Define the source-schema isolation boundary and behavior for unsupported schema change.

## Phased steps

1. **Assess:** document support, source impact, identity, network, replication semantics, cost, and fallback.
2. **Design:** define mirrored scope, source-to-gold mappings, quality rules, latency SLO, monitoring, and pause/recovery procedure; obtain architecture approval.
3. **Build in DEV:** configure least-privilege Mirroring, create health checks, and implement idempotent transformations from mirrored data to gold.
4. **Qualify in TEST:** measure initial/incremental replication and exercise insert, update, delete, schema change, pause, outage, catch-up, and gold replay.
5. **Release:** attach Microsoft Learn evidence, contract tests, source-owner acknowledgement, runbook, and release/rollback manifest to the PR.

## Required evidence and tests

- Product-support links and tenant/region/capacity assumptions.
- Source-impact and least-privilege tests.
- Replication completeness, latency, delete, schema drift, recovery, and gold reconciliation results.
- Proof consumers access governed gold rather than relying on mirrored source schema.

## Approval gates

Human source/data and architecture owners approve replication scope and gold design; security approves identity/access. Agents may deploy approved DEV/TEST assets. Humans approve PR, merge, source production impact, and PROD.

## Rollback and exit strategy

Pause gold publication first, preserve the mirrored state and last safe gold checkpoint, then restore the previous transformation. If Mirroring is no longer viable, select shortcut or ingestion through a new architecture approval; do not silently change transport.

## Related guidance

[Mirroring capability](../capabilities/mirroring.md) · [Mirroring architecture](../reference-architectures/mirroring-to-gold.md) · [Shortcut before copy](../patterns/shortcut-before-copy.md) · [Medallion pattern](../patterns/medallion-data-product.md)
