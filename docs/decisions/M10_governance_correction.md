# M10 — Governance Documents Formulierungskorrektur

phase-state: COMPLETED
milestone-id: M10
date: 2026-03-24
status: closed

---

## Phase Output

**Status:** complete

**Input Summary:**
Gap matrix from M05 (34 gaps), consistency audit from M03, terminology inventory from M02.
Primary gaps addressed: G-001, G-005, G-006, G-012, G-018, G-028.

**Artifacts produced:**

| Artifact | Retention |
| --- | --- |
| `governance/policies/severity-policy.yaml` (updated) | `versioned` |
| `governance/governance-matrix.md` (updated) | `versioned` |
| `governance/quality-principles.md` (updated) | `versioned` |
| `governance/evidence-policy.md` (updated) | `versioned` |
| `governance/severity-framework.md` (updated) | `versioned` |
| `governance/guardrails.md` (updated) | `versioned` |
| This decision document | `immutable` |

**Changes made:**

### `governance/policies/severity-policy.yaml` (version bump: 1 → 2)
- Replaced `stop_return_to_apply` with `block` across all `architecture_decision_in_deploy`
  severity entries — resolves Gap G-001. The `block` action is defined in the action
  vocabulary (`document-quality.md`); the comment clarifies the redirect behavior.
- Replaced `any:` YAML keys in `scope_violation` and `cross_milestone_change` with
  explicit per-level entries (`info` through `critical`) — resolves Gap G-028.
- Added action vocabulary comment in file header for future maintainers.

### `governance/governance-matrix.md`
- Added explanatory note distinguishing "check areas" (governance categories) from
  "modules" (software implementation extension points) with cross-reference to
  `framework/core/modules.md` — resolves Gap G-018.
- Added `framework/core/modules.md` to "Relationship to other documents" section.

### `governance/quality-principles.md`
- Rewrote all six principles with normative language ("must", "must not") and
  cross-references to the relevant framework and governance documents — resolves Gap G-006.
- Added "Relationship to other documents" section.
- Added glossary cross-reference.

### `governance/evidence-policy.md`
- Removed project-specific source hierarchy referencing "DAD-M starter-kit material"
  and "explicit context supplied for the curation task" — resolves Gap G-005.
- Replaced with a general evidence hierarchy applicable to any DAD-M project.
- Added a claims-strength table mapping evidence levels to allowed phrasing.
- Added rule: deployment-specific usage statements belong in `docs/methodology.md`,
  not in general governance documents.
- Added "Relationship to other documents" section.

### `governance/severity-framework.md`
- Updated "Architecture decision in Deploy" override from "stop and return to Apply"
  to "block Deploy; redirect to Apply" — language now matches the `block` action
  in the YAML policy.
- Added explanatory paragraph clarifying that this override is deterministic (not
  a human decision trigger) and maps to `block` in policy files.

### `governance/guardrails.md`
- Added "(scope compliance)" annotation to the "work only inside the allowed files,
  folders, or systems" rule.
- Added cross-reference to `framework/core/modules.md` for software enforcement of
  scope compliance — resolves Gap G-012.

**Risks and Assumptions:**

| Severity | Entry |
| --- | --- |
| `info` | `severity-policy.yaml` bumped to version 2; any software implementation parsing version 1 must be updated. |
| `low` | `evidence-policy.md` no longer contains the Deutsche Telekom usage statement; it remains in `docs/methodology.md` (existing). No information is lost. |
| `low` | `quality-principles.md` now uses normative language ("must"); this is a stricter formulation than the previous advisory form. Existing project uses should be checked for compliance. |

**Next Step:** M11 — Bootstrap + Templates Formulierungskorrektur.

---

## Decision log

```
date: 2026-03-24
decision: architecture_decision_in_deploy maps to action "block" in severity-policy.yaml, not a custom action "stop_return_to_apply"
reason: G-001 identified stop_return_to_apply as outside the defined action vocabulary; block is the closest valid equivalent with a comment clarifying the redirect semantics
decided-by: agent
refs: docs/decisions/M05_gap_analyse.md (G-001), governance/policies/README.md (action vocabulary)
```

```
date: 2026-03-24
decision: any: YAML keys replaced with explicit per-level entries in severity-policy.yaml
reason: G-028 identified "any:" as semantically unclear in YAML; explicit level entries are unambiguous and parseable by standard YAML tools
decided-by: agent
refs: docs/decisions/M05_gap_analyse.md (G-028)
```

```
date: 2026-03-24
decision: evidence-policy.md generalized; project-specific usage statement removed from this document
reason: G-005 identified project-specific language in a general governance document; usage statement is already in docs/methodology.md where it belongs
decided-by: agent
refs: docs/decisions/M05_gap_analyse.md (G-005), docs/methodology.md
```
