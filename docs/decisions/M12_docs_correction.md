# M12 — Docs Formulierungskorrektur

phase-state: COMPLETED
milestone-id: M12
date: 2026-03-24
status: closed

---

## Phase Output

**Status:** complete

**Input Summary:**
Gap matrix from M05. Primary gaps addressed: G-002, G-003, G-004.
`docs/use-cases.md` reviewed — no structural gaps identified, no changes needed.

**Artifacts produced:**

| Artifact | Retention |
| --- | --- |
| `docs/overview.md` (updated) | `versioned` |
| `docs/getting-started.md` (updated) | `versioned` |
| This decision document | `immutable` |

**Changes made:**

### `docs/overview.md` (G-002)
- Replaced the 4-item setup list (project brief, safety boundaries, milestone plan,
  expected deliverable format) with the current 6-step bootstrap sequence aligned with
  `framework/core/bootstrap.md`: brief, safety boundaries, scope declaration, milestone
  plan, plan approval, working mode.
- Resolves Gap G-002 (outdated 4-step bootstrap in overview).

### `docs/getting-started.md` (G-003, G-004)
- Added "3. Declare scope" step between safety boundaries and milestone plan — resolves
  Gap G-003 (missing scope declaration step).
- Added approval checkpoint as step 5 with the artifact format — resolves Gap G-003
  (missing approval checkpoint).
- Added `dependencies` and `priority` fields to the milestone schema — resolves Gap G-004.
- Added severity label vocabulary to the `risks` field.
- Renumbered steps 4–7 accordingly.

**Risks and Assumptions:**

| Severity | Entry |
| --- | --- |
| `info` | `docs/use-cases.md` reviewed and found structurally complete; no changes applied. |
| `low` | `docs/examples/rbac-case-example.md` is tagged for M17 (full overhaul) and was not touched in M12. It currently reflects pre-M06 DAD-M; this is a known gap. |

**Next Step:** M13 — Artifact-retention + Modules correction.

---

## Decision log

```
date: 2026-03-24
decision: getting-started.md renumbered steps to 7 (was 5); new steps 3 (scope) and 5 (approval) inserted
reason: G-003 and G-004 required adding two new steps; renumbering maintains sequential clarity
decided-by: agent
refs: docs/decisions/M05_gap_analyse.md (G-003, G-004)
```
