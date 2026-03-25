# Discover Output Template

Use this template to record the result of a Discover phase. Fill in all sections before
closing the phase. This artifact is immutable once the phase is closed.

For the standard phase output structure and retention rules, see `framework/core/deliverables.md`.

---

```
artifact: discover-output
milestone: <milestone ID>
phase: DISCOVER
status: complete | incomplete | blocked
date: <YYYY-MM-DD>
```

---

## Input Summary

<What inputs this phase worked from — existing files, prior Monitor output, external sources,
constraints from safety boundaries. List the specific artifacts or documents used.>

---

## Current-State Summary

<Structured overview of what currently exists: relevant files, directories, systems, active
components, known behavior. Mark each item as: relevant / not relevant / unclear.

This is a factual snapshot, not a design proposal. No solutions, no architecture.>

---

## Inventory

<What was found that is relevant to this milestone. Each entry:>

| # | Name | Description | Location | Status |
|---|---|---|---|---|
| I1 | <name> | <what it is> | <file or system> | present / missing / unclear |

---

## Dependencies

<Runtime, library, toolchain, or system dependencies. For each: present / missing / unclear,
with version or specifics where known.>

| # | Dependency | Version | Status |
|---|---|---|---|
| D1 | <name> | <version or unknown> | present / missing / unclear |

---

## Risks and Assumptions

<Each entry carries a severity label. Any entry at `medium` or above must be resolved or
explicitly accepted before Apply begins. Any `critical` entry stops work and triggers
a mandatory human decision — see `governance/guardrails.md`.>

| # | Description | Severity | Blocking |
|---|---|---|---|
| R1 | <description> | `info` / `low` / `medium` / `high` / `critical` | yes / no |

---

## Open Questions

<Questions that must be answered before Apply can begin. For each, assign a priority and owner.>

| # | Question | Priority | Owner |
|---|---|---|---|
| Q1 | <question> | blocking / important / nice-to-have | <role or name> |

---

## Next Step

<One-line statement of what Apply needs first — the most critical input it requires from Discover.>
