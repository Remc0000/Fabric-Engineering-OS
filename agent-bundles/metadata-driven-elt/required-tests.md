# Metadata-Driven ELT Required Tests

Required evidence is governed by the [Fabric Engineering OS Constitution](../../CONSTITUTION.md).

| Area | Required test | Passing evidence |
| --- | --- | --- |
| Architecture | Review metadata schema, state machine, medallion boundaries, adapter boundaries, and [Pipeline](../../capabilities/pipeline.md)/[Notebook](../../capabilities/notebook.md)/[Lakehouse](../../capabilities/lakehouse.md)/[Warehouse](../../capabilities/warehouse.md) choices | Human-reviewed decision record; no unbounded generic adapter or cyclic dependency |
| Governance | Validate owners, source approvals, metadata versioning, compatibility rules, catalog fields, lineage, retention, and upstream read-only posture | Complete metadata contract and lineage from source through bronze/silver/gold |
| Security | Test least-privilege identities, connection isolation, secret-free metadata, restricted data handling, and unauthorized access paths | Authorized roles succeed; unauthorized roles fail; metadata contains no secrets or executable expressions |
| Data quality | Test completeness, uniqueness, validity, referential integrity, schema drift, reconciliation, and freshness rules per source/object | Every critical rule meets its numeric threshold or has a human-approved exception |
| Idempotent replay | Run initial load, incremental load, duplicate trigger, retry after failure, checkpoint replay, and backfill for representative sources | Outputs are deterministic; duplicates are not published; watermarks advance only after durable publication |
| State and isolation | Simulate invalid metadata, source outage, partial write, adapter failure, and concurrent source runs | Invalid metadata fails before access/write; one source failure cannot corrupt another source or shared state |
| Transformation | Run deterministic tests for parameterized notebook or SQL transformations across bronze, silver, and gold boundaries | Expected outputs match versioned fixtures and declared medallion semantics |
| Operability | Test observability, run IDs, alert routing, retry limits, quarantine handling, pause/resume, rollback, and support ownership | TEST exercise completes within declared RTO and every alert has an accountable owner |
| Performance/cost | Run representative volume, concurrency, and backfill workload | SLOs meet approved capacity and documented cost envelope |
| Release readiness | Validate onboarding template, runbook, rollback manifest, DEV/TEST deployment evidence, and production handoff | PR links evidence, residual risks, and human approval gates; no agent merge or PROD deployment |

Use approved DEV/TEST workflows from the [metadata-driven ELT golden path](../../golden-paths/metadata-driven-elt.md); production evidence cannot be fabricated from lower environments.
