# Least-Privilege Access

This pattern is governed by the root [Fabric Engineering OS Constitution](../CONSTITUTION.md).

## Context

People, service principals, managed identities, and Fabric artifacts require access to data and operations.

## Problem

Broad workspace roles and shared credentials expand blast radius and obscure accountability.

## Forces

- Fabric permissions span tenant, capacity, workspace, item, and data planes.
- Automation requires non-interactive identity.
- Consumer access differs from operator access.
- Product behavior must be checked against current Microsoft Learn documentation.

## Solution

Map each identity to required actions and smallest viable scope. Separate deployment, runtime, operator, and consumer identities; use groups and approved secretless identity where supported; time-bound elevation; and review access on ownership or contract changes.

## Consequences

Risk and audit ambiguity decrease, while access design and troubleshooting require more precision.

## Validation

- Test allowed and denied actions with representative identities.
- Confirm no secrets or personal credentials are embedded.
- Review inherited workspace and data-plane permissions.
- Record owner, purpose, expiry, and review date for privileged access.

## Related guidance

[Source onboarding](../golden-paths/source-onboarding.md) · [Data agent](../golden-paths/data-agent.md) · [Human approval gate](human-approval-gate.md) · [Capability catalog](../capabilities/README.md)
