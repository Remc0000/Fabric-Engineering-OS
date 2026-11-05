const assert = require("node:assert/strict");
const test = require("node:test");
const {
  findLinkedIssueNumbers,
  isDataDefect,
  setGateStatus,
  statusContext,
  verifyGateOne
} = require("./data-defect-gate");

const sha = "0123456789abcdef0123456789abcdef01234567";
const proposal = `https://github.com/Remc0000/Fabric-Engineering-OS/blob/${sha}/proposals/fix.md`;
const issue = {
  body: "### Accountable data or service owner\n\n@data-owner\n\n### Fabric report or table\n\nSales",
  labels: [{ name: "data-defect" }, { name: "agent-triage" }]
};
const github = {
  rest: {
    repos: {
      getCommit: async () => ({ data: { sha } }),
      getContent: async () => ({ data: { path: "proposals/fix.md" } })
    }
  }
};

function comments(decision = "Approved for build", decisionProposal = proposal) {
  return [
    {
      user: { login: "data-owner" },
      created_at: "2026-01-01T00:00:00Z",
      body: `Proposal revision: ${proposal}`
    },
    {
      user: { login: "data-owner" },
      created_at: "2026-01-02T00:00:00Z",
      body: `Proposal revision: ${decisionProposal}\nGate 1 decision: ${decision}`
    }
  ];
}

test("accepts an owner approval bound to the latest existing proposal commit", async () => {
  const result = await verifyGateOne({
    issue,
    comments: comments(),
    github,
    owner: "Remc0000",
    repo: "Fabric-Engineering-OS"
  });
  assert.deepEqual(result, { owner: "data-owner", sha, path: "proposals/fix.md" });
});

test("rejects approval of an older proposal revision", async () => {
  const changedProposal = `https://github.com/Remc0000/Fabric-Engineering-OS/blob/${"f".repeat(40)}/proposals/fix.md`;
  await assert.rejects(
    verifyGateOne({
      issue,
      comments: comments("Approved for build", changedProposal),
      github,
      owner: "Remc0000",
      repo: "Fabric-Engineering-OS"
    }),
    /stale/
  );
});

test("rejects when a new proposal revision is published after approval", async () => {
  const revisedProposal = `https://github.com/Remc0000/Fabric-Engineering-OS/blob/${"f".repeat(40)}/proposals/fix.md`;
  const revisedComments = [
    ...comments(),
    {
      user: { login: "architect" },
      created_at: "2026-01-03T00:00:00Z",
      body: `Proposal revision: ${revisedProposal}`
    }
  ];
  await assert.rejects(
    verifyGateOne({
      issue,
      comments: revisedComments,
      github,
      owner: "Remc0000",
      repo: "Fabric-Engineering-OS"
    }),
    /stale/
  );
});

test("rejects a revision assignment as build approval", async () => {
  await assert.rejects(
    verifyGateOne({
      issue,
      comments: comments("Revision assigned"),
      github,
      owner: "Remc0000",
      repo: "Fabric-Engineering-OS"
    }),
    /not `Approved for build`/
  );
});

test("rejects a decision from someone other than the named owner", async () => {
  const ownerComments = comments().map((comment) => ({
    ...comment,
    user: { login: "maintainer" }
  }));
  await assert.rejects(
    verifyGateOne({
      issue,
      comments: ownerComments,
      github,
      owner: "Remc0000",
      repo: "Fabric-Engineering-OS"
    }),
    /accountable issue owner/
  );
});

test("rejects the issue until a maintainer authorizes agent triage", async () => {
  await assert.rejects(
    verifyGateOne({
      issue: { ...issue, labels: [{ name: "data-defect" }] },
      comments: comments(),
      github,
      owner: "Remc0000",
      repo: "Fabric-Engineering-OS"
    }),
    /maintainer must apply/
  );
});

test("rejects a proposal permalink outside the current repository", async () => {
  const externalProposal = `https://github.com/other/repo/blob/${sha}/proposals/fix.md`;
  const externalComments = [
    {
      user: { login: "architect" },
      created_at: "2026-01-01T00:00:00Z",
      body: `Proposal revision: ${externalProposal}`
    },
    {
      user: { login: "data-owner" },
      created_at: "2026-01-02T00:00:00Z",
      body: `Proposal revision: ${externalProposal}\nGate 1 decision: Approved for build`
    }
  ];
  await assert.rejects(
    verifyGateOne({
      issue,
      comments: externalComments,
      github,
      owner: "Remc0000",
      repo: "Fabric-Engineering-OS"
    }),
    /this repository/
  );
});

test("extracts closing references without treating unrelated numbers as issue links", () => {
  assert.deepEqual(findLinkedIssueNumbers("Fixes #12 and closes #34; fixes #12; see PR #56"), [12, 34]);
});

test("classifies only issues carrying the data-defect label", () => {
  assert.equal(isDataDefect(issue), true);
  assert.equal(isDataDefect({ labels: [{ name: "bug" }] }), false);
  assert.equal(isDataDefect({
    body: "### Fabric report or table\n\nSales",
    labels: [{ name: "bug" }]
  }), true);
});

test("rejects a data-defect issue whose classification label was removed", async () => {
  await assert.rejects(
    verifyGateOne({
      issue: { ...issue, labels: [{ name: "agent-triage" }] },
      comments: comments(),
      github,
      owner: "Remc0000",
      repo: "Fabric-Engineering-OS"
    }),
    /retain its `data-defect` classification/
  );
});

test("publishes the freshness decision against the requested commit", async () => {
  let request;
  const statusClient = {
    rest: {
      repos: {
        createCommitStatus: async (value) => { request = value; }
      }
    }
  };
  await setGateStatus({
    github: statusClient,
    owner: "Remc0000",
    repo: "Fabric-Engineering-OS",
    sha,
    state: "failure",
    description: "Gate 1 approval is stale."
  });
  assert.deepEqual(request, {
    owner: "Remc0000",
    repo: "Fabric-Engineering-OS",
    sha,
    state: "failure",
    context: statusContext,
    description: "Gate 1 approval is stale."
  });
});
