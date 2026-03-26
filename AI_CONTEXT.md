# AI_CONTEXT — DAD-M Framework

This file is the compact repository summary for humans and AI systems that want one
general overview. For runtime-first AI loading, start with `runtime/AI_BIOS.md`.
That file chooses the smallest useful document set for the current task, phase,
and strictness profile.

For human-readable introduction, see `docs/overview.md`.
For methodological positioning, see `docs/methodology.md`.
For software integration, see `docs/software-reference.md`.

---

## What DAD-M is

DAD-M is a structured workflow method for AI-assisted project work. It is built on
one central design assumption:

> AI-assisted project work is easier to review, reproduce, and correct when analysis,
> design, implementation, and validation are kept in separate, documented steps rather
> than mixed in a single interaction.

This is a design assumption, not an empirically verified claim.

---

## Core structure

### Phases (authoritative: `framework/core/phases.md`)

Every milestone runs through four phases in order:

| Phase | Purpose | Boundary |
| --- | --- | --- |
| DISCOVER | Facts and inventory only | No solution design |
| APPLY | Design the solution | No implementation |
| DEPLOY | Build the approved design | No new architecture decisions |
| MONITOR | Validate and review | No silent scope expansion |

### Phase state machine

```
DISCOVER → APPLY → DEPLOY → MONITOR → COMPLETED
                                     ↘ AWAITING_HUMAN
```

`AWAITING_HUMAN` is a pause state. No phase progresses until a human decision artifact
is recorded.

### Milestones (authoritative: `framework/core/milestones.md`)

A milestone is the basic unit of work. Required fields: goal, scope, constraints,
deliverables, acceptance criteria, risks (with severity), dependencies, priority.

Priority levels: P1 (required), P2 (important), P3 (deferrable).

---

## Severity scale (authoritative: `governance/severity-framework.md`)

| Level | Default action |
| --- | --- |
| `info` | allow_with_notes |
| `low` | allow_with_notes |
| `medium` | rework |
| `high` | rework (escalate if repeated or category override) |
| `critical` | human_decision (always) |

The `medium`/`high` threshold is the action gate: both must be resolved or explicitly
accepted before the next phase begins.

---

## Governance (authoritative: `governance/guardrails.md`, `governance/governance-matrix.md`)

### Human decision triggers (6 mandatory)

1. `critical` severity finding in any phase
2. `high` or `critical` security or privacy finding
3. Cross-milestone scope change
4. Dependency change not in safety boundaries
5. Rework limit reached without resolution
6. Strategic architecture tradeoff with no clearly correct option

### Rework loop

Default limit: 2 attempts per finding per phase. Exceeded limit → escalate → human decision.
Operative form: `governance/policies/rework-policy.yaml`.

---

## Artifacts and retention (authoritative: `framework/core/artifact-retention.md`)

| Class | Meaning |
| --- | --- |
| `immutable` | Written once; cannot be altered after closing |
| `versioned` | Updated by creating new versions; old versions remain |
| `mutable` | Freely updated during active work |

Closed phase outputs and human decision records are always `immutable`.

---

## Policy files (authoritative: `governance/policies/`)

Machine-readable operative forms of governance rules:

| File | Governs |
| --- | --- |
| `severity-policy.yaml` | Severity levels and category overrides |
| `human-decision-policy.yaml` | Human decision triggers and format |
| `rework-policy.yaml` | Rework conditions, limit, escalation |
| `approval-policy.yaml` | Milestone plan approval artifact |
| `scope-policy.yaml` | Scope declaration and violation handling |

Action vocabulary: `allow` | `allow_with_notes` | `rework` | `escalate` | `block` | `human_decision`

---

## Module system (authoritative: `framework/core/modules.md`)

Modules are self-contained checks that run during one or more phases. Each module:
- receives input artifacts
- produces structured findings with severity levels
- maps to the governance matrix (blocking or advisory per phase)

Default profile: `standard`. Override in safety boundaries with `active-profile: <name>`.

---

## Standard phase output format (authoritative: `framework/core/deliverables.md`)

Every phase output must contain:
- Status (in progress / complete / blocked / awaiting human decision)
- Input Summary
- Artifacts (with retention class)
- Risks and Assumptions (with severity labels)
- Next Step

Deploy phase adds: Implementation Summary, Files Changed, Proofs, Acceptance Checklist.

---

## Runtime loading (authoritative: `runtime/AI_BIOS.md`, `runtime/file-registry.yaml`)

Use runtime cards as the default loading surface:

- `runtime/cards/core-rules.md`
- `runtime/cards/phase-map.md`
- `runtime/cards/deliverables-min.md`
- `runtime/cards/governance-min.md`

Load route cards for `bootstrap`, `discover`, `apply`, `deploy`, `monitor`, or
`human_decision`. Full framework and governance documents are on-demand references,
not the default runtime load.

Never auto-load: `docs/examples/*`, `docs/glossary.md`, `docs/methodology.md`,
`docs/software-reference.md`.

## Bootstrap sequence (authoritative: `framework/core/bootstrap.md`)

1. Project brief
2. Safety boundaries
3. Scope declaration
4. Milestone plan
5. Plan approval (immutable artifact — first artifact of the project)
6. Working mode
7. Discover for M1

Operational prompt templates for each step (two-phase setup, prompt chain through M1 Apply)
are in `framework/core/bootstrap.md` under "Operational prompt templates".

---

## Key file index

| What you need | Where to find it |
| --- | --- |
| Phase definitions | `framework/core/phases.md` |
| Milestone fields | `framework/core/milestones.md` |
| Phase output format | `framework/core/deliverables.md` |
| Bootstrap sequence | `framework/core/bootstrap.md` |
| Module interface | `framework/core/modules.md` |
| Artifact retention | `framework/core/artifact-retention.md` |
| Severity scale | `governance/severity-framework.md` |
| Human decision triggers | `governance/guardrails.md` |
| Governance matrix | `governance/governance-matrix.md` |
| Rework rules | `governance/rework-and-escalation.md` |
| Policy files | `governance/policies/` |
| Human decision template | `framework/templates/human-decision-record.md` |
| Discover output template | `framework/templates/discover-output.md` |
| Apply output template | `framework/templates/apply-output.md` |
| Rework plan template | `framework/templates/rework-plan.md` |
| Glossary | `docs/glossary.md` |
| Software integration guide | `docs/software-reference.md` |
| Methodology overview | `docs/methodology.md` |
| Quality criteria | `governance/document-quality.md` |
| Change process | `governance/framework-change-process.md` |
