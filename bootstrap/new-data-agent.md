# New Fabric Data Agent

This template is governed by the [Fabric Engineering OS Constitution](../CONSTITUTION.md).

Use this checklist for a Fabric data agent grounded in approved semantic and data sources.

## Intake

- [ ] Agent name and accountable product owner: `<details>`
- [ ] User personas, questions, and prohibited uses: `<details>`
- [ ] Approved Fabric data sources and semantic models: `<items>`
- [ ] Data owners and content stewards: `<roles>`
- [ ] Expected answer quality, latency, and cost measures: `<targets>`
- [ ] Data classification and audience: `<details>`
- [ ] Supported languages/regions and accessibility needs: `<details>`
- [ ] Microsoft Learn references and assumptions: `<links>`

## Prerequisites

- [ ] All grounding and serving data resides in approved Microsoft Fabric artifacts.
- [ ] GitHub Copilot is the engineering runtime and GitHub MCP is the repository interface.
- [ ] Data-agent capabilities and limitations are validated against current Microsoft Learn content.
- [ ] Skills for Fabric, Fabric Accelerator, and FMD guidance have been reviewed.
- [ ] ELT is secondary, Fabric Toolbox is optional discovery, and upstream sources are read-only.
- [ ] Named data and security owners approve every grounding source.

## Repository and branch steps

- [ ] Create an agent issue with personas, grounded scope, non-goals, risks, and acceptance tests.
- [ ] Create `<type>/<issue>-<slug>` from the protected default branch.
- [ ] Version instructions, source mappings, evaluation cases, safety tests, and deployment configuration.
- [ ] Exclude secrets, prompt test data with personal/customer information, and tenant identifiers.
- [ ] Confirm required checks and protected DEV/TEST environments.

## Architecture and security decisions

- [ ] Record the Fabric Accelerator pattern and FMD-managed data/semantic dependencies.
- [ ] Define grounding boundaries, semantic definitions, freshness, citations, and fallback behavior.
- [ ] Define identity propagation, authorization trimming, least privilege, and audit.
- [ ] Define defenses for prompt injection, data exfiltration, unsupported claims, and unsafe actions.
- [ ] Define evaluation thresholds, monitoring, cost controls, support, disable, and rollback paths.
- [ ] Explicitly prohibit autonomous upstream changes and production operations.

## Required issues and evidence

- [ ] Agent charter and grounded-source inventory.
- [ ] Architecture, privacy, security, and responsible-use review.
- [ ] Evaluation set covering answerability, refusal, authorization, citations, and adversarial prompts.
- [ ] DEV/TEST scorecard with failures, thresholds, and owner decisions.
- [ ] Human usability acceptance evidence.
- [ ] Pull request with instructions, evaluations, risks, and operational impact.

## DEV and TEST path

- [ ] Run static checks and offline evaluations before deployment.
- [ ] Deploy to restricted DEV through a human-authorized, auditable workflow.
- [ ] Evaluate grounding, citations, access trimming, refusal, injection resistance, latency, and cost.
- [ ] Obtain human approval before restricted TEST promotion.
- [ ] Repeat the approved evaluation set with representative authorized users in TEST.
- [ ] Record versioned results and stop; production enablement is human-approved and human-executed.

## Human approval gates

- [ ] Product and data owners approve use cases and grounding sources.
- [ ] Security/privacy owners approve access, testing, and mitigations.
- [ ] Humans authorize DEV and TEST exposure and accept evaluation thresholds.
- [ ] A human approves and merges the pull request; agents never do so.
- [ ] A human release owner separately decides and performs production enablement.

## Definition of ready

- [ ] Personas, sources, owners, non-goals, risks, and measurable evaluations are defined.
- [ ] Grounding, identity, safety, cost, and disable decisions are approved.
- [ ] Authorized test users/data and DEV/TEST environments are available.
- [ ] Evaluation failures have explicit acceptance or remediation owners.

## Definition of done

- [ ] Versioned instructions, source inventory, evaluations, and runbook are complete.
- [ ] DEV/TEST thresholds pass with authorization and citation evidence.
- [ ] Known limitations, monitoring, support, disable, and rollback procedures are documented.
- [ ] Required checks and human review are complete; a human performs merge.
- [ ] Production enablement is neither automated nor implied.

## Next links

1. Establish grounding with [New Data Product](new-data-product.md).
2. Review the [Operating Model](../wiki/Operating-Model.md).
3. Follow the [Contribution Guide](../community/CONTRIBUTING.md).
