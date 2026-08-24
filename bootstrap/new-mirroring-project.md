# New Fabric Mirroring Project

This template is governed by the [Fabric Engineering OS Constitution](../CONSTITUTION.md).

Use this checklist to plan and validate a Microsoft Fabric mirroring project without changing the upstream source.

## Intake

- [ ] Project name and accountable owner: `<details>`
- [ ] Source platform, system owner, and business purpose: `<details>`
- [ ] Databases/tables in scope and exclusions: `<details>`
- [ ] Consumers and freshness/availability targets: `<details>`
- [ ] Expected volume, change rate, region, capacity, licensing, and cost: `<details>`
- [ ] Classification, residency, retention, and deletion requirements: `<details>`
- [ ] Source maintenance windows and support contacts: `<details>`
- [ ] Microsoft Learn support/limitation evidence and assumptions: `<links>`

## Prerequisites

- [ ] The target and all downstream data-platform processing use Microsoft Fabric only.
- [ ] The source owner has approved read-only access and mirroring impact assessment.
- [ ] GitHub Copilot and GitHub MCP are approved for repository work.
- [ ] Current mirroring support and limitations are validated against Microsoft Learn.
- [ ] Skills for Fabric and Fabric Accelerator guidance are reviewed; FMD is the primary downstream implementation reference.
- [ ] ELT is secondary, Fabric Toolbox optional, and the upstream source will never be automatically modified.

## Repository and branch steps

- [ ] Create a mirroring issue with source approval, scope, contracts, owners, acceptance criteria, and risks.
- [ ] Create `<type>/<issue>-<slug>` from the protected default branch.
- [ ] Version supported configuration, validation queries, downstream definitions, tests, and runbooks.
- [ ] Document portal-managed configuration without committing credentials or tenant identifiers.
- [ ] Confirm required checks and protected DEV/TEST environments.

## Architecture and security decisions

- [ ] Record the Fabric Accelerator topology and FMD downstream medallion/serving boundaries.
- [ ] Confirm mirroring eligibility, source prerequisites, supported objects, and known limitations.
- [ ] Define read-only source access, credential storage, rotation, least privilege, network, and audit.
- [ ] Define initial load, change capture, schema evolution, deletes, reconciliation, and recovery.
- [ ] Define OneLake ownership, downstream contracts, retention, lineage, and consumer access.
- [ ] Define source-load guardrails, capacity, cost, freshness monitoring, support, pause, and rollback.

## Required issues and evidence

- [ ] Source-owner authorization and impact assessment.
- [ ] Mirroring architecture and supportability decision.
- [ ] Security, privacy, and data-governance review.
- [ ] Initial-load, reconciliation, change, schema, delete, outage, and recovery evidence.
- [ ] Source performance and Fabric capacity/cost evidence.
- [ ] Pull request with configuration evidence, DEV/TEST results, risks, and runbook.

## DEV and TEST path

- [ ] Validate supported source/object assumptions before connection.
- [ ] Configure DEV through a human-authorized, auditable process using read-only source access.
- [ ] Test initial load, changes, schema behavior, deletes, reconciliation, freshness, access, and pause/recovery.
- [ ] Obtain human approval before creating or promoting the reviewed setup in TEST.
- [ ] Repeat representative operational and downstream-consumer validation in TEST.
- [ ] Record evidence and stop; production source connection is human-approved and human-executed.

## Human approval gates

- [ ] Source and data owners approve read-only access, scope, use, and impact.
- [ ] Architecture and security owners approve topology, identity, and controls.
- [ ] Service owner approves freshness, monitoring, capacity, cost, support, and recovery.
- [ ] Humans authorize DEV/TEST, approve the pull request, and perform merge.
- [ ] Humans separately approve and perform any production source connection or release.

## Definition of ready

- [ ] Source eligibility, owner authorization, scope, consumers, and service targets are clear.
- [ ] Architecture, security, governance, source impact, cost, and lifecycle decisions are approved.
- [ ] DEV/TEST sources, access, validation data, and evidence locations are available.
- [ ] Pause, recovery, rollback, and support responsibilities are assigned.

## Definition of done

- [ ] Configuration evidence, downstream contracts, tests, monitoring, and runbooks are current.
- [ ] DEV/TEST validation meets reconciliation, freshness, security, resilience, and source-impact criteria.
- [ ] Owners accept residual risks and operating responsibilities.
- [ ] Required checks and human review are complete; a human performs merge.
- [ ] No source modification or production automation is introduced or implied.

## Next links

1. Define downstream ownership with [New Data Product](new-data-product.md).
2. Review the [Operating Model](../wiki/Operating-Model.md).
3. Follow the [Contribution Guide](../community/CONTRIBUTING.md).
