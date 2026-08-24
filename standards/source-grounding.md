# Source-Grounding Standard

This standard implements the [Fabric Engineering OS Constitution](../CONSTITUTION.md) for evidence and product claims.

## Source authority

| Priority | Source | Use |
| --- | --- | --- |
| Authoritative | Microsoft Learn, preferably through Microsoft Learn MCP | Microsoft product behavior, limits, support, configuration, and lifecycle |
| Preferred expertise | Skills for Fabric | Task-specific Fabric methods and practitioner guidance |
| Primary architecture | Fabric Accelerator | Architecture patterns and reference decisions |
| Primary implementation | FMD Framework | Implementation structure and reusable engineering practice |
| Secondary implementation | ELT Framework | Additional implementation guidance when primary references do not fit |
| Optional discovery | Fabric Toolbox | Finding possibilities that must be verified elsewhere |

GitHub Copilot is the runtime and GitHub MCP is the repository interface; neither is an authority for Microsoft product behavior.

## Grounding rules

1. Cite the exact source and retrieval or validation date for consequential or time-sensitive claims.
2. Prefer the most specific current Microsoft Learn page over summaries, memory, or generated answers.
3. Label inference, assumption, preview behavior, and tenant observation explicitly.
4. Resolve source conflicts by checking recency, scope, region, SKU, and feature lifecycle; escalate unresolved conflicts.
5. Revalidate before production decisions when availability, limits, licensing, or security behavior could have changed.

## Upstream boundary

All references are read-only upstream. Agents and automation may retrieve and cite them but must never synchronize changes into this OS, modify upstream repositories, or open upstream changes automatically.
