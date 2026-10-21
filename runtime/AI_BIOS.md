# AI BIOS

Runtime entry point for AI systems using DAD-M. Load the smallest document set that fits
the current task, phase, and profile; pull more only when the task requires it.
`AI_CONTEXT.md` is the one-file overview, not the runtime bootstrap.

## Load order

1. Use the profile the project declares (safety boundaries or workspace config; ask the
   human if the two differ); default `standard`.
2. Load the profile's cards and the route for the current activity from the load table.
3. Follow a card's pointers to canonical documents only when the card is insufficient.
4. For agent routing, capability discovery, Codex setup, or prompt-to-workflow
   translation, also load `runtime/bios.policy.md`, `runtime/bios.routing.yaml`, and the
   workspace's `bios.registry.json` (generated per workspace by
   `runtime/build_bios_registry.py`).

Load each document once per session. `runtime/file-registry.yaml` and
`runtime/profiles/*.yaml` hold the same load sets for tools; read them only to resolve a
question the table leaves open.

## Load table

Cards live in `runtime/cards/`.

| Profile | Use when | Auto-load |
| --- | --- | --- |
| `fast` | quick iteration, small scoped task | core-rules, phase-map, deliverables-min |
| `fastdev` | fast coding; one human-readable record per milestone | core-rules, fastdev-card |
| `development` | active project work, lighter governance | core-rules, phase-map, deliverables-min, governance-min |
| `standard` | default for normal milestone work | as `development` |
| `strict` | high assurance, auditability, sensitive environments | as `development`, plus human-decision-card, `governance/governance-matrix.md`, `governance/rework-and-escalation.md` |

| Activity | Route | Load | In `fastdev` |
| --- | --- | --- | --- |
| new project setup | `bootstrap` | bootstrap-card | same |
| fact gathering for the current milestone | `discover` | discover-card | nothing extra |
| solution design | `apply` | apply-card | nothing extra |
| approved implementation | `deploy` | deploy-card | nothing extra |
| validation and follow-up | `monitor` | monitor-card, review-card | review-card |
| pause, escalation, checkpoint | `human_decision` | human-decision-card, `governance/governance-matrix.md` | same |

## Rules

- Cards are summaries; `framework/` and `governance/` documents are canonical detail.
- Load `docs/examples/*`, `docs/integrations/*`, `docs/glossary.md`, `docs/methodology.md`,
  and `docs/software-reference.md` only on explicit request, and at most one overview
  (`README.md`, `AI_CONTEXT.md`, `docs/overview.md`, `docs/getting-started.md`).
- BIOS resolves and routes. Operative truth stays in `AGENTS.md`, `SKILL.md`,
  `.codex/config.toml`, and agent definitions; BIOS does not copy them.
- When a human decision trigger fires, load the `human_decision` route.
- Capability routing in Codex-native repos stays in the active phase and loads the control
  plane (step 4) on demand.
