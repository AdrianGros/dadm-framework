# M19 — README Finalization

phase-state: COMPLETED
milestone-id: M19
date: 2026-03-24
status: closed

---

## Phase Output

**Status:** complete

**Input Summary:**
Gap matrix from M05 (G-029 — README missing MILESTONE_PLAN_V1.md entry).
All new files created in M09–M18 that were not yet listed in README.

**Artifacts produced:**

| Artifact | Retention |
| --- | --- |
| `README.md` (updated) | `versioned` |
| This decision document | `immutable` |

**Changes made:**

### `README.md`
- Added "For AI systems" and "For software implementers" callouts in "How to start" section.
- Expanded Governance table: added `framework-change-process.md`, `document-quality.md`,
  and all five YAML policy files with individual entries.
- Expanded Documentation table: added `AI_CONTEXT.md`, `methodology.md`,
  `software-reference.md`, `reproducibility.md`, `glossary.md`,
  `docs/decisions/MILESTONE_PLAN_V1.md`.
- Updated descriptions for `overview.md`, `getting-started.md`, and `rbac-case-example.md`
  to reflect current content.
- Resolves Gap G-029 (missing MILESTONE_PLAN_V1.md entry).
- Ensures all new files from M09–M18 are indexed.

**Risks and Assumptions:**

| Severity | Entry |
| --- | --- |
| `info` | Decision artifacts (M09–M18) are not individually listed in README; they are in docs/decisions/ which is referenced via the MILESTONE_PLAN_V1.md entry. Individual decision artifact listing would make README too verbose. |

**Next Step:** M20 — Final is/should comparison + Framework release v1.0 approval.

---

## Decision log

```
date: 2026-03-24
decision: individual M09-M18 decision artifacts not listed individually in README
reason: decision artifacts are project-internal records, not primary reference documents; listing them individually would make README more than twice as long without proportional benefit for new users
decided-by: agent
refs: docs/decisions/M05_gap_analyse.md (G-029)
```
