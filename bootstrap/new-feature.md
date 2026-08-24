# New Fabric Feature

This template is governed by the [Fabric Engineering OS Constitution](../CONSTITUTION.md).

Use this checklist for a bounded feature in an existing Fabric repository.

## Intake

- [ ] Feature name and governing issue: `<name and URL>`
- [ ] Product owner and technical owner: `<names or roles>`
- [ ] User problem, expected behavior, and measurable benefit: `<details>`
- [ ] Fabric artifacts and interfaces affected: `<items>`
- [ ] Data contracts, consumers, and compatibility impact: `<details>`
- [ ] Non-goals: `<items>`
- [ ] Data classification and security impact: `<details>`
- [ ] Target release and cost/capacity impact: `<details>`
- [ ] Microsoft Learn evidence and assumptions: `<links>`

## Prerequisites

- [ ] The feature stays within Microsoft Fabric and the repository's approved architecture.
- [ ] Existing capabilities, patterns, and contracts have been reused before introducing new ones.
- [ ] GitHub Copilot uses GitHub MCP; product behavior is grounded in Microsoft Learn.
- [ ] Skills for Fabric, Fabric Accelerator, and FMD guidance have been consulted as applicable.
- [ ] ELT is secondary, Fabric Toolbox is optional discovery, and upstream sources remain read-only.

## Repository and branch steps

- [ ] Confirm the issue has acceptance criteria, owners, dependencies, and risk labels.
- [ ] Create `<type>/<issue>-<slug>` from the current protected default branch.
- [ ] Identify changed artifacts, tests, documentation, deployment units, and rollback files.
- [ ] Keep the change focused; separate unrelated refactoring into another issue.
- [ ] Confirm required checks and DEV/TEST environment protections apply to the branch.

## Architecture and security decisions

- [ ] Record whether the feature conforms to or changes the approved Fabric Accelerator baseline.
- [ ] Document FMD implementation choices and any justified secondary ELT use.
- [ ] Review schema, contract, lineage, retention, quality, and backward compatibility.
- [ ] Review identity, authorization, secrets, network, privacy, and audit implications.
- [ ] Review capacity, performance, reliability, observability, support, and rollback.
- [ ] Escalate material decisions or exceptions to the appropriate human owner.

## Required issues and evidence

- [ ] Feature issue with behavior and acceptance criteria.
- [ ] Architecture decision or "no material change" rationale.
- [ ] Security/data review or "no material change" rationale approved by an owner.
- [ ] Test cases and evidence for happy path, failure path, compatibility, and rollback.
- [ ] Pull request linking the issue, decisions, DEV/TEST evidence, risks, and operational impact.

## DEV and TEST path

- [ ] Validate changed definitions and tests before environment deployment.
- [ ] Deploy the branch revision to DEV through a human-authorized, auditable workflow.
- [ ] Run functional, data-quality, security, and observability checks in DEV.
- [ ] Obtain human approval before promoting the same reviewed revision to TEST.
- [ ] Run acceptance, regression, performance, and rollback checks in TEST.
- [ ] Capture results and stop; production promotion is not automated by this template.

## Human approval gates

- [ ] Product and architecture owners approve scope and material design choices.
- [ ] Security/data owners approve material access or contract changes.
- [ ] Humans authorize DEV and TEST deployments.
- [ ] A human approves and merges the pull request; agents do neither.
- [ ] A human release owner separately approves and performs any production action.

## Definition of ready

- [ ] Problem, non-goals, acceptance criteria, owners, and dependencies are clear.
- [ ] Design and security impacts are documented and approved where required.
- [ ] Test, migration, compatibility, and rollback approaches are feasible.
- [ ] DEV/TEST environments and test data are available.

## Definition of done

- [ ] Acceptance and regression criteria pass in DEV and TEST.
- [ ] Contracts, documentation, runbooks, telemetry, and support ownership are updated.
- [ ] Residual risks and follow-up issues are owned.
- [ ] Required checks and human review are complete and a human performs merge.
- [ ] No automated production deployment is introduced or implied.

## Next links

1. For a reusable data contract, use [New Data Product](new-data-product.md).
2. Review [Getting Started](../wiki/Getting-Started.md).
3. Submit through the [Contribution Guide](../community/CONTRIBUTING.md).
