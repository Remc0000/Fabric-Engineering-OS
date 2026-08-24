# Production Incident Golden Path

This guide is governed by the root [Fabric Engineering OS Constitution](../CONSTITUTION.md).

## Outcome

Service is restored or safely contained with evidence preserved, explicit human command, verified data correctness, and tracked follow-up.

## Prerequisites

- Named incident commander, service owner, communications owner, and technical responders.
- Service runbook, dependencies, dashboards, data recovery boundaries, and contact routes.
- Protected emergency access and change mechanism.
- Severity, notification, regulatory, and evidence-retention rules.

## Decision points

- Classify severity, customer/data impact, security/privacy involvement, and need for containment.
- Choose rollback, roll-forward, pause/quarantine, capacity change, or dependency isolation based on evidence.
- Escalate suspected security/privacy incidents to the applicable human process immediately.
- Never trade hidden data corruption for apparent availability.

## Phased steps

1. **Declare and control:** create the incident record, assign human commander, establish timeline/channel, freeze unrelated changes, and state known impact.
2. **Triage:** correlate recent releases, run IDs, checkpoints, source health, capacity, permissions, and quality signals; preserve logs and samples safely.
3. **Contain:** pause publication/actions, isolate a source, revoke compromised access, or reduce scope under human authorization.
4. **Recover:** a human selects and approves rollback/roll-forward; agents may prepare diagnostics and execute approved DEV/TEST reproduction but never autonomously change PROD.
5. **Verify and close:** reconcile data, freshness, security, downstream consumers, and monitoring; communicate restoration; create owned corrective actions and post-incident review.

## Required evidence and tests

- Timestamped decision/action/approver timeline and immutable release/configuration identifiers.
- Impacted data/window/consumers and preserved diagnostic evidence.
- Recovery reconciliation, replay/idempotency, access, freshness, smoke, and alert-clear results.
- Follow-up issue for root cause, control gaps, owner, due date, and prevention test.

## Approval gates

The human incident commander authorizes containment and recovery actions; security/data/service owners approve decisions in their domains. An emergency does not permit agent self-approval, merge, or PROD deployment. Human owners perform/approve all production actions and closure.

## Rollback and exit strategy

Use the service-specific last-known-good artifact, configuration, checkpoint, and data repair plan. If correctness cannot be proven, keep publication quarantined and provide a degraded or unavailable state explicitly. Exit incident mode only after human commander acceptance and monitoring stability.

## Related guidance

[Capability catalog](../capabilities/README.md) · [Release management](release-management.md) · [Observability pattern](../patterns/observability-by-default.md) · [Human approval gate](../patterns/human-approval-gate.md) · [Environment promotion](../patterns/environment-promotion.md)
