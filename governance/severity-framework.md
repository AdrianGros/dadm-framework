# Severity Framework

DAD-M uses a five-level severity scale to classify risks, findings, and open issues
in a consistent and comparable way across all phases and milestones.

## Severity levels

| Level | Meaning | Default action |
| --- | --- | --- |
| `info` | Observation worth noting, no action required | document only |
| `low` | Minor issue, work can continue | document and monitor |
| `medium` | Requires attention before the milestone closes | rework |
| `high` | Blocks phase completion or introduces significant risk | rework, escalate if repeated |
| `critical` | Stops work; human decision required before continuing | human decision |

## How to use severity

Assign a severity level whenever you record a risk, finding, or open question in
a phase output. The level signals what happens next:

- `info` and `low` go into the Risks and Assumptions section with no further action gate.
- `medium` and `high` must be resolved or explicitly accepted before the next phase begins.
- `critical` triggers an immediate stop. Work does not continue until a human has reviewed
  the situation and recorded a decision.

### Threshold rationale

The boundary between advisory (`info`, `low`) and action-required (`medium`, `high`,
`critical`) is set at `medium` for the following reason: `info` and `low` findings
represent observations and minor issues that do not threaten the phase's goals. Carrying
them forward is acceptable because they do not compound into blocking problems at the
next phase boundary. `medium` findings represent issues that, if left unresolved, are
likely to grow into higher-severity problems in later phases — the cost of resolving
them early is lower than the cost of resolving them after they have propagated. This
is a design decision based on cost-of-correction reasoning, not an empirically measured
threshold. Projects with different risk tolerances can adjust category-specific defaults
(see category overrides below).

## Category-specific guidance

Some issue categories carry inherently higher stakes. Apply stricter defaults when the
finding falls into these areas:

| Category | Override |
| --- | --- |
| Security | `high` → human decision; `critical` → human decision |
| Privacy / personal data | `medium` and above → human decision |
| Scope change | cross-milestone scope change → human decision regardless of severity |
| Dependency change | any dependency change → explicit approval required |
| Architecture decision in Deploy | any level → block Deploy; redirect to Apply |

When a category override applies, note it explicitly in the finding record.

The "block Deploy; redirect to Apply" override is deterministic — it does not require
a human decision unless other triggers also fire. In policy files, this override maps
to the action `block`. The phase must return to Apply before Deploy can resume.

## Relationship to other framework elements

- Severity feeds into the **Human Decision Triggers** defined in `guardrails.md`.
- Severity feeds into the **Rework and Escalation** rules defined in
  `rework-and-escalation.md`.
- Risk entries in milestone templates should carry a severity label.
- Findings recorded in phase outputs should carry a severity label.
