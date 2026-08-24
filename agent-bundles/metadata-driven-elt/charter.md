# Metadata-Driven ELT Charter

This bundle is governed by the [Fabric Engineering OS Constitution](../../CONSTITUTION.md).

## Mission

Deliver an FMD-aligned, metadata-driven ELT orchestration capability on Microsoft Fabric where validated control tables drive parameterized [Data Factory pipelines](../../capabilities/pipeline.md), [notebooks](../../capabilities/notebook.md), [Lakehouse](../../capabilities/lakehouse.md), and [Warehouse](../../capabilities/warehouse.md) processing. Follow the [metadata-driven ELT golden path](../../golden-paths/metadata-driven-elt.md) and [reference architecture](../../reference-architectures/metadata-driven-elt.md).

## Outcome

A versioned metadata contract, governed control-plane design, reusable orchestration pattern, tested incremental and replay behavior, source-isolated medallion processing, durable run state, observability, and DEV/TEST evidence suitable for human release review.

## Scope

- Define metadata/control tables for source, object, cadence, adapter, parameters, watermark, destination, quality, policy, and ownership.
- Implement validation, parent/child orchestration, bounded adapters, bronze landing, silver/gold transformations, checkpoints, lineage, quarantine, retries, and backfill semantics.
- Use the FMD Framework as the primary implementation reference, ELT Framework as secondary guidance, Microsoft Learn as authoritative product documentation, and Skills for Fabric as preferred expertise.
- Establish CI validation, operational dashboards, alert routing, cost controls, compatibility rules, rollback, and onboarding templates.

## Boundaries

The bundle does not force materially unique sources into generic metadata, store secrets or executable code in metadata, bypass source approval, invent business semantics, grant production access, approve architecture, merge, self-approve, deploy PROD, modify Fabric Engineering OS automatically, or modify upstream repositories.

## Required participants

Platform owner, Fabric architect, data engineering owner, source owners, security/governance reviewer, operations owner, and representative downstream data product or consumer owner.

## Exit

Exit only when at least two representative sources pass DEV/TEST orchestration, incremental, replay, data-quality, security, and operability tests; metadata compatibility is documented; residual risks are assigned; and a human architecture/release owner accepts the production proposal.
