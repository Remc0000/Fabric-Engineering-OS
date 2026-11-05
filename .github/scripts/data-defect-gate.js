const proposalPattern = /^Proposal revision:\s*(https:\/\/github\.com\/[^/\s]+\/[^/\s]+\/blob\/[a-f0-9]{40}\/[^\s]+)\s*$/gim;
const decisionPattern = /^Gate 1 decision:\s*(Approved for build|Revision assigned)\s*$/gim;
const statusContext = "Data-defect Gate 1 freshness";

function findLinkedIssueNumbers(body) {
  return [...new Set(
    [...body.matchAll(/(?:close[sd]?|fix(?:e[sd])?|resolve[sd]?)\s+#(\d+)/gi)]
      .map((match) => Number(match[1]))
  )];
}

function isDataDefect(issue) {
  return issue.labels.some((label) => label.name === "data-defect" || label.name === "agent-triage") ||
    /### Fabric report or table/i.test(issue.body || "");
}

function extractProposalLinks(body) {
  return [...body.matchAll(proposalPattern)].map((match) => match[1].replace(/[),.]+$/, ""));
}

function getAccountableOwner(body) {
  const ownerMatch = body.match(
    /### Accountable data or service owner\s+([\s\S]*?)(?=\n###|\n---|$)/i
  );
  const owner = ownerMatch?.[1]?.trim().replace(/^@/, "").split(/\s+/)[0];
  if (!owner || !/^[a-zA-Z0-9-]+$/.test(owner)) {
    throw new Error("The data-defect issue must identify the accountable owner's GitHub username.");
  }
  return owner;
}

function require(condition, message) {
  if (!condition) throw new Error(message);
}

async function verifyGateOne({ issue, comments, github, owner, repo }) {
  const labels = issue.labels.map((label) => label.name);
  require(labels.includes("data-defect"),
    "The linked data-defect issue must retain its `data-defect` classification label.");
  require(labels.includes("agent-triage"),
    "A maintainer must apply the `agent-triage` label before implementation proceeds.");

  const accountableOwner = getAccountableOwner(issue.body || "");
  const orderedComments = [...comments].sort(
    (a, b) => new Date(a.created_at) - new Date(b.created_at)
  );
  const proposalComments = orderedComments.filter((comment) =>
    !/^Gate 1 decision:\s*(?:Approved for build|Revision assigned)\s*$/im.test(comment.body || "")
  );
  const proposals = proposalComments.flatMap((comment) =>
    extractProposalLinks(comment.body || "").map((url) => ({ url, author: comment.user.login }))
  );
  const latestProposal = proposals.at(-1);
  require(latestProposal, "No immutable `Proposal revision` permalink is recorded on the issue.");

  const decisions = orderedComments.flatMap((comment) =>
    [...(comment.body || "").matchAll(decisionPattern)].map((match) => ({
      decision: match[1],
      author: comment.user.login,
      proposal: extractProposalLinks(comment.body || "").at(-1)
    }))
  );
  const latestDecision = decisions.at(-1);
  require(latestDecision?.decision === "Approved for build",
    "The latest Gate 1 decision is not `Approved for build`.");
  require(latestDecision.author.toLowerCase() === accountableOwner.toLowerCase(),
    `Gate 1 decision must be recorded by the accountable issue owner @${accountableOwner}.`);
  require(latestDecision.proposal === latestProposal.url,
    "Gate 1 approval is missing or stale: it must reference the latest immutable proposal permalink.");

  const match = latestProposal.url.match(
    /^https:\/\/github\.com\/([^/]+)\/([^/]+)\/blob\/([a-f0-9]{40})\/(.+)$/
  );
  require(match &&
    match[1].toLowerCase() === owner.toLowerCase() &&
    match[2].toLowerCase() === repo.toLowerCase(),
  "The proposal permalink must identify a commit and file in this repository.");

  const [, proposalOwner, proposalRepo, sha, path] = match;
  await github.rest.repos.getCommit({ owner: proposalOwner, repo: proposalRepo, ref: sha });
  await github.rest.repos.getContent({ owner: proposalOwner, repo: proposalRepo, path, ref: sha });
  return { owner: accountableOwner, sha, path };
}

async function setGateStatus({ github, owner, repo, sha, state, description }) {
  await github.rest.repos.createCommitStatus({
    owner,
    repo,
    sha,
    state,
    context: statusContext,
    description
  });
}

module.exports = {
  findLinkedIssueNumbers,
  isDataDefect,
  setGateStatus,
  statusContext,
  verifyGateOne
};
