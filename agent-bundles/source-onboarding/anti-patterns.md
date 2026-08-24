# Source Onboarding Anti-Patterns

These prohibitions implement the [Fabric Engineering OS Constitution](../../CONSTITUTION.md).

- **Connector-first design:** choosing a connector before documenting latency, change semantics, limits, and ownership. Start with the source contract.
- **Full reload by default:** repeatedly scanning an operational source without an approved volume, cost, locking, and reconciliation assessment.
- **Timestamp hope:** treating a non-monotonic update timestamp as reliable CDC. Prove overlap, ordering, deletion, and clock behavior.
- **Checkpoint after extraction:** advancing a watermark before durable landing. Commit data and checkpoint atomically or use a recoverable protocol.
- **Silent schema drift:** coercing or dropping changed fields. Quarantine breaking changes, alert the owner, and preserve raw evidence.
- **Bronze as a junk drawer:** landing files without source identity, ingestion time, batch/run ID, schema version, and retention.
- **Happy-path-only validation:** omitting duplicate, late-arrival, partial-failure, replay, and unauthorized-access tests.
- **Embedded credentials:** placing tokens, connection strings, tenant IDs, or customer samples in code, issue text, logs, or fixtures.
- **Unowned alerts:** creating telemetry with no severity, route, runbook, or response objective.
- **Premature production:** interpreting a successful DEV run as authorization to merge or deploy PROD; the agent must stop at human approval.
