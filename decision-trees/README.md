# Decision Trees

These reusable decision trees support bounded choices under the [Fabric Engineering OS Constitution](../CONSTITUTION.md).

## How to use

1. Start with a documented outcome, constraints, data classification, accountable human, and target environment.
2. Follow the relevant tree and record the path taken, rejected branches, assumptions, and evidence.
3. Validate the resulting candidate against current Microsoft Learn documentation and the target tenant, region, capacity, licensing, and feature lifecycle.
4. Use Fabric Accelerator for architecture and FMD Framework for implementation guidance.
5. Escalate when a branch lacks evidence or requires a consequential human decision.

A leaf is a candidate direction, not approval or a product promise.

## Tree catalog

| Decision tree | Use when deciding |
| --- | --- |
| [Workload and capability selection](workload-capability-selection.md) | Which Fabric workload should lead |
| [Ingestion](ingestion.md) | How data should enter Fabric |
| [Storage and serving](storage-serving.md) | Where data should be persisted and served |
| [Real-time](real-time.md) | Whether and how to use real-time capabilities |
| [Semantic layer](semantic-layer.md) | How governed analytical meaning is exposed |
| [AI and data agent](ai-data-agent.md) | Whether an AI or data-agent experience is appropriate |
| [Environment promotion](environment-promotion.md) | Whether an artifact can advance |
| [Incident routing](incident-routing.md) | Who must respond to an operational event |
| [Escalation](escalation.md) | When agent work must pause for a human |
