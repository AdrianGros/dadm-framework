# Governance Policies

This directory contains the operative (machine-readable) forms of the DAD-M governance rules.

Each YAML file is the counterpart to a Markdown governance document. The Markdown
files explain the intent and reasoning. The YAML files define the rules in a format
that tooling and structured workflows can read and enforce.

When the two conflict, update both and resolve the conflict explicitly before continuing.

## Files

| File | Markdown counterpart |
| --- | --- |
| `severity-policy.yaml` | `governance/severity-framework.md` |
| `human-decision-policy.yaml` | `governance/guardrails.md` (Human decision triggers) |
| `rework-policy.yaml` | `governance/rework-and-escalation.md` |
| `approval-policy.yaml` | `framework/core/bootstrap.md` (Approval checkpoint) |
| `scope-policy.yaml` | `governance/guardrails.md` (scope compliance) + `framework/core/bootstrap.md` (scope declaration) |

## Adding a new policy

1. Write or update the corresponding Markdown document first.
2. Create the YAML file with `version: 1` and the operative rules.
3. Add it to this table.
4. If the rules contradict any existing policy, resolve the conflict before committing.
