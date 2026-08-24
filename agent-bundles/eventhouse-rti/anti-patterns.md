# Eventhouse RTI Anti-Patterns

Avoid these violations of the [Fabric Engineering OS Constitution](../../CONSTITUTION.md):

- **Real time without an SLO:** selecting RTI because it sounds faster, without a decision that requires measured latency.
- **Ingestion time equals event time:** ignoring delayed, replayed, and out-of-order events.
- **No stable event identity:** making deduplication, reconciliation, replay, and action safety impossible.
- **Schema overwrite:** changing mappings or producer payloads without versioning and mixed-version tests.
- **Infinite hot retention:** retaining high-volume events without query, legal, capacity, and cost justification.
- **KQL by copy/paste:** deploying unversioned portal queries with no expected-result tests or ownership.
- **Average-only telemetry:** reporting mean latency while hiding P95/P99, backlog, drops, and throttling.
- **Replay re-triggers actions:** allowing historical recovery to duplicate notifications or external effects.
- **Autonomous consequential action:** activating business-impacting behavior without human approval, limits, audit, and kill switch.
- **Preview assumption:** relying on a feature without current Microsoft Learn validation for region/tenant/capacity.
- **Production experimentation:** using PROD to establish throughput or failure behavior; the agent is limited to approved DEV/TEST.
