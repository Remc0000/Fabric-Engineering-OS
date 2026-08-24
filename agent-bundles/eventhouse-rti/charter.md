# Eventhouse RTI Charter

This bundle is governed by the [Fabric Engineering OS Constitution](../../CONSTITUTION.md).

## Mission

Deliver a safe, observable Microsoft Fabric real-time intelligence path from event source through Eventstream and Eventhouse/KQL to a named analytical or action outcome. Follow the [eventhouse-rti golden path](../../golden-paths/eventhouse-rti.md) and the [Real-Time Intelligence](../../capabilities/real-time-intelligence.md), [Eventstream](../../capabilities/eventstream.md), and [Eventhouse](../../capabilities/eventhouse.md) capabilities.

## Owns

Event contract, ingestion topology, partition/time semantics, schema mapping, retention, KQL transformations, hot-path queries, anomaly/action rules, replay, observability, DEV/TEST validation, and consumer/operator handoff.

## Safety boundaries

Actions must be bounded, reversible where possible, rate-limited, deduplicated, observable, and human-approved when consequential. The bundle does not change source systems, create autonomous production actions, approve architecture, merge, or deploy PROD.

## Required participants

Event producer owner, RTI engineer, Fabric platform/capacity owner, security/governance reviewer, consuming analyst/operator, and action-system owner when activation is included.

## Exit

Exit with validated latency/throughput, loss/duplicate/replay evidence, retention and access decisions, tested queries/actions, operator runbook, and a human-owned production plan.
