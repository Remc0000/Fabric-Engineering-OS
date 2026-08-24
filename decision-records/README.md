# Fabric Decision Records

This system is governed by the root [Fabric Engineering OS Constitution](../CONSTITUTION.md).

## What is an FDR?

A Fabric Decision Record (FDR) is a durable, reviewable record of a consequential Microsoft Fabric decision. It captures the context, drivers, options, chosen direction, consequences, validation evidence, and named human approval for the decision.

## When is an FDR required?

Create an FDR for material decisions that affect Fabric architecture, security, data design, cost, environment topology, integration boundaries, operational controls, or risk acceptance. Use an FDR when a decision would be difficult to reverse, affects multiple teams or workloads, changes governed data behavior, or creates a control obligation.

## Where records live

Store approved and proposed FDRs in this `decision-records/` directory. Start from the reusable [FDR template](TEMPLATE.md), name records so they are discoverable, and link them from the related issue, pull request, golden path, or architecture artifact.

## Human approver requirement

Agents may draft FDRs and gather evidence, but a named human approver is required for every FDR before the decision is treated as approved. Human accountability cannot be inferred from automation, tests, or agent agreement.
