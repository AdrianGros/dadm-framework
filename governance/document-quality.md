# Document Quality

This document defines measurable quality criteria for each type of framework document.
A document is considered complete when it satisfies all applicable criteria for its type.

All criteria are checkable without automated tooling.

---

## Document types

| Type | Examples |
| --- | --- |
| Core | `framework/core/*.md` |
| Governance | `governance/*.md` |
| Policy | `governance/policies/*.yaml` |
| Template | `framework/templates/*.md` |
| Runtime card | `runtime/cards/*.md` |
| Docs | `docs/*.md`, `docs/**/*.md` |
| Decision | `docs/decisions/*.md` |

---

## Core documents

1. Every defined concept links to the glossary or provides an inline definition on first use.
2. All cross-references point to files that exist in the repository.
3. Every normative statement ("must", "should", "may not") has a traceable reason — either by reference to a principle, a guardrail, or a governance document.
4. No information that is already authoritative in another core document is duplicated; instead, a cross-reference is used.
5. The document does not describe implementation beyond the conceptual level.

## Governance documents

1. Every rule is stated in one of three forms: obligation ("must"), prohibition ("must not"), or default ("by default").
2. Rules that reference severity levels use the exact five-level vocabulary from `governance/severity-framework.md`.
3. Every mention of "human decision" links to `governance/guardrails.md` or the human decision policy.
4. Normative claims that go beyond framework logic are either marked as design decisions or supported by a cited rationale.
5. No rule in this document contradicts a rule in another governance document. If a conflict exists, it is documented in `docs/decisions/` before the document is marked complete.

## Policy files (YAML)

1. The file begins with a `version:` field.
2. Every action value is drawn from the defined action vocabulary: `allow`, `allow_with_notes`, `rework`, `escalate`, `block`, `human_decision`.
3. The YAML file has a corresponding Markdown governance document that it operationalizes.
4. The YAML file includes a header comment identifying its Markdown counterpart.
5. The YAML is syntactically valid and parseable without errors.

## Templates

1. Every field in the template is required unless explicitly marked optional.
2. The template includes usage notes explaining when and how to use each field.
3. The template states its retention class (immutable / versioned / mutable).
4. The template cross-references the governance or core document that defines its trigger or context.

## Runtime cards

Runtime cards are loaded automatically for a profile or route, so every line costs tokens
on every load. These criteria are adapted from `writing-for-agents` in mattpocock/skills.

1. The card stays under 300 words (`wc -w runtime/cards/*.md`) and points to canonical
   detail instead of copying it.
2. Each rule appears once in the documents a profile loads. A rule every profile needs
   lives in `core-rules.md`; other cards point to it.
3. A prohibition is paired with the positive target (for example "park solution ideas as
   open questions for Apply" next to "no solution design").
4. Every line changes agent behaviour compared with the model's default; lines that do
   not are removed.
5. A pointer to another document states the condition for loading it.
6. Facts the environment already holds (configuration, scripts, version control) are
   referenced, not restated.
7. The card does not contradict the canonical framework or governance documents.

## Docs (public-facing)

1. The document does not introduce terminology not found in the glossary or not defined inline.
2. The document does not describe framework internals that are only relevant to framework developers.
3. Claims about the framework's behavior are consistent with the current state of core and governance documents.
4. The document is readable without prior DAD-M knowledge (self-contained or cross-referenced).
5. No normative statement is stronger than the supporting evidence allows (see `governance/evidence-policy.md`).

## Decision documents

1. The document header contains: phase state, milestone ID, date, and status (open / closed).
2. The Phase-Output section at the end is complete: Status, Input Summary, Artifacts, Risks and Assumptions, Next Step.
3. Risk entries carry a severity label.
4. All referenced gap IDs or finding IDs are traceable to the document that introduced them.
5. The document is append-only after it is marked closed.

Human decision records stored in `docs/decisions/` follow
`framework/templates/human-decision-record.md`; criteria 1 to 3 do not apply to them.

---

## Revision checklist

Before marking any document revision complete, confirm:

- [ ] All criteria for the document's type are satisfied
- [ ] No new cross-references point to non-existent files
- [ ] No normative statement was added without a traceable reason
- [ ] If the revision resolves a gap from the gap matrix, the gap status has been updated
- [ ] The document does not introduce a new term without a glossary entry or inline definition
