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
- stopping at defined points for human decisions

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

**For AI systems:** Load [AI_CONTEXT.md](AI_CONTEXT.md) for a compact structured summary.
**For software implementers:** See [docs/software-reference.md](docs/software-reference.md) for interface contracts and schemas.

## Repository structure

- `docs/` — public explanation and onboarding
- `framework/core/` — canonical method artifacts
- `framework/templates/` — reusable framework templates
- `governance/` — operating rules, evidence boundaries, and policies
- `governance/policies/` — machine-readable (YAML) forms of governance rules

### Core method

| File | Purpose |
| --- | --- |
| [framework/core/phases.md](framework/core/phases.md) | Phase definitions, states, and transition protocol |
| [framework/core/milestones.md](framework/core/milestones.md) | Milestone structure including dependencies and priority |
| [framework/core/deliverables.md](framework/core/deliverables.md) | Expected outputs, decision log, artifact retention |
| [framework/core/bootstrap.md](framework/core/bootstrap.md) | Setup sequence including scope declaration and plan approval |
| [framework/core/artifact-retention.md](framework/core/artifact-retention.md) | Immutability and retention classes for artifacts |
| [framework/core/modules.md](framework/core/modules.md) | Module system, registry, profiles, and extensibility |

### Governance

| File | Purpose |
| --- | --- |
| [governance/guardrails.md](governance/guardrails.md) | Operating boundaries, human decision triggers, AWAITING_HUMAN |
| [governance/quality-principles.md](governance/quality-principles.md) | Method quality principles (normative obligations) |
| [governance/evidence-policy.md](governance/evidence-policy.md) | Claim strength standard and publication policy |
| [governance/severity-framework.md](governance/severity-framework.md) | Five-level severity scale, category overrides, threshold rationale |
| [governance/governance-matrix.md](governance/governance-matrix.md) | Which checks apply in which phase; blocking vs. advisory |
| [governance/rework-and-escalation.md](governance/rework-and-escalation.md) | Intra-phase rework loop and escalation rules |
| [governance/framework-change-process.md](governance/framework-change-process.md) | How to change framework documents (minor / significant / breaking) |
| [governance/document-quality.md](governance/document-quality.md) | Quality criteria for each document type |
| [governance/policies/severity-policy.yaml](governance/policies/severity-policy.yaml) | Severity level actions and category overrides (machine-readable) |
| [governance/policies/human-decision-policy.yaml](governance/policies/human-decision-policy.yaml) | Human decision triggers and format (machine-readable) |
| [governance/policies/rework-policy.yaml](governance/policies/rework-policy.yaml) | Rework conditions, limit, escalation (machine-readable) |
| [governance/policies/approval-policy.yaml](governance/policies/approval-policy.yaml) | Milestone plan approval rules (machine-readable) |
| [governance/policies/scope-policy.yaml](governance/policies/scope-policy.yaml) | Scope declaration and violation handling (machine-readable) |

### Templates

| File | Purpose |
| --- | --- |
| [framework/templates/human-decision-record.md](framework/templates/human-decision-record.md) | Template for mandatory human decision artifacts |

### Documentation

| File | Purpose |
| --- | --- |
| [AI_CONTEXT.md](AI_CONTEXT.md) | Compact structured summary for AI systems |
| [docs/overview.md](docs/overview.md) | Concise method overview including design assumption |
| [docs/methodology.md](docs/methodology.md) | Methodological positioning, design assumption, comparison table |
| [docs/getting-started.md](docs/getting-started.md) | Step-by-step first use (7 steps including scope + approval) |
| [docs/use-cases.md](docs/use-cases.md) | Where the framework fits and where it does not |
| [docs/software-reference.md](docs/software-reference.md) | Integration contracts and schemas for software implementations |
| [docs/reproducibility.md](docs/reproducibility.md) | Reproducibility requirements and checklist |
| [docs/glossary.md](docs/glossary.md) | Canonical term definitions |
| [docs/examples/rbac-case-example.md](docs/examples/rbac-case-example.md) | Full structured milestone example with phase outputs and decision log |
| [docs/variants/education.md](docs/variants/education.md) | DAD-M Education variant |
| [docs/decisions/MILESTONE_PLAN_V1.md](docs/decisions/MILESTONE_PLAN_V1.md) | Approved milestone plan for this repository (v1.0) |

## Example usage / workflow

1. Define the project brief, safety boundaries, and scope declaration.
2. Break the work into milestones with clear scope, dependencies, and priority.
3. Obtain approval for the milestone plan before starting M1.
4. Run Discover to collect the facts for milestone M1.
5. Run Apply to design the solution within those facts.
6. Run Deploy to implement only the approved design and capture proofs.
7. Run Monitor to validate the result and prepare the next milestone.

For a concrete public example, see [docs/examples/rbac-case-example.md](docs/examples/rbac-case-example.md).

## Governance and guardrails

DAD-M is strict about workflow boundaries. Discover is for facts, Apply is for design,
Deploy is for implementation, and Monitor is for validation. The framework pauses at
mandatory checkpoints and requires a documented human decision before continuing.
Dependency changes, network use, and work outside the declared scope stay explicitly controlled.

## Project status

This repository documents DAD-M as a public framework repository. The current focus is a clear method overview, practical starting guidance, and conservative governance notes.

A DAD-M Education variant is also being documented as an early public extension for validated learning and knowledge-building workflows. A public summary for that variant is available in [docs/variants/education.md](docs/variants/education.md).

This repository does not claim formal approval, organization-wide adoption, or enterprise validation.

## Author / context

I curated this Repository in a way that hopefully helps with structuring your projects and uses the key advantages of agentic systems while keeping responsibility firmly in the hands of human operators.
