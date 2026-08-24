# Data Agent Golden Path

This guide is governed by the root [Fabric Engineering OS Constitution](../CONSTITUTION.md).

## Outcome

A bounded Fabric data agent answers an approved question set from governed sources, preserves source authorization, and has measurable refusal, accuracy, and support behavior.

## Prerequisites

- Named business, data, security, and service owners and a narrow user outcome.
- Approved semantic model, Warehouse, Lakehouse, or KQL source with current contracts.
- User personas, sensitive-data classification, representative questions, and deterministic expected answers.
- Current [Microsoft Learn data agent documentation](https://learn.microsoft.com/fabric/data-science/concept-data-agent).

## Decision points

- Prefer reports or deterministic query experiences when natural language adds no material value.
- Ground in the smallest source/field set that answers the approved scope.
- Prefer a governed semantic model for shared business metrics.
- Define ambiguity clarification, unsupported-question refusal, citation/trace, and feedback behavior before build.

## Phased steps

1. **Frame:** define audience, jobs, in/out-of-scope questions, risk, success metrics, owner, and disable criteria.
2. **Design:** select approved sources, descriptions, synonyms, instructions, security inheritance, trace retention, and evaluation set; obtain human architecture/data approval.
3. **Build in DEV:** configure the agent and curated sources; version instructions and test prompts; avoid secrets and sensitive examples.
4. **Evaluate in TEST:** compare answers to deterministic queries; test ambiguity, refusal, adversarial prompts, unauthorized access, latency, source change, and failure handling.
5. **Release:** publish scope, limitations, feedback/support route, evaluation scorecard, source/instruction versions, and disable/rollback runbook.

## Required evidence and tests

- Source approval and question-to-source mapping.
- Versioned evaluation set with expected answer, tolerance, and owner.
- Accuracy/reconciliation, ambiguity, refusal, adversarial, unauthorized-access, and regression results.
- Prompt/trace classification, retention decision, monitoring, and TEST disable/rollback proof.

## Approval gates

Human business/data and architecture owners approve use case and grounding; security/privacy owners approve exposed data and traces. Agents may deploy/evaluate DEV/TEST. Humans approve PR, merge, production audience, and PROD.

## Rollback and exit strategy

Disable user access, restore the last accepted instructions/source set, and preserve evaluation evidence. Exit when source quality, authorization, or answer accuracy drops below the accepted threshold and cannot be restored within the support objective.

## Related guidance

[Data agent capability](../capabilities/data-agent.md) · [Data agent architecture](../reference-architectures/data-agent.md) · [Grounded agent pattern](../patterns/grounded-data-agent.md) · [Governed semantic layer](../patterns/governed-semantic-layer.md)
