# Engineering Standard

This standard implements the [Fabric Engineering OS Constitution](../CONSTITUTION.md) for solution design and implementation.

## Requirements

1. Build only for Microsoft Fabric and validate availability against the target tenant, region, capacity, licensing, and current documentation.
2. Start from an approved issue with outcome, scope, exclusions, acceptance criteria, owner, and environment.
3. Prefer existing capability guidance, golden paths, patterns, and reference architectures over one-off designs.
4. Use Fabric Accelerator as the primary architecture reference and FMD Framework as the primary implementation reference. ELT Framework is secondary.
5. Keep changes small, cohesive, reversible where practical, and traceable to decisions.
6. Define ownership, dependencies, failure behavior, observability, recovery, security, data quality, and cost implications.
7. Externalize environment configuration and secrets; do not encode tenant- or customer-specific values in reusable assets.
8. Record assumptions and validate consequential product behavior before implementation.

## Design record

A consequential design must record context, decision, alternatives, consequences, assumptions, evidence, owner, and review trigger. Preview or tenant-dependent features require an explicit fallback or stop condition.

## Completion

Engineering work is complete only when implementation, documentation, relevant tests, deployment implications, and unresolved risks are visible in the pull request. Completion is not approval.
