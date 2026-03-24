# Reproducibility

DAD-M treats reproducibility as a first-class quality requirement, not an optional
property. This document defines what reproducibility means in the framework, why
it matters, and how to achieve it in practice.

For term definitions see `docs/glossary.md`.

---

## What reproducibility means in DAD-M

A DAD-M output is reproducible when another person — working from the same artifacts
and inputs — can verify what was done, why it was done, and whether the result is valid.

Reproducibility does not mean bit-for-bit identical output from an AI system. It means:

- the inputs are documented
- the decisions are traceable
- the results can be independently checked
- the evidence is concrete, not asserted

---

## The three reproducibility requirements

### 1. Documented inputs

Every phase output must record what it worked from. The Input Summary field in the
standard phase output (`framework/core/deliverables.md`) is the required format.
An undocumented input cannot be verified and cannot be reproduced.

### 2. Traceable decisions

Every significant decision made during a milestone must appear in the decision log.
The decision log is append-only. It records:

- what was decided
- why
- who decided it
- which artifacts support the decision

A decision that exists only in conversation history is not traceable. It must be
recorded as an artifact.

### 3. Verifiable proofs

Phase outputs for Deploy must include Proofs — concrete evidence that the implementation
is real and that acceptance criteria are met. Assertions without evidence do not qualify.

Accepted proof types (from `framework/core/deliverables.md`):

- compile checks
- test results
- grep results
- screenshots
- service status checks
- command output (e.g., curl results)

Choose the minimum set of proofs that makes the result independently verifiable.
Do not overstate what the proofs show.

---

## Reproducibility and AI-generated outputs

AI-generated content is not inherently reproducible. The same prompt may produce
different outputs on different runs. DAD-M addresses this by:

- requiring artifact-level documentation rather than relying on conversation history
- separating analysis from implementation (so the analysis can be reviewed before
  results are acted on)
- requiring human decision records for significant tradeoffs

The framework does not guarantee that an AI system will produce the same output twice.
It guarantees that the *decisions made using* that output are documented and reviewable.

---

## Minimum reproducibility checklist

Before closing a phase, verify:

- [ ] Input Summary is complete
- [ ] All artifacts are listed with retention class
- [ ] Every significant decision is in the decision log
- [ ] For Deploy: Proofs are concrete and link to real outputs
- [ ] No assertion appears without supporting evidence or an explicit assumption marker

---

## Relationship to other documents

- `framework/core/deliverables.md` — standard phase output structure (Input Summary, Proofs)
- `governance/quality-principles.md` — Principle 4 (Reproducibility)
- `governance/evidence-policy.md` — evidence hierarchy and claims standard
- `framework/core/artifact-retention.md` — retention classes ensuring outputs persist
