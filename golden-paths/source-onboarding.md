# Source Onboarding Golden Path

This guide is governed by the root [Fabric Engineering OS Constitution](../CONSTITUTION.md).

## Outcome

A source is connected to Fabric through the least-complex supported method, with ownership, contract, security, replay, monitoring, and downstream readiness proven.

## Prerequisites

- Named source, data, security, and service owners.
- Business purpose, consumers, freshness objective, classification, region, and retention.
- Non-production source access and representative safe test data.
- Current Microsoft Learn validation for the candidate connector, shortcut, or Mirroring method.

## Decision points

- Use a [shortcut](../patterns/shortcut-before-copy.md) before copying when lifecycle, performance, and policy allow.
- Use Mirroring for a supported operational source when replication semantics meet the requirement.
- Use pipeline/connector ingestion when transformation, scheduling, unsupported source, or checkpoint control requires it.
- Reject onboarding when ownership, lawful use, keys, or production support cannot be established.

## Phased steps

1. **Discover:** capture source purpose, owner, objects, volume, cadence, keys, deletes, schema-change process, classification, and dependencies in the issue.
2. **Design:** choose shortcut, Mirroring, or ingestion; define identity, destination, contract, replay boundary, failure handling, cost assumption, and architecture decision.
3. **Build in DEV:** create environment-neutral configuration, secretless/approved identity, landing path, audit metadata, schema checks, and source-specific runbook.
4. **Prove in TEST:** execute initial and incremental loads; exercise duplicates, deletes, schema drift, outage, retry, and backfill; measure latency and capacity.
5. **Prepare adoption:** publish ownership, contract, monitoring, support route, and downstream handoff in the pull request.

## Required evidence and tests

- Source inventory and contract with classification, owner, keys, freshness, and retention.
- Microsoft Learn links and recorded tenant/region/capacity assumptions.
- Allowed/denied identity tests and proof that no secret is committed.
- Reconciliation counts/checksums, latency measurement, schema-drift result, retry/backfill evidence, and alert delivery.

## Approval gates

Human data and security owners approve source use and access. A human architecture owner approves the connection pattern. Agents may deploy approved DEV/TEST changes, but humans approve the PR, merge, source production impact, and every PROD action.

## Rollback and exit strategy

Disable schedules or replication without deleting evidence, revoke the runtime identity, preserve the last safe checkpoint, and stop downstream publication. If the source cannot meet contract or support requirements, document rejection and remove DEV/TEST artifacts through a reviewed change.

## Related guidance

[Capability catalog](../capabilities/README.md) · [Pipeline](../capabilities/pipeline.md) · [Mirroring](../capabilities/mirroring.md) · [OneLake](../capabilities/onelake.md) · [Data product architecture](../reference-architectures/data-product.md) · [Mirroring architecture](../reference-architectures/mirroring-to-gold.md)
