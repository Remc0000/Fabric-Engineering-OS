# Environment Promotion

This pattern is governed by the root [Fabric Engineering OS Constitution](../CONSTITUTION.md).

## Context

Fabric artifacts and configuration must move through DEV, TEST, and PROD with controlled differences.

## Problem

Manual recreation and environment-specific branches produce drift and unreviewed production changes.

## Forces

- Artifact support for deployment and source control varies by workload and evolves.
- Environment identifiers and secrets cannot live in source.
- Production needs human accountability and rollback evidence.
- Data migration may not be reversible with artifact rollback alone.

## Solution

Keep one reviewed source version, externalize environment configuration, and promote the same immutable release candidate. Agents may execute approved DEV and TEST deployments. A human approves architecture, the pull request, merge, and PROD release; an agent never self-approves, merges, or deploys PROD. Capture artifact versions, configuration deltas, tests, approver, and rollback target.

## Consequences

Promotion is reproducible and auditable, but unsupported artifacts need documented deployment adapters or manual human-run steps.

## Validation

- Compare deployed artifacts and approved release manifest.
- Run environment-specific smoke and security tests.
- Prove secrets and tenant identifiers are absent from source.
- Rehearse rollback in TEST before PROD approval.

## Related guidance

[Release management](../golden-paths/release-management.md) · [Human approval gate](human-approval-gate.md) · [Deployment pipeline capability](../capabilities/deployment-pipeline.md)
