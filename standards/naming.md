# Naming Standard

This standard implements the [Fabric Engineering OS Constitution](../CONSTITUTION.md) through consistent, searchable names.

## General rules

- Use names that communicate purpose, domain, and lifecycle without embedding secrets, customer data, or mutable personal ownership.
- Use kebab-case for Markdown filenames, directories, branches, and reusable repository identifiers unless a platform requires another format.
- Keep conventional index files as `README.md`.
- Use stable business and technical terms from the repository glossary or owning domain.
- Use approved abbreviations only; avoid unexplained acronyms, dates as version substitutes, and labels such as `new`, `final`, or `temp`.

## Suggested patterns

| Artifact | Pattern | Example |
| --- | --- | --- |
| Branch | `<type>/<issue>-<short-purpose>` | `feature/142-order-quality` |
| Decision record | `<sequence>-<decision>` | `004-lakehouse-serving.md` |
| Fabric workspace | `<domain>-<purpose>-<environment>` | `sales-analytics-test` |
| Deployable item | `<domain>-<capability>-<qualifier>` | `sales-orders-ingestion` |
| Environment variable | `<SYSTEM>_<PURPOSE>` | `FABRIC_WORKSPACE_ID` |

## Environment names

Use the canonical uppercase labels `DEV`, `TEST`, and `PROD` in prose and governance records. In platform identifiers, use lowercase suffixes when required by the naming pattern.

## Renaming

Treat externally referenced names as interfaces. Before renaming, identify dependencies, migration steps, compatibility period, rollback, and the accountable human approver.
