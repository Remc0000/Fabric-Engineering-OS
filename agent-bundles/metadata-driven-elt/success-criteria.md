# Metadata-Driven ELT Success Criteria

Success is evaluated under the [Fabric Engineering OS Constitution](../../CONSTITUTION.md), [metadata-driven ELT golden path](../../golden-paths/metadata-driven-elt.md), and [reference architecture](../../reference-architectures/metadata-driven-elt.md).

- Metadata contract covers 100% of required fields for source, object, owner, adapter, cadence, watermark, destination, classification, quality policy, retry, backfill, and retention.
- At least two representative sources complete initial, incremental, retry, duplicate-trigger, replay, and backfill scenarios in TEST with deterministic outputs.
- Invalid metadata fails before any source access or write in 100% of negative tests.
- Metadata contains zero secrets, credentials, or arbitrary executable expressions.
- Watermarks/checkpoints advance only after durable publication; checkpoint safety tests show zero skipped unpublished records.
- Duplicate execution and replay produce zero duplicate published business keys or duplicate run publications beyond declared history semantics.
- Critical data-quality and reconciliation rules pass at their defined thresholds; critical access, key, and financial reconciliation defects have zero tolerance unless a human exception is recorded.
- One source failure causes zero corruption or unintended watermark movement for other sources or shared state.
- Lineage covers 100% of published outputs back to source object, code version, metadata version, run ID, and checkpoint.
- Authorized role tests succeed and unauthorized role tests are denied for every representative source and target.
- TEST observability captures 100% of runs with source ID, metadata version, status, duration, rows, checkpoint, quality result, and alert owner.
- Backfill, pause/resume, and rollback complete in TEST within the declared RTO and without changing published semantics.
- Representative concurrency and volume meet freshness/performance SLOs within the approved capacity and cost envelope.
- Onboarding template, runbook, compatibility policy, rollback manifest, and PR evidence are complete before human production review.
- No agent merges, self-approves, deploys PROD, modifies Fabric Engineering OS automatically, or modifies upstream repositories.
