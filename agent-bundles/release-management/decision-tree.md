# Release Management Decision Tree

This tree follows the [Fabric Engineering OS Constitution](../../CONSTITUTION.md) and [release-management golden path](../../golden-paths/release-management.md).

```mermaid
flowchart TD
    A[Human release owner and immutable candidate?] -->|No| X[Stop: establish owner and exact commit/artifacts]
    A -->|Yes| B[Map issues, changes, dependencies, environments]
    B --> C{Architecture/security/governance exception?}
    C -->|Yes| D[Obtain appropriate human decision]
    C -->|No| E{Breaking schema/model/data migration?}
    D --> E
    E -->|Yes| F[Version, compatibility plan, backup/rollback, rehearsal]
    E -->|No| G[Standard compatibility checks]
    F --> H[Run CI and deploy exact candidate to DEV]
    G --> H
    H --> I{DEV gates pass?}
    I -->|No| J[Return to owner; create new candidate]
    I -->|Yes| K[Promote exact candidate to TEST]
    K --> L{TEST quality, security, acceptance, rollback pass?}
    L -->|No| J
    L -->|Yes| M[Freeze evidence and release notes]
    M --> N{All required human approvals present?}
    N -->|No| O[Wait; do not merge or deploy]
    N -->|Yes| P[Hand exact PROD plan to authorized human operator]
    P --> Q[Agent does not execute PROD]
```

Use [Deployment Pipelines](../../capabilities/deployment-pipeline.md) only where supported and reviewed. The artifact tested in TEST must be the artifact proposed for production.
