# Data Agent Decision Tree

This tree follows the [Fabric Engineering OS Constitution](../../CONSTITUTION.md) and [data-agent golden path](../../golden-paths/data-agent.md).

```mermaid
flowchart TD
    A[Named owner, users, approved questions?] -->|No| X[Stop: define accountable use case]
    A -->|Yes| B{Governed Fabric source with stable semantics?}
    B -->|No| C[Build data product/semantic model first]
    B -->|Yes| D{Question is analytical and read-only?}
    D -->|No, consequential write/action| E[Reject or route to human-controlled workflow]
    D -->|Yes| F{Approved semantic model covers it?}
    F -->|Yes| G[Prefer semantic model grounding]
    F -->|No| H{Other Fabric source has curated contract?}
    H -->|No| C
    H -->|Yes| I[Document why and constrain source]
    G --> J[Define vocabulary, answer, citation, ambiguity rules]
    I --> J
    J --> K{Sensitive or audience-specific?}
    K -->|Yes| L[Security/privacy review and negative tests]
    K -->|No| M[Standard least-privilege tests]
    L --> N[Golden, adversarial, refusal, regression evaluation]
    M --> N
    N --> O{Correctness, grounding, security thresholds pass?}
    O -->|No| P[Fix source/instructions or narrow scope]
    O -->|Yes| Q[Human publication and PROD handoff]
```

Prefer the [semantic model capability](../../capabilities/semantic-model.md) for governed metrics and use [Data Agents](../../capabilities/data-agent.md) only for explicitly bounded questions.
