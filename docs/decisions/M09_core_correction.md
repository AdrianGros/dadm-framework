# M09 — Core Files Formulierungskorrektur

phase-state: COMPLETED
milestone-id: M09
date: 2026-03-24
status: closed

---

## Phase Output

**Status:** complete

**Input Summary:**
Gap matrix from M05 (34 gaps), terminology inventory from M02 (10 inconsistencies I-01–I-10),
consistency audit from M03 (9 contradictions W-01–W-09, 18 gaps L-01–L-18),
and the wissenschaftlichkeits audit from M04.

**Artifacts produced:**

| Artifact | Retention |
| --- | --- |
| `framework/core/milestones.md` (updated) | `versioned` |
| `framework/core/deliverables.md` (updated) | `versioned` |
| `framework/core/artifact-retention.md` (updated) | `versioned` |
| This decision document | `immutable` |

**Changes made:**

### `framework/core/milestones.md`
- Added severity label vocabulary (`info` / `low` / `medium` / `high` / `critical`) to risks and assumptions field — resolves Gap G-009 and inconsistency I-04.
- Added `dependencies` field with explicit `none` instruction — resolves Gap L-07.
- Added `priority` table (P1/P2/P3) — documents existing field more completely.
- Added `docs/decisions/` as storage location for versioned milestone plans — resolves Gap L-09.
- Added glossary cross-reference (`docs/glossary.md`).

### `framework/core/deliverables.md`
- Added structured decision log entry format (date / decision / reason / decided-by / refs) — resolves Gap L-05.
- Added explicit append-only rule for the decision log.
- Replaced inline retention class table with authoritative cross-reference to `framework/core/artifact-retention.md` — resolves contradiction W-04 (duplication).
- Added severity label requirement to Risks and Assumptions section — resolves Gap L-06.
- Added glossary cross-reference.

### `framework/core/artifact-retention.md`
- Added "Relationship to other documents" section cross-referencing `deliverables.md`, `bootstrap.md`, and `guardrails.md` — resolves Gap G-031.

**Risks and Assumptions:**

| Severity | Entry |
| --- | --- |
| `info` | Decision log format uses YAML-like inline syntax for readability; software implementations must parse it accordingly. |
| `low` | `artifact-retention.md` cross-references `governance/guardrails.md` (immutability as principle); this dependency must be maintained if guardrails.md is restructured in M10. |

**Next Step:** M10 — Governance documents Formulierungskorrektur.

---

## Decision log

```
date: 2026-03-24
decision: artifact-retention.md made the single authoritative source for retention class definitions; deliverables.md references it with a summary table only
reason: W-04 identified duplication as a consistency risk; one authoritative source removes divergence potential
decided-by: agent
refs: docs/decisions/M03_konsistenz_luecken.md (W-04), docs/decisions/M05_gap_analyse.md (G-031)
```

```
date: 2026-03-24
decision: decision log format in deliverables.md uses five fixed fields (date, decision, reason, decided-by, refs); all are required
reason: structured format enables traceability and machine parsing; gap L-05 identified absence of format spec as a risk
decided-by: agent
refs: docs/decisions/M05_gap_analyse.md (L-05)
```
