# New Real-Time Intelligence Project

This template is governed by the [Fabric Engineering OS Constitution](../CONSTITUTION.md).

Use this checklist for a Microsoft Fabric Real-Time Intelligence project.

## Intake

- [ ] Project name and accountable owner: `<details>`
- [ ] Operational outcome and decisions enabled: `<details>`
- [ ] Event producers, protocols, rates, and payload contracts: `<details>`
- [ ] Consumers, latency/freshness targets, and alert recipients: `<details>`
- [ ] Required Fabric RTI artifacts: `<items>`
- [ ] Retention, replay, ordering, and late-arrival requirements: `<details>`
- [ ] Classification, region, capacity, licensing, and cost constraints: `<details>`
- [ ] Microsoft Learn references and assumptions: `<links>`

## Prerequisites

- [ ] The event ingestion, processing, storage, analytics, and activation path uses Microsoft Fabric only.
- [ ] Producer access and event use are human-approved.
- [ ] GitHub Copilot and GitHub MCP are approved for repository operations.
- [ ] Current RTI behavior is validated through Microsoft Learn.
- [ ] Skills for Fabric and Fabric Accelerator guidance are reviewed; FMD is the primary implementation reference where applicable.
- [ ] ELT remains secondary, Fabric Toolbox optional, and upstream sources read-only.

## Repository and branch steps

- [ ] Create an RTI project issue with contracts, SLOs, owners, acceptance criteria, and risks.
- [ ] Create `<type>/<issue>-<slug>` from the protected default branch.
- [ ] Version event contracts, queries, rules, tests, deployment definitions, and runbooks where export is supported.
- [ ] Document any portal-managed configuration and required review evidence.
- [ ] Confirm required checks and protected DEV/TEST environments.

## Architecture and security decisions

- [ ] Record the Fabric Accelerator RTI topology and FMD integration boundaries.
- [ ] Define ingestion endpoint, transformation, Eventhouse/KQL database, dashboard, and activation flow.
- [ ] Define schema evolution, deduplication, ordering, late data, replay, retention, and backpressure handling.
- [ ] Define identity, least privilege, producer/consumer isolation, secrets, network, and audit.
- [ ] Define latency, throughput, capacity, cost, observability, incident response, and recovery.
- [ ] Define safe alert/action behavior with human ownership for consequential actions.

## Required issues and evidence

- [ ] RTI charter and event-contract issue.
- [ ] Architecture and source-authorization evidence.
- [ ] Security, privacy, and governance review.
- [ ] Load, latency, data-quality, replay, failure, and recovery test evidence.
- [ ] Alert/action review proving recipients, throttling, and safe failure.
- [ ] Pull request with DEV/TEST evidence, costs, risks, and rollback.

## DEV and TEST path

- [ ] Validate contracts, KQL, rules, and tests before deployment.
- [ ] Deploy to DEV through a human-authorized, auditable workflow with synthetic or approved events.
- [ ] Test throughput, latency, duplicates, ordering, late data, failures, access, alerts, and telemetry.
- [ ] Obtain human approval before promoting the reviewed revision to TEST.
- [ ] Run representative load, resilience, recovery, and operational acceptance in TEST.
- [ ] Record evidence and stop; no automated production activation is authorized.

## Human approval gates

- [ ] Architecture and data owners approve producers, contracts, retention, and topology.
- [ ] Security owner approves identities, endpoints, and event access.
- [ ] Service owner approves SLOs, alerts, cost, recovery, and action safety.
- [ ] Humans authorize DEV/TEST, approve the pull request, and perform merge.
- [ ] Production connection and activation are separately approved and executed by humans.

## Definition of ready

- [ ] Producers, contracts, consumers, SLOs, owners, and constraints are known.
- [ ] Architecture, security, retention, capacity, cost, and action decisions are approved.
- [ ] Representative test events and DEV/TEST resources are available.
- [ ] Failure, replay, rollback, and evidence plans are executable.

## Definition of done

- [ ] Contracts, queries, rules, tests, telemetry, and runbooks are versioned or evidenced.
- [ ] DEV/TEST results meet latency, quality, security, resilience, and cost criteria.
- [ ] Support, alert ownership, recovery, and residual risks are accepted.
- [ ] Required checks and human review are complete; a human performs merge.
- [ ] Production ingestion or activation is not automated or claimed.

## Next links

1. Review the [New Project](new-project.md) template for repository setup.
2. Use the [FAQ](../wiki/FAQ.md) for source and approval questions.
3. Follow the [Contribution Guide](../community/CONTRIBUTING.md).

