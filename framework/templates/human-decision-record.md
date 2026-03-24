# Human Decision Record

Use this template whenever a mandatory human decision trigger fires (see `guardrails.md`).
Fill in all fields before continuing work. This artifact is immutable once completed.

---

```
artifact: human-decision-record
milestone: <milestone ID>
phase: <DISCOVER | APPLY | DEPLOY | MONITOR>
trigger: <which trigger fired — see guardrails.md>
date: <YYYY-MM-DD>
decided-by: <name or role>

summary:
  <concise description of the situation that requires a decision — 2–4 sentences>

blocking-reasons:
  - <reason 1>
  - <reason 2>

options:
  - option: <option A>
    risks: <risks of choosing A>
  - option: <option B>
    risks: <risks of choosing B>

recommended-option: <which option is recommended and why>

evidence-refs:
  - <artifact or document that supports the recommendation>

decision: approve | reject | modify | defer
decision-notes: <any conditions, modifications, or follow-up actions>
```

---

## Notes on use

- Complete every field. An incomplete record does not count as a human decision.
- `modify` means the work continues with a documented change to scope, approach, or plan.
- `defer` means the decision is postponed; record a date or condition for revisiting.
- `reject` stops the current approach; a new Apply phase is required before Deploy resumes.
- After recording, reference this artifact in the phase output under Artifacts.
