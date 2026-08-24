# Maintainer Guide

Maintenance is governed by the [Fabric Engineering OS Constitution](CONSTITUTION.md).

## Maintainer responsibilities

Maintainers preserve the operating boundaries, review quality, release integrity, and navigability of this repository. They own the final decision when a contribution changes architecture guidance, security posture, approval boundaries, or compatibility.

## Routine maintenance

- Triage issues and label them as idea, proposal, defect, governance, or release work.
- Confirm that new guidance uses Microsoft Fabric only and cites authoritative product sources.
- Require links between capabilities, patterns, golden paths, and reference architectures instead of repeating canonical text.
- Review automated dependency or workflow changes before allowing them to run with elevated permissions.
- Keep CODEOWNERS, branch protection, environments, and required checks current.
- Treat upstream references as read-only and review compatibility manually.

## Change classes

| Class | Examples | Required human review |
| --- | --- | --- |
| Editorial | Typo, broken link, clearer wording | Maintainer |
| Guidance | Capability, pattern, test, prompt | Maintainer plus domain reviewer |
| Architecture | Reference architecture or major golden-path decision | Architecture owner |
| Governance | Constitution, approval boundary, security standard | Repository owner |
| Release | Version, compatibility, release notes | Release owner |

## Release operation

Use the [Release Strategy](community/RELEASE-STRATEGY.md). A maintainer confirms quality gates, resolves review conversations, verifies preview limitations, and creates the release only after human approval. Agents may prepare release artifacts but cannot approve, merge, tag, or publish a release autonomously.

## Incident response

If repository guidance creates unsafe or incorrect behavior, label the issue `governance` and `priority:critical`, document affected content, and pause dependent releases. Corrective work still follows pull request and approval requirements.
