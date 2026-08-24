# Security Standard

This standard implements the [Fabric Engineering OS Constitution](../CONSTITUTION.md) using secure-by-default controls.

## Identity and access

- Use managed identities, workload identities, or approved service principals where supported; avoid shared human credentials.
- Apply least privilege and separate duties for authoring, approval, deployment, and administration.
- Scope access by workspace, item, data domain, and environment. Review privileged access and remove it when no longer required.
- Require a named human owner for identities, secrets, data classifications, and accepted exceptions.

## Secrets and sensitive data

- Never commit secrets, credentials, tenant identifiers, customer data, or production extracts.
- Store secrets in an approved secret store and reference them through environment-specific configuration.
- Use synthetic or approved masked data in development and tests.
- Stop work and invoke the incident process if a secret or sensitive dataset is exposed.

## Engineering controls

- Threat-model trust boundaries, ingestion paths, external connections, data egress, and administrative actions.
- Pin and review third-party dependencies where practical; preserve provenance for templates and generated assets.
- Log security-relevant actions without logging secrets or sensitive payloads.
- Validate authorization failures and safe defaults, not only successful access.

## Exceptions

Security exceptions require documented business need, affected assets, compensating controls, owner, expiry, and explicit human approval. Agents may recommend but never accept security risk.
