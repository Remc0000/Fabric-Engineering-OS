# Release Management Anti-Patterns

Avoid these violations of the [Fabric Engineering OS Constitution](../../CONSTITUTION.md):

- **Moving candidate:** changing commits, artifacts, dependencies, or parameters after TEST while retaining prior evidence.
- **PR equals release:** assuming code review proves deployability, data correctness, environment configuration, and operations readiness.
- **Latest wins:** deploying a branch head or workspace state instead of an immutable reviewed candidate.
- **Manual mystery configuration:** changing TEST/PROD values outside reviewed parameterization and evidence.
- **Green-by-omission:** skipping unavailable or failed checks and presenting the remaining gates as success.
- **Breaking change by release note:** documenting incompatibility without versioning, migration, consumer coordination, and approval.
- **Rollback fiction:** naming “redeploy previous version” without testing artifact availability, data compatibility, duration, and permissions.
- **DEV-to-PROD jump:** skipping TEST because a change looks small or urgent.
- **Approval collection after action:** treating retrospective sign-off as authorization.
- **Shared production identity:** obscuring who approved and who executed production work.
- **Agent as release authority:** letting automation approve, merge, tag/publish, deploy PROD, or weaken protections.
- **OS/upstream drift:** automatically modifying Fabric Engineering OS or referenced upstream repositories as part of a product release.
