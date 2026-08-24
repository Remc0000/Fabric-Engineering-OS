# Production Incident Success Criteria

Success is measured under the [Fabric Engineering OS Constitution](../../CONSTITUTION.md) and remains human-declared.

- A named human incident commander, severity, affected scope, communication channel, and evidence record exist within the organization's target response time.
- 100% of production actions are performed by authorized humans and logged with UTC timestamp, exact plan/version, approver, operator, outcome, and rollback status.
- The agent performs zero production writes, deployments, rollbacks, failovers, capacity/access changes, or data repairs.
- Timeline records detection, material observations, hypotheses, decisions, actions, and recovery without overwriting prior evidence.
- Every mitigation proposal states preconditions, blast radius, expected signal, rollback, and validation before human authorization.
- User-visible service meets the restored SLO for the commander-defined observation window.
- Data owner verifies impacted-window completeness, freshness, uniqueness, and control totals, or an explicit remediation issue with severity/owner remains open.
- Security indicators receive documented security-owner disposition; sensitive evidence and secrets are absent from Git.
- Root-cause confidence is evidence-rated; unknown cause is reported as unknown rather than asserted.
- Every temporary mitigation has owner and expiry; follow-up issues, DEV/TEST regression test, and post-incident review are linked before human closure.
