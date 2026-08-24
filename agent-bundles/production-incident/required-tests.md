# Production Incident Required Tests

Incident validation is governed by the [Fabric Engineering OS Constitution](../../CONSTITUTION.md). During an active incident, run only tests whose risk and load the human incident commander accepts.

| Area | Required validation | Passing evidence |
| --- | --- | --- |
| Architecture | Map affected Fabric components, dependencies, failure domains, and recent changes | Scope diagram/list with owners and evidence links |
| Governance | Confirm commander, severity, communication path, evidence handling, approvals, and action log | Every production action has named human authorizer/operator and timestamp |
| Security | Check for access anomalies, leakage, secret exposure, and unauthorized changes; escalate indicators | Security owner disposition recorded; sensitive evidence protected |
| Service health | Validate user-visible symptom with a low-risk probe and compare baseline | Repeatable impact and recovery signals |
| Data quality | Reconcile impacted windows, keys, counts/control totals, freshness, and duplication | Data owner signs off or remediation issue remains open |
| Remediation safety | Before any human action, review preconditions, blast radius, rollback, permissions, and validation | Commander approval references exact plan/version |
| Recovery | After human action, observe SLO, backlog, retries, and recurrence over agreed window | Stable metrics for commander-defined observation period |
| Operability | Verify alerts fired/routed, runbook was usable, telemetry timestamps align, and evidence is retained | Gaps captured as owned follow-up issues |
| Regression | Reproduce cause/fix with safe fixture in DEV/TEST | Corrective test fails before and passes after fix |
| Closure | Review temporary mitigations, owner/expiry, communications, follow-ups, and post-incident meeting | No unowned action; human commander declares closure |

Use the [production-incident golden path](../../golden-paths/production-incident.md). Never run destructive, load-generating, or state-changing tests in PROD through this bundle.
