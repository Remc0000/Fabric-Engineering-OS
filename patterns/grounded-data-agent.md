# Grounded Data Agent

This pattern is governed by the root [Fabric Engineering OS Constitution](../CONSTITUTION.md).

## Context

Users need natural-language answers grounded in governed Fabric data.

## Problem

An agent can produce plausible but incorrect, over-broad, or unauthorized answers when grounding and evaluation are implicit.

## Forces

- Natural language is ambiguous.
- Agent answers inherit source quality and security.
- Broad source scope reduces precision.
- Product behavior and supported sources evolve.

## Solution

Ground the agent only in approved semantic models, warehouses, lakehouses, or KQL databases needed for its purpose. Provide curated descriptions and instructions, preserve source permissions, define refusal and ambiguity behavior, and evaluate a versioned set of answer, citation, security, and adversarial cases before promotion.

## Consequences

Answers become more useful and auditable, while source curation and regression evaluation remain ongoing work.

## Validation

- Reconcile answers to deterministic source queries.
- Test ambiguous, unsupported, malicious, and access-restricted prompts.
- Verify citations or trace evidence where supported.
- Confirm model or source changes trigger regression tests.

## Related guidance

[Data agent golden path](../golden-paths/data-agent.md) · [Data agent architecture](../reference-architectures/data-agent.md) · [Governed semantic layer](governed-semantic-layer.md) · [Data agent capability](../capabilities/data-agent.md)
