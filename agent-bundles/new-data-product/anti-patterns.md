# New Data Product Anti-Patterns

Avoid these violations of the [Fabric Engineering OS Constitution](../../CONSTITUTION.md):

- **Dataset without a product:** no named owner, consumer, decision, contract, SLO, or retirement path.
- **Technology-led boundaries:** selecting [Lakehouse](../../capabilities/lakehouse.md) or [Warehouse](../../capabilities/warehouse.md) before grain and consumption are known.
- **Medallion theater:** renaming the same unvalidated data bronze/silver/gold without increasing trust or contract stability.
- **Two gold authorities:** maintaining competing canonical tables for identical semantics.
- **Business logic in every consumer:** publishing raw fields while reports and agents independently recreate definitions.
- **Mutable contract:** silently renaming, removing, or changing meaning of published fields.
- **Unbounded history:** retaining every version without legal, analytical, performance, and cost justification.
- **Quality averages:** allowing critical key or financial errors because an aggregate score is high.
- **Notebook-only operations:** transformations depend on manual state with no parameterization, tests, deployment, or runbook.
- **Ownerless alerts:** SLO telemetry exists but no accountable response path.
- **Agent release authority:** allowing an agent to approve architecture, merge, or deploy production.
