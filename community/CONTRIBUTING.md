# Contributing

All contributions are governed by the [Fabric Engineering OS Constitution](../CONSTITUTION.md).

## Before contributing

- Use Microsoft Fabric only for supported data-platform guidance.
- Ground product claims in current Microsoft Learn documentation.
- Prefer existing Skills for Fabric expertise, Fabric Accelerator architectures, FMD implementation patterns, and repository golden paths.
- Treat ELT as secondary and Fabric Toolbox as optional discovery.
- Treat every upstream source as read-only; never automate a write or synchronization.
- Never include secrets, tenant identifiers, customer data, or confidential evidence.

## Contribution workflow

1. Search existing issues and the [Ideas Backlog](IDEAS-BACKLOG.md).
2. Open or claim an issue describing the problem, outcome, scope, owner, acceptance criteria, risks, and evidence plan.
3. Obtain human direction before material architecture, security, data, compliance, cost, or governance work.
4. Create a focused branch from the current protected default branch using `<type>/<issue>-<slug>`.
5. Make the smallest coherent change and update affected navigation.
6. Validate links, formatting, stated behavior, and any applicable automated checks.
7. Open a pull request that links the issue and explains the problem, approach, validation, operational impact, risks, and rollback.
8. Resolve review feedback and required checks.
9. Obtain at least one human approval. A human maintainer performs merge.

## Evidence expected

- Microsoft Learn links for product-specific statements.
- Architecture/security decisions or an explicit no-impact rationale.
- Tests or review evidence proportional to the change.
- DEV/TEST evidence when deployment behavior changes.
- Compatibility, migration, rollback, and documentation impact where applicable.

## Human gates

Agents may help create issues, branches, commits, pull requests, and approved DEV/TEST evidence. Agents must not self-approve, merge, release, deploy to production, change this OS autonomously, or modify an upstream repository.

Maintainers may close an incomplete proposal with a reason. Acceptance into the [Roadmap](ROADMAP.md) is direction, not a delivery promise. Unaccepted possibilities remain in the [Ideas Backlog](IDEAS-BACKLOG.md).

For roles and escalation, see [Maintainers](MAINTAINERS.md) and canonical [Governance](../GOVERNANCE.md).

