# Repository Inventory

This inventory is governed by the [Fabric Engineering OS Constitution](CONSTITUTION.md).

File counts represent files stored **directly** in each folder. Parent-folder totals are not duplicated.

## Folders

| Path | Purpose | Files |
| --- | --- | ---: |
| `.github/` | GitHub Copilot instructions, pull request templates, automation, and repository configuration. | 2 |
| `.github/deployment/` | Fail-closed DEV and TEST deployment adapters and their implementation contract. | 3 |
| `.github/ISSUE_TEMPLATE/` | Structured templates for architecture changes, features, and production-incident learnings. | 4 |
| `.github/release-notes/` | Versioned release notes for Fabric Engineering OS releases. | 1 |
| `.github/scripts/` | Repository validation and quality-control scripts. | 1 |
| `.github/workflows/` | GitHub Actions for quality gates, DEV/TEST deployment, and PROD approval. | 4 |
| `agent-bundles/` | Index of scenario-specific agent teams, prompts, decisions, tests, and success criteria. | 1 |
| `agent-bundles/data-agent/` | Agent bundle for designing and delivering governed Fabric Data Agents. | 6 |
| `agent-bundles/eventhouse-rti/` | Agent bundle for Eventhouse and Real-Time Intelligence solutions. | 6 |
| `agent-bundles/mirroring-to-gold/` | Agent bundle for mirroring source data and producing governed Gold outputs. | 6 |
| `agent-bundles/new-data-product/` | Agent bundle for creating contract-first Fabric data products. | 6 |
| `agent-bundles/production-incident/` | Agent bundle for safe, auditable, human-controlled incident response. | 6 |
| `agent-bundles/release-management/` | Agent bundle for governed release preparation and environment promotion. | 6 |
| `agent-bundles/semantic-model/` | Agent bundle for governed Power BI semantic model delivery on Fabric. | 6 |
| `agent-bundles/source-onboarding/` | Agent bundle for assessing, connecting, and onboarding new data sources. | 6 |
| `agents/` | Definitions for the eleven bounded engineering agent roles. | 12 |
| `bootstrap/` | Immediately usable startup guides for projects, features, data products, Data Agents, RTI, and mirroring. | 7 |
| `capabilities/` | Decision-oriented catalog of supported Microsoft Fabric capabilities. | 15 |
| `community/` | Contribution, maintenance, release, roadmap, and ideas-management guidance. | 6 |
| `decision-trees/` | Operational decision trees for selecting capabilities and routing engineering work. | 10 |
| `golden-paths/` | Repeatable, evidence-driven delivery paths for common Fabric scenarios. | 10 |
| `patterns/` | Reusable architecture, governance, security, orchestration, and operations patterns. | 13 |
| `reference-architectures/` | Opinionated Fabric architecture baselines with diagrams, trade-offs, and validation checklists. | 6 |
| `standards/` | Repository-wide engineering, security, testing, documentation, and delivery standards. | 9 |
| `wiki/` | Source-controlled adopter documentation, onboarding, glossary, and FAQs. | 5 |

## Folder Totals

| Parent path | Direct files | Files including subfolders |
| --- | ---: | ---: |
| `.github/` | 2 | 15 |
| `agent-bundles/` | 1 | 49 |
| All repository folders | 157 | - |

The repository also contains **12 root files**, producing **169 tracked files** in total.

## Root Files

| Filename | Purpose |
| --- | --- |
| `.gitignore` | Excludes dependencies, build output, environment files, secrets, logs, and local tooling state. |
| `AGENTS.md` | Defines repository-wide operating instructions and boundaries for AI agents. |
| `CODEOWNERS` | Assigns human ownership for repository content and sensitive governance areas. |
| `CONSTITUTION.md` | Establishes the strategic principles, source hierarchy, permissions, and human approval boundaries. |
| `currentstate.md` | Records the current repository folder and root-file inventory. |
| `DISCLAIMER.md` | Describes preview limitations, validation responsibilities, and the risks of relying on AI-generated guidance. |
| `GOVERNANCE.md` | Defines decision rights, change processes, exception handling, and OS evolution controls. |
| `LICENSE.md` | Provides the MIT License governing use and distribution of the repository. |
| `README-FOR-GITHUB-COPILOT.md` | Gives GitHub Copilot its runtime contract, source precedence, required workflow, and mandatory stop conditions. |
| `README-FOR-MAINTAINER.md` | Explains maintainer responsibilities, change classes, releases, and repository incident handling. |
| `README.md` | Introduces Fabric Engineering OS, its operating model, boundaries, navigation, and current status. |
| `ROADMAP.md` | Describes the planned progression from `v0.9.0-preview` to a stable governed baseline. |
