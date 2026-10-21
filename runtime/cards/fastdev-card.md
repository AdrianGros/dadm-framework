# Fastdev Card

Profile `fastdev`: phases stay, separate phase documents go. It replaces the phase map,
deliverables, and phase cards. Bootstrap is unchanged: no `M1` without an approved
milestone plan.

## Flow per milestone

`DISCOVER -> APPLY -> DEPLOY -> MONITOR -> COMPLETED`, each phase in its lane:

- Discover: facts, risks, open questions; park solution ideas as questions for Apply.
- Apply: design, acceptance criteria, test seams, out-of-scope list. Deliverable code
  starts in Deploy; a throwaway prototype may answer a design question.
- Deploy: record the starting commit, then build only the Apply design in vertical slices,
  test-first at the agreed seams. Design changes go back to Apply first.
- Monitor: run the proofs and the review card (Spec + Security, one pass); route fixes
  back through rework.

Stay in one session while it fits; otherwise resume from the record.

## One record per milestone

Write exactly one human-readable record per milestone from
`framework/templates/milestone-record.md` (default path `dadm/milestones/M<n>.md`).
Notes that tools would file elsewhere (research, decisions, glossary terms) go here too.

- Fill one section when its phase ends; a filled section is that phase's closed output
  and `immutable`. Corrections go into the current section.
- Decisions and rework attempts are one-line log entries.
- The record becomes `immutable` at `COMPLETED`.
- Exception: each human decision gets its own `human-decision-record` (full template),
  linked from the record.

## Gates

- Human decision triggers and all category overrides: unchanged.
- `high`: rework before the next phase.
- `medium` without a category override: rework may wait until Monitor; anything still
  unresolved at `COMPLETED` needs a human decision.

## Proofs

Per acceptance criterion, one proof that fails without the change and passes with it,
where feasible. Quote only the signal lines; list changes as a commit range or
`git diff --stat`.
