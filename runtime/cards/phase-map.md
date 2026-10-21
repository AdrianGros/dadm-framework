# Phase Map

## Sequence

`DISCOVER -> APPLY -> DEPLOY -> MONITOR -> COMPLETED`

`AWAITING_HUMAN` may interrupt any active phase.

## Per-phase boundary

### Discover

- Goal: collect facts, current state, constraints, risks, open questions
- Forbidden: solution design, architecture choice, implementation

### Apply

- Goal: design the solution inside discovered constraints
- Forbidden: implementation, hidden scope expansion

### Deploy

- Goal: implement the approved design and capture proofs
- Forbidden: new architecture decisions, silent dependency or scope changes

### Monitor

- Goal: validate outcomes, regressions, and next actions
- Forbidden: silent feature expansion or undocumented fixes

## Transition rule

Before moving to the next phase:

- current phase output is complete
- no open `medium` or higher finding remains unresolved or unaccepted
- no pending human decision remains
- closed phase output becomes `immutable`

## Context at a transition

The closed phase output is the handoff to the next phase. Recommend the cheapest fitting
move to the human: continue when the next phase needs this session's reasoning and it fits
the window; a fresh session from the closed output when it does not; a subagent for review
or research. Load `framework/core/bootstrap.md` (Working mode) when the choice is unclear.
