# Governance Minimal

## Human decision triggers

- any `critical` finding
- any `high` or `critical` finding in `security` or `privacy`
- cross-milestone scope change
- dependency change outside approved safety boundaries
- rework limit reached without resolution
- strategic architecture tradeoff with no clearly correct option

## Action gate

- `info`, `low`: allow with notes
- `medium`, `high`: rework before phase transition
- `critical`: human decision

## Rework

- default limit: 2 attempts per finding per phase
- if limit is exceeded, escalate to human decision

Use `governance/governance-matrix.md` and `governance/rework-and-escalation.md`
for canonical detail.
