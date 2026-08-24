# Metadata-Driven ELT Anti-Patterns

Avoid these violations of the [Fabric Engineering OS Constitution](../../CONSTITUTION.md):

- **Metadata as code execution:** storing SQL fragments, notebook code, secrets, or unrestricted expressions in control tables.
- **One orchestrator for every exception:** forcing materially unique sources into generic metadata instead of using a bounded adapter or dedicated path.
- **Unreviewed control-plane changes:** changing metadata schema, compatibility, or source behavior without issue/PR review and owner approval.
- **Watermark optimism:** advancing checkpoints before durable bronze landing, quality checks, and publication are complete.
- **Replay creates duplicates:** retry, duplicate triggers, or backfills produce extra rows or inconsistent aggregates.
- **Medallion theater:** copying data through bronze/silver/gold names without validation, conformance, or clearer trust boundaries.
- **Shared identity blast radius:** using one overprivileged connection for all sources instead of least-privilege source isolation.
- **Silent schema drift:** accepting new, missing, or changed columns without validation, quarantine, and owner notification.
- **Opaque failures:** pipeline and notebook runs lack source ID, metadata version, run ID, checkpoint, lineage, or accountable alert routing.
- **Notebook-only operations:** transformations depend on manual parameters with no orchestration, validation, tests, or runbook.
- **Architecture by upstream copy:** modifying or synchronizing FMD Framework, ELT Framework, Fabric Accelerator, or other upstream repositories instead of treating them as read-only references.
- **Agent release authority:** allowing an agent to approve architecture, merge, self-approve, deploy PROD, modify the OS automatically, or modify upstream repositories.
