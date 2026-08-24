# Release Management Required Tests

Release evidence is governed by the [Fabric Engineering OS Constitution](../../CONSTITUTION.md).

| Area | Required test | Passing evidence |
| --- | --- | --- |
| Architecture | Review changed topology, dependencies, capacity/region, feature support, and decisions | Required human architecture decisions linked |
| Governance | Verify candidate scope, issues, owners, approvals, separation of duties, and retention | 100% change-to-issue/artifact traceability |
| Security | Run secret/dependency/config scans and least-privilege deployment/access checks | No unresolved critical finding or secret |
| Data quality | Run affected product reconciliation, freshness, uniqueness, validity, and regression checks | All critical gates meet thresholds |
| Compatibility | Diff schemas, semantic models, APIs/contracts, parameters, and consumers | Unapproved breaking changes are zero |
| Deployment | Deploy exact candidate through approved DEV and TEST paths using environment-specific config | Recorded deployment IDs match candidate version |
| Migration | Rehearse schema/data changes with representative volume and failure injection | Duration, correctness, resume/rollback meet plan |
| Operability | Exercise alerts, dashboards, support ownership, rollback/roll-forward, and communications | TEST drill completes within RTO |
| Performance/cost | Compare critical workload and capacity metrics with baseline | Within approved regression and cost thresholds |
| Acceptance | Execute business/consumer acceptance for affected critical paths | Named owner signs off every critical scenario |
| Provenance | Recompute/compare candidate identity after tests | Evidence packet references one unchanged candidate |

Apply workload tests from the linked bundle and [release-management golden path](../../golden-paths/release-management.md). PROD deployment is not a test this agent may perform.
