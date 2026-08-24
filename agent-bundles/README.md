# Agent Bundles

These scenario bundles operate under the [Fabric Engineering OS Constitution](../CONSTITUTION.md).

Each bundle defines a bounded Copilot team contract: the outcome it owns, the evidence it must produce, the decisions it may make, and the points where a human must take control. Select one bundle for the primary scenario and use linked capabilities and golden paths rather than inventing an unreviewed delivery process.

| Bundle | Use when | Entry point |
| --- | --- | --- |
| Source onboarding | Connecting a new batch or streaming source to governed Fabric landing | [Charter](source-onboarding/charter.md) |
| Metadata-driven ELT | Building shared, metadata-driven Fabric ELT orchestration with governed control tables | [Charter](metadata-driven-elt/charter.md) |
| New data product | Delivering a reusable medallion data product with named consumers | [Charter](new-data-product/charter.md) |
| Semantic model | Designing and releasing a governed Power BI semantic model in Fabric | [Charter](semantic-model/charter.md) |
| Eventhouse RTI | Building low-latency ingestion, KQL storage, analysis, and action | [Charter](eventhouse-rti/charter.md) |
| Mirroring to gold | Converting mirrored operational data into governed gold outputs | [Charter](mirroring-to-gold/charter.md) |
| Data agent | Grounding a Fabric data agent on approved analytical data | [Charter](data-agent/charter.md) |
| Production incident | Diagnosing production safely while humans control remediation | [Charter](production-incident/charter.md) |
| Release management | Preparing and promoting a reviewed Fabric release | [Charter](release-management/charter.md) |

## Standard use

1. Start with the bundle charter and record owner, outcome, environment, sensitivity, and constraints.
2. Follow the decision tree and matching golden path.
3. Use the required tests as the minimum evidence set; add workload-specific tests when risk demands it.
4. Compare results with measurable success criteria and document exceptions.
5. Stop at every human approval, destructive-change, architecture, security, cost, merge, and production boundary.

All bundles use GitHub Copilot as the runtime, GitHub MCP as the repository interface, and Microsoft Learn as authoritative Microsoft product documentation. Skills for Fabric is preferred expertise; Fabric Accelerator is the primary architecture reference; FMD Framework is the primary implementation reference; ELT Framework is secondary; Project Osmos is an agentic-execution reference; Fabric Toolbox is optional discovery. Concrete source locations are in the [Source-Grounding registry](../standards/source-grounding.md). Upstream sources are read-only.
