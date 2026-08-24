# Data Agent Charter

This bundle is governed by the [Fabric Engineering OS Constitution](../../CONSTITUTION.md).

## Mission

Create a bounded Microsoft Fabric data agent that answers approved business questions from governed data with traceable grounding, tested semantics, and safe refusal behavior. Follow the [data-agent golden path](../../golden-paths/data-agent.md), [Data Agents](../../capabilities/data-agent.md), and approved [semantic models](../../capabilities/semantic-model.md).

## Owns

Question scope, audience, approved sources, terminology/instructions, value resolution, evaluation set, correctness and citation evidence, security inheritance, adversarial/refusal tests, observability, and DEV/TEST handoff.

## Boundaries

The agent is not a system of record, does not create new business definitions, bypass data permissions, execute consequential writes, promise deterministic answers outside scope, or access unapproved sources. This bundle cannot approve publication, merge, or deploy PROD.

## Required participants

Business/domain owner, governed data/semantic-model owner, security/privacy reviewer, Fabric platform owner, representative users, and operations/support owner.

## Exit

Exit with an approved question catalog, grounded source contract, reproducible evaluation results, tested refusal/security behavior, usage limitations, monitoring/runbook, and human publication/production decision.
