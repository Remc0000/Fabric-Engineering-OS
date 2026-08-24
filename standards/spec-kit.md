# Spec Kit Delivery

This standard operationalizes the [Fabric Engineering OS Constitution](../CONSTITUTION.md) for specification-driven delivery with [GitHub Spec Kit](https://github.com/github/spec-kit).

## Applicability

Every new GitHub project created through Fabric Engineering OS must initialize Spec Kit's native GitHub Copilot skills integration. Existing projects adopt this standard only through an approved migration issue.

Spec Kit is a workflow dependency, not a source of Microsoft Fabric product truth. Microsoft Learn remains authoritative for Fabric behavior, and the Spec Kit upstream repository remains read-only.

## Initialization

Before specification work begins:

1. Record the initial Spec Kit release tag and installation command in the project bootstrap issue.
2. Install that release rather than an unpinned branch:

   ```text
   uv tool install specify-cli --from git+https://github.com/github/spec-kit.git@<approved-release-tag>
   ```

3. Initialize the non-empty project repository with the native GitHub Copilot skills layout:

   ```text
   specify init --here --force --non-interactive --integration copilot --integration-options="--skills"
   ```

4. Verify that Spec Kit skills exist under `.github/skills/speckit-*/SKILL.md`. Ontdekker and the other roles must invoke these native skills rather than duplicate, translate, or vendor their prompts.
5. Review all generated changes before committing them. Record the actual paths for the generated constitution, specification, plan, and task artifacts in the bootstrap issue because paths may differ between releases.

Initialization does not authorize planning, implementation, deployment, or modification of the Spec Kit upstream repository.

## Required workflow

| Phase | Owner | Spec Kit capability | Required entry evidence | Required exit evidence |
| --- | --- | --- | --- | --- |
| Principles | Ontdekker and Regisseur | `/speckit-constitution` | Named human specification owner | Project principles compatible with this Constitution |
| Specification | Ontdekker | `/speckit-specify`, `/speckit-clarify`, `/speckit-checklist` | Approved intake and source evidence | Proposed specification and requirements checklist |
| Specification decision | Named human specification owner | Human review in GitHub | Permalink to the exact specification revision | Approval or revision assignment |
| Technical plan | Architect | `/speckit-plan` | Approval of the exact specification revision | Proposed plan and architecture decision evidence |
| Architecture decision | Named human architecture owner | Human review in GitHub | Exact specification and plan revisions | Architecture approval or revision assignment |
| Work breakdown | Regisseur | `/speckit-tasks`, `/speckit-analyze`, `/speckit-taskstoissues` | Current specification and architecture approvals | Traceable tasks or issues |
| Implementation | Maker | `/speckit-implement`, `/speckit-converge` | Authorized issues and current approval evidence | Implementation and convergence evidence |
| Verification | Inspecteur | Verification against Spec Kit artifacts | Exact implemented revision | Reproducible findings and readiness recommendation |

## Specification approval gate

Ontdekker must stop after proposing or revising the specification. The named human specification owner must respond in GitHub with one of these decisions:

- **Approved for planning:** identifies a permalink containing the commit SHA and specification path. Only this decision opens the `/speckit-plan` gate.
- **Revision assigned:** describes required adjustments and returns ownership to Ontdekker. It is not approval, even if all requested changes appear straightforward.

Any change to specification content after approval makes that approval stale. Ontdekker must publish a new immutable revision and request approval again. A branch name, mutable URL, reaction, silence, task assignment, or approval of an earlier revision is insufficient evidence.

Specification approval confirms what and why to build. It does not approve architecture, implementation, a pull request, merge, environment access, or production action.

## Automatic updates

The monthly `.github/workflows/spec-kit-update.yml` workflow may automatically resolve the latest stable Spec Kit release, generate an update without repository write credentials, and pass only an allowlisted patch to a separate publishing job. It must use the manifest-aware `specify integration upgrade copilot --integration-options="--skills"` and `specify extension update` commands, validate the native skill layout, and open a pull request.

Automatic updates may change only `.github/skills/speckit-*`, the Spec Kit hook manifest, `.specify/integration.json`, `.specify/init-options.json`, `.specify/extensions.yml`, integration manifests, shared scripts and templates, and installed extension assets. Both jobs must reject every other path. Updates must not change specifications, plans, tasks, `.specify/memory/constitution.md`, source code, the default branch, or approval records. Every update requires normal automated checks, human review, and human merge; the workflow may never merge its own pull request.

## Enforcement

Regisseur must record the specification path, commit SHA, human owner, decision link, and decision state in the handoff ledger. Architect, Maker, and Inspecteur must reject missing, ambiguous, or stale evidence rather than infer approval.

If the native Copilot skills are missing or Spec Kit cannot be initialized or invoked, stop before planning. A human may approve a documented exception with scope, rationale, risk, compensating controls, owner, expiry, and migration path; inconvenience alone is not an exception.
