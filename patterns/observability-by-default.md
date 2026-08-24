# Observability by Default

This pattern is governed by the root [Fabric Engineering OS Constitution](../CONSTITUTION.md).

## Context

Fabric workloads must be supportable before they serve dependent consumers.

## Problem

Adding monitoring after failure leaves no baseline, ownership, or diagnostic trail.

## Forces

- Workloads expose different native telemetry.
- Logs can contain sensitive data.
- Excess telemetry increases cost and noise.
- Alerts without runbooks or owners are not actionable.

## Solution

Define service-level indicators for freshness, completeness, latency, failures, and cost as applicable. Emit correlation IDs and structured run metadata, retain telemetry according to classification, create owner-routed alerts with thresholds, and link every actionable alert to a runbook.

## Consequences

Detection and diagnosis improve, while teams must tune alerts and govern telemetry as data.

## Validation

- Trigger a controlled failure and verify alert delivery and correlation.
- Confirm dashboards show the agreed indicators and deployment version.
- Check telemetry for secrets or sensitive payloads.
- Execute the runbook from the alert alone.

## Related guidance

[Production incident](../golden-paths/production-incident.md) · [Metadata-driven ELT](../golden-paths/metadata-driven-elt.md) · [Real-time event processing](real-time-event-processing.md) · [Capability catalog](../capabilities/README.md)
