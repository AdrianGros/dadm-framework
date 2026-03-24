# Quality Principles

These principles define the working quality expected from all DAD-M artifacts and
agent behavior. They are not suggestions — they are governance obligations that apply
across all phases and milestones.

For term definitions see `docs/glossary.md`.

---

## 1. Phase separation

Facts, design, implementation, and validation must stay distinct. An agent must not
propose solutions during Discover, introduce architecture decisions during Deploy,
or carry unresolved findings forward without documenting them.

See `framework/core/phases.md` for phase definitions and the phase transition protocol.

## 2. Artifact-first work

Project knowledge must be externalized into documents, code, prompts, reports, or other
reviewable outputs. Work that exists only in conversation history is not a DAD-M artifact
and cannot serve as evidence.

See `framework/core/deliverables.md` for the standard phase output structure.

## 3. Milestone-based progress

Large work must be split into milestones with explicit scope and acceptance criteria.
A single open-ended request is not a valid milestone. Scope must be declared before
work begins.

See `framework/core/milestones.md` for milestone fields and the minimal checklist.

## 4. Reproducibility

Outputs must be concrete enough that another person can review what happened and why.
Proofs must be real and verifiable, not asserted without evidence. Claims about
system behavior should be backed by observable outputs.

See `framework/core/deliverables.md` (Proof section) for acceptable proof types.

## 5. Human accountability

Humans must define goals, constraints, and final decisions. The framework does not
replace human judgment. Where the framework defines mandatory human decision triggers,
these must not be bypassed.

See `governance/guardrails.md` for the complete list of human decision triggers.

## 6. Conservative documentation

When evidence is incomplete, documentation must use narrower wording or mark the
limitation explicitly. A stronger claim must not appear in a public artifact unless
it is supported by traceable evidence.

See `governance/evidence-policy.md` for the evidence hierarchy and allowed claims.

---

## Relationship to other documents

- `governance/guardrails.md` — operating rules that enforce principles 1 and 5
- `governance/severity-framework.md` — severity scale that supports principles 4 and 6
- `governance/document-quality.md` — checkable quality criteria for each document type
