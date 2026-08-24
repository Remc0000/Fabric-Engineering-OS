# Deployment Adapter Contract

Deployment automation is governed by the [Fabric Engineering OS Constitution](../../CONSTITUTION.md).

The OS provides protected DEV and TEST workflow entry points, but a generated project must implement its own deployment adapters because Fabric item types, authentication, workspace topology, and rollback behavior are solution-specific.

## Adapter contract

`deploy-dev.ps1` and `deploy-test.ps1` must:

1. Accept a repository-relative artifact path and change identifier.
2. Authenticate through workload identity federation; never use committed credentials.
3. validate the target workspace and environment before changing it.
4. deploy only the requested, reviewed artifacts.
5. emit a sanitized deployment summary and evidence.
6. fail on partial deployment and identify the rollback or recovery action.

The default adapters fail closed until a project replaces their implementation through a reviewed pull request. The PROD gate never calls a deployment adapter; production execution remains human-owned.
