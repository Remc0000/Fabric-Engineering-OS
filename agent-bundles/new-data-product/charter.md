# New Data Product Charter

This bundle is governed by the [Fabric Engineering OS Constitution](../../CONSTITUTION.md).

## Mission

Deliver a consumer-owned Microsoft Fabric data product from governed sources to reusable gold interfaces. Follow the [data-product golden path](../../golden-paths/data-product.md), using [Lakehouse](../../capabilities/lakehouse.md), [Warehouse](../../capabilities/warehouse.md), and [Data Factory pipelines](../../capabilities/pipeline.md) according to workload needs.

## Outcome

A versioned product contract, approved medallion architecture, tested transformations, discoverable lineage, service objectives, operating model, and DEV/TEST evidence suitable for human release review.

## Scope

- Define consumers, decisions supported, domain owner, grain, keys, measures, freshness, quality rules, classification, and retention.
- Reuse onboarded bronze contracts; design silver conformance and gold consumption interfaces.
- Establish CI validation, observability, ownership, cost envelope, rollback, and compatibility policy.

## Boundaries

The bundle does not invent enterprise definitions without a domain owner, ingest unapproved sources, grant production access, approve architecture, merge, or deploy PROD. It does not modify Fabric Engineering OS or upstream repositories.

## Required participants

Domain/data product owner, source owners, Fabric architect, engineering owner, governance/security reviewer, consumer representative, and operations owner.

## Exit

Exit only when consumers accept the contract in TEST, mandatory tests pass, residual risks are assigned, and a human architecture/release owner accepts the production proposal.
