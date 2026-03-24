# Overview

DAD-M is a structured framework for AI-assisted project work built around four phases:

1. Discover
2. Apply
3. Deploy
4. Monitor

The method is built for milestone-based work. Each milestone passes through the same cycle, and the result of Monitor becomes input for the next Discover step.

## Core idea

DAD-M is built on one central design assumption: AI-assisted project work is easier
to review, reproduce, and correct when analysis, design, implementation, and validation
are kept in separate, documented steps rather than mixed in a single interaction. This
is a design assumption, not an empirically verified claim.

Instead of treating prompts as disposable, DAD-M turns project work into documented
artifacts that can be checked, reused, and improved. For the full statement of this
assumption and its methodological positioning, see [docs/methodology.md](methodology.md).

## What the method tries to solve

Without structure, AI-assisted project work often runs into the same problems:

- facts and assumptions get mixed
- implementation starts before the design is stable
- decisions are hard to trace afterward
- outputs are difficult to reproduce

DAD-M addresses that by giving each phase a narrow purpose and a defined output.

## Setup before the cycle

Before milestone work starts, a one-time bootstrap phase captures the project context
and produces the first artifacts. The setup sequence is:

1. Project brief — goal, end state, technologies, timeframe, non-goals
2. Safety boundaries — what may and may not be changed
3. Scope declaration — specific files, folders, or systems in scope; anything not listed is off limits
4. Milestone plan — full plan with scope, deliverables, acceptance criteria, risks, dependencies, and priority for each milestone
5. Plan approval — explicit approval artifact before M1 starts (immutable)
6. Working mode — single session or multi-session

The full setup sequence with field definitions and the approval artifact format is in
[framework/core/bootstrap.md](../framework/core/bootstrap.md).

## What DAD-M is not

DAD-M is not a claim of official organizational approval, and it is not meant to replace human judgment. It is a structured working method for guided collaboration with AI systems.

## Related pages

- [docs/getting-started.md](getting-started.md)
- [docs/use-cases.md](use-cases.md)
- [docs/variants/education.md](variants/education.md)
- [framework/core/phases.md](../framework/core/phases.md)
- [governance/guardrails.md](../governance/guardrails.md)
