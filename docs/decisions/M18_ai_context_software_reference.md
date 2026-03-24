# M18 — AI_CONTEXT.md + Software Reference

phase-state: COMPLETED
milestone-id: M18
date: 2026-03-24
status: closed

---

## Phase Output

**Status:** complete

**Input Summary:**
Gap matrix from M05 (G-032 — missing AI_CONTEXT.md and docs/software-reference.md).
All prior milestone outputs (M09–M17) representing the corrected framework state.

**Artifacts produced:**

| Artifact | Retention |
| --- | --- |
| `AI_CONTEXT.md` (new) | `versioned` |
| `docs/software-reference.md` (new) | `versioned` |
| This decision document | `immutable` |

**Changes made:**

### `AI_CONTEXT.md` (new, G-032)
- Compact, structured summary of the entire DAD-M framework designed for AI system
  ingestion at conversation start.
- Covers: design assumption, phases, phase state machine, milestone fields, severity
  scale, governance (triggers, rework loop), artifact retention, policy files, module
  system, standard phase output format, bootstrap sequence, key file index.
- All concepts link to their authoritative source document.
- Resolves G-032 (primary goal: software reference document).

### `docs/software-reference.md` (new, G-032)
- Authoritative integration guide for software implementations.
- Covers: phase state machine with transition rules, human decision trigger conditions
  (HDT-01 to HDT-06 with IDs), module interface contract (JSON schema), governance
  matrix integration, severity action mapping (decision tree), rework loop (pseudocode),
  phase output schema (JSON), human decision record schema (JSON), scope enforcement,
  artifact retention enforcement, profile configuration.
- All schemas use JSON format for machine parseability.
- Architecture decision in Deploy explicitly noted as `block` action (not human_decision).
- Resolves G-032 (software reference as integration contract).

**Risks and Assumptions:**

| Severity | Entry |
| --- | --- |
| `low` | Software-reference.md uses JSON schema notation for interfaces; actual implementations may use JSON Schema 2020-12 formally — this document provides the structure, not a formal schema file. |
| `info` | Human decision trigger IDs (HDT-01 to HDT-06) are introduced here; they are not currently referenced in guardrails.md. This is acceptable — HDT IDs are a software implementation convenience, not a framework requirement. |

**Next Step:** M19 — README finalization.

---

## Decision log

```
date: 2026-03-24
decision: AI_CONTEXT.md placed at repository root, not in docs/
reason: root-level placement ensures AI systems that load repository context see it first; docs/ placement would require explicit navigation
decided-by: agent
refs: docs/decisions/M05_gap_analyse.md (G-032)
```

```
date: 2026-03-24
decision: human decision trigger IDs (HDT-01 to HDT-06) introduced in software-reference.md as implementation convenience
reason: software systems benefit from stable identifiers for trigger conditions; the IDs map directly to the six triggers in guardrails.md without changing the governance document itself
decided-by: agent
refs: governance/guardrails.md (Human decision triggers), docs/software-reference.md
```
