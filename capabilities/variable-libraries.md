This guide is governed by the [Fabric Engineering OS Constitution](../CONSTITUTION.md).

> **Scope/status:** Validate current Variable Libraries, environment, deployment, Git integration, security, and item support behavior in Microsoft Learn and the target tenant.

## Purpose

Select Variable Libraries when Fabric delivery needs governed environment-specific values for deployment, promotion, and configuration across lifecycle stages.

## When To Use

- DEV, TEST, and PROD need different values for endpoints, item references, workspace-specific settings, or other deploy-time parameters.
- Configuration values should be managed as a Fabric item instead of being embedded directly in implementation assets.
- Variable management must align with [Deployment pipeline](./deployment-pipeline.md), [Git integration](./git-integration.md), or release governance.

## When NOT To Use

- The need is source control history or pull-request review; evaluate [Git integration](./git-integration.md).
- The need is stage promotion and deployment governance; evaluate [Deployment pipeline](./deployment-pipeline.md).
- The value is a secret or credential that requires a dedicated secrets-management control rather than ordinary configuration.

## Pros

- Makes environment-specific configuration explicit and easier to review during promotion.
- Reduces hard-coded values in deployable Fabric assets.
- Supports repeatable release management when paired with lifecycle governance.

## Cons

- Variable ownership, naming, scope, and change control must be designed deliberately.
- Not every configuration problem is solved by variables; item-specific support must be validated.
- Misuse can hide important operational differences or create promotion failures.

## Alternatives

- [Deployment pipeline](./deployment-pipeline.md) for controlled movement through lifecycle stages.
- [Git integration](./git-integration.md) for reviewable item definitions and version history.
- Implementation-specific parameterization when the target item owns the configuration mechanism.

## Decision Drivers

- Number of environments and frequency of promotion.
- Which Fabric items need environment-specific values and whether current support covers them.
- Separation of configuration from secrets, identities, and production approvals.
- Current Microsoft Learn support, tenant settings, and deployment behavior at decision time.

## Related Patterns

- Select release, configuration, environment, and governance guidance from the [patterns catalog](../patterns/README.md).

## Related Golden Paths

- [Release management](../golden-paths/release-management.md)
