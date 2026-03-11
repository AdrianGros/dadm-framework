# DAD-M Framework

DAD-M is a structured framework for AI-assisted project work. It separates analysis, design, implementation, and validation into four explicit phases: Discover, Apply, Deploy, and Monitor.

The repository is published as a public method repository for people who want a more controlled alternative to ad-hoc prompting.

## What DAD-M is

DAD-M is a reusable operating model for projects that need more than ad-hoc prompting. It is designed around milestones, documented outputs, and repeatable delivery instead of one-off chats.

## Why DAD-M exists

Many AI-supported tasks start fast but become hard to reproduce once a project spans several steps, files, or stakeholders. DAD-M addresses that by:

- collecting facts before design
- separating planning from execution
- requiring concrete deliverables per phase
- feeding review results back into the next cycle

## The four phases

| Phase | Purpose | Typical outputs |
| --- | --- | --- |
| Discover | Understand the current state and constraints | system overview, file structure, dependencies, risks, open questions |
| Apply | Turn facts into a solution design | architecture, interfaces, data models, pseudocode, acceptance criteria |
| Deploy | Implement the approved design | code, documents, scripts, configuration, proofs |
| Monitor | Validate results and capture follow-up work | test results, error analysis, regression risks, recommended fixes |

More detail: [framework/core/phases.md](framework/core/phases.md)

## Who it is for

DAD-M is useful for people who need structure around AI-assisted delivery, especially in:

- software development
- system analysis
- documentation-heavy work
- automation workflows
- project planning with explicit milestones

It is most useful when work needs reviewable outputs, explicit scope boundaries, and milestone-by-milestone control.

## How to start

1. Read the method summary in [docs/overview.md](docs/overview.md).
2. Use the setup sequence in [framework/core/bootstrap.md](framework/core/bootstrap.md).
3. Define milestones with [framework/core/milestones.md](framework/core/milestones.md).
4. Run the first cycle and record outputs using [framework/core/deliverables.md](framework/core/deliverables.md).
5. Keep the work inside the rules in [governance/guardrails.md](governance/guardrails.md).

## Repository structure

The repository uses one dominant layout:

- `docs/` for public explanation and onboarding
- `framework/core/` for the canonical method documents
- `framework/templates/` for reusable framework templates
- `governance/` for operating rules and evidence boundaries

Key pages:

- [docs/overview.md](docs/overview.md): concise method overview
- [docs/getting-started.md](docs/getting-started.md): step-by-step first use
- [docs/use-cases.md](docs/use-cases.md): where the framework fits and where it does not
- [docs/examples/rbac-case-example.md](docs/examples/rbac-case-example.md): public milestone example for a technical access-control design
- [docs/variants/education.md](docs/variants/education.md): early public variant for validated learning and knowledge-building workflows
- [framework/core/phases.md](framework/core/phases.md): phase definitions and boundaries
- [framework/core/milestones.md](framework/core/milestones.md): milestone design
- [framework/core/deliverables.md](framework/core/deliverables.md): expected outputs and proof format
- [framework/core/bootstrap.md](framework/core/bootstrap.md): starter prompt structure and setup flow
- [governance/guardrails.md](governance/guardrails.md): operating boundaries
- [governance/quality-principles.md](governance/quality-principles.md): method quality rules
- [governance/evidence-policy.md](governance/evidence-policy.md): claim and publication policy

## Example usage / workflow

1. Define the project brief and safety boundaries once.
2. Break the work into milestones with clear scope and acceptance criteria.
3. Run Discover to collect the facts for milestone M1.
4. Run Apply to design the solution within those facts.
5. Run Deploy to implement only the approved design and capture proofs.
6. Run Monitor to validate the result and prepare the next milestone.

For a concrete public example, see [docs/examples/rbac-case-example.md](docs/examples/rbac-case-example.md).

## Governance and guardrails

DAD-M is intentionally strict about workflow boundaries. Discover is for facts, Apply is for design, Deploy is for implementation, and Monitor is for validation. Dependency changes, network use, and work outside the allowed scope should stay explicitly controlled.

## Project status

This repository documents DAD-M as a public framework repository. The current focus is a clear method overview, practical starting guidance, and conservative governance notes.

A DAD-M Education variant is also being documented as an early public extension for validated learning and knowledge-building workflows. A public summary for that variant is available in [docs/variants/education.md](docs/variants/education.md).

This repository does not claim formal approval, organization-wide adoption, or enterprise validation.

## Author / context

This repository is curated as a public GitHub repository for explaining and applying the DAD-M method.
