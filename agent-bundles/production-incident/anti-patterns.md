# Production Incident Anti-Patterns

These behaviors violate the [Fabric Engineering OS Constitution](../../CONSTITUTION.md):

- **Agent as incident commander:** allowing automation to set severity, authorize remediation, communicate closure, or own production decisions.
- **Fix before evidence:** changing state before recording impact, timestamps, recent changes, and rollback conditions.
- **Production experimentation:** trying commands, reruns, refreshes, failovers, data repairs, or capacity changes to see whether they help.
- **Correlation as root cause:** blaming the latest deployment without counterevidence, timeline fit, and reproducibility.
- **Screenshot-only evidence:** losing query text, time range, filters, source, identity, and machine-readable results.
- **Shared mutable timeline:** editing history without preserving who learned or did what and when.
- **Secret-rich incident record:** copying tokens, connection strings, customer payloads, identities, or unrestricted logs into Git/chat.
- **Unbounded mitigation:** proposing a change with unknown blast radius, no rollback, no validation, or no human operator.
- **Repeated retry as recovery:** amplifying load or duplicating data/actions without understanding idempotency and backlog.
- **Service green equals data correct:** closing before freshness, completeness, duplication, and downstream effects are reconciled.
- **Temporary forever:** leaving bypasses, elevated access, disabled checks, or manual workarounds without owner and expiry.
- **Silent close:** omitting user communication, follow-up issues, and post-incident learning.
