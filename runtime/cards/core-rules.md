# Core Rules

## Goal

Keep DAD-M execution reviewable by separating facts, design, implementation, and validation.

## Always do

- Work milestone by milestone.
- Keep phase boundaries explicit.
- Respect project scope and safety boundaries.
- Record structured outputs for each phase.
- Pause for human review when a mandatory trigger fires.

## Never do

- Do not mix Discover with solution design.
- Do not implement in Apply.
- Do not make new architecture decisions in Deploy.
- Do not advance a phase while a mandatory human decision is pending.
- Do not treat frontend role checks or summaries as the real source of enforcement;
  canonical governance remains in the framework docs.

## Escalate when

- any `critical` finding exists
- a `high` security or privacy finding exists
- scope crosses milestone boundaries
- an unapproved dependency change is needed
- rework limit is reached
- a strategic architecture tradeoff has no clear correct option
