# Guidance Freshness

This standard implements the [Fabric Engineering OS Constitution](../CONSTITUTION.md) requirement that Microsoft Learn remains authoritative for Microsoft product behavior.

## Purpose

Expose when product-specific guidance was last grounded, who owns its review, and when it should be reviewed again without implying automatic synchronization or product correctness.

## Canonical artifacts

- Human-readable guidance remains canonical in its Markdown document.
- [`metadata/guidance-freshness.json`](../metadata/guidance-freshness.json) records operational freshness metadata.
- [`metadata/guidance-freshness.schema.json`](../metadata/guidance-freshness.schema.json) is the versioned contract.
- [FDR-0001](../decision-records/0001-guidance-freshness-metadata.md) records the storage and enforcement decision.

## Required fields

Every freshness entry contains:

| Field | Meaning |
| --- | --- |
| `path` | Unique repository-relative path to the canonical Markdown document |
| `contentType` | Governed content family: capability, pattern, golden path, or reference architecture |
| `status` | Lifecycle state: `preview`, `stable`, or `deprecated` |
| `owner` | Human-maintained role or team accountable for revalidation |
| `lastValidated` | ISO date on which the cited product assumptions were reviewed |
| `reviewBy` | ISO date by which a new review should occur |
| `sources` | Current Microsoft Learn URLs used for product grounding |

## Lifecycle

1. Add or update an entry when product-specific guidance is reviewed.
2. Validate the cited Microsoft Learn content and relevant tenant, region, capacity, and licensing assumptions.
3. Set `lastValidated` to the actual human review date and choose a risk-appropriate `reviewBy` date.
4. Update the covered document and metadata in the same pull request when validation changes the guidance.
5. Assign overdue reviews to the named owner; do not infer that overdue guidance is automatically wrong.
6. Remove an entry only when the document is removed or no longer contains Microsoft product behavior requiring freshness tracking.

## Enforcement

The repository gate fails when the manifest is malformed, paths are duplicated or missing, values are unsupported, dates are invalid or reversed, or an entry lacks a Microsoft Learn source. A passed `reviewBy` date emits a review-due warning while the gate remains successful.

Freshness metadata is evidence of a prior review, not a substitute for current Microsoft Learn validation. It never authorizes autonomous content updates, upstream synchronization, architecture approval, merge, release, or production action.

## Consumer repositories

The manifest is additive. Existing Markdown remains valid without an entry while adoption is incremental. Consumers may keep the OS entries they inherit or add entries for their own governed guidance. To omit freshness metadata entirely, call `.github/scripts/validate-content.ps1` with `-SkipFreshnessValidation` in the quality workflow; the switch disables the associated required-artifact checks and validator invocation. Consumers must not reuse validation dates for content they materially changed without performing a new review.
