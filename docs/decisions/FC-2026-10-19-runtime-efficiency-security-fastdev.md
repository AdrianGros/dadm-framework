# Framework Change FC-2026-10-19: Token Use, Code Security, Error Rate, Profile `fastdev`

```
artifact: framework-change-record
milestone: FC-2026-10-19
phase-state: COMPLETED
status: closed
date: 2026-10-19
profile: standard (none declared; AI_BIOS default)
change-category: significant (governance/framework-change-process.md)
approval: docs/decisions/HD-2026-10-19-framework-change-approval.md
workspace: dadm-test-1, a copy of dadm-main-framework; the canonical framework is unchanged
retention: immutable (this record and the human decision record)
```

The four phase outputs of this change are kept in one file for review. Token figures are
estimates (characters / 4); no tokenizer was available offline. Load figures count the
documents an agent loads per phase when it follows the respective `runtime/AI_BIOS.md`.

## 1. Discover

- Status: complete.
- Input summary: `runtime/AI_BIOS.md` and its load order (registry, `standard` profile,
  cards, route cards), all profiles and cards, framework core, templates, governance and
  policy files, control plane; github.com/mattpocock/skills at `49dd158` (38 skills, read
  as data); the global `.claude/CLAUDE.md` (read only).
- Facts:
  - F1: Per phase, `standard` loaded about 12,000 characters (~3,000 tokens); 65 % of it
    was `AI_BIOS.md` (4,107) and `file-registry.yaml` (3,679), the cards only ~4,200.
  - F2: The global CLAUDE.md DAD-M section (928 words) restates phase rules, output format,
    governance, triggers, rework, and transitions, and loads in every session under that
    directory, DAD-M or not.
  - F3: Cards repeated the triggers (core-rules, governance-min) and the phase boundaries
    (core-rules, phase-map).
  - F4: Cards were weaker than the canonical policy: privacy `medium` and scope violations
    lead to a human decision in `severity-policy.yaml`, not in the cards.
  - F5: No guidance on secrets, redaction, untrusted content, dependency vetting, or
    enforcement; an immutable artifact could keep a leaked secret forever.
  - F6: No test-first, proof-quality, or independent-review guidance.
  - F7: Bootstrap did not ask for the profile; step 6 "Working mode" had no section.
  - F8: `build_bios_registry.py` scanned only `.agents/skills/`, missed symlinked skill
    folders and `.claude/skills/`, and reported every skill as implicitly invocable.
  - F9: `README.md` linked a milestone plan file (`MILESTONE_PLAN_V1.md`) that is absent
    in this copy; the row now points to the `docs/decisions/` folder.
  - F10: The upstream `git-guardrails-claude-code` hook allows every command when `jq` is
    missing; `jq` is not installed on this machine.
  - F11: Kimbap is not installed; the public repository was cloned without credentials.
- Risks: R1 changes to an always-loaded path can raise token use instead of lowering it
  (`medium`); R2 new rules are design assumptions, not measured outcomes (`low`).
- Next step: Apply.

## 2. Apply

- Status: complete.
- Input summary: section 1; the user's request (HD-2026-10-19).
- Design:
  - D1 Load path: agents read `AI_BIOS.md` with a compact load table, then cards.
    `file-registry.yaml` and `runtime/profiles/*.yaml` stay the machine-readable sources;
    the change process checks that all three match.
  - D2 Cards: one runtime home per rule; escalation list aligned with the canonical
    overrides; positive targets next to prohibitions; terse-output rule; writing rules for
    cards in `document-quality.md`.
  - D3 Security: `governance/security-baseline.md`; two always-on lines in `core-rules`;
    redaction exception to immutability; Security review axis; hardened guard hook.
  - D4 Error rate: test seams in Apply; vertical slices, verification cadence, and proofs
    that can fail in Deploy; fresh-context review card in Monitor; reproduce-first rework;
    milestone sizing.
  - D5 Further token rules: question rounds with recommended answers; decision-log
    significance test; changed files by commit range; context choice at transitions.
  - D6 Profile `fastdev`: auto-load `core-rules` and `fastdev-card` only; one milestone
    record per milestone (`framework/templates/milestone-record.md`); human decision
    records stay separate; bootstrap unchanged; `medium` outside security, privacy, and
    scope may carry to milestone completion; review in one Spec + Security pass.
  - D7 mattpocock/skills: disciplines adopted into cards; optional phase mapping in
    `bios.routing.yaml`; registry scanner fix; evaluation in
    `docs/integrations/mattpocock-skills.md`; MIT attribution in `THIRD_PARTY_NOTICES.md`.
- Acceptance criteria:
  - AC1 `fastdev` exists in the BIOS table, the registry, and a profile file; one record
    template; the human decision exception is explicit.
  - AC2 `standard` loads at least 25 % less in Discover, Apply, and Deploy.
  - AC3 Every referenced repository path exists; every YAML file parses.
  - AC4 The guard blocks the defined groups, allows the defined benign commands, and fails
    closed without a parser.
  - AC5 The registry lists `.claude/skills/`, symlinked folders, and user-invoked skills
    as `explicit_only`.
  - AC6 Every card has at most 300 words.
  - AC7 Cards do not contradict the canonical escalation rules.
  - AC8 `dadm-main-framework` is unchanged.
- Out of scope: editing the global CLAUDE.md, editing `dadm-main-framework`, installing
  skills, DADM-UI.
- Next step: Deploy.

## 3. Deploy

- Status: complete.
- Implementation summary: D1 to D7 as designed.
- Files changed (`diff -rq dadm-main-framework dadm-test-1`):
  - New: `THIRD_PARTY_NOTICES.md`; `governance/security-baseline.md`;
    `runtime/cards/fastdev-card.md`, `runtime/cards/review-card.md`;
    `runtime/profiles/fastdev.yaml`; `framework/templates/milestone-record.md`;
    `runtime/integration/` (`README.md`, `dadm-guard.sh`, `dadm-guard.test.sh`);
    `docs/integrations/mattpocock-skills.md`; `docs/decisions/` (this record, HD-2026-10-19).
  - Changed: `runtime/AI_BIOS.md`, `runtime/file-registry.yaml`, `runtime/bios.policy.md`,
    `runtime/bios.routing.yaml`, `runtime/build_bios_registry.py`; cards `core-rules`,
    `phase-map`, `deliverables-min`, `governance-min`, `bootstrap-card`, `discover-card`,
    `apply-card`, `deploy-card`, `monitor-card`; `framework/core/` `bootstrap`,
    `milestones`, `deliverables`, `artifact-retention`, `phases`, `modules`; `governance/`
    `guardrails`, `governance-matrix`, `rework-and-escalation`, `document-quality`,
    `framework-change-process`, `policies/rework-policy.yaml`; `README.md`,
    `AI_CONTEXT.md`, `docs/getting-started.md`, `docs/glossary.md`,
    `docs/software-reference.md`.
- Proofs:
  - AC1: `fastdev` appears in the BIOS load table, `file-registry.yaml` (with
    `route_overrides`), and `runtime/profiles/fastdev.yaml`; the resolved load sets of the
    registry and of the profile files were printed and match the BIOS table.
  - AC2 (characters per phase, old load path on the old framework → new load path):

    | Profile | Discover | Apply | Deploy | Monitor |
    | --- | --- | --- | --- | --- |
    | `fast` | 11,005 → 7,185 (−35 %) | 10,986 → 7,124 (−35 %) | 10,911 → 7,242 (−34 %) | 10,916 → 8,450 (−23 %) |
    | `fastdev` (vs old `standard`) | 12,038 → 6,118 (−49 %) | 12,019 → 6,118 (−49 %) | 11,944 → 6,118 (−49 %) | 11,949 → 7,484 (−37 %) |
    | `standard` | 12,038 → 7,775 (−35 %) | 12,019 → 7,714 (−36 %) | 11,944 → 7,832 (−34 %) | 11,949 → 9,040 (−24 %) |
    | `strict` | 19,993 → 16,538 (−17 %) | 19,974 → 16,477 (−18 %) | 19,899 → 16,595 (−17 %) | 19,904 → 17,803 (−11 %) |

    Monitor saves less because the review card is new. Counter-check: an agent that keeps
    the old order (registry first) loads 13,202 characters for `standard` Deploy, 11 %
    more than before (see Monitor, M-R1).
  - AC3: reference and YAML check: 0 YAML errors, 0 missing paths after this record was
    written (before: 9 missing, all `docs/decisions/`).
  - AC4: `bash runtime/integration/dadm-guard.test.sh` → `75 passed, 0 failed`. The first
    run failed on `git clean --force` (red), the pattern was fixed, the rerun passed
    (green). Upstream hook on the same input without `jq`: `git push --force origin main`
    exit 0 (allowed); `dadm-guard.sh`: exit 2 (blocked).
  - AC5: fixture workspace with `.agents/skills/dadm-deploy` and symlinked
    `.claude/skills/{tdd,grill-me}`: old scanner 1 skill, new scanner 3 skills, `grill-me`
    as `explicit_only` with `user_invoked_only: true`.
  - AC6: `wc -w runtime/cards/*.md`: maximum 298 (`fastdev-card.md`).
  - AC7: `core-rules` escalation now includes privacy `medium`+ and scope violations as in
    `severity-policy.yaml`; bootstrap card requires `status: approved` as in
    `approval-policy.yaml`.
  - AC8: no file in `dadm-main-framework` was modified after 2026-10-01
    (`find -newermt`: 0 files).
- Acceptance checklist: AC1 to AC8 met.

## 4. Monitor

- Status: complete.
- Review (axes run one after another by the implementing agent; no subagent was
  requested, so independence is limited):
  - Spec: all four parts of the request covered. Finding: under `fastdev`, ADR files from
    `domain-modeling` would add per-milestone artifacts → resolved by routing them to the
    record's Log (`low`).
  - Security: the install guidance recommended unpinned, self-updating skill installs,
    contradicting `security-baseline.md` section 3 → resolved with pinning guidance
    (`medium`). Guard script: no `eval`, `python3 -I`, output through `printf %s`.
  - Standards: one "should" in a governance rule, a stale `automatic_context` entry, a
    missing never-auto-load entry, a leftover `__pycache__` → resolved (`low`).
- Residual risks:
  - M-R1 (`medium`, accepted pending human action): the global CLAUDE.md still prescribes
    reading `file-registry.yaml`; until it points to `AI_BIOS.md` only, the savings do not
    materialise. Changing that file is outside the declared scope, so it is a human
    decision; a replacement section is prepared outside the repository.
  - M-R2 (`low`): the `jq` fallback of the guard is untested here (`jq` not installed).
  - M-R3 (`low`): the guard is pattern-based; quoted or scripted commands pass.
  - M-R4 (`low`): effects on error rate and security are design assumptions until a
    project runs on the new cards.
  - M-R5 (`low`, pre-existing): `framework-change-process.md` cites
    `docs/decisions/M05_gap_analyse.md`, which exists only in older copies.
- Decisions for human review:
  - `fastdev` moves the `medium` gate from each phase transition to milestone completion
    (security, privacy, and scope excluded).
  - Apply may contain throwaway prototype code that answers one design question.
  - A secret in an immutable artifact may be redacted, with a human decision record.
  - Agents no longer read `file-registry.yaml` at runtime; the BIOS table must be kept in
    sync with it.
- Follow-ups: decide promotion to `dadm-main-framework`; update the global CLAUDE.md;
  pilot `fastdev` on one real milestone; run the guard tests on a machine with `jq`.
- Next step: human decision on promotion.

## Decision log

- 2026-10-19 DISCOVER decision: work in the sandbox copy only — reversible and reviewable
  by diff — agent, within HD-2026-10-19.
- 2026-10-19 DEPLOY decision: replace the registry read by a BIOS load table — the first
  design missed AC2 (registry grew to 4,664 characters, `standard` +3 %) — agent.
- 2026-10-19 DEPLOY rework 1/2: AC2 missed → load path redesigned (D1) → resolved.
- 2026-10-19 DEPLOY rework 1/2: guard let `git clean --force` pass → pattern fixed →
  resolved.
