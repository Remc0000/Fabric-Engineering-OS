# Environment Promotion Decision Tree

Use this tree under the [Fabric Engineering OS Constitution](../CONSTITUTION.md) with the [environment promotion standard](../standards/environment-promotion.md).

```mermaid
flowchart TD
    A[Identify versioned artifact and target environment] --> B{Target is DEV or TEST?}
    B -->|Yes| C{Approved auditable workflow and scope?}
    C -->|No| X[Stop and escalate]
    C -->|Yes| D{Required checks and environment configuration pass?}
    D -->|No| R[Remediate without promotion]
    D -->|Yes| E[Agent may deploy and record evidence]
    B -->|No, target is PROD| F{Human approval, production workflow, readiness, and rollback confirmed?}
    F -->|No| X
    F -->|Yes| G[Authorized human-controlled PROD deployment]
    E & G --> H[Observe, reconcile, and record outcome]
    H --> I{Failure or unexpected drift?}
    I -->|Yes| J[Execute approved rollback or incident route]
    I -->|No| K[Close promotion record]
```

## Gate checklist

- Same identified artifact, source commit, and dependency set.
- Required tests, security checks, data-quality evidence, and accepted residual risks.
- Target configuration, identity, connection, capacity, and workspace validation; use [Variable Libraries](../capabilities/variable-libraries.md) only for supported non-secret environment-specific values.
- Deployment order, compatibility, migration, rollback, monitoring, and support owner.
- Human approval for PROD; agents may never approve, initiate, or execute PROD deployment.

## Stop conditions

Stop on artifact drift, failed checks, unapproved exceptions, unknown data impact, missing rollback, or a target outside the authorized environment.

## Record

Record artifact identity, source and target, approvals, checks, workflow run, timestamps, observations, rollback status, and accountable human.
