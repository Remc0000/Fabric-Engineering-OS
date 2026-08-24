# Release Strategy

Releases are governed by the [Fabric Engineering OS Constitution](../CONSTITUTION.md).

## Versioning

Fabric Engineering OS uses semantic versioning for tagged repository releases:

- **Major:** incompatible governance, contract, navigation, or extension changes.
- **Minor:** backward-compatible capabilities, templates, patterns, or substantial guidance.
- **Patch:** backward-compatible corrections, clarifications, and maintenance.
- **Preview:** content requiring broader validation before a stable baseline.

## Release inputs

- An accepted [Roadmap](ROADMAP.md) outcome or approved corrective issue.
- Human-approved pull requests with required checks.
- Microsoft Learn grounding for current product claims.
- Compatibility, migration, security, operational, and rollback notes as applicable.
- A release note that identifies changed documents, known limitations, and validation status.

## Release process

1. A human release owner selects the candidate scope and immutable revision.
2. Maintainers verify issue/PR traceability, checks, documentation, and known limitations.
3. Applicable DEV and TEST validation is run through approved, auditable workflows.
4. A human release owner accepts residual risk and authorizes version/tag creation.
5. A human creates or approves the tag and publishes the GitHub release.
6. Any downstream production adoption is separately approved and performed by the adopting humans.

Agents may prepare evidence and draft release material. They never approve, merge, tag, publish a release, or deploy to production autonomously.

## Support and compatibility

Preview releases may change before v1.0 and must state their validation limits. Deprecations require a replacement or rationale, migration guidance, and an announced removal window. Security or correctness fixes may be expedited, but human approval and release ownership remain mandatory.

Ideas in the [Ideas Backlog](IDEAS-BACKLOG.md) do not enter a release until accepted into governed scope. See [Maintainers](MAINTAINERS.md) for decision roles.

