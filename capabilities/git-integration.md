# Git Integration

This guide is governed by the [Fabric Engineering OS Constitution](../CONSTITUTION.md).

> **Scope/status:** Git provider support, item coverage, serialization, branch behavior, and workspace synchronization vary by workload and tenant. Confirm current behavior in Microsoft Learn before adopting a workflow.

## Purpose

Select Fabric Git integration to synchronize supported Fabric item definitions with a repository for version history, branching, review, and collaborative change control.

## When To Use

- Supported item definitions must participate in pull-request and branch workflows.
- A workspace can be assigned a deliberate repository, directory, and branch boundary.
- Teams can review serialization changes and resolve workspace-versus-repository conflicts.

## When NOT To Use

- The goal is to version data, runtime state, credentials, or unsupported Fabric items.
- Workspace synchronization is assumed to deploy safely across environments; evaluate [Deployment pipeline](deployment-pipeline.md).
- Repository and workspace ownership, branching policy, or conflict handling are undefined.

## Pros

- Brings supported Fabric definitions into reviewable Git history.
- Enables collaborative engineering through branches and pull requests.
- Improves traceability between intent, implementation, and review.

## Cons

- Not all items or properties necessarily round-trip through Git.
- Workspace state and repository state can diverge and require deliberate reconciliation.
- Git integration does not provide testing, approval, secret management, or production deployment by itself.

## Alternatives

- [Deployment pipeline](deployment-pipeline.md) for stage-to-stage Fabric promotion.
- Supported APIs and approved CI automation for item types or controls not covered by native integration.
- Exported artifacts only when native integration is unavailable and a reviewed lifecycle is documented.

## Decision Drivers

- Supported item and Git provider coverage.
- Repository topology, branch policy, and workspace ownership.
- Conflict, recovery, and synchronization procedures.
- CI checks, environment promotion, and approval boundaries.

## Related Patterns

- Select trunk-based development, environment isolation, configuration separation, and release-evidence guidance from the [patterns catalog](../patterns/README.md).

## Related Golden Paths

- [Release management](../golden-paths/release-management.md)
- [Production incident](../golden-paths/production-incident.md)
- [Data product](../golden-paths/data-product.md)
