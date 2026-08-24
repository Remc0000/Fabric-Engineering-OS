# Bootstrap Guides

This bootstrap router is governed by the [Fabric Engineering OS Constitution](../CONSTITUTION.md).

Use this checklist to select and start a governed Microsoft Fabric delivery path. It is a planning template, not a generator and not authorization to deploy to production.

## Intake

- [ ] Sponsor and accountable owner: `<name or role>`
- [ ] Delivery lead and repository owner: `<name or team>`
- [ ] Business outcome and measurable success: `<outcome and measure>`
- [ ] Target users and data owners: `<users and owners>`
- [ ] Fabric workload and target artifacts: `<workload and artifacts>`
- [ ] Data classification and regulatory scope: `<classification and obligations>`
- [ ] DEV and TEST workspaces/capacities: `<approved names or pending>`
- [ ] Target date and cost guardrail: `<date and budget owner>`
- [ ] Assumptions requiring Microsoft Learn validation: `<links or issue>`

## Choose one starting template

- [ ] [New project](new-project.md) for a repository or delivery boundary.
- [ ] [New feature](new-feature.md) for a bounded change to an existing project.
- [ ] [New data product](new-data-product.md) for an owned, reusable data contract.
- [ ] [New data agent](new-data-agent.md) for a grounded Fabric data-agent experience.
- [ ] [New RTI project](new-rti-project.md) for Real-Time Intelligence.
- [ ] [New mirroring project](new-mirroring-project.md) for Fabric mirroring.

## Prerequisites

- [ ] The solution uses Microsoft Fabric only as its data platform.
- [ ] GitHub Copilot is the agent runtime and GitHub MCP is the repository interface.
- [ ] Product claims are grounded in current Microsoft Learn documentation.
- [ ] Skills for Fabric expertise, Fabric Accelerator architecture, and FMD implementation guidance have been considered in that order.
- [ ] Any ELT Framework use is recorded as secondary; Fabric Toolbox use is optional discovery only.
- [ ] All upstream sources are treated as read-only and will never be automatically modified.
- [ ] Human architecture, data, security, service, and repository owners are named.

## Repository and branch

- [ ] Create or select the GitHub repository under human-approved ownership.
- [ ] Link a governing issue that states outcome, scope, owners, risks, and acceptance criteria.
- [ ] Create a focused branch from the current protected default branch: `<type>/<issue>-<slug>`.
- [ ] Confirm branch protection, required checks, CODEOWNERS, and environment protections.
- [ ] Keep secrets, tenant identifiers, and customer data out of source and issue content.

## Architecture and security decisions

- [ ] Record the selected Fabric Accelerator pattern and any variance.
- [ ] Record why FMD is applicable or why an approved secondary approach is needed.
- [ ] Define data boundaries, contracts, lineage, retention, recovery, and ownership.
- [ ] Define identity, least privilege, workspace roles, network controls, secret handling, and audit requirements.
- [ ] Identify capacity, licensing, region, cost, and operational constraints.
- [ ] Escalate architecture, security, compliance, data-loss, cost, and production decisions to named humans.

## Required issues and evidence

- [ ] Governing delivery issue.
- [ ] Architecture decision evidence, including rejected options.
- [ ] Security and data-governance review evidence.
- [ ] DEV/TEST validation plan with expected results.
- [ ] Rollback or safe-disable plan.
- [ ] Pull request linking intent, changes, validation, risks, and operational impact.

## DEV and TEST path

- [ ] Implement the smallest reviewable change on the feature branch.
- [ ] Validate locally or statically before using an environment.
- [ ] Deploy to DEV only through an approved, auditable workflow.
- [ ] Capture DEV evidence and obtain the required human gate before TEST.
- [ ] Deploy to TEST only through an approved, auditable workflow.
- [ ] Capture functional, security, data-quality, and operational evidence.
- [ ] Stop after TEST readiness; production approval and execution remain human responsibilities.

## Human approval gates

- [ ] Architecture and data decisions approved before implementation.
- [ ] Security and compliance decisions approved before environment access.
- [ ] Human authorization recorded before DEV and before TEST deployment.
- [ ] At least one human approves the pull request; agents never self-approve or merge.
- [ ] A human release owner separately decides and performs any production action.

## Definition of ready

- [ ] Intake is complete and accountable owners are available.
- [ ] Scope, acceptance criteria, dependencies, and assumptions are testable.
- [ ] Architecture and security decisions are documented.
- [ ] DEV/TEST access and evidence collection are approved.

## Definition of done

- [ ] The pull request is focused, reviewed, and has passed required checks.
- [ ] DEV and TEST evidence satisfies acceptance criteria.
- [ ] Documentation, ownership, support, rollback, and residual risks are current.
- [ ] A human has merged or explicitly deferred the work.
- [ ] No production deployment is claimed or automated by this checklist.

## Next links

1. Complete the selected scenario template above.
2. Use the [Operating Model](../wiki/Operating-Model.md) for decision rights and evidence flow.
3. Submit changes through the [Contribution Guide](../community/CONTRIBUTING.md).

