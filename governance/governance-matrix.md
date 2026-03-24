# Governance Matrix

The governance matrix defines which checks apply in which phase, and whether a finding
blocks phase progression or is advisory only.

## How to read the matrix

- **blocking** — a finding at the relevant severity level prevents the phase from closing
  until it is resolved or accepted via human decision.
- **advisory** — a finding is logged and visible but does not block the phase transition.

The matrix below represents the default configuration. Projects can adjust it in their
safety boundaries section, provided the change is explicitly approved.

The check areas listed below are governance categories, not module names. For the module
framework that operationalizes these checks in software implementations, see
`framework/core/modules.md`.

## Default matrix

| Check area | Discover | Apply | Deploy | Monitor |
| --- | --- | --- | --- | --- |
| Syntax and structural correctness | blocking | blocking | blocking | advisory |
| Security findings | blocking | blocking | blocking | blocking |
| Privacy / personal data | blocking | blocking | blocking | blocking |
| Scope compliance | blocking | blocking | blocking | blocking |
| Architecture consistency | advisory | blocking | blocking | advisory |
| Dependency changes | blocking | blocking | blocking | advisory |
| Dead code / unused artifacts | advisory | advisory | advisory | advisory |
| Style and convention | advisory | advisory | advisory | advisory |
| Test coverage quality | advisory | advisory | advisory | blocking |
| Change risk (high-impact paths) | advisory | advisory | blocking | blocking |
| Regression risk | — | — | advisory | blocking |

## Decision flow

When a check produces a finding, the governance decision follows this sequence:

```
finding received
    │
    ├─ severity: info or low
    │       → allow with notes (document, continue)
    │
    ├─ severity: medium
    │       → rework (fix before phase closes)
    │       → if repeated without resolution: escalate
    │
    ├─ severity: high
    │       → rework
    │       → if category override applies (security, privacy): human decision
    │       → if rework limit reached: human decision
    │
    └─ severity: critical
            → human decision (always)
```

## Category overrides

These override the default decision flow regardless of phase:

| Category | Override rule |
| --- | --- |
| Security | `high` and `critical` → human decision |
| Privacy | `medium`, `high`, `critical` → human decision |
| Scope violation | any severity → human decision |
| Cross-milestone change | any severity → human decision |
| Architecture decision in Deploy | any severity → stop, return to Apply |

## Advisory findings

Advisory findings are not ignored. They are:

- recorded in the phase output under Risks and Assumptions
- assigned a severity level
- reviewed during Monitor
- carried forward as inputs to the next Discover phase if unresolved

The distinction is that they do not halt the current phase.

## Relationship to other documents

- Severity definitions: `governance/severity-framework.md`
- Module framework (software implementation of check areas): `framework/core/modules.md`
- Human decision format: `framework/templates/human-decision-record.md`
- Rework and escalation rules: `governance/rework-and-escalation.md`
- Guardrails and triggers: `governance/guardrails.md`
