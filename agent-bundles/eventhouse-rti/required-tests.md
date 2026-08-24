# Eventhouse RTI Required Tests

All tests are governed by the [Fabric Engineering OS Constitution](../../CONSTITUTION.md).

| Area | Required test | Passing evidence |
| --- | --- | --- |
| Architecture | Validate [Eventstream](../../capabilities/eventstream.md)/[Eventhouse](../../capabilities/eventhouse.md) topology, region, capacity, retention, and failure domains | Reviewed topology and current Microsoft Learn citations |
| Governance | Verify event owner, purpose, classification, retention, lineage, and action accountability | Complete event/action contracts |
| Security | Test producer, consumer, operator, and unauthorized identities | Least privilege enforced; no unauthorized query/action |
| Data quality | Send valid, malformed, duplicate, late, out-of-order, and schema-versioned events | Declared accept/quarantine/correction behavior matches counts |
| Loss/duplication | Reconcile unique sent event IDs to accepted and queryable IDs | Zero unexplained loss; duplicates within explicit threshold |
| Latency | Measure event-to-query/action latency at steady and burst rates | P50/P95/P99 meet SLO |
| Replay/recovery | Interrupt ingestion/query policy, restore, replay bounded window | RPO/RTO met without uncontrolled duplicate action |
| KQL correctness | Run versioned expected-result queries over deterministic fixtures | All critical KQL assertions pass |
| Operability | Trigger lag, ingestion error, capacity, and action-failure alerts | Correct owner receives alert and follows TEST runbook |
| Action safety | Test dedupe, rate limit, permission, kill switch, and audit record | No duplicate/unbounded action; every attempt is traceable |

Test at representative burst size and retention assumptions from the [eventhouse-rti golden path](../../golden-paths/eventhouse-rti.md).
