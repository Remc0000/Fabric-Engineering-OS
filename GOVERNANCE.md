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

1. Capture intent and owner in an issue.
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
