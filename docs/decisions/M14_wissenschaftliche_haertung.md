# M14 — Wissenschaftliche Härtung

phase-state: COMPLETED
milestone-id: M14
date: 2026-03-24
status: closed

---

## Phase Output

**Status:** complete

**Input Summary:**
Gap matrix from M05 (WH-dimension gaps), wissenschaftlichkeits audit from M04.
Primary gaps addressed: G-007, G-008, G-009, G-033.
G-025 (Education variant, WH P2) deferred — out of scope for core framework correction.

**Artifacts produced:**

| Artifact | Retention |
| --- | --- |
| `docs/overview.md` (updated) | `versioned` |
| `governance/guardrails.md` (updated) | `versioned` |
| `governance/rework-and-escalation.md` (updated) | `versioned` |
| `governance/severity-framework.md` (updated) | `versioned` |
| This decision document | `immutable` |

**Changes made:**

### `docs/overview.md` (G-007)
- Replaced "The framework assumes that AI-assisted project work becomes more reliable..."
  with the canonical design assumption statement from `docs/methodology.md`.
- Added explicit qualifier: "This is a design assumption, not an empirically verified claim."
- Added cross-reference to `docs/methodology.md` for the full methodological statement.
- Resolves Gap G-007 (core thesis formulated as fact rather than design assumption).

### `governance/guardrails.md` (G-008)
- Added inline rationale for each of the six mandatory human decision triggers.
- Each rationale explains *why* that specific situation exceeds automated decision
  authority (irreversibility, compliance implications, plan invalidation, etc.).
- Resolves Gap G-008 (triggers listed without rationale).

### `governance/rework-and-escalation.md` (G-009)
- Added "The rationale for 2 as the default" paragraph after the rework limit rule.
- Explains the cost-of-correction reasoning: first attempt = direct fix, second attempt
  = correction based on result; third attempt without resolution signals structural problem.
- Explicitly marks the number as a design default, not empirically validated.
- Resolves Gap G-009 (rework limit = 2 without rationale).

### `governance/severity-framework.md` (G-033)
- Added "Threshold rationale" subsection after the "How to use severity" rules.
- Explains the advisory/action-required boundary at `medium`: info/low don't compound;
  medium findings, if carried forward, are likely to escalate in cost.
- Explicitly marks as a design decision based on cost-of-correction reasoning.
- Resolves Gap G-033 (severity threshold medium→rework without rationale).

**Risks and Assumptions:**

| Severity | Entry |
| --- | --- |
| `info` | G-025 (Education variant WH) deferred; not a core framework gap and the education.md variant is out of scope for this correction cycle. |
| `low` | All four rationale additions are framed as design decisions, not empirical claims. This is consistent with the evidence policy but means the rationale itself is not independently verifiable. Future empirical validation would strengthen these claims. |

**Next Step:** M15 — Reproducibility standards (`docs/reproducibility.md`).

---

## Decision log

```
date: 2026-03-24
decision: all WH-dimension additions explicitly marked as design decisions or design defaults, not empirical claims
reason: evidence-policy.md requires that claim strength match evidence level; the rationale additions are reasoning-based, not observation-based
decided-by: agent
refs: governance/evidence-policy.md, docs/decisions/M05_gap_analyse.md (G-007, G-008, G-009, G-033)
```

```
date: 2026-03-24
decision: G-025 deferred (Education variant WH gap)
reason: education.md is a variant document, not part of the core framework correction scope; addressing it would expand M14 scope beyond what was planned
decided-by: agent
refs: docs/decisions/M05_gap_analyse.md (G-025), docs/decisions/MILESTONE_PLAN_V1.md
```
