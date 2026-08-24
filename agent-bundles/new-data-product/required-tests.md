# New Data Product Required Tests

Required evidence is governed by the [Fabric Engineering OS Constitution](../../CONSTITUTION.md).

| Area | Required test | Passing evidence |
| --- | --- | --- |
| Architecture | Review grain, medallion boundaries, authority, dependencies, and [Lakehouse](../../capabilities/lakehouse.md)/[Warehouse](../../capabilities/warehouse.md) choice | Human-reviewed decision record; no cyclic or unowned dependency |
| Governance | Validate owner, catalog metadata, classification, lineage, retention, purpose, and sharing | Complete product contract and lineage from source to gold |
| Security | Test least-privilege roles, restricted columns/rows, and non-production data handling | Authorized roles succeed; unauthorized roles fail |
| Data quality | Test uniqueness, completeness, validity, referential integrity, reconciliation, and freshness | Every critical rule meets its numeric threshold |
| Transformation | Run deterministic unit tests for business rules and boundary dates | Expected outputs match versioned fixtures |
| History | Test inserts, updates, deletes, late arrivals, and correction handling | Declared history semantics hold without silent loss |
| Contract | Compare schema and semantics against previous released contract | Breaking changes fail unless versioned and human-approved |
| Operability | Test observability, alert routing, retry, backfill, rollback, and support ownership | TEST exercise completes within declared RTO |
| Performance/cost | Run representative peak workload and concurrency | SLO met within approved capacity/cost envelope |
| Consumer | Execute named consumer acceptance queries/use cases | All critical use cases accepted by consumer owner |

Use approved DEV/TEST workflows from the [data-product golden path](../../golden-paths/data-product.md); production evidence cannot be fabricated from lower environments.
