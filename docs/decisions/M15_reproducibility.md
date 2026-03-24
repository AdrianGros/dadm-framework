# M15 — Reproducibility Standards

phase-state: COMPLETED
milestone-id: M15
date: 2026-03-24
status: closed

---

## Phase Output

**Status:** complete

**Input Summary:**
Gap matrix from M05. Primary gap addressed: G-030 (missing `docs/reproducibility.md`).

**Artifacts produced:**

| Artifact | Retention |
| --- | --- |
| `docs/reproducibility.md` (new) | `versioned` |
| This decision document | `immutable` |

**Changes made:**

### `docs/reproducibility.md` (new, G-030)
- New public-facing document defining what reproducibility means in DAD-M.
- Three reproducibility requirements: documented inputs, traceable decisions,
  verifiable proofs.
- Section on AI-generated output: explains that DAD-M guarantees decision traceability,
  not AI output determinism — this is an important distinction for a framework built
  around AI assistance.
- Minimum reproducibility checklist (5 items).
- Cross-references to deliverables.md, quality-principles.md, evidence-policy.md,
  artifact-retention.md.
- Resolves Gap G-030.

**Risks and Assumptions:**

| Severity | Entry |
| --- | --- |
| `info` | The distinction between "AI output determinism" and "decision traceability" is a framework-level claim; it is stated as a design intent, consistent with the evidence policy. |

**Next Step:** M16 — Framework Change Management Process (`governance/framework-change-process.md`).

---

## Decision log

```
date: 2026-03-24
decision: reproducibility.md explicitly distinguishes AI output determinism from decision traceability
reason: without this distinction, users might incorrectly assume DAD-M guarantees reproducible AI output; the correct guarantee is that decisions made using AI output are documented and reviewable
decided-by: agent
refs: governance/evidence-policy.md, docs/decisions/M05_gap_analyse.md (G-030)
```
