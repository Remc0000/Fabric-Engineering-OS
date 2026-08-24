# Governed Semantic Layer

This pattern is governed by the root [Fabric Engineering OS Constitution](../CONSTITUTION.md).

## Context

Multiple reports, applications, or agents need consistent business metrics over Fabric data.

## Problem

Reimplementing measures and relationships in each consumer produces contradictory results.

## Forces

- Business meaning requires accountable ownership.
- Model performance depends on source shape, relationships, and storage mode.
- Row- and object-level security must align with data policy.
- Changes can break many consumers.

## Solution

Build a domain-owned semantic model over contract-approved gold data. Define conformed dimensions, explicit measures, hidden technical fields, descriptions, security roles, endorsement, and compatibility policy. Treat measures and exposed fields as versioned interfaces.

## Consequences

Consumers share trusted meaning and performance tuning, while the model becomes a critical dependency requiring disciplined evolution.

## Validation

- Reconcile key measures to approved gold queries.
- Test relationship ambiguity, totals, time intelligence, and security roles.
- Measure representative query performance.
- Run downstream compatibility checks before release.

## Related guidance

[Semantic model golden path](../golden-paths/semantic-model.md) · [Data agent golden path](../golden-paths/data-agent.md) · [Data product architecture](../reference-architectures/data-product.md) · [Semantic model capability](../capabilities/semantic-model.md)
