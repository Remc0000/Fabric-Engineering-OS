# Environment Promotion Standard

This standard implements the [Fabric Engineering OS Constitution](../CONSTITUTION.md) for controlled progression across Fabric environments.

## Environment intent

| Environment | Purpose | Agent boundary |
| --- | --- | --- |
| DEV | Isolated build, integration, and early validation | Agents may deploy through approved auditable workflows |
| TEST | Production-like acceptance, security, performance, and operational validation | Agents may deploy through approved auditable workflows |
| PROD | Live workloads and governed business data | Agents may prepare evidence but never deploy |

Environments must use separate configuration and appropriately isolated identities, workspaces, connections, secrets, and data. Never promote secrets or uncontrolled production data with an artifact.

## Promotion gates

Promotion requires a versioned artifact, successful environment-appropriate tests, resolved or human-accepted findings, configuration validation, deployment and rollback instructions, and an accountable owner. Promote the same immutable artifact where Fabric item behavior permits; record unavoidable environment-specific transformations.

## PROD boundary

PROD deployment requires explicit human approval and an authorized production workflow. Confirm readiness, change window, monitoring, rollback, data impact, and support ownership immediately before release. No agent may approve, initiate, or execute PROD promotion.

## Failure handling

Stop promotion on drift, missing evidence, failed controls, unknown data impact, or environment mismatch. Roll back or remediate through the approved plan, preserve evidence, and route incidents through the incident decision tree.
