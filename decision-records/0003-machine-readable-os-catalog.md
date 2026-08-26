# FDR-0003: Machine-Readable OS Catalog

This decision is governed by the root [Fabric Engineering OS Constitution](../CONSTITUTION.md).

## Status

Proposed for human approval in the pull request that implements issue #24.

## Context

Fabric Engineering OS exposes capabilities, patterns, golden paths, reference architectures, and agent bundles through human-readable Markdown indexes. Tools currently have to scrape prose to discover stable identities, lifecycle state, canonical entry points, and relationships. Guidance freshness already has a separate path-keyed contract that future catalogs must reference rather than duplicate.

## Decision Drivers

- Keep Markdown as the canonical source of instructions and product claims.
- Give consumers one deterministic discovery contract across the five catalog types.
- Keep stable identity independent from display titles and file moves.
- Validate local targets and relationships without adding package dependencies.
- Preserve the separate ownership and lifecycle of guidance freshness metadata.
- Permit namespaced consumer extensions without changing OS-owned IDs.

## Options Considered

1. **Generate metadata from Markdown:** reduces manual entry, but requires Markdown conventions to become a hidden schema and makes relationships difficult to review.
2. **One manifest per catalog:** mirrors the directory layout, but duplicates schema headers and makes cross-catalog relationship validation more complex.
3. **One maintained unified manifest:** provides one schema version and relationship graph while keeping canonical guidance in its existing Markdown files.

## Decision

Maintain `metadata/os-catalog.json` by hand under the published `metadata/os-catalog.schema.json` contract. Each entry has a stable namespaced ID, type, title, lifecycle status, canonical Markdown path, dependency IDs, related IDs, and an optional freshness reference.

The optional `freshnessRef` is the canonical Markdown path used by `metadata/guidance-freshness.json`; catalog entries never copy owners, review dates, status, or Microsoft Learn sources from the freshness contract. Agent bundles use their charter as the canonical entry point.

The validator requires every canonical artifact in the five catalog surfaces to be indexed exactly once. It rejects duplicate IDs or paths, unknown types, broken or escaping targets, malformed arrays, unresolved or self-referential relationships, dependency/related overlap, and freshness references that do not resolve to the same canonical path.

Consumers may add data only below an `extensions` object using a reverse-domain namespace they own. Extensions must not replace or reinterpret OS fields or IDs.

## Consequences

- Tools gain a predictable cross-catalog discovery graph without scraping Markdown.
- Maintainers must update the manifest when adding, removing, or moving catalog artifacts.
- Relationships are explicit and reviewable, but remain discovery metadata rather than product instructions.
- Removing the additive catalog files rolls back the feature without changing canonical Markdown.
- Schema changes require a proposal, compatibility assessment, validator updates, and human-approved pull request.

## Validation

- Validate the complete canonical manifest in the repository quality gate.
- Exercise duplicate ID, unknown type, broken target, invalid relationship, scalar-array, and invalid freshness-reference failures.
- Confirm every canonical artifact in the five governed catalog surfaces is indexed.

## Human Approver

The proposal scope was approved by maintainer `@Remc0000` in issue #24 on 2026-08-25. This storage and ownership decision remains proposed until a human approves and merges the implementation pull request.
