# Deployment Pipeline

This guide is governed by the [Fabric Engineering OS Constitution](../CONSTITUTION.md).

> **Scope/status:** Supported item types, deployment rules, stage behavior, binding behavior, and automation interfaces change over time. Validate the complete release path in Microsoft Learn and non-production workspaces.

## Purpose

Select a Fabric deployment pipeline to promote supported Fabric items through defined lifecycle stages with controlled comparison and deployment.

## When To Use

- DEV, TEST, and production-like stages need an explicit Fabric promotion path.
- Supported items require stage-specific configuration or binding rules.
- Human approvals and release evidence can wrap the promotion process.

## When NOT To Use

- Source history, branching, or pull-request review is the primary need; use [Git integration](git-integration.md).
- The design assumes every Fabric item or dependency is deployable.
- The pipeline is expected to replace CI validation, secrets management, or production approval.

## Pros

- Makes stage-to-stage Fabric promotion visible and repeatable.
- Supports comparison and controlled deployment for supported items.
- Separates content promotion from day-to-day authoring.

## Cons

- Item coverage and dependency behavior can differ across workloads.
- Stage configuration and unsupported dependencies require explicit handling.
- It is one release mechanism, not a complete software delivery control plane.

## Alternatives

- [Git integration](git-integration.md) for version history and pull-request workflows.
- Reviewed Fabric APIs or approved automation where deployment-pipeline support is insufficient.
- Manual deployment only when risk is bounded, evidence is retained, and human owners approve the exception.

## Decision Drivers

- Supported item and dependency coverage.
- Workspace topology and environment isolation.
- Parameter, connection, identity, and secret handling.
- Approval, rollback, audit, and production-control requirements.

## Related Patterns

- Select environment promotion, configuration separation, release evidence, and rollback guidance from the [patterns catalog](../patterns/README.md).

## Related Golden Paths

- [Release management](../golden-paths/release-management.md)
- [Production incident](../golden-paths/production-incident.md)
- [Semantic model](../golden-paths/semantic-model.md)
