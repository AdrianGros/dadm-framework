# Milestone Record Template

The single human-readable artifact per milestone under the `fastdev` profile
(`runtime/profiles/fastdev.yaml`). It replaces the separate Discover, Apply, Deploy, and
Monitor outputs, rework plans, rework attempt records, and the decision log. Human
decisions keep their own `framework/templates/human-decision-record.md`.

Usage notes:

- Fill one section when its phase ends. A filled section is the closed output of that
  phase and `immutable`; corrections go into the current section.
- Retention while active: header `mutable`, Log append-only, filled sections `immutable`;
  the whole record is `immutable` once `status: completed`
  (`framework/core/artifact-retention.md`).
- Content that tools would write to other files (research notes, decision notes, glossary
  terms) goes into the matching section or the Log.
- Keep entries to bullets. Reference files, commits, and commands instead of copying them.
  Redact secrets as `<REDACTED>`.
- Every field is required; write `none` where nothing applies.

---

```
artifact: milestone-record
profile: fastdev
milestone: <milestone ID> — <goal in one line>
status: discover | apply | deploy | monitor | awaiting_human | completed
fixed-point: <commit where Deploy started>
opened: <YYYY-MM-DD>
completed: <YYYY-MM-DD or open>
```

## 1. Discover

- Inputs: <plan entry, previous record, sources used>
- Current state: <facts only, each with a file, command, or source reference>
- Risks: <R1: description — severity — category>
- Open questions: <Q1: question → answer and who answered>

## 2. Apply

- Design: <components, interfaces, data flow; bullets or a small diagram>
- Acceptance criteria: <AC1: binary, checkable criterion>
- Test seams: <AC1 → public interface where it is proven>
- Out of scope: <explicit exclusions>

## 3. Deploy

- Summary: <what was built>
- Changes: <commit range or `git diff --stat` summary>
- Proofs: <AC1: command → fails without the change / passes with it; signal lines only>

## 4. Monitor

- Review: <Spec and Security findings with severity, or none>
- Acceptance: <AC1 met / not met, with proof reference>
- Accepted risks: <`medium` findings unresolved at completion, each with the human
  decision record that accepted it, or none>
- Follow-ups: <input for the next Discover; deterministic checks to add>

## Log

- <YYYY-MM-DD> <PHASE> decision: <what> — <why> — <who>
- <YYYY-MM-DD> <PHASE> rework <n>/<limit>: <finding> — reproduction: <command, or why
  none> — <action> — resolved | unresolved
- <YYYY-MM-DD> <PHASE> human decision: <path to human-decision-record>
