# Phases

The operational core of DAD-M is a four-phase cycle that is repeated per milestone.

| Phase | Main goal | Typical artifacts | Boundary |
| --- | --- | --- | --- |
| Discover | Understand the current state | system overview, file inventory, dependencies, risks, open questions | no solution design |
| Apply | Design the solution | architecture, interfaces, data models, pseudocode, acceptance criteria | no implementation |
| Deploy | Build the approved design | code, documentation, scripts, configuration, implementation report, proofs | no new architecture decisions |
| Monitor | Validate and review | test results, error analysis, regression risks, recommended fixes | no silent scope expansion |

## Phase states

Every active milestone has an explicit phase state at any point in time:

```
DISCOVER → APPLY → DEPLOY → MONITOR → COMPLETED
                                     ↘ AWAITING_HUMAN (when a trigger fires)
```

Record the current state in the milestone's phase output header. This makes it
unambiguous where the work stands without reading the full conversation history.

`AWAITING_HUMAN` is a pause state. No phase progresses until the human decision
artifact is recorded. See `guardrails.md` for triggers and `framework/templates/human-decision-record.md` for the format.

## Phase transition protocol

Before moving from one phase to the next, confirm:

1. All phase outputs for the current phase are recorded.
2. All `medium` or higher risks are addressed or explicitly accepted.
3. No `critical` findings are open.
4. No human decision is pending.
5. The phase output is marked as closed (moves to `immutable`).

Only then begin the next phase.

## Discover

Discover is an inventory phase. The goal is to gather facts and constraints before any design starts.

Expected outcomes:

- current-state summary
- relevant artifacts and dependencies
- risk list (with severity levels)
- open questions

## Apply

Apply converts the Discover results into a plan that can be implemented.

Expected outcomes:

- solution architecture
- data or interface design
- pseudocode or workflow plan
- updated acceptance criteria

## Deploy

Deploy turns the Apply design into working artifacts. The source material is explicit that this phase should not introduce new architecture decisions.

Expected outcomes:

- changed files
- implementation summary
- proof set
- acceptance checklist

All changes stay within the declared project scope. Any file or system not listed
in the scope declaration requires explicit approval before it is touched.

## Monitor

Monitor checks whether the result works and what should happen next.

Expected outcomes:

- validation or test results
- problem analysis
- regression risks
- recommended fixes or next actions

Monitor findings that reach `medium` severity or above feed back as risks into the
next milestone's Discover phase.
