# mattpocock/skills and DAD-M

Evaluation of the 38 agent skills in https://github.com/mattpocock/skills (MIT License,
`THIRD_PARTY_NOTICES.md`) for use with DAD-M, checked at commit `49dd158` (2026-10-09).
Criteria: lower token use, lower error rate in AI-assisted coding, better code security,
and fit with the DAD-M phase boundaries.

## Summary

The skills fit DAD-M phase by phase, because both aim at the same failure modes:
misalignment, missing feedback loops, and context overload. Their core disciplines are
adopted into the runtime cards, so they apply without installing anything. The skills
themselves stay optional; `runtime/bios.routing.yaml` maps them to phases
(`compatible_external_skills`) for workspaces that install them.

## Adopted into the framework

| Source | Adopted as | Where | Aim |
| --- | --- | --- | --- |
| `grilling` | questions in numbered rounds, each with a recommended answer; facts are looked up, decisions are asked | core rules, `bootstrap.md` | fewer round trips, fewer misunderstandings |
| `domain-modeling` (test for architecture decision records) | log a decision only if hard to reverse, surprising, and a real trade-off | `deliverables.md`, deliverables card | shorter decision logs |
| `to-spec`, `tdd` | test seams agreed in Apply | apply card | errors |
| `tdd` | vertical red-green slices; a proof must be able to fail; no tautological tests | deploy card, deliverables card, `deliverables.md` | errors |
| `implement` | fast checks per slice, full suite once at the end | deploy card | errors, tokens |
| `diagnosing-bugs` | rework starts from a command that reproduces the finding; redact secrets in shown output | core rules, `rework-and-escalation.md`, `rework-policy.yaml`, `security-baseline.md` | errors, security |
| `code-review` | fresh-context review on separate axes (Spec, Standards), plus a Security axis | review card | errors, security |
| `retro` | every defect asks whether a deterministic check would have caught it | review card, monitor card | recurring errors |
| `to-tickets` | milestones as vertical slices that fit one fresh session | `milestones.md`, bootstrap card | errors, tokens |
| `ask-matt` (`PHASE-BOUNDARIES.md`), `handoff` | context choice at each phase transition; the closed phase output is the handoff | phase map, `bootstrap.md` (Working mode) | tokens |
| `writing-for-agents` | writing rules for runtime cards: one home per rule, positive targets, no no-ops, conditional pointers | `document-quality.md` | tokens |
| `prototype` | throwaway code may answer a design question in Apply; the answer is recorded, the code stays out of the deliverable | apply card | errors |
| `git-guardrails-claude-code` | hardened guard hook | `runtime/integration/dadm-guard.sh` | security |

## Optional skills by phase

When installed, BIOS can route to these. Skills marked user-invoked
(`disable-model-invocation: true`) are recommended to the human, not called by the agent.

| Phase | Skills | Use with DAD-M |
| --- | --- | --- |
| Bootstrap, Discover | `grill-me`, `grill-with-docs` (both user-invoked), `grilling`, `domain-modeling`, `research` | `research` results are Discover facts and keep their sources; `grill-me` is the variant that writes no files |
| Apply | `codebase-design`, `prototype`, `domain-modeling` | keep prototypes on a throwaway branch |
| Deploy | `tdd`, `diagnosing-bugs`, `wizard` | `wizard` lets the human enter credentials with hidden input, so the agent never sees them |
| Monitor | `code-review`, `diagnosing-bugs`, `retro` (user-invoked) | point the Spec axis of `code-review` at the Apply output; it otherwise expects an issue tracker |
| Human decision | `to-questionnaire` (user-invoked) | when the person who must decide is not in the session |
| Phase transition | `handoff` (user-invoked) | only when work moves to another tool, directory, or person |

## Not adopted

| Skills | Reason |
| --- | --- |
| `ask-matt` | BIOS is the DAD-M router; a second router would compete with it |
| `to-spec`, `to-tickets`, `triage`, `wayfinder`, `implement-spec`, `setup-matt-pocock-skills` (as skills) | they organise work around an issue tracker and publish to it (outward-facing), which overlaps the milestone plan; their disciplines are adopted above |
| `implement` (as a skill) | commits automatically at the end; adopted as discipline instead |
| `pr` | useful only where pull requests exist; its before/after evidence matches DAD-M proofs |
| `improve-codebase-architecture` | a periodic survey; its output can seed a new milestone but adds no phase rule |
| `setup-pre-commit` | stack-specific (Husky, npm); the underlying rule is the deterministic-check follow-up in the review card |
| `teach`, `wait-what`, `writing-beats`, `writing-fragments`, `writing-shape`, `loop-me`, `scaffold-exercises`, `migrate-to-shoehorn` | outside DAD-M's scope |
| `chief-of-staff`, `claude-handoff`, `setup-ts-deep-modules` | in-progress or stack-specific; revisit when stable |

## Defect found in the source

`git-guardrails-claude-code` reads its input with `jq`. Without `jq` installed, the
command field comes back empty and the hook allows every command, including
`git push --force` (reproduced on a machine without `jq`; with `jq` installed it blocks
as intended). `dadm-guard.sh` parses with
`python3` or `jq` and blocks when it cannot parse (fails closed); its test suite is
`runtime/integration/dadm-guard.test.sh`.

## Installing the skills

Under DAD-M, installing a skill pack is a dependency change: record it under the safety
boundaries before installing (`governance/security-baseline.md`, section 3). Skills are
instructions the agent follows, so an unreviewed update changes agent behaviour.

- The upstream commands install the latest state and may update themselves, so they do
  not meet the pinned-version requirement of section 3:
  `claude plugin install mattpocock-skills@claude-plugins-official` (Claude Code, updates
  by default) or `npx skills@latest add mattpocock/skills` (other agents).
  `dadm-guard.sh` blocks both until the human runs or approves them.
- To pin, copy the needed skill folders from a checkout of the evaluated commit into the
  workspace's `.claude/skills/` or `.agents/skills/`, and review the diff before taking a
  newer commit.

Regenerate the workspace registry afterwards (`runtime/build_bios_registry.py`); it scans
`.agents/skills/` and `.claude/skills/`, including symlinked skill folders. Plugin installs
outside the workspace do not appear in the registry.

Under `fastdev`, everything these skills would write to separate files (research notes
from `research`, architecture decision records and `GLOSSARY.md` entries from
`domain-modeling`) goes into the milestone record instead, so each milestone keeps one
human-readable artifact.
