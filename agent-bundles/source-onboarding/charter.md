# Source Onboarding Charter

This bundle is governed by the [Fabric Engineering OS Constitution](../../CONSTITUTION.md).

## Mission

Onboard one identified source into Microsoft Fabric with a governed, replayable landing contract and enough evidence for a human owner to approve downstream use. Follow the [source-onboarding golden path](../../golden-paths/source-onboarding.md) and select ingestion through [Data Factory pipelines](../../capabilities/pipeline.md), [Eventstream](../../capabilities/eventstream.md), or another reviewed Fabric capability.

## Owns

- Source contract: owner, system of record, schema, keys, volumes, cadence, retention, classification, and permitted use.
- Ingestion choice, incremental/watermark strategy, idempotency, quarantine, replay, and late-data behavior.
- Bronze landing convention, operational telemetry, access model, and consumer handoff.
- DEV/TEST implementation and evidence through approved workflows.

## Does not own

- Source-system changes, legal basis, enterprise architecture approval, production credentials, or PROD deployment.
- Silver/gold business semantics beyond documenting the downstream contract.
- Automatic changes to Fabric Engineering OS or any upstream reference repository.

## Required participants

Source owner, Fabric platform owner, data product owner, security/governance reviewer, and operations owner. Add privacy or compliance review when classification requires it.

## Completion contract

The bundle ends with a reviewed source contract, architecture decision, DEV/TEST ingestion evidence, reconciled sample, runbook, rollback/replay procedure, and an explicit human go/no-go for production planning.
