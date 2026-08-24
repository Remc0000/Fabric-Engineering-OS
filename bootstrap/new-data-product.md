# New Fabric Data Product

This template is governed by the [Fabric Engineering OS Constitution](../CONSTITUTION.md).

Use this checklist to establish an owned, discoverable, reusable data product in Microsoft Fabric.

## Intake

- [ ] Product name and domain: `<name and domain>`
- [ ] Business owner, data owner, technical owner, and steward: `<roles>`
- [ ] Consumer personas and use cases: `<details>`
- [ ] Product contract and success/service measures: `<details>`
- [ ] Source systems and authorized extraction methods: `<details>`
- [ ] Fabric storage, transformation, and serving artifacts: `<items>`
- [ ] Classification, residency, retention, and deletion requirements: `<details>`
- [ ] Freshness, quality, availability, and cost targets: `<targets>`
- [ ] Microsoft Learn references and assumptions: `<links>`

## Prerequisites

- [ ] The product is implemented and served only on Microsoft Fabric.
- [ ] Source access, ownership, and intended use are human-approved.
- [ ] GitHub Copilot and GitHub MCP are approved for repository work.
- [ ] Skills for Fabric and Fabric Accelerator guidance have been reviewed.
- [ ] FMD is the primary implementation reference; any ELT use is secondary and documented.
- [ ] Fabric Toolbox is optional discovery only; all upstream sources remain read-only.

## Repository and branch steps

- [ ] Create a data-product issue with owner, consumers, contract, SLOs, and acceptance criteria.
- [ ] Create `<type>/<issue>-<slug>` from the protected default branch.
- [ ] Locate schemas, transformations, tests, policies, documentation, and deployment definitions under version control.
- [ ] Version the contract and document compatibility/deprecation rules.
- [ ] Confirm branch checks and protected DEV/TEST environments are configured.

## Architecture and security decisions

- [ ] Record the Fabric Accelerator architecture and FMD medallion or equivalent boundaries.
- [ ] Define source-to-product lineage, grain, keys, schema, semantics, and ownership.
- [ ] Define ingestion mode, refresh/freshness, quality rules, reconciliation, and failure handling.
- [ ] Define access model, least privilege, sensitivity, masking, retention, deletion, and audit.
- [ ] Define capacity, performance, availability, observability, cost, recovery, and support.
- [ ] Record contract evolution, consumer notification, and safe rollback decisions.

## Required issues and evidence

- [ ] Data-product charter and contract issue.
- [ ] Architecture and source-authorization evidence.
- [ ] Privacy, security, classification, and governance approval evidence.
- [ ] Data-quality test matrix with thresholds and reconciliation evidence.
- [ ] Consumer acceptance and compatibility evidence.
- [ ] Pull request with lineage, operational impact, rollback, and DEV/TEST results.

## DEV and TEST path

- [ ] Validate schemas, transformations, policies, and tests before deployment.
- [ ] Deploy to DEV through a human-authorized, auditable workflow using non-sensitive or approved test data.
- [ ] Verify lineage, quality, access, observability, failure handling, and recovery in DEV.
- [ ] Obtain human approval before TEST promotion.
- [ ] Validate contract, reconciliation, consumer queries, performance, security, and rollback in TEST.
- [ ] Record the tested revision; production publication remains a human action.

## Human approval gates

- [ ] Data owner approves sources, purpose, contract, classification, and retention.
- [ ] Architecture and security owners approve the design and controls.
- [ ] Consumer owner accepts contract and quality/service targets.
- [ ] Humans authorize DEV/TEST, approve the pull request, and perform merge.
- [ ] A human release owner separately approves and executes production publication.

## Definition of ready

- [ ] Owners, consumers, source authorization, contract, and service measures are defined.
- [ ] Architecture, governance, security, cost, and lifecycle decisions are approved.
- [ ] Quality thresholds, test data, DEV/TEST path, and rollback are available.
- [ ] Dependencies and assumptions have accountable owners.

## Definition of done

- [ ] Contract, lineage, quality rules, access controls, and operational documentation are versioned.
- [ ] DEV and TEST evidence meets contract, governance, and service criteria.
- [ ] Consumer acceptance, support ownership, and residual risks are recorded.
- [ ] Required checks and human approval are complete; a human performs merge.
- [ ] Production publication is not automated or claimed.

## Next links

1. For conversational access, use [New Data Agent](new-data-agent.md).
2. Review the [Glossary](../wiki/Glossary.md).
3. Follow the [Contribution Guide](../community/CONTRIBUTING.md).

