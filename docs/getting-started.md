# Getting Started

This is the shortest path to using DAD-M on a new project.

If an AI system is loading runtime context, start with `runtime/AI_BIOS.md` and
follow the registry/profile flow instead of loading multiple onboarding documents.

## 1. Create the project brief

Capture the minimum context before any design work starts:

- project name
- goal in one sentence
- measurable end state
- technologies or environment
- timeframe if relevant
- non-goals
- specific ideas 

## 2. Set safety boundaries

Decide what the AI-assisted workflow may and may not touch:

- allowed areas
- forbidden areas
- whether dependency changes are allowed
- whether network access is allowed
- which proofs are required

## 3. Declare scope

List the specific files, folders, systems, or domains this project is allowed to touch.
Anything not listed is off limits by default. This is the scope declaration — write it
before the milestone plan, because the milestone plan references it.

## 4. Build the milestone plan

DAD-M uses a milestone model rather than one large task. A typical project has 10 to 20
milestones, each with:

- goal
- scope
- deliverables
- acceptance criteria
- risks (each with a severity label: `info` / `low` / `medium` / `high` / `critical`)
- dependencies (which milestones must complete before this one starts; write `none` if there are none)
- priority (P1 = required to function; P2 = important but not blocking; P3 = deferrable)

## 5. Obtain plan approval

After the milestone plan is written, record an approval artifact before starting M1:

```
artifact: milestone-plan-approval
plan-version: <version>
status: approved | rejected | deferred
date: <YYYY-MM-DD>
decided-by: <name or role>
```

This artifact is immutable. Work on M1 must not begin without an approved plan.
See `governance/policies/approval-policy.yaml` for the operative rules.

## 6. Run the first cycle

For milestone M1, work through the four phases in order:

1. Discover: inventory the current state and identify risks.
2. Apply: design the solution within the discovered facts.
3. Deploy: implement the approved design and record proofs.
4. Monitor: validate the result and capture follow-up actions.

## 7. Repeat per milestone

The Monitor output is not the end of the method. It becomes the starting point for the next Discover step.

## Practical starting point

Use [runtime/cards/bootstrap-card.md](../runtime/cards/bootstrap-card.md) for the shortest runtime setup path, [framework/core/bootstrap.md](../framework/core/bootstrap.md) for the full setup template, and [framework/core/deliverables.md](../framework/core/deliverables.md) as the reporting format.

For a public technical milestone example, review [docs/examples/rbac-case-example.md](examples/rbac-case-example.md).
