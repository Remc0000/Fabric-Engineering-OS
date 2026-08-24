# Semantic Model Required Tests

These tests implement the [Fabric Engineering OS Constitution](../../CONSTITUTION.md).

| Area | Required test | Passing evidence |
| --- | --- | --- |
| Architecture | Validate fact grain, conformed dimensions, relationship direction/cardinality, date tables, and storage mode | Model review has no unexplained many-to-many or bidirectional relationship |
| Governance | Verify owner, descriptions, lineage, metric glossary, sensitivity, endorsement prerequisites | 100% of published measures have owner-approved definitions |
| Security | Test each RLS/OLS role with positive, negative, and cross-role cases | Restricted rows/objects are inaccessible to unauthorized identities |
| Correctness | Reconcile base measures and totals with governed gold source | Critical measures match approved expected values exactly |
| DAX | Test filter context, subtotals, blanks, zero, boundary dates, and non-additive measures | Versioned query suite returns expected results |
| Refresh | Test full/incremental refresh, failure, retry, late correction, and credentials/config separation | TEST refresh meets SLO and recovers within RTO |
| Compatibility | Compare tables, columns, measures, formats, and roles with released model | Unapproved breaking change fails the gate |
| Performance | Run representative visual queries under expected concurrency | P95 query and refresh durations meet SLO |
| Operability | Validate alerts, refresh ownership, support query, rollback, and capacity response | Operator completes TEST drill from runbook |
| Consumer | Run critical report/Excel/API acceptance scenarios | Named consumer accepts every critical scenario |

The [semantic model capability](../../capabilities/semantic-model.md) and [semantic-model golden path](../../golden-paths/semantic-model.md) define the baseline; add workload-specific tests for composite models or advanced security.
