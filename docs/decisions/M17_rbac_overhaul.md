# M17 — RBAC Case Example Overhaul

phase-state: COMPLETED
milestone-id: M17
date: 2026-03-24
status: closed

---

## Phase Output

**Status:** complete

**Input Summary:**
Gap matrix from M05 (G-024 — rbac-case-example.md shows Pre-MA-06-DAD-M).
Current state of framework documents (phases, milestones, deliverables, severity-framework).

**Artifacts produced:**

| Artifact | Retention |
| --- | --- |
| `docs/examples/rbac-case-example.md` (full overhaul) | `versioned` |
| This decision document | `immutable` |

**Changes made:**

### `docs/examples/rbac-case-example.md` (G-024)
Full overhaul. Original domain content (RBAC entities, permission naming, role families,
check pattern, rollout strategy) was retained. Structural additions:

- **Milestone definition section**: goal, scope, constraints, deliverables, acceptance
  criteria, risks and assumptions (with severity labels), dependencies, priority — full
  set of milestone fields from `framework/core/milestones.md`.
- **Phase-state markers**: each phase section opens with phase-state.
- **Standard phase output sections**: each phase ends with Status, Input Summary,
  Artifacts (with retention class), Risks and Assumptions (severity-labeled), Next Step
  — from `framework/core/deliverables.md`.
- **Severity labels on all risks**: `high`, `medium`, `low`, `info` applied throughout.
- **Decision log section**: two example entries showing deny-by-default and
  emergency-override decisions.
- **Updated "What this example demonstrates"** section to include all new structural elements.
- Resolves Gap G-024.

**Risks and Assumptions:**

| Severity | Entry |
| --- | --- |
| `info` | Decision log entries use placeholder dates (`<project date>`) since this is an anonymized example; real projects must use actual dates. |
| `info` | Acceptance checklist items are marked `[x]` as a demonstration; real projects must verify each item before marking complete. |

**Next Step:** M18 — AI_CONTEXT.md + docs/software-reference.md (primary software-reference goal).

---

## Decision log

```
date: 2026-03-24
decision: original domain content retained; structural wrapper added rather than content replaced
reason: the RBAC domain content was valid and well-anonymized; the gap was structural (missing milestone fields, phase outputs, severity labels, decision log) — not domain content quality
decided-by: agent
refs: docs/decisions/M05_gap_analyse.md (G-024)
```
