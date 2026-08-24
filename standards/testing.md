# Testing Standard

This standard implements the [Fabric Engineering OS Constitution](../CONSTITUTION.md) through risk-based evidence.

## Test strategy

Select the smallest meaningful test set that covers changed behavior and likely failure modes. Include, as applicable:

- static validation for schemas, configuration, policy, and syntax;
- unit tests for deterministic transformation and decision logic;
- contract tests for interfaces and data shapes;
- integration tests in an approved isolated environment;
- data-quality tests for completeness, validity, uniqueness, timeliness, and reconciliation;
- security tests for authorization and safe failure;
- operational tests for observability, retry, idempotency, recovery, and rollback.

## Evidence

Record the version or commit, environment, inputs, expected result, actual result, date, and limitations. Distinguish mocked results from observed Fabric behavior. Flaky, skipped, or partially executed tests are visible failures of evidence, not silent passes.

## Environment rules

Use synthetic or approved masked data. Destructive tests require isolation, explicit scope, and a recovery path. DEV and TEST evidence does not authorize PROD deployment.

## Exit criteria

Acceptance criteria must map to test evidence. Blocking failures are resolved or explicitly accepted by an accountable human; an agent cannot waive a test, accept residual risk, or approve its own change.
