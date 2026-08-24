# Eventhouse RTI Success Criteria

Success is measured under the [Fabric Engineering OS Constitution](../../CONSTITUTION.md) and [eventhouse-rti golden path](../../golden-paths/eventhouse-rti.md).

- Event contract names producer, consumer, schema/version, event ID, event time, volume/burst, SLO, classification, retention, and replay owner with 100% mandatory completion.
- Reconciliation shows zero unexplained event loss across sent, accepted, and queryable IDs for the agreed TEST window.
- Duplicate rate is zero after declared deduplication for critical events, or remains below a numeric human-approved threshold.
- P95 and P99 event-to-query/action latency meet the declared SLO at steady rate and agreed peak burst.
- Malformed and breaking-schema events are quarantined and alerted within one monitoring interval.
- Recovery meets declared RPO/RTO, and replay causes zero duplicate consequential actions.
- Every action is permission-checked, bounded, deduplicated, rate-limited, auditable, and covered by a tested kill switch.
- Unauthorized query/action tests all fail closed; no secrets or restricted samples exist in Git.
- Operator can diagnose lag/loss and execute recovery from the TEST runbook.
- PR links architecture, current product citations, load/security/recovery evidence, residual risks, and the human PROD gate.
