# Human Decision Record HD-2026-10-19-3

Retention: `immutable`. Template: `framework/templates/human-decision-record.md`.

```
artifact: human-decision-record
milestone: FC-2026-10-19 (follow-up)
phase: MONITOR
trigger: change outside the declared scope (the user's global skill folder)
date: 2026-10-19
decided-by: Matt (project lead), reply in the working session of 2026-10-19

summary:
  55 skills that call the Kimbap runtime were loaded into every session; their
  descriptions add about 15,500 characters (estimate ~3,900 tokens) of always-loaded
  context. Kimbap is no longer used and is not installed.

blocking-reasons:
  - Moving files outside the declared scope needs a human decision.

options:
  - option: move the skills into a backup folder that the harness does not load
    risks: none known; restorable with one move
  - option: delete the skills
    risks: not restorable
  - option: keep them
    risks: the context cost stays in every session

recommended-option: move into a backup folder (reversible)

evidence-refs:
  - measurement of the skill descriptions with a YAML parser: 55 skills, 2,233 words,
    15,474 characters

decision: approve
decision-notes: Moved to the folder `skills-kimbap-backup-2026-10-19` next to the
  skill folder; 55 of 55 moved, none left behind. Restore by moving the folders back.
```
