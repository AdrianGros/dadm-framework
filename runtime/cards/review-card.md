# Review Card

## Goal

Find defects before a milestone closes, using a reviewer that never saw the
implementation session.

## Setup

1. Fixed point: the commit recorded when Deploy started. Review `git diff <fixed-point>...HEAD`
   (for non-code work: the changed artifacts).
2. Give each axis only the diff and that axis's source.
3. Run each axis in a fresh context (subagent) when the harness supports it; otherwise run
   the axes one after another and keep their reports separate.

## Axes

| Axis | Source | Reports |
| --- | --- | --- |
| Spec | Apply design and acceptance criteria | missing or partial criteria; unrequested behaviour (scope finding); wrong behaviour |
| Security | `governance/security-baseline.md`, section 5 | each hit, category `security` or `privacy` |
| Standards | the repo's documented coding standards; Fowler smells as judgement calls | violations, citing the standard |

Depth: `fast` and `fastdev` run Spec and Security in one pass. Other profiles run all three
axes separately.

## Output

- Per finding: axis, location, severity, category, one line of evidence (quoted hunk or spec line).
- At most 300 words per axis. Keep axes separate; each finding enters the normal severity gate.
- For each defect, ask whether a deterministic check (test, lint rule, hook) would have
  caught it; if so, list that check as a follow-up.
