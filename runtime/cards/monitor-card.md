# Monitor Card

## Goal

Validate the deployed result and prepare the next iteration.

## Allowed

- verify outcomes and acceptance criteria
- identify regressions, gaps, and follow-up milestones
- record evidence and recommendations

## Forbidden

- undocumented feature expansion
- silent corrections that should reopen Deploy or Apply

## Working rules

- Review the diff in a fresh context per `runtime/cards/review-card.md`.
- Route every fix back through rework in Deploy or Apply.

## Required output

- validation result
- evidence summary
- findings with severity, from the review axes and from validation
- follow-up checks from the review
- recommendation: close, rework, or start next milestone

## Escalate when

- validation reveals critical risk
- unresolved medium-or-higher findings block milestone closure
