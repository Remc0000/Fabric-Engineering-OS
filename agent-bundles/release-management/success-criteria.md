# Release Management Success Criteria

Success is measured under the [Fabric Engineering OS Constitution](../../CONSTITUTION.md) and [release-management golden path](../../golden-paths/release-management.md).

- One human release owner and one immutable candidate commit/artifact manifest are named; candidate identity is unchanged across TEST evidence and production proposal.
- 100% of included changes map to approved issues, owners, artifacts, tests, and release-note entries; excluded work is explicit.
- All mandatory CI, architecture, governance, security, data-quality, compatibility, operability, and acceptance gates pass, or the release is stopped.
- Secret scan reports zero exposed secrets; unresolved critical security findings and unapproved exceptions are zero.
- Exact candidate deploys successfully to DEV and TEST with recorded IDs and reviewed environment parameter differences.
- Critical contract/schema/model changes are backward-compatible or have a versioned, owner-approved migration and consumer plan.
- Migration and rollback/roll-forward rehearsals meet the numeric change-window and RTO targets while preserving reconciled data.
- Critical performance and capacity metrics stay within approved regression/cost thresholds.
- Release packet contains candidate identity, evidence, risks, approvals requested, communications, production steps, validation, and rollback with 100% mandatory completion.
- Agent performs zero self-approvals, merges, production deployments, or protection changes; authorized humans retain all final actions.
