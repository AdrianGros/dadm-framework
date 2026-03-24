# Framework Change Process

This document defines how the DAD-M framework itself may be changed. It applies to
changes in core documents, governance documents, templates, and policy files.

For term definitions see `docs/glossary.md`.

---

## When this process applies

This process applies when:

- a core framework document (`framework/core/`) is added or substantively changed
- a governance document (`governance/`) is added or substantively changed
- a template (`framework/templates/`) is added or changed
- a policy file (`governance/policies/`) is added or changed
- a document in `docs/` introduces a new normative statement

It does not apply to:

- corrections of typos, broken links, or formatting errors (no normative content change)
- adding or updating decision artifacts in `docs/decisions/` (these are project records,
  not framework changes)

---

## Change categories

| Category | Definition | Required approval |
| --- | --- | --- |
| Minor | Wording clarification, cross-reference addition, formatting | Agent, with decision log entry |
| Significant | New concept, changed rule, new normative statement, structural reorganization | Human decision record required before merging |
| Breaking | Removal of an existing rule, backward-incompatible change to an artifact format | Human decision record + version increment required |

When in doubt, treat a change as Significant rather than Minor.

---

## Process steps

### For minor changes

1. Identify the gap or issue (reference the gap ID from `docs/decisions/M05_gap_analyse.md`
   or a new finding).
2. Make the change.
3. Add a decision log entry in the corresponding milestone decision artifact.
4. Verify the document-quality checklist (`governance/document-quality.md`) is satisfied.

### For significant and breaking changes

1. Record the proposed change as an open decision in `docs/decisions/`.
2. Identify all documents that reference or depend on the changed document.
3. Obtain human approval (use `framework/templates/human-decision-record.md`).
4. Apply the change.
5. Update all cross-references in dependent documents.
6. For breaking changes: increment the document version header.
7. Add a decision log entry in the corresponding milestone decision artifact.
8. Update `README.md` if the file listing changes.

---

## Immutability constraint

Framework documents that are currently `immutable` (see `framework/core/artifact-retention.md`)
cannot be changed after they are closed. If a change is required:

1. Create a new artifact that supersedes the original.
2. Reference the original from the new artifact.
3. Leave the original unchanged.

---

## Cross-reference consistency

After any framework change, verify:

- [ ] All new cross-references point to files that exist.
- [ ] No term is introduced without a glossary entry or inline definition.
- [ ] No normative statement is added without a traceable reason.
- [ ] If a conflict with an existing document is introduced, it is documented in
      `docs/decisions/` before the change is finalized.

---

## Relationship to other documents

- `framework/core/artifact-retention.md` — retention classes and immutability rules
- `governance/document-quality.md` — quality criteria for each document type
- `governance/evidence-policy.md` — evidence standard for normative claims
- `framework/templates/human-decision-record.md` — required format for significant change approval
- `docs/decisions/` — where change approval records are stored
