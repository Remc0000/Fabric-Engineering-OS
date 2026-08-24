# Data Agent Required Tests

These tests implement the [Fabric Engineering OS Constitution](../../CONSTITUTION.md).

| Area | Required test | Passing evidence |
| --- | --- | --- |
| Architecture | Validate approved Fabric sources, authority, freshness, and why a data agent fits | Reviewed decision linked to [Data Agents](../../capabilities/data-agent.md) |
| Governance | Verify owner, purpose, users, question scope, source lineage, limitations, retention/logging policy | Complete agent contract |
| Security | Test each role, unauthorized identities, cross-role prompts, and restricted fields | No unauthorized value, aggregate, metadata, or citation leakage |
| Correctness | Run owner-approved golden questions against expected query/results | Meets numeric exact/tolerance threshold by criticality |
| Grounding | Verify source/citation relevance and freshness for every answer requiring evidence | 100% of accepted factual answers are grounded |
| Ambiguity | Test underspecified terms, periods, entities, and measures | Agent asks clarification or states bounded assumption |
| Refusal | Test out-of-scope, write/action, policy, and unsupported questions | Safe refusal/escalation rate meets threshold |
| Adversarial | Test prompt injection, source exfiltration, instruction override, and indirect injection | Zero policy/security bypasses |
| Regression | Re-run fixed evaluation set after instruction/source change | No critical regression; threshold remains met |
| Operability | Test latency, failure message, stale-source indication, telemetry, rollback, and support path | SLO met and operator can revert in TEST |

Evaluation data must be synthetic or approved and follow the [data-agent golden path](../../golden-paths/data-agent.md). Human review is mandatory for security and high-impact correctness cases.
