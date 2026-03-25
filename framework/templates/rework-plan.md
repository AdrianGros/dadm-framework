# Rework Plan Template

Use this template when one or more `medium` or `high` findings require correction within
the current phase. Each finding that triggers rework gets its own entry (MR1, MR2, ...).

For the rework rules, limit, and escalation conditions, see `governance/rework-and-escalation.md`.
For severity definitions, see `governance/severity-framework.md`.

---

```
artifact: rework-plan
milestone: <milestone ID>
phase: <DISCOVER | APPLY | DEPLOY | MONITOR>
date: <YYYY-MM-DD>
finding-refs: <reference to the original findings from the phase output>
```

---

## MR1 — <short name of the finding being addressed>

**Goal:** <What this rework attempt must achieve — stated as a verifiable outcome.>

**Scope:** <Exactly what is allowed to change in this attempt. Keep it narrow.>

**Deliverables:** <Concrete outputs that must exist when this attempt is complete.>

**Acceptance criteria:** <How success is checked — binary, measurable.>

**Risks:** <What could prevent resolution or create new problems.>

**Attempt:** 1 / 2

**Result:** resolved | unresolved

---

## MR2 — <short name>

**Goal:**

**Scope:**

**Deliverables:**

**Acceptance criteria:**

**Risks:**

**Attempt:** 1 / 2

**Result:** resolved | unresolved

---

## Escalation

<Fill this section if any finding reaches the rework limit without being resolved.>

```
escalation:
  finding-ref: <reference>
  attempts-made: <number>
  reason-unresolved: <why the finding could not be resolved within the phase>
  action: human-decision-required
```

Reference the human decision record in the phase output under Artifacts once created.
