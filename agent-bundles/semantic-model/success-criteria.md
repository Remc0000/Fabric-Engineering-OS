# Semantic Model Success Criteria

Success is measured under the [Fabric Engineering OS Constitution](../../CONSTITUTION.md) and [semantic-model golden path](../../golden-paths/semantic-model.md).

- The model contract names owner, consumers, source version, refresh/query SLOs, security roles, and compatibility policy with no mandatory gaps.
- Every published measure has an approved definition, format, description, owner, and at least one expected-result query.
- Critical measures reconcile exactly to governed gold acceptance values; noncritical tolerances are numeric and human-approved.
- Relationship validation reports zero unexplained many-to-many, bidirectional, or referential-integrity exceptions.
- Every security role passes positive, negative, and cross-role leakage tests; unauthorized detail exposure is zero.
- P95 representative query duration and refresh duration meet documented SLOs in TEST at expected data volume and concurrency.
- Full/incremental refresh recovery completes within RTO and late corrections appear within the declared freshness window.
- Compatibility automation detects 100% of fixture breaking changes and blocks unapproved changes.
- Named consumers accept all critical analytical questions in TEST.
- PR evidence includes source lineage, model diff, tests, runbook, rollback, and explicit human endorsement/production gates.
