# FDR-0001: Guidance Freshness Metadata

This decision is governed by the root [Fabric Engineering OS Constitution](../CONSTITUTION.md).

## Status

Proposed for human approval in the pull request that implements issue #23.

## Context

Fabric Engineering OS grounds Microsoft product behavior in Microsoft Learn, but product-specific documents do not expose consistent validation dates, review ownership, or review-due signals. Adding front matter to every Markdown document would mix operational metadata with guidance and require a YAML parser that is not currently part of the repository toolchain.

## Decision Drivers

- Keep Markdown readable and canonical.
- Avoid new runtime or package dependencies.
- Make metadata deterministic, machine-readable, versioned, and centrally validated.
- Distinguish review-due content from content proven incorrect.
- Allow machine-readable catalogs to reference the same freshness records later without duplicating fields.

## Options Considered

1. **YAML front matter in each document:** colocated and familiar, but changes every document contract and needs a reliable YAML parser.
2. **HTML comment blocks in each document:** dependency-free, but require custom parsing and are easy to damage invisibly.
3. **Versioned JSON sidecar manifest:** keeps Markdown unchanged, uses built-in PowerShell JSON support, and creates one reviewable freshness index.

## Decision

Use `metadata/guidance-freshness.json` as the versioned sidecar manifest and `metadata/guidance-freshness.schema.json` as its published contract. Each entry identifies one canonical document, content type, lifecycle status, owner, last validation date, next review date, and one or more Microsoft Learn sources.

The validation gate fails on malformed metadata, duplicate paths, unsupported values, missing targets, invalid date ordering, or absent Microsoft Learn sources. A passed `reviewBy` date emits a warning and does not claim that the guidance is incorrect. Markdown remains the canonical guidance; the manifest never replaces validation against current Microsoft Learn documentation.

## Consequences

- Maintainers gain a queryable review queue without changing all Markdown files.
- Freshness metadata can drift from content, so reviewed changes to covered documents must update the corresponding entry.
- The initial pilot covers four content types; expansion is incremental.
- Future catalog manifests may reference freshness entries by canonical path but must not duplicate freshness fields.

## Validation

- Validate the canonical manifest in the repository quality gate.
- Exercise an invalid fixture that must fail.
- Exercise an overdue fixture that must pass with an explicit warning.
- Pilot one capability, pattern, golden path, and reference architecture.

## Human Approver

The proposal scope was approved by maintainer `@Remc0000` in issue #23 on 2026-08-25. The storage and enforcement decision remains proposed until a human approves and merges the implementation pull request.
