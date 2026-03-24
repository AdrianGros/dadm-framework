# Methodology

This document describes what DAD-M is as a method, what design assumptions it rests on,
and how it relates to other structured work approaches.

---

## Design assumption

DAD-M is built on one central design assumption:

> AI-assisted project work is easier to review, reproduce, and correct when analysis,
> design, implementation, and validation are kept in separate, documented steps rather
> than mixed in a single interaction.

This is a design assumption, not an empirically verified claim. The framework is built
to make that assumption practical and checkable. Whether it holds for a given project
is something each team will find out through use.

---

## What DAD-M addresses

DAD-M is designed for situations where:

- work spans more than one step or session
- outputs need to be reviewed by someone other than the person who created them
- decisions need to be traceable after the fact
- AI assistance is involved in analysis, design, or implementation

It directly targets four recurring problems in unstructured AI-assisted work:

| Problem | DAD-M response |
| --- | --- |
| Facts and assumptions get mixed | Discover phase: only facts, no design |
| Implementation starts before design is stable | Apply before Deploy; phase boundary enforced |
| Decisions are hard to trace afterward | Decision log; immutable phase outputs |
| Outputs are difficult to reproduce | Proof requirements; artifact retention |

---

## What DAD-M does not address

DAD-M does not:

- replace human judgment about goals, constraints, or final decisions
- guarantee the quality of the underlying AI system
- specify how to prompt or configure a specific AI tool
- provide domain-specific content (security rules, legal requirements, etc.)
- substitute for organizational governance, compliance frameworks, or risk management processes

---

## Methodological positioning

DAD-M is a structured workflow method. It is not a project management framework,
not a delivery methodology, and not a software development lifecycle in the traditional sense.

| Comparison | DAD-M | Scrum | Kanban | Classic PM |
| --- | --- | --- | --- | --- |
| Primary unit | Milestone | Sprint | Work item | Phase/Gate |
| Scope control | Explicit per milestone | Sprint scope | Continuous | Stage boundary |
| Human oversight | Mandatory triggers | Retrospective | Ad hoc | Review meetings |
| Phase separation | Strict (by design) | Implicit | None | Waterfall-like |
| Suited for AI-assisted work | Yes, by design | Not designed for it | Not designed for it | Not designed for it |
| Artifacts | Required per phase | Optional | Optional | Required at gates |

This comparison is not a ranking. Each method was designed for different contexts.
DAD-M is specifically designed for the problem of structured AI collaboration;
the other methods listed are not and were not intended to be.

---

## What makes DAD-M a method and not a standard

DAD-M is a working method: a reusable set of phases, rules, and artifact formats
that a team adopts to organize a specific type of work. It is:

- reusable across different projects and domains
- adaptable within defined limits (profiles, module configuration)
- not formally adopted, standardized, or certified by any organization

Known usage: used in project work by project managers in a Deutsche Telekom Technik
environment. This repository does not claim broader adoption.

---

## Relationship to this repository

This repository documents DAD-M as a public framework artifact. The documents here are:

- the authoritative definition of DAD-M's phases, rules, and artifact formats
- the reference material for teams implementing or extending DAD-M in software
- not a prompt collection, starter kit, or training dataset on their own

For use as a software reference, see `docs/software-reference.md` (created in M18).
