# Phases

The operational core of DAD-M is a four-phase cycle that is repeated per milestone.

| Phase | Main goal | Typical artifacts | Boundary |
| --- | --- | --- | --- |
| Discover | Understand the current state | system overview, file inventory, dependencies, risks, open questions | no solution design |
| Apply | Design the solution | architecture, interfaces, data models, pseudocode, acceptance criteria | no implementation |
| Deploy | Build the approved design | code, documentation, scripts, configuration, implementation report, proofs | no new architecture decisions |
| Monitor | Validate and review | test results, error analysis, regression risks, recommended fixes | no silent scope expansion |

## Discover

Discover is an inventory phase. The goal is to gather facts and constraints before any design starts.

Expected outcomes:

- current-state summary
- relevant artifacts and dependencies
- risk list
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

## Monitor

Monitor checks whether the result works and what should happen next.

Expected outcomes:

- validation or test results
- problem analysis
- regression risks
- recommended fixes or next actions
