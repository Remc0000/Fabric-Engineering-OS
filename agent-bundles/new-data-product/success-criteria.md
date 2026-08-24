# New Data Product Success Criteria

Success is evaluated under the [Fabric Engineering OS Constitution](../../CONSTITUTION.md) and [data-product golden path](../../golden-paths/data-product.md).

- Product contract names one accountable owner, at least one consumer, supported decisions, grain, keys, measures, SLOs, classification, retention, and compatibility policy; completion is 100%.
- Architecture records one authoritative gold interface and traces every material choice to current Microsoft Learn and the selected Fabric capability.
- Lineage covers 100% of published gold fields back to approved sources and transformation versions.
- All critical data-quality rules pass at their defined thresholds; critical key, access, and reconciliation defects have zero tolerance unless a human exception is recorded.
- TEST freshness and availability meet the declared SLO for at least three representative consecutive runs.
- Peak workload meets query/processing objectives within the approved capacity and documented cost envelope.
- Unauthorized role tests are denied and sensitive test data follows masking/synthetic-data policy.
- Backfill and rollback complete in TEST within the declared RTO without changing published semantics.
- Contract compatibility check blocks every unversioned breaking change.
- Named consumers accept 100% of critical use cases in TEST, and the PR links evidence, runbook, risks, and human production handoff.
