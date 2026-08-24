# Semantic Model Golden Path

This guide is governed by the root [Fabric Engineering OS Constitution](../CONSTITUTION.md).

## Outcome

A reusable Fabric semantic model exposes reconciled measures, clear business language, predictable performance, and tested security over approved gold data.

## Prerequisites

- Contract-approved gold data with owner, grain, keys, quality, and freshness evidence.
- Named semantic, data, security, and service owners and known consumer scenarios.
- Representative query workload and user/security personas.
- Current Microsoft Learn validation for model mode, deployment, security, and refresh behavior.

## Decision points

- Reuse/extend an existing domain model before creating another.
- Select model/storage mode from freshness, scale, feature, and capacity tests—not preference.
- Choose conformed dimensions, relationship direction, explicit measures, and security at the narrowest reliable layer.
- Treat an incompatible measure or exposed-field change as a contract change.

## Phased steps

1. **Define:** inventory business questions, measures, dimensions, synonyms, security personas, freshness, and performance objectives.
2. **Design:** create model grain, relationships, measure definitions, security roles, naming, descriptions, endorsement, and compatibility plan; obtain semantic/architecture approval.
3. **Build in DEV:** implement explicit measures, hide technical fields, configure security and refresh/direct access, and version model definitions.
4. **Qualify in TEST:** reconcile measures and totals; test ambiguity, blank/unknown members, time logic, security roles, concurrency, representative queries, and downstream compatibility.
5. **Publish:** attach model documentation, ownership, lineage, test results, refresh/support runbook, and release manifest.

## Required evidence and tests

- Measure dictionary tied to approved gold queries.
- Relationship/grain review and totals/time-intelligence reconciliation.
- Allowed and denied row/object access per persona.
- Query and refresh performance against objectives, plus consumer compatibility and TEST rollback.

## Approval gates

Human data/semantic and architecture owners approve meaning and model design; security approves roles. Agents may build and deploy DEV/TEST. Humans approve PR, merge, endorsement changes, breaking semantic changes, and PROD.

## Rollback and exit strategy

Restore the prior model artifact and environment binding; disable or revert incompatible refresh/configuration. Preserve a compatibility window or parallel version for breaking changes, then retire only after human-confirmed consumer migration.

## Related guidance

[Semantic model capability](../capabilities/semantic-model.md) · [Data product architecture](../reference-architectures/data-product.md) · [Governed semantic layer](../patterns/governed-semantic-layer.md) · [Data agent golden path](data-agent.md)
