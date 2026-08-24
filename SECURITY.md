# Security Policy

This policy is governed by the [Fabric Engineering OS Constitution](CONSTITUTION.md).

## Scope

Fabric Engineering OS is governance and engineering guidance, not a running service. Security concerns therefore fall into two categories:

- **Repository issues:** defects in this OS content, workflows, or scripts that could weaken governance, leak data, or mislead adopters.
- **Consumer solutions:** vulnerabilities in a Microsoft Fabric solution built from this OS. Those are owned by the team that operates the solution and must follow that organization's incident process.

## Reporting a vulnerability

Report suspected vulnerabilities in this repository privately. Do not open a public issue for an undisclosed vulnerability.

- Use GitHub's **private vulnerability reporting** for this repository (Security tab → "Report a vulnerability") where available.
- Otherwise, contact the maintainers listed in [CODEOWNERS](CODEOWNERS) through a private channel.

Include a description, affected files or workflows, reproduction steps, and any suggested mitigation. Maintainers aim to acknowledge a report within a reasonable time, agree on severity, and coordinate a fix through the normal human-approved pull request process.

## Handling secrets and sensitive data

- Never commit secrets, credentials, tokens, connection strings, tenant identifiers, or customer data.
- Keep environment-specific values in externally configured secrets, not in Git history.
- Sanitize incident evidence before adding it to an issue or pull request. See the production-incident issue template.
- If a secret is exposed, treat it as compromised: rotate it and record the remediation.

## Coordinated disclosure

Please give maintainers a reasonable opportunity to remediate before public disclosure. Fixes follow the same review, approval, and merge boundaries as all other changes; production actions remain human-owned.
