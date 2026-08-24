# Data Product Golden Path

This guide is governed by the root [Fabric Engineering OS Constitution](../CONSTITUTION.md).

## Outcome

A domain-owned Fabric data product publishes versioned, secure, observable gold interfaces whose quality and compatibility are independently testable.

## Prerequisites

- Approved [source onboarding](source-onboarding.md) evidence.
- Named product, data, security, and service owners and identified consumers.
- Draft purpose, grain, keys, classification, freshness, quality, retention, and compatibility contract.
- DEV/TEST workspaces and reviewed deployment mechanism.

## Decision points

- Select Lakehouse, Warehouse, or both based on engineering and serving needs validated in Microsoft Learn.
- Decide physical bronze/silver/gold boundaries from replay, quality, access, and performance needs.
- Prefer shortcut over copy when measured requirements do not justify materialization.
- Add a semantic model only when shared measures, relationships, or consumer security require it.

## Phased steps

1. **Contract:** agree purpose, consumers, grain, fields, semantics, quality thresholds, freshness, access, change, and deprecation.
2. **Architecture:** map sources, medallion boundaries, identities, lineage, capacity, failure domains, and recovery; obtain human architecture approval.
3. **DEV implementation:** land bronze evidence, implement deterministic silver rules, publish only contract-approved gold, and add run metadata and tests.
4. **TEST qualification:** run representative scale, reconciliation, replay, schema evolution, security, performance, failure, and recovery scenarios.
5. **Publish:** document ownership, discoverability, sample consumption, SLOs, runbook, cost baseline, release manifest, and compatibility statement.

## Required evidence and tests

- Versioned data contract and [Fabric Decision Record](../decision-records/TEMPLATE.md).
- Source-to-gold reconciliation and record-level lineage sample.
- Idempotent replay, quarantine, late/corrected-data, and schema compatibility results.
- Freshness, quality, performance, least-privilege, monitoring, and TEST rollback evidence.

## Approval gates

Human data and architecture owners approve contract and topology; security/service owners approve controls and operability. Agents may implement and deploy DEV/TEST. Humans approve PR, merge, breaking contract changes, and PROD.

## Rollback and exit strategy

Stop gold publication, retain bronze and checkpoints, restore the prior compatible transformation and contract, and replay affected partitions. Deprecation requires a human-approved consumer migration window; deletion follows retention and access policy.

## Related guidance

[Lakehouse capability](../capabilities/lakehouse.md) · [Warehouse capability](../capabilities/warehouse.md) · [Data product architecture](../reference-architectures/data-product.md) · [Medallion pattern](../patterns/medallion-data-product.md) · [Contract-first pattern](../patterns/contract-first-data-product.md)
