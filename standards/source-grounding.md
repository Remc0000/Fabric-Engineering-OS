# Source-Grounding Standard

This standard implements the [Fabric Engineering OS Constitution](../CONSTITUTION.md) for evidence and product claims.

## Source authority

| Priority | Source | Use |
| --- | --- | --- |
| Authoritative | Microsoft Learn, preferably through Microsoft Learn MCP | Microsoft product behavior, limits, support, configuration, and lifecycle |
| Authoritative practice | Microsoft data engineering playbook | End-to-end data engineering methodology, checklists, and lifecycle guidance |
| Preferred expertise | Skills for Fabric | Task-specific Fabric methods and practitioner guidance |
| Primary architecture | Fabric Accelerator (unified data foundation, Option 1: Fabric-only) | Architecture patterns and reference decisions |
| Primary implementation | FMD Framework | Implementation structure and reusable engineering practice |
| Secondary implementation | ELT Framework | Additional implementation guidance when primary references do not fit |
| Agentic execution reference | Project Osmos for Microsoft Fabric | Patterns for agent-run Fabric data engineering inside a Lakehouse |
| Optional discovery | Fabric Toolbox | Finding possibilities that must be verified elsewhere |

GitHub Copilot is the runtime and GitHub MCP is the repository interface; neither is an authority for Microsoft product behavior.

## Reference registry

These are the concrete upstream sources behind the labels above. They are read-only and Fabric-only; where a source offers non-Fabric options, this OS uses only the Fabric-native configuration.

| Label | Location |
| --- | --- |
| Microsoft data engineering playbook | https://learn.microsoft.com/en-us/data-engineering/playbook/understanding-data-playbook |
| Skills for Fabric | https://github.com/microsoft/skills-for-fabric |
| Fabric Accelerator (Option 1: Fabric-only) | https://github.com/microsoft/unified-data-foundation-with-fabric-solution-accelerator |
| FMD Framework | https://github.com/edkreuk/FMD_FRAMEWORK |
| Project Osmos for Microsoft Fabric | https://github.com/microsoft/project-osmos |

The unified data foundation accelerator also offers Purview and Azure Databricks options; this OS references **Option 1 (Microsoft Fabric only)** and does not adopt Databricks or a multi-platform default. Project Osmos is cited as an agentic execution reference only; it does not override Microsoft Learn, the Constitution, or human decisions, and agents must not run it against production without human approval.

## Grounding rules

1. Cite the exact source and retrieval or validation date for consequential or time-sensitive claims.
2. Prefer the most specific current Microsoft Learn page over summaries, memory, or generated answers.
3. Label inference, assumption, preview behavior, and tenant observation explicitly.
4. Resolve source conflicts by checking recency, scope, region, SKU, and feature lifecycle; escalate unresolved conflicts.
5. Revalidate before production decisions when availability, limits, licensing, or security behavior could have changed.

## Upstream boundary

All references are read-only upstream. Agents and automation may retrieve and cite them but must never synchronize changes into this OS, modify upstream repositories, or open upstream changes automatically.
