const requiredFields = [
  "Gate 1 proposal permalink and decision",
  "Feature workspace and Fabric Git branch",
  "Regression test and result",
  "Before/after comparison and agreed control totals",
  "Evidence sanitization and data authorization",
  "Inspecteur verification and limitations",
  "Criticus findings and disposition",
  "Exact PR commit SHA"
];

const placeholderPattern = /^(?:n\/?a|none|tbd|todo|pending|not provided|<[^>]+>|\[.*\])$/i;

function parseEvidenceSection(body) {
  const heading = /^## Data-defect evidence\s*$/im.exec(body);
  if (!heading) return null;

  const start = heading.index + heading[0].length;
  const nextSection = /^##\s+/gm;
  nextSection.lastIndex = start;
  const end = nextSection.exec(body)?.index ?? body.length;
  const lines = body.slice(start, end).split(/\r?\n/);
  const fields = new Map();
  let currentField;

  for (const line of lines) {
    const field = /^\s*-\s*([^:]+):\s*(.*)$/.exec(line);
    if (field) {
      currentField = field[1].trim().toLowerCase();
      fields.set(currentField, field[2].trim());
    } else if (currentField && line.trim()) {
      fields.set(currentField, `${fields.get(currentField)} ${line.trim()}`.trim());
    }
  }

  return fields;
}

function validateGateTwoEvidence({ body, headSha, isDataDefect }) {
  if (!isDataDefect) return { applicable: false };

  const fields = parseEvidenceSection(body);
  if (!fields) throw new Error("The pull request is missing the Data-defect evidence section.");

  const evidence = {};
  for (const name of requiredFields) {
    const value = fields.get(name.toLowerCase());
    if (!value || placeholderPattern.test(value)) {
      throw new Error(`Data-defect evidence is missing a completed value for "${name}".`);
    }
    evidence[name] = value;
  }

  if (!/https:\/\/github\.com\/[^/\s]+\/[^/\s]+\/blob\/[a-f0-9]{40}\/\S+/i
    .test(evidence["Gate 1 proposal permalink and decision"]) ||
    !/\bApproved for build\b/.test(evidence["Gate 1 proposal permalink and decision"])) {
    throw new Error("Gate 2 must link the immutable Gate 1 proposal and its Approved for build decision.");
  }

  if (!/^[a-f0-9]{40}$/i.test(headSha) ||
      evidence["Exact PR commit SHA"].trim().toLowerCase() !== headSha.toLowerCase()) {
    throw new Error("Gate 2 evidence must identify the exact current 40-character PR commit SHA.");
  }

  return { applicable: true, evidence };
}

module.exports = { parseEvidenceSection, validateGateTwoEvidence };
