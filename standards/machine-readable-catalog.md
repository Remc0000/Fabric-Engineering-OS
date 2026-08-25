# Machine-Readable Catalog Standard

This standard is governed by the root [Fabric Engineering OS Constitution](../CONSTITUTION.md).

## Purpose

`metadata/os-catalog.json` is the discovery index for OS capabilities, patterns, golden paths, reference architectures, and agent bundles. It helps tools navigate existing guidance; it is not product documentation, an implementation specification, or authority to act.

## Canonical ownership

- Markdown remains canonical for instructions, decisions, constraints, and Microsoft product claims.
- The catalog is maintained and reviewed with the Markdown it indexes. It is not generated from headings and is not synchronized with Microsoft Learn or upstream repositories.
- Stable IDs identify OS concepts and must not change when a title or path changes. Removing or replacing an ID is a schema compatibility decision.
- Agent bundles point to their `charter.md` entry point. Supporting bundle files remain discoverable through the charter and are not separate catalog entries.

## Entry contract

Every entry contains:

- `id`: stable type-prefixed identity, such as `capability:lakehouse`.
- `type`: `capability`, `pattern`, `golden-path`, `reference-architecture`, or `agent-bundle`.
- `title`: human-readable discovery label.
- `status`: `preview`, `stable`, or `deprecated`.
- `path`: repository-relative canonical Markdown entry point.
- `dependencies`: stable IDs that must be considered before applying the entry.
- `related`: useful neighboring entries that are not dependencies.

An entry may include `freshnessRef` only when its canonical path exists in `metadata/guidance-freshness.json`. Freshness owner, dates, status, and sources remain exclusively in that manifest.

## Relationship rules

- Every dependency and related ID must resolve within the same catalog version.
- Entries must not refer to themselves.
- The same ID must not appear in both `dependencies` and `related`.
- Relationships aid navigation and do not imply automatic execution, approval, deployment, or product compatibility.

## Consumer discovery

PowerShell example:

```powershell
$catalog = Get-Content .\metadata\os-catalog.json -Raw | ConvertFrom-Json
$catalog.entries |
    Where-Object type -eq "golden-path" |
    Select-Object id, title, path, dependencies
```

Consumers may ignore the manifest. A consumer that enriches entries may add an `extensions` object with a reverse-domain namespace it controls:

```json
{
  "extensions": {
    "com.example.delivery": {
      "team": "data-platform",
      "internalPortal": "https://example.invalid/catalog/data-product"
    }
  }
}
```

Extensions must not modify OS-owned IDs, shadow standard properties, add product instructions, or imply that the OS validates external extension values.

## Change control

Add or update catalog metadata in the same pull request as the canonical artifact. Run `.github/scripts/validate-os-catalog.ps1` and its regression suite. Contract changes require a proposal issue, compatibility assessment, validator and documentation updates, and human approval.
