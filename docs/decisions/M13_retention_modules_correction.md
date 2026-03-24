# M13 — Artifact-Retention + Modules Correction

phase-state: COMPLETED
milestone-id: M13
date: 2026-03-24
status: closed

---

## Phase Output

**Status:** complete

**Input Summary:**
Gap matrix from M05. Gaps tagged M13: G-022, G-034.

**Artifacts produced:**

| Artifact | Retention |
| --- | --- |
| `framework/core/modules.md` (updated) | `versioned` |
| This decision document | `immutable` |

**Changes made:**

### `framework/core/artifact-retention.md` (G-022)
No change required. G-022 was resolved in M09: the "Relationship to other documents"
section with three outgoing cross-references was added then. Verified current state is
complete.

### `framework/core/modules.md` (G-034)
- Added justification paragraph for the `standard` default profile after the "If no
  profile is declared, `standard` applies" statement.
- Explains: `standard` is a conservative middle ground, not the least restrictive
  option. `strict` must be declared explicitly for regulated environments; `development`
  or `fast` must be declared explicitly for reduced strictness.
- Resolves Gap G-034 (default profile without rationale).

**Risks and Assumptions:**

| Severity | Entry |
| --- | --- |
| `info` | G-022 resolved in M09; confirmed by reading current artifact-retention.md state. No action required here. |
| `info` | The `standard` profile rationale is a design decision recorded in the document. It is not empirically validated; it is a stated design intent (consistent with WH dimension: claim is now marked as a design choice, not a fact). |

**Next Step:** M14 — Wissenschaftliche Härtung (evidence-based hardening of normative claims).

---

## Decision log

```
date: 2026-03-24
decision: G-022 closed in M09, not re-addressed in M13
reason: M09 decision artifact confirms artifact-retention.md received outgoing cross-references; re-applying the same change would violate the immutability principle (create redundant edits)
decided-by: agent
refs: docs/decisions/M09_core_correction.md, docs/decisions/M05_gap_analyse.md (G-022)
```

```
date: 2026-03-24
decision: standard profile rationale framed as design intent, not empirical claim
reason: G-034 was a WH-dimension gap; the fix must not introduce a stronger claim than the evidence supports; "design choice" and "intended to represent" are appropriately hedged
decided-by: agent
refs: docs/decisions/M05_gap_analyse.md (G-034), governance/evidence-policy.md
```
