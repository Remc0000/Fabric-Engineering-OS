# Mirroring to Gold Charter

This bundle is governed by the [Fabric Engineering OS Constitution](../../CONSTITUTION.md).

## Mission

Turn a supported Microsoft Fabric mirrored operational source into a governed gold product without treating the mirror as a finished analytical contract. Follow the [mirroring-to-gold golden path](../../golden-paths/mirroring-to-gold.md), [Mirroring](../../capabilities/mirroring.md), and the chosen [Lakehouse](../../capabilities/lakehouse.md) or [Warehouse](../../capabilities/warehouse.md) serving capability.

## Owns

- Mirroring eligibility and limitation assessment, source/table scope, latency and change semantics, monitoring, and source-impact review.
- Reconciliation from source to mirror, silver conformance, gold contract, access separation, history/deletion handling, and downstream compatibility.
- DEV/TEST evidence, pause/resume and recovery procedure, operations handoff, and release proposal.

## Boundaries

The bundle cannot enable unsupported sources, alter source schema/retention, assume the replica is authoritative business truth, expose raw mirrored data broadly, merge, or deploy PROD. It does not modify Fabric Engineering OS or upstream repositories.

## Required participants

Source/database owner, Fabric platform owner, domain/data product owner, security/governance reviewer, consumer, and operations owner.

## Exit

Exit with a validated mirror contract, reconciled representative changes, tested gold outputs, source-safe operations plan, and human approval requests for architecture and production.
