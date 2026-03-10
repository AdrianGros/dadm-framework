# Overview

DAD-M is a structured framework for AI-assisted project work built around four phases:

1. Discover
2. Apply
3. Deploy
4. Monitor

The method is built for milestone-based work. Each milestone passes through the same cycle, and the result of Monitor becomes input for the next Discover step.

## Core idea

The framework assumes that AI-assisted project work becomes more reliable when analysis, design, implementation, and review are kept separate. Instead of treating prompts as disposable, DAD-M turns project work into documented artifacts that can be checked, reused, and improved.

## What the method tries to solve

Without structure, AI-assisted project work often runs into the same problems:

- facts and assumptions get mixed
- implementation starts before the design is stable
- decisions are hard to trace afterward
- outputs are difficult to reproduce

DAD-M addresses that by giving each phase a narrow purpose and a defined output.

## Setup before the cycle

Before milestone work starts, the source material describes a one-time setup step. That setup usually captures:

- a short project brief
- safety boundaries
- a milestone plan
- an expected deliverable format

The setup sequence is described in [framework/core/bootstrap.md](../framework/core/bootstrap.md).

## What DAD-M is not

DAD-M is not a claim of official organizational approval, and it is not meant to replace human judgment. It is a structured working method for guided collaboration with AI systems.

## Related pages

- [docs/getting-started.md](getting-started.md)
- [docs/use-cases.md](use-cases.md)
- [docs/variants/education.md](variants/education.md)
- [framework/core/phases.md](../framework/core/phases.md)
- [governance/guardrails.md](../governance/guardrails.md)
