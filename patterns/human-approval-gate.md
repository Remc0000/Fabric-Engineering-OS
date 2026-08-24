# Human Approval Gate

This pattern is governed by the root [Fabric Engineering OS Constitution](../CONSTITUTION.md).

## Context

A decision affects architecture, security, data loss, compliance, cost, merge state, or production.

## Problem

Automation can produce evidence but cannot accept organizational accountability.

## Forces

- Gates must be explicit without blocking low-risk feedback loops.
- Approval must bind to an exact decision and immutable candidate.
- Emergencies require speed but not agent self-approval.

## Solution

Define the named human role, decision, evidence bundle, candidate version, expiry, and rejection path. Fail closed when evidence or identity is missing. Agents may prepare evidence and deploy to DEV/TEST through approved workflows; humans approve architecture, pull requests, merges, and PROD actions.

## Consequences

Accountability is auditable, with added lead time that should be managed through early evidence preparation.

## Validation

- Attempt the action without approval and confirm it is blocked.
- Confirm an agent identity cannot satisfy the gate.
- Verify approval references the exact commit/release and required evidence.
- Test rejection, expiry, and revocation behavior.

## Related guidance

[Release management](../golden-paths/release-management.md) · [Production incident](../golden-paths/production-incident.md) · [Environment promotion](environment-promotion.md)
