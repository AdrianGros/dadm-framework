# Human Decision Record HD-2026-10-19

Retention: `immutable`. Template: `framework/templates/human-decision-record.md`.

```
artifact: human-decision-record
milestone: FC-2026-10-19
phase: DISCOVER (approval given with the request, before work started)
trigger: significant framework change (governance/framework-change-process.md)
date: 2026-10-19
decided-by: Matt (project lead), request in the working session of 2026-10-19

summary:
  The project lead asked to improve the DAD-M framework by following runtime/AI_BIOS.md,
  with three goals: lower token use, better code security, and a lower error rate in
  AI-assisted coding. The request also asked to evaluate github.com/mattpocock/skills for
  adaptable tools and skills, and to add a fifth runtime profile "fastdev" that writes one
  human-readable artifact per milestone covering Discover, Apply, Deploy, and Monitor,
  with human decisions as the only exception.

blocking-reasons:
  - New rules, a new profile, and changed runtime loading are significant framework
    changes and need a human decision record before they are merged.

options:
  - option: A - implement in the sandbox copy dadm-test-1; leave dadm-main-framework
      unchanged; decide on promotion afterwards
    risks: the two copies diverge until promotion
  - option: B - implement directly in dadm-main-framework
    risks: every workspace that uses framework_root receives unreviewed changes at once
  - option: C - write proposals only
    risks: no proof of effect; the decision is delayed by a second round

recommended-option: A - reversible, fully reviewable with
  `diff -r dadm-main-framework dadm-test-1`, and the request was made in dadm-test-1.

evidence-refs:
  - docs/decisions/FC-2026-10-19-runtime-efficiency-security-fastdev.md

decision: approve
decision-notes: The approval is the request itself. The human did not review the
  individual design choices before implementation; the agent chose option A within the
  mandate. Promotion to dadm-main-framework needs a separate human decision. Choices
  flagged for review are listed in the change record under "Decisions for human review".
```
