# Semantic Model Decision Tree

This tree follows the [Fabric Engineering OS Constitution](../../CONSTITUTION.md) and [semantic-model golden path](../../golden-paths/semantic-model.md).

```mermaid
flowchart TD
    A[Governed gold source and owner?] -->|No| X[Stop: use new-data-product path]
    A -->|Yes| B[Confirm consumer questions, grain, metrics]
    B --> C{Definitions approved?}
    C -->|No| D[Escalate to domain owner]
    C -->|Yes| E{Can star schema represent the domain?}
    E -->|No| F[Architecture review; do not hide ambiguity in DAX]
    E -->|Yes| G{Latency, volume, feature constraints}
    G -->|Import appropriate| H[Define refresh and incremental strategy]
    G -->|Direct Lake appropriate| I[Validate source, region, capacity, feature constraints]
    G -->|DirectQuery required| J[Validate necessity and performance constraints]
    H --> K[Define measures, relationships, date behavior]
    I --> K
    J --> K
    K --> L{Restricted data or audience segmentation?}
    L -->|Yes| M[Design and test RLS/OLS and identity mapping]
    L -->|No| N[Least-privilege workspace access]
    M --> O[DEV/TEST correctness, refresh, security, performance]
    N --> O
    O --> P{Acceptance and compatibility pass?}
    P -->|No| Q[Fix or version; no release]
    P -->|Yes| R[Human endorsement and PROD handoff]
```

Validate storage-mode behavior and constraints against current Microsoft Learn and the [semantic model capability](../../capabilities/semantic-model.md); do not choose a mode from preference alone.
