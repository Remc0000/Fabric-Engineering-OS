# Data Agent

This guide is governed by the [Fabric Engineering OS Constitution](../CONSTITUTION.md).

> **Scope/status:** Data agent availability, supported data sources, grounding behavior, permissions, and preview terms can be tenant-specific. Verify current Microsoft Learn guidance before design or release.

## Purpose

Select a Fabric data agent to provide governed natural-language exploration over explicitly curated and supported Fabric data sources.

## When To Use

- Users need conversational discovery and analysis rather than a fixed report journey.
- Curated data, business terminology, example questions, and owner-approved instructions can ground the agent.
- Answers can be evaluated against representative questions and reviewed for ambiguity.

## When NOT To Use

- The outcome requires deterministic API behavior, guaranteed wording, or unattended consequential actions.
- Source data, security, semantics, or ownership are not ready.
- A fixed [semantic model](semantic-model.md) and report better serve repeatable decisions.

## Pros

- Lowers the barrier to exploratory questions over governed Fabric data.
- Can expose curated data products through business language.
- Makes grounding instructions and evaluation part of the product design.

## Cons

- Natural-language answers are probabilistic and require evaluation and user guidance.
- Quality depends on source semantics, naming, examples, and supported grounding.
- It does not replace access control, data quality, semantic modeling, or human accountability.

## Alternatives

- [Semantic model](semantic-model.md) and Power BI reports for repeatable governed analysis.
- Direct SQL or KQL query experiences for expert, inspectable exploration.
- A purpose-built application when deterministic workflows and transactional controls are required.

## Decision Drivers

- User personas, question types, and acceptable ambiguity.
- Supported source and grounding behavior.
- Security, sensitivity, audit, and misuse risks.
- Evaluation set, feedback loop, and accountable owner.

## Related Patterns

- Select grounded AI, evaluation, human-accountability, semantic governance, and least-privilege guidance from the [patterns catalog](../patterns/README.md).

## Related Golden Paths

- [Data agent](../golden-paths/data-agent.md)
- [Semantic model](../golden-paths/semantic-model.md)
- [Data product](../golden-paths/data-product.md)
