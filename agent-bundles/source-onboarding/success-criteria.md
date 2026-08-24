# Source Onboarding Success Criteria

Success is measured under the [Fabric Engineering OS Constitution](../../CONSTITUTION.md) and the [source-onboarding golden path](../../golden-paths/source-onboarding.md).

- Source contract contains owner, purpose, classification, keys, schema, cadence, volume, retention, deletion semantics, SLA, and consumers; mandatory-field completion is 100%.
- Every Fabric product claim and connector constraint used in the decision has a current Microsoft Learn citation and validation date.
- Representative full and incremental loads reconcile to 100% of agreed control totals, or a human-approved tolerance is documented with rationale.
- Replaying the same window creates zero additional business-key duplicates and produces the same accepted control totals.
- A simulated partial failure recovers within the agreed TEST recovery objective with no missing committed records.
- Breaking schema changes are quarantined and alerted within one monitoring interval; no field is silently discarded.
- Unauthorized access is denied, repository secret scanning is clean, and test fixtures contain no restricted production data.
- Peak-volume TEST execution meets the agreed ingestion SLA with measured capacity headroom.
- Runbook identifies alert route, owner, checkpoint, quarantine, replay, and rollback steps; a second operator can execute it in TEST.
- DEV and TEST evidence is linked from the pull request; merge and PROD deployment remain explicit human actions.
