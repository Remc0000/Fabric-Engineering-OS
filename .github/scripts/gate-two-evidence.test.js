const assert = require("node:assert/strict");
const test = require("node:test");
const { validateGateTwoEvidence } = require("./gate-two-evidence");

const sha = "0123456789abcdef0123456789abcdef01234567";
const evidence = [
  "## Data-defect evidence",
  "",
  `- Gate 1 proposal permalink and decision: https://github.com/Remc0000/Fabric-Engineering-OS/blob/${sha}/proposals/fix.md — Approved for build`,
  "- Feature workspace and Fabric Git branch: Isolated validation workspace; branch defect-123",
  "- Regression test and result: tests/defect.test.js — passed",
  "- Before/after comparison and agreed control totals: evidence/comparison.md — totals match",
  "- Evidence sanitization and data authorization: approved test data; identifiers removed",
  "- Inspecteur verification and limitations: evidence/inspecteur.md — expected output reproduced",
  "- Criticus findings and disposition: evidence/criticus.md — no unresolved findings",
  `- Exact PR commit SHA: ${sha}`,
  "",
  "## Human approval gates"
].join("\n");

test("accepts complete evidence bound to the current PR commit", () => {
  const result = validateGateTwoEvidence({ body: evidence, headSha: sha, isDataDefect: true });
  assert.equal(result.applicable, true);
});

test("does not require data-defect evidence for unrelated pull requests", () => {
  assert.deepEqual(
    validateGateTwoEvidence({ body: "", headSha: sha, isDataDefect: false }),
    { applicable: false }
  );
});

test("rejects a missing evidence section", () => {
  assert.throws(
    () => validateGateTwoEvidence({ body: "## Outcome\nChange", headSha: sha, isDataDefect: true }),
    /missing the Data-defect evidence section/
  );
});

test("rejects an uncompleted evidence placeholder", () => {
  const incomplete = evidence.replace(
    "- Criticus findings and disposition: evidence/criticus.md — no unresolved findings",
    "- Criticus findings and disposition: TODO"
  );
  assert.throws(
    () => validateGateTwoEvidence({ body: incomplete, headSha: sha, isDataDefect: true }),
    /Criticus findings and disposition/
  );
});

test("rejects evidence bound to an earlier PR commit", () => {
  const staleSha = "f".repeat(40);
  const staleEvidence = evidence.replace(`- Exact PR commit SHA: ${sha}`, `- Exact PR commit SHA: ${staleSha}`);
  assert.throws(
    () => validateGateTwoEvidence({ body: staleEvidence, headSha: sha, isDataDefect: true }),
    /exact current 40-character PR commit SHA/
  );
});

test("rejects Gate 1 evidence without an immutable approved proposal", () => {
  const unapproved = evidence.replace(
    " — Approved for build",
    " — Revision assigned"
  );
  assert.throws(
    () => validateGateTwoEvidence({ body: unapproved, headSha: sha, isDataDefect: true }),
    /Approved for build/
  );
});
