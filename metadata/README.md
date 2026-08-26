# Repository Metadata

This metadata is governed by the [Fabric Engineering OS Constitution](../CONSTITUTION.md).

The directory contains versioned, machine-readable operational metadata for the OS. Human-readable Markdown remains canonical; metadata must link to it and must not duplicate product instructions or imply automatic synchronization.

## Current contracts

| Contract | Manifest | Standard |
| --- | --- | --- |
| Guidance freshness | [`guidance-freshness.json`](guidance-freshness.json) | [Guidance Freshness](../standards/guidance-freshness.md) |
| OS discovery catalog | [`os-catalog.json`](os-catalog.json) | [Machine-Readable Catalog](../standards/machine-readable-catalog.md) |

The discovery catalog indexes capabilities, patterns, golden paths, reference architectures, and agent-bundle charters with stable IDs and validated relationships. It references freshness records by canonical path and never duplicates freshness fields.

Schema changes require a proposal issue, compatibility assessment, validation updates, and human-approved pull request.
