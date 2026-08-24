# Mirroring to Gold Anti-Patterns

Avoid these violations of the [Fabric Engineering OS Constitution](../../CONSTITUTION.md):

- **Enable first, assess later:** starting Mirroring before validating support, source approval, load, region, keys, and semantics.
- **Replica equals backup:** relying on the mirror for independent recovery without a reviewed backup/restore design.
- **Replica equals gold:** exposing source-shaped tables directly as stable business contracts.
- **Mirror everything:** expanding object scope without purpose, classification, capacity, and consumer justification.
- **Delete blindness:** validating inserts but not hard deletes, soft deletes, key changes, and retention interactions.
- **Source-impact denial:** measuring Fabric latency while ignoring operational database resource and workload effects.
- **Silent drift:** accepting count or checksum differences as eventual consistency without a bounded SLO and investigation rule.
- **Raw-data democratization:** giving consumers broad mirror access instead of least-privilege gold interfaces.
- **Unplanned reseed:** initiating reset/reseed without blast-radius analysis, source owner, consumer notice, and human approval.
- **Schema optimism:** assuming every source DDL change propagates safely.
- **Autonomous production enablement:** allowing an agent to merge or enable production Mirroring.
