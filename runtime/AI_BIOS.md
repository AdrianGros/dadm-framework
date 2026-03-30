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

For Codex-native repositories, BIOS also acts as a control plane for routing work to
repo-local capabilities. BIOS should resolve which repo rules, skills, agents, and
external capabilities are relevant. It must not become a second source of truth that
duplicates their instructions.

## Load order

1. Read `runtime/file-registry.yaml`.
2. Pick one profile: `fast`, `development`, `standard`, or `strict`.
3. Auto-load the card set for that profile.
4. Load route-specific cards for the current activity:
   `bootstrap`, `discover`, `apply`, `deploy`, `monitor`, or `human_decision`.
5. Escalate to reference documents only if the current card is insufficient.
6. If the task is about agent routing, Codex setup, capability discovery, or prompt-to-workflow
   translation, load the control-plane artifacts:
   `runtime/bios.policy.md`, `runtime/bios.routing.yaml`, and `runtime/bios.registry.json`.

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

### Runtime control plane

Load on demand when the repository uses Codex-native orchestration and capability routing:

- `runtime/bios.policy.md`
- `runtime/bios.routing.yaml`
- `runtime/bios.registry.json`

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
- Treat BIOS as a resolver and router, not a duplicate instruction store.
- Keep the operative source of truth in `AGENTS.md`, `SKILL.md`, `.codex/config.toml`,
  agent definitions, and capability-specific docs.
- If a human decision trigger fires, load `runtime/cards/human-decision-card.md` and
  `governance/governance-matrix.md`.

## Routing hints

- New project setup: `bootstrap`
- Fact gathering for current milestone: `discover`
- Solution design: `apply`
- Approved implementation: `deploy`
- Validation and follow-up: `monitor`
- Pause / escalation / checkpoint: `human_decision`
- Capability and routing resolution for Codex-native repos: stay in the active DAD-M phase,
  but load the runtime control-plane artifacts on demand
