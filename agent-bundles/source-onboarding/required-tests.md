# Source Onboarding Required Tests

All evidence must comply with the [Fabric Engineering OS Constitution](../../CONSTITUTION.md).

| Area | Required test | Passing evidence |
| --- | --- | --- |
| Architecture | Validate selected [Data Factory pipeline](../../capabilities/pipeline.md) or [Eventstream](../../capabilities/eventstream.md) path against latency, volume, region, capacity, and connector constraints | Decision record with current Microsoft Learn citations and rejected alternatives |
| Governance | Verify owner, classification, purpose, retention, lineage fields, and access groups | Approved source contract with no unresolved mandatory field |
| Security | Prove secrets use approved Fabric/identity mechanisms and least-privilege identities | Repository secret scan clean; access test denies an unauthorized principal |
| Data quality | Reconcile source counts/control totals and key uniqueness for representative full and incremental windows | 100% control-total match or documented, approved tolerance |
| Schema | Add, remove, rename, and type-change test fields in a safe fixture | Compatible change accepted; breaking change quarantined and alerted |
| Idempotency | Re-run the same window/checkpoint | No additional business-key duplicates and stable control totals |
| Recovery | Fail after extraction and before commit, then resume | Checkpoint resumes without gaps or duplication |
| Quarantine | Inject malformed and policy-invalid records | Records are isolated with reason codes; valid records follow declared policy |
| Operability | Exercise alert, telemetry query, retry limit, replay, and runbook | On-call can identify failed source/window and execute TEST recovery |
| Performance | Run expected peak volume plus agreed headroom | Meets ingestion SLA and recorded capacity envelope |

Tests follow the [source-onboarding golden path](../../golden-paths/source-onboarding.md). Use masked or synthetic TEST data; never copy sensitive production samples into Git.
