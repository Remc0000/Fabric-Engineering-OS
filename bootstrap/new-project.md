# New Fabric Project

This template is governed by the [Fabric Engineering OS Constitution](../CONSTITUTION.md).

Copy this checklist into the project issue or pull request and replace every placeholder.

## Intake

- [ ] Project name: `<name>`
- [ ] Sponsor / accountable owner: `<name or role>`
- [ ] Human specification owner: `<name>`
- [ ] Repository owner and maintainers: `<team>`
- [ ] Business outcome and success measures: `<outcome>`
- [ ] Users, data owners, and service owner: `<names or roles>`
- [ ] Fabric workloads and artifacts in scope: `<items>`
- [ ] Explicitly out of scope: `<items>`
- [ ] Data classification, region, capacity, licensing, and cost constraints: `<details>`
- [ ] Target milestone: `<date>`
- [ ] Microsoft Learn validation links and open assumptions: `<links>`

## Prerequisites

- [ ] Microsoft Fabric is the only data platform in the proposed solution.
- [ ] GitHub Copilot and GitHub MCP access are approved.
- [ ] `uv` is available for installing the recorded initial Spec Kit CLI release.
- [ ] Skills for Fabric guidance and Fabric Accelerator architecture have been reviewed.
- [ ] FMD is the default implementation reference; any ELT use is justified as secondary.
- [ ] Fabric Toolbox is used only for optional discovery.
- [ ] Upstream repositories and sources are read-only and excluded from automated writes.

## Repository and branch steps

- [ ] Create the repository from the approved template or select an existing empty repository.
- [ ] Add owners, CODEOWNERS, branch protection, required checks, and protected DEV/TEST environments.
- [ ] Create a project bootstrap issue: `<issue URL>`.
- [ ] Record the initial Spec Kit release tag: `<vX.Y.Z>`.
- [ ] Create `<type>/<issue>-<slug>` from the protected default branch.
- [ ] Add the Constitution, governance, architecture, test, and operational links to the project README.
- [ ] Confirm no secrets, tenant identifiers, or customer data enter Git history.

## Spec Kit initialization and specification gate

- [ ] Follow the [Spec Kit delivery standard](../standards/spec-kit.md).
- [ ] Install the recorded release with `uv tool install specify-cli --from git+https://github.com/github/spec-kit.git@<approved-release-tag>`.
- [ ] Run `specify init --here --force --non-interactive --integration copilot --integration-options="--skills"` and review all generated changes before committing.
- [ ] Verify the native skills under `.github/skills/speckit-*/SKILL.md` and keep `.github/agents/ontdekker.agent.md` as the role adapter.
- [ ] Record the actual generated constitution, specification, plan, and task artifact paths in the bootstrap issue.
- [ ] Ontdekker runs `/speckit-constitution`, `/speckit-specify`, `/speckit-clarify`, and `/speckit-checklist` through GitHub Copilot's native skills surface.
- [ ] Link the proposed specification using a permalink containing its commit SHA and repository path.
- [ ] The named human specification owner records either **Approved for planning** for that exact specification revision or **Revision assigned** with required adjustments.
- [ ] When revisions are assigned, Ontdekker updates the specification, publishes a new immutable revision, and requests a new decision.
- [ ] Do not run `/speckit-plan` or begin architecture design until the exact specification revision has current human approval.
- [ ] Invalidate and repeat specification approval after any specification content change.
- [ ] Keep the monthly Spec Kit update workflow enabled so managed native skills are refreshed through a human-reviewed pull request.

## Architecture and security decisions

- [ ] Record the selected Fabric Accelerator baseline and workload topology.
- [ ] Record FMD components, deployment units, naming, and environment boundaries.
- [ ] Define source-to-serving flow, data contracts, lineage, quality, retention, and recovery.
- [ ] Define workspace, domain, capacity, region, and ownership boundaries.
- [ ] Define identities, least privilege, secrets, network controls, sensitivity, and audit evidence.
- [ ] Document availability, observability, support, cost, rollback, and disaster-recovery expectations.
- [ ] Assign human approvers for architecture, data, security, service, and release decisions.

## Required issues and evidence

- [ ] Project charter issue with outcome, scope, owners, acceptance criteria, dependencies, and risks.
- [ ] Exact specification revision, checklist, named owner, and human approval or revision-assignment link.
- [ ] [Architecture decision record](../decision-records/TEMPLATE.md) or issue with alternatives and consequences.
- [ ] Threat/data-governance review with mitigations and exception owners.
- [ ] Environment-readiness issue for DEV and TEST.
- [ ] Validation issue or test plan covering quality, security, operations, and rollback.
- [ ] Pull request with linked evidence and operational impact.

## DEV and TEST path

- [ ] Prove repository checks and artifact validation before deployment.
- [ ] Use a human-authorized, auditable workflow to deploy the baseline to DEV.
- [ ] Validate connectivity with non-sensitive test data and capture evidence.
- [ ] Obtain human approval to promote the reviewed revision to TEST.
- [ ] Run acceptance, data-quality, security, performance, recovery, and observability checks in TEST.
- [ ] Record the immutable revision and results; do not automate or claim production deployment.

## Human approval gates

- [ ] The exact specification revision approved by the named human specification owner before `/speckit-plan`.
- [ ] Project charter and architecture baseline approved before implementation; specification approval does not replace architecture approval.
- [ ] Security/data review approved before source or environment access.
- [ ] Human authorization recorded before each DEV and TEST deployment.
- [ ] Human pull-request approval and merge are required.
- [ ] Production readiness, release approval, and production execution remain human-only actions.

## Definition of ready

- [ ] Owners, scope, success measures, and support expectations are agreed in an approved Spec Kit specification revision.
- [ ] Architecture, security, data, cost, and environment decisions are reviewable.
- [ ] DEV/TEST workflows, test data, and evidence locations are available.
- [ ] Dependencies and Microsoft Learn assumptions are resolved or explicitly owned.

## Definition of done

- [ ] Repository controls and baseline documentation are operational.
- [ ] Required checks pass and DEV/TEST evidence meets acceptance criteria.
- [ ] Runbooks, ownership, rollback, risks, and decisions are current.
- [ ] A human has approved and merged the pull request.
- [ ] Production remains a separate human-approved and human-executed activity.

## Next links

1. Add work with the [New Feature](new-feature.md) template.
2. Review the [Operating Model](../wiki/Operating-Model.md).
3. Follow the [Contribution Guide](../community/CONTRIBUTING.md).
