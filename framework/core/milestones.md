# Milestones

DAD-M uses milestones as the basic unit of work. Each milestone runs through Discover, Apply, Deploy, and Monitor in order.

## Milestone fields

A milestone is described through a stable set of fields:

- **goal** — what must be achieved, in one sentence
- **scope** — what is inside the boundary of this milestone
- **constraints** — fixed conditions that cannot be changed
- **deliverables** — which artifacts must exist when the milestone is complete (see also: *Milestone Deliverable* in `docs/glossary.md`)
- **acceptance criteria** — how success is checked
- **risks and assumptions** — known unknowns; each risk carries a severity label (`info` / `low` / `medium` / `high` / `critical`)
- **dependencies** — which milestones must be complete before this one starts; write `none` if there are none
- **priority** — see below

## Priority

| Level | Meaning |
| --- | --- |
| P1 | Required for the project to function; do first |
| P2 | Important but not immediately blocking |
| P3 | Useful improvement; can be deferred |

## Why milestones matter

Milestones keep the framework practical. They prevent one large, vague request from mixing analysis, design, implementation, and review in a single step.

## Milestone plan versioning

Milestone plans are stored in `docs/decisions/` and follow a version header:

```
version: <number>
status: draft | approved
date: <YYYY-MM-DD>
basis: <what this plan builds on>
```

An approved plan version is the baseline for the work that follows. If the plan changes significantly, increment the version and obtain a new approval before continuing. The old version remains on record.

See `framework/core/bootstrap.md` for the approval checkpoint that closes the plan before work begins.

## Minimal milestone checklist

Before work starts on a milestone, confirm all of the following:

- What has to be achieved?
- What is inside scope? What is outside scope?
- Which artifacts must exist at the end?
- How will success be checked?
- Which risks or unknowns are already visible, and what is their severity?
- Which milestones does this depend on?
- What is its priority?

## Iteration rule

The Monitor result for one milestone becomes input for the next Discover step. That is how the framework keeps continuity across longer projects.
