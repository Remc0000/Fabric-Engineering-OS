# Production Incident Decision Tree

This tree follows the [Fabric Engineering OS Constitution](../../CONSTITUTION.md) and [production-incident golden path](../../golden-paths/production-incident.md).

```mermaid
flowchart TD
    A[Human incident commander assigned?] -->|No| X[Escalate; agent remains read-only]
    A -->|Yes| B[Record severity, impact, scope, timeline]
    B --> C{Security/privacy/exfiltration indicator?}
    C -->|Yes| D[Escalate to security response; preserve evidence]
    C -->|No| E{Active data loss/corruption?}
    D --> E
    E -->|Yes| F[Human decides containment; agent proposes only]
    E -->|No| G[Collect read-only Fabric telemetry and recent changes]
    F --> G
    G --> H{Recent change correlates with onset?}
    H -->|Yes| I[Compare release/config evidence; assess rollback]
    H -->|No| J[Rank workload, capacity, dependency, data hypotheses]
    I --> K{Mitigation has bounded blast radius and rollback?}
    J --> K
    K -->|No| L[Gather more evidence or escalate Microsoft/platform owner]
    K -->|Yes| M[Present preconditions, risk, validation to commander]
    M --> N{Human authorizes and executes PROD action?}
    N -->|No| L
    N -->|Yes| O[Agent observes and records result only]
    O --> P{Service and data correctness restored?}
    P -->|No| J
    P -->|Yes| Q[Human closure; follow-up issues and post-incident review]
```

The agent may use the [capability catalog](../../capabilities/README.md) and workload-specific read-only evidence, but it never interprets observability access as production change authority.
