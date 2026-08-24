# Documentation Standard

This standard implements the [Fabric Engineering OS Constitution](../CONSTITUTION.md) for durable engineering knowledge.

## Required qualities

- **Purposeful:** state the audience, task, and boundary near the start.
- **Grounded:** link product claims to authoritative evidence and date time-sensitive validation.
- **Operational:** include prerequisites, inputs, expected outcomes, failure handling, and ownership where action is required.
- **Traceable:** link decisions, issues, pull requests, implementations, and superseding guidance.
- **Scoped:** identify environment, tenant assumptions, region, capacity, licensing, and preview status when relevant.
- **Maintainable:** use focused files, stable relative links, and one canonical location per rule.

## Structure

Use descriptive headings, short paragraphs, tables for comparisons, and numbered steps for sequences. Code and commands must be reproducible, avoid secrets, and declare placeholders. Mermaid diagrams must have meaningful node labels and a text explanation when the decision is consequential.

## Lifecycle

Every operational document identifies an owner or owning team and a review trigger. Superseded content links to its replacement; do not erase decision history. Broken links and unsupported claims are defects.

## Prohibited practices

Do not copy large upstream documents, present generated text as verified fact, or duplicate shared governance across role files. Upstream references remain read-only and are never synchronized or changed automatically.
