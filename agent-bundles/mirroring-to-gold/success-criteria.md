# Mirroring to Gold Success Criteria

Success is measured under the [Fabric Engineering OS Constitution](../../CONSTITUTION.md) and [mirroring-to-gold golden path](../../golden-paths/mirroring-to-gold.md).

- Source owner has approved exact databases/tables, test windows, source-impact threshold, and recovery procedure.
- Every relied-upon Mirroring behavior is cited to current Microsoft Learn with source/version/region assumptions recorded.
- Source-to-mirror reconciliation has zero unexplained key, count, or control-total differences for the agreed TEST scope.
- Inserts, updates, hard/soft deletes, and declared key edge cases produce expected mirror and gold outcomes.
- P95 source-commit-to-gold latency meets the numeric SLO at representative change rate.
- Measured source workload impact remains within the database-owner-approved threshold.
- Breaking schema tests alert and stop affected gold publication within one monitoring interval; no field disappears silently.
- Raw mirror access is denied to unauthorized consumer roles, while approved gold access succeeds.
- Pause/resume and documented recovery exercise meet RPO/RTO with no unexplained data loss or duplication.
- Gold contract, lineage, quality tests, runbook, risks, and human architecture/PROD approvals are linked from the PR.
