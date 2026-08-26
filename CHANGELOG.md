# Changelog

All notable changes to Fabric Engineering OS are recorded here. This changelog is governed by the [Fabric Engineering OS Constitution](CONSTITUTION.md).

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/), and this project aims to follow [Semantic Versioning](https://semver.org/spec/v2.0.0.html). Releases and tags are created only through a human-approved process; see the [Release Strategy](community/RELEASE-STRATEGY.md).

## [Unreleased]

### Added

- A versioned machine-readable OS discovery catalog with stable IDs, canonical entry points, validated relationships, freshness references, consumer extension namespaces, and regression tests.
- A governed, non-destructive project bootstrap helper with deterministic planning, conflict-safe apply, exact generated-file rollback, and regression tests.
- Versioned guidance-freshness metadata, an FDR and standard, representative coverage, and quality-gate validation with non-blocking review-due warnings.
- A dedicated OS-canon proposal issue form for governance, agents, capabilities, patterns, golden paths, standards, workflows, wiki changes, and upstream contributions.
- Capability guides for Activator, Dataflows Gen2, and Variable Libraries.
- `metadata-driven-elt` agent bundle aligned to its golden path and reference architecture.
- Fabric Decision Record (FDR) system under `decision-records/` with a reusable template.
- `SECURITY.md` vulnerability-reporting and data-handling policy.
- `TEMPLATE-USAGE.md` describing canonical-versus-consumer content and required settings.
- Assurance role boundary matrix in `agents/README.md`.
- `.github/CONTRIBUTING.md` pointer so GitHub surfaces contribution guidance.
- `Data Engineering Lifecycle` wiki page mapping the Microsoft data engineering playbook onto the governed, Fabric-only lifecycle.

### Changed

- Completed capability-selection routes for Activator, Dataflows Gen2, and Variable Libraries, and documented why Spark/Environment and OneLake shortcuts remain folded into existing capability guides.
- Bound the reference-source labels to concrete upstream repositories in a Source-Grounding registry: the Fabric-only unified data foundation accelerator (Option 1), Skills for Fabric, FMD Framework, the Microsoft data engineering playbook, and Project Osmos as an agentic-execution reference; corrected stale `microsoft/fabric-accelerator` links.
- Wove concrete, governed source references into the data-product, metadata-driven-elt, data-agent, source-onboarding, and semantic-model golden paths and into the source-onboarding, new-data-product, and metadata-driven-elt bundle prompts.
- Constitution, Governance, `AGENTS.md`, and Copilot instructions now protect the wiki as a surface and require a proposal issue before OS-canon or upstream changes.
- DEV and TEST deployment workflows refuse to run outside the protected default branch.
- The content-validation gate exempts consumer documentation directories from the Constitution-reference requirement.
- Relocated the repository inventory to `community/repository-inventory.md` as a maintainer artifact.

## [0.9.0-preview] - 2026-08-24

### Added

- Initial Fabric Engineering OS: eleven agent roles, eight agent bundles, fourteen capability guides, nine golden paths, twelve patterns, five reference architectures, bootstrap guides, standards, decision trees, community docs, and source-controlled wiki.
- GitHub issue and pull request templates, Copilot instructions, quality gates, fail-closed DEV/TEST deployment adapters, and a human-controlled PROD approval gate.
