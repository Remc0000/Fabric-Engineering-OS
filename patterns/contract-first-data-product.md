# Contract-First Data Product

This pattern is governed by the root [Fabric Engineering OS Constitution](../CONSTITUTION.md).

## Context

A dataset, table, event, or semantic model is consumed across team boundaries.

## Problem

Without an explicit contract, producers cannot distinguish safe evolution from breaking change.

## Forces

- Consumers value stability while sources evolve.
- Quality, freshness, and semantics are as important as schema.
- Sensitive fields need policy before publication.
- Contracts create ownership obligations.

## Solution

Before implementation, version a contract containing purpose, owner, consumers, grain, keys, schema, semantics, classification, freshness, quality thresholds, retention, access, compatibility, and deprecation policy. Validate published outputs against it and require human data-owner approval for breaking changes.

## Consequences

Consumers can automate expectations and changes become deliberate, but producers must maintain compatibility and communication.

## Validation

- Run schema, key, nullability, quality, and freshness contract tests.
- Verify classification and access for every exposed field.
- Exercise compatible and breaking change examples.
- Confirm owner and deprecation contacts are active.

## Related guidance

[Data product golden path](../golden-paths/data-product.md) · [Semantic model golden path](../golden-paths/semantic-model.md) · [Medallion data product](medallion-data-product.md) · [Governed semantic layer](governed-semantic-layer.md)
