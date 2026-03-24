# Rework and Escalation

Not every finding requires stopping the milestone or involving a human immediately.
This document defines when to attempt a fix within the current phase, when to escalate,
and when a human decision is required.

## Rework

Rework is an intra-phase correction loop. When a `medium` or `high` finding is
identified, attempt to resolve it before closing the phase rather than carrying
it forward as an unresolved risk.

Rework conditions — all must apply:

- the finding is within the scope of the current milestone (not cross-milestone)
- the severity is `medium` or `high` (not `critical`)
- no category override requires a human decision
- the rework attempt counter has not reached the limit

### Rework limit

The default rework limit is **2 attempts** per finding within a phase.
If the issue is not resolved after 2 attempts, do not try a third time.
Escalate instead.

The rationale for 2 as the default: the first attempt addresses the finding directly;
the second allows for one correction based on the result of the first. If two attempts
do not resolve the issue, this signals that the problem either has cross-milestone scope,
requires information or decisions not available to the current phase, or exceeds what
intra-phase correction can achieve. Further attempts within the same phase are unlikely
to succeed and may mask the underlying problem. This is a design default, not an
empirically validated number; it can be adjusted by explicit project declaration.

To change the limit for a specific project, declare it explicitly in the safety boundaries:

```
rework-limit: <number>
```

## Escalation

Escalation means the issue moves from automatic handling to human review.
Escalate when:

- the rework limit is reached without resolving the finding
- the same `medium` or `high` finding recurs across multiple rework attempts
- the finding scope extends beyond the current milestone
- a module or check produces an error state rather than a finding

Escalation always results in a mandatory human decision (see `guardrails.md`
and `framework/templates/human-decision-record.md`).

## Scope of rework

Rework stays within the current phase. It does not restart the milestone.

| Situation | Action |
| --- | --- |
| `medium` finding, within milestone scope | rework within current phase |
| `high` finding, within milestone scope | rework within current phase |
| `medium` / `high` repeated, rework limit reached | escalate → human decision |
| any finding with cross-milestone scope | escalate → human decision immediately |
| `critical` finding | human decision immediately (no rework attempt) |
| security or privacy `high` / `critical` | human decision immediately (no rework attempt) |
| module or check error | stop; investigate before continuing |

## Recording rework

Each rework attempt is recorded in the phase output:

```
rework-attempt:
  finding-ref: <reference to the original finding>
  attempt: <number>
  action-taken: <what was changed>
  result: resolved | unresolved
```

If the result is `unresolved` after the limit, add an escalation entry and stop.

Rework attempt records appear in the phase output under the Artifacts section with
retention class `immutable`. For the full phase output structure, see
`framework/core/deliverables.md`.

## Relationship to other documents

- Severity definitions: `governance/severity-framework.md`
- Governance decision flow: `governance/governance-matrix.md`
- Human decision format: `framework/templates/human-decision-record.md`
- Phase transition protocol: `framework/core/phases.md`
