# Pipeline

This guide is governed by the [Fabric Engineering OS Constitution](../CONSTITUTION.md).

> **Scope/status:** Connector behavior, integration runtime requirements, activity support, limits, and authentication options are source- and tenant-specific; validate them in Microsoft Learn.

## Purpose

Select a Fabric Data Factory pipeline to orchestrate data movement and dependent activities across a visible, parameterized workflow.

## When To Use

- Copy, scheduling, dependencies, retries, parameters, and activity coordination are central.
- Multiple Fabric items or supported external endpoints must run in a controlled sequence.
- Operators need run history and an explicit orchestration boundary.

## When NOT To Use

- Complex transformation logic belongs in a [Notebook](notebook.md), [Warehouse](warehouse.md), or other compute capability.
- Continuous event routing is required; evaluate [Eventstream](eventstream.md).
- The need is lifecycle promotion or source control; use [Deployment pipeline](deployment-pipeline.md) or [Git integration](git-integration.md).

## Pros

- Makes dependencies, parameters, and operational runs visible.
- Supports reusable orchestration around specialized compute artifacts.
- Fits scheduled source onboarding and metadata-driven processing.

## Cons

- Overly complex pipelines become difficult to test, review, and recover.
- Connector-specific behavior can affect reliability and portability.
- Orchestration does not remove the need for idempotency, reconciliation, or workload observability.

## Alternatives

- [Notebook](notebook.md) for code-first transformation.
- [Eventstream](eventstream.md) for continuous supported event flows.
- [Mirroring](mirroring.md) for lower-ownership replication from a supported source.

## Decision Drivers

- Batch frequency, dependency graph, and recovery objectives.
- Connector, network, identity, and source support.
- Parameterization, idempotency, and metadata requirements.
- Monitoring, ownership, and capacity behavior.

## Related Patterns

- Select metadata-driven orchestration, idempotency, retry, reconciliation, and observability guidance from the [patterns catalog](../patterns/README.md).

## Related Golden Paths

- [Metadata-driven ELT](../golden-paths/metadata-driven-elt.md)
- [Source onboarding](../golden-paths/source-onboarding.md)
- [Production incident](../golden-paths/production-incident.md)
