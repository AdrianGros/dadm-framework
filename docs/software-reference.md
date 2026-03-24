# Software Reference

This document is the authoritative integration guide for software implementations
of the DAD-M framework. It defines the contracts, data structures, and behavioral
rules that software must implement to be considered DAD-M-compliant.

For a compact AI-readable summary, see `AI_CONTEXT.md`.
For human introduction, see `docs/overview.md`.

---

## Scope of this document

This document covers:

- Phase state machine and transition rules
- Module interface contract
- Policy file schema and action vocabulary
- Phase output format
- Human decision artifact format
- Severity handling rules
- Scope enforcement requirements

It does not cover:
- AI model selection or configuration
- Prompt engineering
- Domain-specific rule sets
- Organization-specific compliance requirements

---

## Phase state machine

### States

```
CREATED → DISCOVER → APPLY → DEPLOY → MONITOR → COMPLETED
                                              ↘ AWAITING_HUMAN
```

A milestone must move through states in this order. Skipping states is not permitted.
`AWAITING_HUMAN` is reachable from any active phase state when a human decision trigger fires.

### State transition rules

Before transitioning from any phase to the next, the following conditions must all hold:

1. Phase output is recorded with Status = complete
2. No open finding at `medium` severity or above (unresolved or unaccepted)
3. No `critical` finding open
4. No human decision pending
5. Phase output artifact is closed (retention class transitions to `immutable`)

If condition 4 is violated, the milestone enters `AWAITING_HUMAN` state.

### AWAITING_HUMAN behavior

- No phase may progress while in this state
- The state exits when a human decision record artifact is created and contains a decision value
- Allowed decision values: `approve` | `reject` | `modify` | `defer`
- `reject` returns the work to Apply (or Discover if the decision requires it)
- `defer` must include a condition or date for revisit

---

## Human decision trigger conditions

A software implementation must check for these conditions and enter `AWAITING_HUMAN`
when any fires:

| Trigger ID | Condition |
| --- | --- |
| HDT-01 | Any finding with severity = `critical` |
| HDT-02 | Any finding with category in {`security`, `privacy`} and severity in {`high`, `critical`} |
| HDT-03 | Any scope change that crosses milestone boundaries |
| HDT-04 | Any dependency change not listed in the approved safety boundaries |
| HDT-05 | Rework attempt counter >= rework limit without `result: resolved` |
| HDT-06 | A module produces a finding with category `strategic_architecture_tradeoff` |

Operative form: `governance/policies/human-decision-policy.yaml`

---

## Module interface contract

Every module must conform to this interface regardless of implementation language.

### Input

```json
{
  "phase": "DISCOVER | APPLY | DEPLOY | MONITOR",
  "artifacts": ["<artifact reference>"]
}
```

### Output

```json
{
  "module_name": "<string>",
  "module_version": "<semver>",
  "phase": "<phase>",
  "findings": [
    {
      "id": "<unique within this result>",
      "severity": "info | low | medium | high | critical",
      "category": "<string>",
      "location": "<optional: file, line, or artifact reference>",
      "message": "<human-readable description>"
    }
  ]
}
```

If no findings, return `"findings": []` — not an error or null.

### Module registry format

```yaml
modules:
  - name: <module-name>
    version: <semver>
    active: true | false
    phases: [DISCOVER, APPLY, DEPLOY, MONITOR]
```

A module not in the registry does not run, even if installed.

---

## Governance matrix integration

Each module finding must be evaluated against the governance matrix
(`governance/governance-matrix.md`) to determine if it is blocking or advisory
for the current phase.

If a module is not in the governance matrix, treat all its findings as `advisory`
until the matrix is updated.

---

## Severity action mapping

Process findings using this decision tree, after consulting `governance/policies/severity-policy.yaml`:

```
finding.severity == info or low  →  allow_with_notes
finding.severity == medium        →  rework
finding.severity == high          →  rework
  + if category_override applies  →  human_decision
  + if rework_limit_reached       →  human_decision
finding.severity == critical      →  human_decision (always)
```

Category override rules are defined in `governance/policies/severity-policy.yaml`.

For `architecture_decision_in_deploy`: action = `block` (halt Deploy; redirect to Apply).
This is deterministic — it does not require a human decision unless other triggers also fire.

---

## Rework loop

```
finding_received (medium or high)
  attempt += 1
  if attempt > rework_limit:
    → escalate → human_decision
  else:
    → apply fix → re-evaluate finding
    if finding.result == resolved:
      → continue
    else:
      → increment attempt → loop
```

Default `rework_limit`: 2. Override via `rework-limit: <number>` in safety boundaries.

Operative form: `governance/policies/rework-policy.yaml`

---

## Phase output schema

Every phase output artifact must contain these fields:

```json
{
  "phase": "DISCOVER | APPLY | DEPLOY | MONITOR",
  "milestone_id": "<string>",
  "status": "in_progress | complete | blocked | awaiting_human_decision",
  "input_summary": "<string>",
  "artifacts": [
    {
      "name": "<string>",
      "retention": "immutable | versioned | mutable"
    }
  ],
  "risks_and_assumptions": [
    {
      "severity": "info | low | medium | high | critical",
      "description": "<string>"
    }
  ],
  "next_step": "<string>"
}
```

Deploy phase adds: `implementation_summary`, `files_changed`, `proofs`, `acceptance_checklist`.

---

## Human decision record schema

When a human decision trigger fires, the implementation must create an artifact with
these fields (all required):

```json
{
  "artifact": "human-decision-record",
  "milestone": "<string>",
  "phase": "<phase>",
  "trigger": "<trigger ID from HDT-01 to HDT-06>",
  "date": "<YYYY-MM-DD>",
  "decided_by": "<name or role>",
  "summary": "<string>",
  "blocking_reasons": ["<string>"],
  "options": [
    {
      "option": "<string>",
      "risks": "<string>"
    }
  ],
  "recommended_option": "<string>",
  "evidence_refs": ["<string>"],
  "decision": "approve | reject | modify | defer",
  "decision_notes": "<string>"
}
```

Retention class: `immutable`. Template: `framework/templates/human-decision-record.md`.

---

## Scope enforcement

Scope declaration must be recorded at bootstrap and enforced throughout all phases.

- Any write to a file, folder, or system not in the scope declaration is a scope violation.
- Scope violations trigger human decision (HDT-03).
- Scope extensions require a human decision record before the extension is active.

Operative form: `governance/policies/scope-policy.yaml`

---

## Artifact retention enforcement

| Class | Enforcement requirement |
| --- | --- |
| `immutable` | Write once. After closing, reject any modification attempt. |
| `versioned` | New version creates a new artifact. Old version remains unmodified. |
| `mutable` | Free update allowed while artifact status is `active`. |

---

## Profile configuration

The active profile controls which modules run and at what strictness level.
Declare in safety boundaries:

```
active-profile: standard | strict | development | fast
```

If not declared, `standard` applies.

---

## Relationship to other documents

- Phase definitions: `framework/core/phases.md`
- Milestone fields: `framework/core/milestones.md`
- Severity rules: `governance/severity-framework.md`
- Module framework: `framework/core/modules.md`
- Policy files: `governance/policies/`
- Glossary: `docs/glossary.md`
- AI_CONTEXT (compact summary): `AI_CONTEXT.md`
