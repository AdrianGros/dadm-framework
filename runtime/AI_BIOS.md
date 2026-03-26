# AI BIOS

This is the runtime entry point for AI systems using the DAD-M framework.
Do not start by loading the whole repository. Start here, choose the smallest
useful load profile, and pull additional documents only when the task requires them.

`AI_CONTEXT.md` remains the general summary for humans and AI systems that want a
single overview. It is no longer the preferred runtime bootstrap document.

## Runtime goal

Load only the documents needed for the current task, phase, and strictness mode.
Prefer short runtime cards for active work. Use the full framework documents only
when a card points to them or the task requires canonical detail.

## Load order

1. Read `runtime/file-registry.yaml`.
2. Pick one profile: `fast`, `development`, `standard`, or `strict`.
3. Auto-load the card set for that profile.
4. Load route-specific cards for the current activity:
   `bootstrap`, `discover`, `apply`, `deploy`, `monitor`, or `human_decision`.
5. Escalate to reference documents only if the current card is insufficient.

## Profile guidance

| Profile | Use when |
| --- | --- |
| `fast` | quick iteration, small scoped task, minimal process overhead |
| `development` | active project work with lighter governance load |
| `standard` | default balanced mode for normal milestone work |
| `strict` | high assurance, auditability, or sensitive environments |

If no profile is declared in project safety boundaries, use `standard`.

## Document classes

### Runtime-canonical

Default loading surface for day-to-day execution:

- `runtime/cards/core-rules.md`
- `runtime/cards/phase-map.md`
- `runtime/cards/deliverables-min.md`
- `runtime/cards/governance-min.md`
- phase cards in `runtime/cards/`

### Reference-canonical

Load on demand when runtime cards are not enough:

- `framework/core/phases.md`
- `framework/core/milestones.md`
- `framework/core/deliverables.md`
- `framework/core/bootstrap.md`
- `governance/governance-matrix.md`
- `governance/rework-and-escalation.md`
- `governance/guardrails.md`

### Human and explanatory docs

Useful for onboarding and context, not default runtime loads:

- `README.md`
- `AI_CONTEXT.md`
- `docs/overview.md`
- `docs/getting-started.md`

### Cold storage / opt-in

Never auto-load these unless explicitly needed:

- `docs/examples/*`
- `docs/glossary.md`
- `docs/methodology.md`
- `docs/software-reference.md`

## Runtime rules

- Do not auto-load examples, glossary, methodology, or software reference.
- Do not load multiple overview documents to restate the same core assumption.
- Treat runtime cards as summaries; treat framework and governance docs as canonical detail.
- If a human decision trigger fires, load `runtime/cards/human-decision-card.md` and
  `governance/governance-matrix.md`.

## Routing hints

- New project setup: `bootstrap`
- Fact gathering for current milestone: `discover`
- Solution design: `apply`
- Approved implementation: `deploy`
- Validation and follow-up: `monitor`
- Pause / escalation / checkpoint: `human_decision`
