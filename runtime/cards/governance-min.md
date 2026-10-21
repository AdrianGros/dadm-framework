# Governance Minimal

## Human decision triggers

The triggers and the category overrides that require a human decision are listed under
"Escalate when" in `runtime/cards/core-rules.md`.

## Action gate

- `info`, `low`: allow with notes
- `medium`, `high`: rework before phase transition
- `critical`: human decision

## Rework

Limit and reproduction rule: `runtime/cards/core-rules.md`. Load
`governance/rework-and-escalation.md` when recording an attempt or escalating, and
`governance/governance-matrix.md` when a finding's category or phase gate is unclear.
