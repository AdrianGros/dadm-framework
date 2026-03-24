# M16 — Framework Change Management Process

phase-state: COMPLETED
milestone-id: M16
date: 2026-03-24
status: closed

---

## Phase Output

**Status:** complete

**Input Summary:**
Gap matrix from M05. Primary gap addressed: G-031 (missing `governance/framework-change-process.md`).

**Artifacts produced:**

| Artifact | Retention |
| --- | --- |
| `governance/framework-change-process.md` (new) | `versioned` |
| This decision document | `immutable` |

**Changes made:**

### `governance/framework-change-process.md` (new, G-031)
- New governance document defining how the framework itself may be changed.
- Three change categories: Minor, Significant, Breaking — each with different
  required approval level.
- Separate process steps for minor vs. significant/breaking changes.
- Immutability constraint section: closed immutable artifacts cannot be changed;
  superseding artifacts must be created instead.
- Cross-reference consistency checklist.
- Cross-references to artifact-retention.md, document-quality.md, evidence-policy.md,
  human-decision-record.md template, docs/decisions/.
- Resolves Gap G-031.

**Risks and Assumptions:**

| Severity | Entry |
| --- | --- |
| `info` | The three-category change classification (Minor/Significant/Breaking) is a design decision. Projects may need to refine the boundary between Minor and Significant for their specific context. |
| `low` | This process was not applied retroactively to M09–M15 changes; those milestones preceded the process definition. Retroactive application is not required since the changes were tracked via decision artifacts. |

**Next Step:** M17 — RBAC case example overhaul (`docs/examples/rbac-case-example.md`).

---

## Decision log

```
date: 2026-03-24
decision: framework-change-process.md applies prospectively, not retroactively to M09-M15
reason: creating a governance process and then retroactively failing prior work against it would be counterproductive; the M09-M15 decision artifacts already serve the traceability purpose
decided-by: agent
refs: docs/decisions/M05_gap_analyse.md (G-031)
```
