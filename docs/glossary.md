# Glossary

This glossary defines all core terms used in the DAD-M framework. Each definition is
authoritative within this repository. When a term appears in any framework document,
it carries the meaning given here unless the document explicitly states otherwise.

Definitions are ordered alphabetically.

---

## Advisory

A finding that is logged and visible but does not block the current phase from closing.
Advisory findings are carried into the Risks and Assumptions section and reviewed during Monitor.
Compare: **Blocking**.

## Approval

A formal human confirmation that a specific artifact — most commonly the milestone plan —
is accepted and may be acted upon. An approval is version-bound: it applies to the
specific version of the artifact that was reviewed, not to later revisions.
See also: **Approval Record**, `framework/core/bootstrap.md`.

## Approval Record

An immutable artifact that documents the result of an **Approval** checkpoint.
Contains: artifact reference, plan version, status (approved / rejected / deferred),
date, and deciding party.

## Artifact

A documented, reviewable output produced during a milestone. Artifacts can be documents,
code, reports, prompts, configuration files, or any other persistent output.
Every artifact has a **Retention Class**.
Compare: **Deliverable** (the structured format for phase outputs).

## AWAITING_HUMAN

A pause state a milestone enters when a **Human Decision Trigger** fires.
No phase output is marked complete and no new phase begins until a **Human Decision Record**
is produced and recorded.

## Blocking

A finding that prevents the current phase from closing until it is resolved or
explicitly accepted via a **Human Decision**. Whether a finding is blocking depends
on the **Governance Matrix** configuration for the current phase.
Compare: **Advisory**.

## Bootstrap

The one-time setup process that precedes milestone work. Bootstrap establishes the
project brief, safety boundaries, scope declaration, and the milestone plan, and
obtains **Approval** before the first milestone begins.
See: `framework/core/bootstrap.md`.

## Decision Log

An append-only record of significant decisions made during a milestone.
Each entry contains: date, decision made, reason, deciding party (human or agent),
and artifact references. The decision log is part of every milestone's deliverables.
See: `framework/core/deliverables.md`.

## Deliverable (phase output)

The structured output of a completed phase. Standard fields: Status, Input Summary,
Artifacts, Risks and Assumptions, Next Step. Deploy adds: Implementation Summary,
Files Changed, Proofs, Acceptance Checklist.
Note: the term "deliverable" also appears in milestone planning with a different meaning —
see **Milestone Deliverable**.

## Escalation

The transfer of a finding or problem to a **Human Decision** when automatic resolution
is no longer appropriate. Escalation is triggered by reaching the **Rework Limit**,
a cross-milestone scope issue, or a module error state.
See: `governance/rework-and-escalation.md`.

## Finding

The output of a module or check: a specific observation about an artifact, classified
by **Severity** and **Category**. A finding includes: an identifier, severity, category,
optional location, and a human-readable message.

## Governance Matrix

A table that maps check areas (modules) to phases and specifies whether each is
**Blocking** or **Advisory** in that phase. The governance matrix is the primary
configuration point for phase-specific quality enforcement.
See: `governance/governance-matrix.md`.

## Guardrail

A behavioral rule that keeps the workflow reviewable and controlled. Guardrails define
what each phase may and may not do, and specify when the workflow must pause for
human review.
See: `governance/guardrails.md`.

## Human Decision

A formal decision made by a human in response to a **Human Decision Trigger**.
Documented in a **Human Decision Record**. Allowed responses: approve, reject, modify, defer.

## Human Decision Record

An immutable artifact that documents a **Human Decision**. Required fields: milestone,
phase, trigger, date, deciding party, summary, blocking reasons, options with risks,
recommended option, evidence references, decision, and notes.
Template: `framework/templates/human-decision-record.md`.

## Human Decision Trigger

One of six defined conditions that require a mandatory human decision before the
milestone can continue:
1. A critical severity finding in any phase
2. A high or critical security or privacy finding
3. A scope change crossing milestone boundaries
4. A dependency change not covered by the safety boundaries
5. The rework limit reached without resolution
6. A strategic architecture tradeoff with no clearly correct option
See: `governance/guardrails.md`.

## Immutable

A retention class for artifacts that cannot be changed after they are closed.
Immutable artifacts include: closed phase outputs, approved milestone plans,
approval records, and human decision records. If circumstances change, a new artifact
supersedes the old one; the original is not altered.
See: `framework/core/artifact-retention.md`.

## Iteration Rule

The rule that the Monitor output of one milestone becomes the Discover input of the
next milestone. This is how the framework maintains continuity across a project.
See: `framework/core/milestones.md`.

## Milestone

The basic unit of work in DAD-M. Each milestone runs through all four phases in order.
A milestone has: goal, scope, constraints, deliverables, acceptance criteria, risks and
assumptions, dependencies, and priority.

## Milestone Deliverable

The planned outputs listed in a milestone's definition — what artifacts must exist
when the milestone is complete. This is a planning field, not a phase output format.
Compare: **Deliverable (phase output)**.

## Module

A self-contained check unit that runs during one or more phases, receives input
artifacts, and produces a structured result with zero or more **Findings**.
Modules are registered in a module registry and configured via the **Governance Matrix**.
See: `framework/core/modules.md`.

## Phase

One of the four sequential work stages in a DAD-M milestone:
**Discover**, **Apply**, **Deploy**, **Monitor**.
Each phase has a narrow purpose, defined outputs, and explicit boundaries.
See: `framework/core/phases.md`.

## Phase State

The explicit current state of an active milestone:
`DISCOVER`, `APPLY`, `DEPLOY`, `MONITOR`, `COMPLETED`, `AWAITING_HUMAN`.
The phase state is recorded in the milestone's phase output header.

## Priority

A classification of a milestone's urgency relative to other milestones:
- `P1` — required for the project to function; do first
- `P2` — important but not immediately blocking
- `P3` — useful improvement; can be deferred

## Profile

A named configuration that activates a specific subset of modules and optionally
overrides severity defaults. Profiles adapt the governance intensity to the project
context without changing the core framework.
See: `framework/core/modules.md`.

## Proof

Concrete, reviewable evidence that a Deploy phase result is real and correct.
Examples: compile output, test results, grep results, screenshots, service status.
Proofs are listed in the Deploy phase output.

## Retention Class

The mutability category assigned to an artifact:
- `immutable` — cannot be changed after closing
- `versioned` — updated by creating new versions; old versions remain
- `mutable` — freely updatable during active work
See: `framework/core/artifact-retention.md`.

## Rework

An intra-phase correction loop triggered when a medium or high finding is identified
and the issue is within the current milestone's scope. Rework attempts to resolve the
finding before the phase closes. The number of attempts is limited by the **Rework Limit**.
See: `governance/rework-and-escalation.md`.

## Rework Limit

The maximum number of automatic rework attempts allowed for a single finding within
one phase. Default: 2. After the limit is reached, **Escalation** is triggered.

## Safety Boundaries

Project-specific rules defined during **Bootstrap** that govern what the workflow
may and may not do: allowed areas, forbidden areas, dependency change permissions,
network access permissions, and mandatory proof types.
Compare: **Scope Declaration** (the specific list of affected files/areas).

## Scope

The defined boundary of work for a milestone or project. Work outside the declared
scope requires explicit approval before it may proceed.

## Scope Declaration

An explicit list of files, folders, systems, or domains a project is allowed to
modify. Defined during **Bootstrap**. Any write outside the scope declaration is
treated as a scope violation and requires a **Human Decision** before proceeding.
See: `framework/core/bootstrap.md`.

## Severity

A five-level classification of a finding's seriousness:
`info` → `low` → `medium` → `high` → `critical`.
Severity determines the default governance response and whether escalation or
human decision is required.
See: `governance/severity-framework.md`.
