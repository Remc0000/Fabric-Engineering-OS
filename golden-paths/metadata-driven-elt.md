# Metadata-Driven ELT Golden Path

This guide is governed by the root [Fabric Engineering OS Constitution](../CONSTITUTION.md).

## Outcome

A shared Fabric orchestrator onboards sources through validated, versioned metadata while isolating failures and producing reproducible data, checkpoints, and evidence.

## Prerequisites

- At least two approved sources with materially similar lifecycle needs.
- Named platform, source, data, security, and service owners.
- DEV/TEST connections, representative volumes, and source contracts.
- Current Microsoft Learn validation for Data Factory, connectors, notebooks, and target items.

## Decision points

- Use dedicated pipelines for materially unique behavior; do not force exceptions into opaque metadata.
- Define metadata schema, compatibility/versioning, extension points, and prohibited fields.
- Select watermark/checkpoint, concurrency, retry, backfill, quarantine, and publication semantics.
- Prefer shortcut or Mirroring when they satisfy the need with less orchestration.

## Phased steps

1. **Model:** derive a minimal metadata contract from representative sources, including owner, adapter, object, schema, cadence, watermark, destination, quality, and policy.
2. **Design:** define validator, parent/child orchestration, state transitions, identities, bronze boundary, transformation interface, telemetry, and failure isolation; obtain architecture approval.
3. **Build in DEV:** implement schema validation, bounded adapters, idempotent writes, durable checkpoints, configuration-version capture, and per-source alerts.
4. **Qualify in TEST:** run initial/incremental, retry, duplicate, backfill, schema drift, invalid metadata, source outage, concurrency, and partial-publication scenarios for two sources.
5. **Operationalize:** publish onboarding template, compatibility rules, runbook, dashboards, cost baseline, and release/rollback manifests.

## Required evidence and tests

- Metadata schema, examples, version rules, and review history.
- Proof invalid metadata fails before access/write and contains no secrets/arbitrary code.
- Deterministic retry/backfill, checkpoint safety, failure isolation, and output reconciliation.
- Trace from output to source, code, metadata version, run ID, plus security, scale, alert, and TEST rollback results.

## Approval gates

Human architecture and platform owners approve the shared design; source/data/security owners approve each onboarding. Agents may deploy approved DEV/TEST changes. Humans approve PR, merge, breaking metadata changes, and PROD.

## Rollback and exit strategy

Pause affected metadata entries, preserve run/checkpoint state, restore prior orchestrator and compatible metadata, then replay from the last safe checkpoint. Move an exceptional source to a dedicated path through a reviewed [Fabric Decision Record](../decision-records/TEMPLATE.md).

## Reference sources

Ground the metadata contract and orchestration in the [FMD Framework](https://github.com/edkreuk/FMD_FRAMEWORK) as the primary implementation reference and the Fabric-only Option 1 of the [unified data foundation accelerator](https://github.com/microsoft/unified-data-foundation-with-fabric-solution-accelerator) for architecture. [Project Osmos](https://github.com/microsoft/project-osmos) is a governed agent-execution reference for building and testing ingestion notebooks; agents may apply it in DEV/TEST only after human approval and never against PROD. All are read-only; validate product behavior against Microsoft Learn. See the [Source-Grounding registry](../standards/source-grounding.md).

## Related guidance

[Pipeline capability](../capabilities/pipeline.md) · [Metadata-driven ELT architecture](../reference-architectures/metadata-driven-elt.md) · [Metadata orchestration pattern](../patterns/metadata-driven-orchestration.md) · [Idempotent processing](../patterns/idempotent-processing.md)
