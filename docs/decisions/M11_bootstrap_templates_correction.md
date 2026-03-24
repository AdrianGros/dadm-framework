# M11 — Bootstrap + Templates Formulierungskorrektur

phase-state: COMPLETED
milestone-id: M11
date: 2026-03-24
status: closed

---

## Phase Output

**Status:** complete

**Input Summary:**
Gap matrix from M05. Primary gaps addressed: G-020, G-021, G-023.
G-021 was tagged M10 but not completed there; addressed here with a note in the M10
decision log that it was carried forward.

**Artifacts produced:**

| Artifact | Retention |
| --- | --- |
| `framework/core/bootstrap.md` (updated) | `versioned` |
| `governance/rework-and-escalation.md` (updated) | `versioned` |
| `governance/policies/rework-policy.yaml` (new) | `versioned` |
| `governance/policies/approval-policy.yaml` (new) | `versioned` |
| `governance/policies/scope-policy.yaml` (new) | `versioned` |
| `governance/policies/README.md` (updated) | `versioned` |
| This decision document | `immutable` |

**Changes made:**

### `framework/core/bootstrap.md` (G-023)
- Added explicit `immutable` retention class reference with link to `artifact-retention.md`
  in the Approval checkpoint section — resolves Gap G-023.
- Added reference to new `governance/policies/approval-policy.yaml` as the operative
  form of the approval rule.

### `governance/rework-and-escalation.md` (G-021)
- Added cross-reference to `framework/core/deliverables.md` after the `rework-attempt:`
  format definition — clarifies where rework attempt records appear in phase outputs.
- Added retention class `immutable` for rework attempt records.

### `governance/policies/rework-policy.yaml` (new, G-020 — rework policy)
- Operative form of `governance/rework-and-escalation.md`.
- Defines: default rework limit (2), rework conditions (4), escalation triggers (4),
  escalation action (`human_decision`), rework attempt record required fields.

### `governance/policies/approval-policy.yaml` (new, G-020 — approval policy)
- Operative form of the Approval checkpoint in `framework/core/bootstrap.md`.
- Defines: required and optional fields, allowed status values, rules.

### `governance/policies/scope-policy.yaml` (new, G-020 — scope policy)
- Operative form of scope compliance rules from `governance/guardrails.md` and
  `framework/core/bootstrap.md`.
- Defines: scope declaration format, scope violation default action (`human_decision`),
  allowed scope change artifact, cross-milestone scope change trigger.

### `governance/policies/README.md`
- Added three new policy files to the file table.

**Risks and Assumptions:**

| Severity | Entry |
| --- | --- |
| `info` | G-021 was tagged M10 but carried into M11; the M10 decision artifact does not list it. This is a tracking gap only — the fix is now in place. |
| `low` | The three new YAML policies introduce new machine-readable rules; any software implementations must be updated to parse and enforce them. |

**Next Step:** M12 — Docs correction (`overview.md`, `getting-started.md`, `use-cases.md`).

---

## Decision log

```
date: 2026-03-24
decision: G-021 addressed in M11 rather than M10 as originally tagged
reason: M10 was closed before G-021 was identified as outstanding; carrying it forward preserves the immutability of the M10 decision artifact while still resolving the gap
decided-by: agent
refs: docs/decisions/M05_gap_analyse.md (G-021), docs/decisions/M10_governance_correction.md
```

```
date: 2026-03-24
decision: scope-policy.yaml references both guardrails.md and bootstrap.md as Markdown counterparts
reason: scope compliance spans two documents; both are listed in the YAML header comment and the policies README for traceability
decided-by: agent
refs: docs/decisions/M05_gap_analyse.md (G-020)
```
