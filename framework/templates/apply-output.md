# Apply Output Template

Use this template to record the result of an Apply phase. Fill in all sections before
closing the phase. This artifact is immutable once the phase is closed.

Apply converts Discover results into a design that can be implemented. It produces no
implementation code — only architecture, interfaces, data models, pseudocode, and
acceptance criteria.

For the standard phase output structure and retention rules, see `framework/core/deliverables.md`.

---

```
artifact: apply-output
milestone: <milestone ID>
phase: APPLY
status: complete | incomplete | blocked
date: <YYYY-MM-DD>
```

---

## Input Summary

<What inputs this phase worked from — the closed Discover output, open questions resolved
since Discover, constraints from safety boundaries. List the specific artifacts used.>

---

## Solution Design

<The core design output. Structure this section to match what the milestone requires.
Typical content:

- Architecture overview (components, responsibilities, relationships)
- Interface definitions (signatures, contracts — no implementation bodies)
- Data models or schema
- Workflow or state diagram (text or ASCII — no external tools required)
- Pseudocode for non-trivial logic

No implementation code. No calls to external systems. Mark anything unresolved as [TBD]
and list it in Open TBDs below.>

---

## Acceptance Criteria

<Measurable, binary-checkable criteria that must be satisfied at the end of Deploy before
Monitor can begin. Format: one criterion per line, numbered.>

```
AC-<milestone>-01: <criterion — measurable and binary>
AC-<milestone>-02: <criterion>
```

---

## Risks and Assumptions

<Each entry carries a severity label. Any entry at `medium` or above must be resolved or
explicitly accepted before Deploy begins. Any `critical` entry stops work — see `governance/guardrails.md`.>

| # | Description | Severity | Blocking |
|---|---|---|---|
| R1 | <description> | `info` / `low` / `medium` / `high` / `critical` | yes / no |

---

## Open TBDs

<Anything that could not be fully resolved in Apply and must be decided before or during Deploy.
For each: description, priority, and who must resolve it.>

| # | TBD | Priority | Owner |
|---|---|---|---|
| T1 | <description> | blocking / important / nice-to-have | <role or name> |

---

## Next Step

<One-line statement of what Deploy must implement first — the most critical entry point
into the implementation.>
