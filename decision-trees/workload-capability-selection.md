# Workload and Capability Selection

Use this tree under the [Fabric Engineering OS Constitution](../CONSTITUTION.md) to select a leading Microsoft Fabric workload.

```mermaid
flowchart TD
    A[Define outcome and dominant interaction] --> B{Primary need?}
    B -->|Engineer batch or streaming data| C{Code-first distributed processing needed?}
    C -->|Yes| D[Candidate: Data Engineering]
    C -->|No| E[Candidate: Data Factory]
    B -->|Relational analytics and SQL serving| F[Candidate: Data Warehouse]
    B -->|Event ingestion, exploration, or low-latency analytics| G[Candidate: Real-Time Intelligence]
    B -->|Governed BI metrics and reports| H[Candidate: Power BI]
    B -->|Train, track, or operationalize data science work| I[Candidate: Data Science]
    B -->|Conversational access to governed data| J[Use AI and data-agent tree]
    D & E & F & G & H & I --> K[Check cross-workload architecture]
    J --> K
    K --> L[Validate support, capacity, region, licensing, security, and operations]
```

## Decision criteria

- Choose the dominant workload by the primary engineering and operational responsibility, not by where a demo is easiest.
- Compose workloads only when each has a clear boundary, owner, interface, and support need.
- Prefer native Fabric integration and OneLake reuse where it satisfies security and lifecycle requirements.
- Use the specific ingestion, storage, real-time, semantic, or AI tree before fixing detailed capabilities.

## Stop conditions

Stop and escalate if the outcome requires a non-Fabric implementation target, the product behavior is undocumented, or capacity, licensing, region, tenant policy, ownership, or production support is unresolved.

## Record

Capture the chosen lead workload, supporting workloads, rejected alternatives, authoritative sources, tenant validation, and accountable architecture approver.
