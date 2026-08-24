# Mirroring to Gold Required Tests

These tests implement the [Fabric Engineering OS Constitution](../../CONSTITUTION.md).

| Area | Required test | Passing evidence |
| --- | --- | --- |
| Architecture | Validate source/region/object support, topology, authority, and gold [Lakehouse](../../capabilities/lakehouse.md)/[Warehouse](../../capabilities/warehouse.md) choice | Current Microsoft Learn citations and reviewed decision |
| Governance | Verify source consent, classification, purpose, lineage, retention, and raw/gold access separation | Approved mirror and product contracts |
| Security | Test connection identity, workspace roles, raw mirror restriction, and gold consumer access | Unauthorized source/mirror/gold access denied |
| Reconciliation | Compare source and mirror row counts, key sets, checksums/control totals | Zero unexplained drift for agreed sample/windows |
| Change semantics | Insert, update, delete, key edge case, and transaction-boundary fixtures | Mirror and gold reflect declared outcomes |
| Schema evolution | Add/alter/drop test columns where safely supported | Compatible changes flow; breaking changes stop/alert |
| Latency | Measure source commit to mirrored and gold availability | P95 meets declared SLO |
| Source impact | Compare source resource/latency baseline during representative change rate | Within database-owner-approved threshold |
| Recovery | Pause/resume and simulate documented outage/reseed path | RPO/RTO met; no unexplained duplicate/loss |
| Operability | Exercise lag, failure, schema, capacity alerts and runbook | On-call identifies object/checkpoint and safe next action |
| Gold quality | Run product rules, history, reconciliation, and compatibility tests | All critical quality and contract gates pass |

Execute in approved DEV/TEST environments following the [mirroring-to-gold golden path](../../golden-paths/mirroring-to-gold.md); do not test destructive recovery in production.
