# Release Management Golden Path

This guide is governed by the root [Fabric Engineering OS Constitution](../CONSTITUTION.md).

## Outcome

An immutable, reviewed Fabric release is promoted with traceable evidence, explicit environment configuration, human-controlled PROD approval, and a rehearsed rollback.

## Prerequisites

- Linked issue, release owner, service owner, architecture decision, and accepted change scope.
- Source-controlled artifacts and environment-neutral configuration contract.
- Protected branch/environments, required checks, human reviewers, and deployment identity.
- Workload-specific DEV/TEST deployment and rollback procedures.

## Decision points

- Classify change risk: compatibility, data migration, security, capacity/cost, downtime, and consumer impact.
- Determine whether artifact rollback is sufficient or a forward-compatible data migration is required.
- Verify current Microsoft Learn support for source control/deployment of each Fabric item; define a reviewed adapter/manual step where unsupported.
- Reject release if evidence, ownership, rollback, or human approval is incomplete.

## Phased steps

1. **Plan:** define candidate contents, dependencies, compatibility, migration, communications, success/abort thresholds, and approvals.
2. **Build and DEV:** create an immutable candidate and manifest; agents may deploy it through the approved DEV workflow and collect tests.
3. **Qualify in TEST:** promote the same candidate, apply TEST-only external configuration, run functional/security/performance/contract tests, and rehearse rollback.
4. **Review and merge:** attach problem, approach, architecture approval, evidence, operational impact, manifest, and rollback to the PR; humans approve and merge after required checks.
5. **PROD and observe:** a human release owner approves and performs/triggers protected PROD promotion; verify manifest/configuration, smoke tests, data correctness, telemetry, and consumer health through the observation window.

## Required evidence and tests

- Candidate manifest with commit, artifact versions, dependencies, and configuration schema.
- DEV/TEST deployment records and functional, contract, security, performance, and compatibility results.
- Secret scan, environment-drift comparison, TEST rollback rehearsal, data migration/recovery evidence, and owner-approved runbook.
- Human architecture/PR/merge/PROD approvals bound to the exact candidate.

## Approval gates

Agents may create implementation and deploy approved candidates to DEV/TEST. Human architecture owners approve architecture; human reviewers approve the PR; humans merge; a human release owner approves and performs/authorizes all PROD actions. Gates fail closed and agents never self-approve.

## Rollback and exit strategy

Apply predeclared abort thresholds. Restore the prior artifact/configuration and compatible data state, or execute the approved roll-forward repair when rollback would violate data compatibility. Preserve evidence, notify consumers, and open an incident if correctness or recovery objectives are missed.

## Related guidance

[Deployment pipeline capability](../capabilities/deployment-pipeline.md) · [Production incident](production-incident.md) · [Environment promotion](../patterns/environment-promotion.md) · [Human approval gate](../patterns/human-approval-gate.md) · [Observability](../patterns/observability-by-default.md)
