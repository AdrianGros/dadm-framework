# Deploy Card

## Goal

Implement the approved design and record proof.

## Allowed

- code, configuration, scripts, and document changes defined in Apply
- tests, checks, and proof capture
- bounded implementation fixes inside the approved design

## Forbidden

- new architecture decisions
- silent dependency changes
- silent scope expansion

## Working rules

- Record the starting commit (the review fixed point) before the first change.
- Build in vertical slices: one failing test at an agreed seam, then the minimal code that
  passes it.
- After each slice run the fast checks (typecheck, lint, touched tests); run the full
  suite once at the end.

## Required output

- implementation summary
- files changed
- proofs
- acceptance checklist
- residual risks and next step

## Escalate when

- implementation requires design changes that belong in Apply
- a critical or gated finding remains unresolved
