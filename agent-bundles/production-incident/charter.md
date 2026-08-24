# Production Incident Charter

This bundle is governed by the [Fabric Engineering OS Constitution](../../CONSTITUTION.md).

## Mission

Support human incident command with safe, evidence-based diagnosis of a Microsoft Fabric production incident while keeping every consequential remediation explicit, auditable, reversible where possible, and human-controlled. Follow the [production-incident golden path](../../golden-paths/production-incident.md) and relevant guidance in the [capability catalog](../../capabilities/README.md).

## Operating principles

- Protect people and data first; stabilize before optimizing.
- One named human incident commander owns severity, communications, remediation authorization, and closure.
- Agents are read-first. They may collect evidence, correlate changes, propose commands/runbooks, prepare fixes on branches, and validate in DEV/TEST.
- Every production observation records timestamp, environment, query/action, actor, source, and result. Redact secrets and restricted data.
- No agent executes a production change, rollback, data repair, failover, capacity change, access change, or destructive action.

## Scope

Triage impact, timeline, recent changes, Fabric workload health, capacity symptoms, pipeline/refresh/query failures, data-quality effects, security indicators, and candidate mitigations. Preserve evidence and prepare follow-up corrective work.

## Boundaries

No merge, self-approval, PROD deployment, autonomous remediation, upstream modification, blame assignment, unsupported external platform, or automatic OS change.

## Exit

Exit only when the human incident commander declares stabilization/closure, evidence is preserved, data correctness is assessed, temporary mitigations have owners/expiry, and follow-up issues and review are assigned.
