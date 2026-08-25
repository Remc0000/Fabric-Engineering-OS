# Governance

This governance model implements the [Fabric Engineering OS Constitution](CONSTITUTION.md).

## Accountability model

| Decision or action | Agent | Human |
| --- | --- | --- |
| Create issue, branch, commit, or pull request | May perform | Oversees |
| Propose architecture | May perform | Approves |
| Approve a pull request | Prohibited | Approves |
| Merge | Prohibited | Approves and performs |
| Deploy to DEV or TEST | May use approved workflow | Authorizes workflow and owns outcome |
| Deploy to PROD | Prohibited | Approves and performs through protected workflow |
| Change this OS | May propose through a pull request | Approves and merges |
| Change the source-controlled wiki | May propose through a pull request; never autonomous | Approves and merges |
| Change upstream repository | Prohibited automatically | Managed outside this OS |

## Decision rights

- **Architecture owner:** accepts architecture and material trade-offs.
- **Data owner:** accepts contracts, classification, retention, and access.
- **Security owner:** accepts identity, network, secret, and exception controls.
- **Service owner:** accepts reliability, support, cost, and rollback readiness.
- **Maintainer:** accepts repository quality and compatibility.
- **Release owner:** approves production promotion and release publication.

One person may hold multiple roles, but an agent cannot satisfy a human approval role.

## Change process

1. Capture intent and owner in an issue. Changes to OS canon (Constitution, governance, agents, capabilities, patterns, golden paths, reference architectures, standards, workflows), the wiki, or any upstream contribution must start with the dedicated [OS canon proposal form](.github/ISSUE_TEMPLATE/os-canon-proposal.yml) before implementation. Use the architecture-change form for solution architecture that does not alter OS canon and the feature form for ordinary consumer work.
2. Select the relevant bundle or golden path.
3. Document decisions, risks, tests, and environment impact.
4. Implement on a branch and open a pull request.
5. Pass required checks and resolve review conversations.
6. Obtain required human approvals.
7. Merge and promote through protected environments.

## Exceptions

An exception must identify scope, owner, rationale, risk, compensating controls, expiry, and rollback. Emergency work may accelerate review but never authorizes agent self-approval, autonomous merge, or production deployment.

## OS evolution

Changes to constitutional boundaries, source precedence, agent permissions, or approval gates are governance changes. They require a dedicated pull request and explicit maintainer approval; they cannot be bundled invisibly into feature work.

## Required repository settings

Some controls are enforced only by GitHub configuration, not by files in this repository. They must be set manually and re-verified after any template instantiation:

- **Branch protection on the default branch:** require a pull request, the required status check, and — for the canonical OS — at least one human approval and CODEOWNERS review. Any deliberate deviation must be recorded as an accepted risk.
- **Environment protection for DEV and TEST:** configure the human authorization appropriate to each environment's risk. Workflow YAML alone does not enforce this.
- **Environment protection for PROD:** required reviewers and a protected-branch policy; production remains human-approved and human-executed.

The DEV and TEST deployment workflows additionally refuse to run from any branch other than the protected default branch, so only human-approved, merged changes can be deployed.
