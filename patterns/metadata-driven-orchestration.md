# Metadata-Driven Orchestration

This pattern is governed by the root [Fabric Engineering OS Constitution](../CONSTITUTION.md).

## Context

Many sources follow the same ingestion and transformation lifecycle with source-specific parameters.

## Problem

Cloned pipelines drift, duplicate fixes, and hide which configuration produced an output.

## Forces

- Sources differ in schema, watermark, cadence, and quality rules.
- Configuration must be reviewable and versioned.
- A bad metadata row can affect many workloads.
- Exceptional sources still need an explicit path.

## Solution

Use a versioned metadata contract to drive a small set of orchestrators. Validate metadata before execution, resolve secrets through approved identity mechanisms, persist run and configuration versions, isolate source failures, and provide an extension point rather than embedding arbitrary code in metadata.

## Consequences

Onboarding becomes consistent and cheaper, while the metadata schema and orchestrator become shared critical infrastructure.

## Validation

- Reject incomplete or incompatible metadata before data movement.
- Prove watermark, retry, and restart behavior with two representative sources.
- Trace every output to code, metadata version, and run ID.
- Confirm one source failure does not corrupt another.

## Related guidance

[Metadata-driven ELT golden path](../golden-paths/metadata-driven-elt.md) · [Metadata-driven ELT architecture](../reference-architectures/metadata-driven-elt.md) · [Idempotent processing](idempotent-processing.md) · [Pipeline capability](../capabilities/pipeline.md)
