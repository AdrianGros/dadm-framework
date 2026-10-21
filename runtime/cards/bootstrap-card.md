# Bootstrap Card

## Goal

Initialize a project before milestone execution starts.

## Required sequence

1. Project brief
2. Safety boundaries, including the active profile (`fast`, `fastdev`, `development`,
   `standard`, `strict`; default `standard`)
3. Scope declaration
4. Milestone plan
5. Plan approval
6. Working mode
7. Discover for `M1`

## Required checkpoint

Do not start `M1` before a milestone plan approval artifact with `status: approved` exists.

## Working rules

- For safety boundaries, recommend the most restrictive option (no dependency changes, no
  network access); only the human widens them.
- Size each milestone as a vertical slice: verifiable on its own, and small enough that
  each phase fits one fresh session.

## Use when

- starting a new project
- restarting a project with unclear setup state
- re-baselining after major plan changes

## Load deeper docs if needed

- `framework/core/bootstrap.md` for the setup questions and the approval format
- `framework/core/milestones.md` for milestone fields and sizing
