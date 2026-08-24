# Data Agent Anti-Patterns

Avoid these violations of the [Fabric Engineering OS Constitution](../../CONSTITUTION.md):

- **Chatbot before contract:** building an agent without named users, approved questions, sources, owner, and success thresholds.
- **Raw-data grounding:** pointing the agent at broad source-shaped tables instead of curated contracts or a [semantic model](../../capabilities/semantic-model.md).
- **Prompt-defined metrics:** encoding disputed business meaning only in instructions rather than governed data/measure definitions.
- **More sources means better:** adding artifacts that introduce conflicting authority, leakage, latency, and ambiguity.
- **Demo-question evaluation:** testing only prompts written by the builder and accepting plausible prose as correctness.
- **Citation theater:** showing a source name that does not support the returned number or definition.
- **Permission optimism:** assuming workspace/source security automatically covers every user and output path without negative tests.
- **Always answer:** guessing when entity, measure, time period, freshness, or scope is ambiguous.
- **Write-capable assistant:** allowing a data-answering agent to perform consequential actions.
- **Sensitive logs as evidence:** storing prompts, answers, identities, or data values in Git or unrestricted telemetry.
- **Autonomous publication:** allowing the engineering agent to approve, merge, publish, or deploy production.
