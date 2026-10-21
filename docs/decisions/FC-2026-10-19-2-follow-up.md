# Framework Change FC-2026-10-19-2: Follow-up (jq test, fresh review, integration)

```
artifact: framework-change-record
milestone: FC-2026-10-19-2 (follow-up to FC-2026-10-19)
phase-state: COMPLETED
status: closed
date: 2026-10-19
profile: standard (none declared; AI_BIOS default)
change-category: significant; governance/policies/rework-policy.yaml changes format (version 2)
approval: HD-2026-10-19-2, HD-2026-10-19-3
retention: immutable
```

Token figures are estimates (characters / 4). Paths outside this repository are named
generically.

## Corrections to FC-2026-10-19

FC-2026-10-19 is `immutable`; these entries correct it.

- C1: The load-path redesign (D1) was an architecture decision taken during Deploy. Under
  `severity-policy.yaml` (`architecture_decision_in_deploy: block`) Deploy should have
  returned to Apply; the record logged it as a Deploy decision and rework. Correct
  reading: Deploy blocked, Apply revised D1, Deploy resumed. The human approved D1 as built
  (HD-2026-10-19-2).
- C2: "Implementation summary: D1 to D7 as designed" means D1 as revised (C1), D2 to D7 as
  designed.
- C3: Missing fields. Artifacts in every phase: the record and HD-2026-10-19 (both
  `immutable`) and the framework files listed under Deploy (`versioned`, tracked by diff
  against `dadm-main-framework`). Deploy input summary: section 2; Deploy risks: R1,
  handled by rework; Deploy next step: Monitor.
- C4: The guard and its test changed after FC-2026-10-19 closed; the changes are recorded
  here.
- C5: HD-2026-10-19 records an approval the agent inferred from the request; the human's
  explicit approval of the design choices is HD-2026-10-19-2.

## 1. Discover

- Status: complete.
- Input summary: HD-2026-10-19-2; three fresh-context review reports (Spec, Security,
  Standards) on a frozen copy of the FC-2026-10-19 result; the machine's tools.
- Facts:
  - F1: `sudo` needs a password; jq 1.8.2 exists as an official static release with
    published SHA-256 checksums.
  - F2: The guard's jq parser path had never run: under jq it blocked every allowed call
    (32 of 32 allow cases red).
  - F3: Review: Spec 6 findings (+4 omitted), Security 11 (+4), Standards 12 (+8);
    several overlap.
  - F4: Medium findings: fastdev downgraded the `medium` gate instead of moving it (the
    agent could accept risks itself); filled fastdev sections were append-only although
    closed phase outputs are `immutable`; `reproduction` was optional although the rework
    rules require it; quoted secret paths, the Grep `glob` field, the scope of the pip
    exemption, and package runners passed the guard; the prototype rule contradicted
    three documents; FC-2026-10-19 deviated from the Deploy rule (C1).
  - F5: The global steering file carried the only copy of three rules that the canonical
    framework's cards lack (privacy `medium` and scope violation lead to a human decision;
    approval needs `status: approved`), plus an unused Kimbap block.
  - F6: 55 Kimbap skills added 15,474 characters (~3,900 tokens) to every session.
- Artifacts: this record (`immutable` once closed).
- Risks: R1 slimming the steering file would drop the three rules for workspaces on the
  canonical framework (`medium`, handled by D6).
- Next step: Apply.

## 2. Apply

- Status: complete.
- Input summary: section 1.
- Design:
  - D1 Install jq user-locally from the verified release; run the whole guard suite a
    second time under a PATH that offers jq but not python3.
  - D2 Rewrite the guard: equal behaviour of both parsers (input must be a JSON object);
    quote- and redirect-aware secret paths; `glob` check; pip exemption per command
    segment; package runners and agent plugin installs in the dependency group (`npx`
    only for locally installed binaries); wider git and remote-exec coverage; fewer false
    positives (commit messages, `cp`, `| python3 -m`, shell operators).
  - D3 fastdev: `medium` rework may wait until Monitor; anything unresolved at
    `COMPLETED` needs a human decision; category exceptions as data.
  - D4 fastdev: filled sections `immutable`, Log append-only; content of other tool files
    goes into the record.
  - D5 One runtime home per rule: question rounds, reproduce-first, and the rework limit
    in `core-rules`; proof quality in the deliverables card; deterministic follow-ups in
    the review card.
  - D6 Steering file: Kimbap removed; DAD-M pointer section with a compatibility block for
    the three rules and the rework limit; general secrets line kept; fallback copy.
  - D7 Remaining fixes: rule forms (must, by default), claim strength, privilege rule in
    the security baseline, human decision before redaction, restrictive recommendations
    for safety boundaries, registry scanner (`repo_local`, dangling symlinks), consistency
    of documents.
- Acceptance criteria:
  - AC1 jq installed with a verified checksum; the guard suite passes under python3 and
    jq; the new tests fail against the reviewed guard.
  - AC2 Every review finding is fixed or recorded with a reason.
  - AC3 0 YAML errors and 0 missing paths; cards at most 300 words; BIOS table, registry,
    and profile files in sync.
  - AC4 Steering-file fallback byte-identical; unrelated sections unchanged; no Kimbap
    reference left.
  - AC5 Kimbap skills moved, none left behind, restorable.
- Out of scope: `dadm-main-framework`; the fastdev pilot (deferred).
- Artifacts: this record.
- Risks: R2 the compatibility block repeats rules that `dadm-test-1` cards already hold
  (`low`, accepted: harmless while the canonical framework stays unchanged).
- Next step: Deploy.

## 3. Deploy

- Status: complete.
- Input summary: section 2.
- Implementation summary: D1 to D7 as designed.
- Files changed in this repository: `runtime/integration/` (`dadm-guard.sh`,
  `dadm-guard.test.sh`, `README.md`), `runtime/build_bios_registry.py`,
  `runtime/AI_BIOS.md`, `runtime/file-registry.yaml`, `runtime/bios.routing.yaml`,
  `runtime/profiles/fastdev.yaml`; cards `core-rules`, `governance-min`, `bootstrap-card`,
  `discover-card`, `deploy-card`, `deliverables-min`, `monitor-card`, `phase-map`,
  `fastdev-card`; `framework/core/` `phases`, `milestones`, `deliverables`,
  `artifact-retention`, `modules`, `bootstrap`; `framework/templates/milestone-record.md`;
  `governance/` `guardrails`, `security-baseline`, `governance-matrix`,
  `severity-framework`, `document-quality`, `framework-change-process`,
  `policies/rework-policy.yaml`; `THIRD_PARTY_NOTICES.md`, `AI_CONTEXT.md`,
  `docs/integrations/mattpocock-skills.md`; `docs/decisions/` (HD-2026-10-19-2,
  HD-2026-10-19-3, this record). Outside: jq in the user's local binary folder; the
  global steering file and its fallback; the user's skill folder.
- Proofs:
  - AC1: `sha256sum -c` → `jq-linux-amd64: OK`; `jq --version` → `jq-1.8.2`. Guard
    suite with jq: `117 passed, 32 failed` (F2) → parser fixed → `149 passed, 0 failed`
    → after the review fixes `209 passed, 0 failed (parsers: python3, jq)`. The same
    suite against the reviewed guard: `157 passed, 52 failed`.
  - Scanner: a fixture with a dangling `SKILL.md` symlink crashes the reviewed scanner
    (`FileNotFoundError`); the new scanner lists 3 skills and reports the two symlinks
    that point outside the fixture as `repo_local: False`.
  - AC3: reference check `YAML files with errors: 0`, `Missing referenced paths: 0`
    (after this record); largest card 297 words; sync check `all in sync: True`.
  - AC4: `cmp` of fallback and original: identical (SHA-256 `7ae746df…` for both); the
    unrelated section compared with `cmp`: identical; `grep -ci kimbap` → `0`; steering
    file 1,202 → 480 words.
  - AC5: `moved: 55`, `left in skills/: 0`, `in backup: 55`.
  - Runtime load per phase, characters, original `standard` path → now:

    | Profile | Discover | Apply | Deploy | Monitor |
    | --- | --- | --- | --- | --- |
    | `standard` | 12,038 → 8,045 (−33 %) | 12,019 → 8,189 (−32 %) | 11,944 → 8,194 (−31 %) | 11,949 → 9,471 (−21 %) |
    | `fastdev` (vs old `standard`) | 12,038 → 6,542 (−46 %) | 12,019 → 6,542 (−46 %) | 11,944 → 6,542 (−45 %) | 11,949 → 7,908 (−34 %) |
    | `strict` | 19,993 → 16,984 (−15 %) | 19,974 → 17,128 (−14 %) | 19,899 → 17,133 (−14 %) | 19,904 → 18,410 (−8 %) |

    Per session on top: steering file −6,727 characters, Kimbap skill descriptions
    −15,474 characters.
- Acceptance checklist: AC1 to AC5 met.
- Artifacts: this record, HD-2026-10-19-2, HD-2026-10-19-3 (all `immutable`); framework
  files (`versioned`, tracked by diff).
- Risks: none new.
- Next step: Monitor.

## 4. Monitor

- Status: complete.
- Input summary: section 3; the three review reports.
- Review disposition:
  - Fixed: Standards 1, 4 to 12 and its omitted items; Security 1 to 11, parser parity,
    dangling symlinks; Spec 1 to 5 and its omitted items.
  - Recorded instead: Standards 2 and 3, Spec 6 (FC-2026-10-19 is immutable, see
    Corrections); Spec (b) steering-file change (approved in HD-2026-10-19-2); Security
    "registry output path may be a symlink" (unchanged code from before this change,
    `low`, left as is).
- Residual risks:
  - M2-R1 (`low`): the guard can still be bypassed by scripts or unusual quoting.
  - M2-R2 (`low`): the fixes were verified by tests and checks, not by a second fresh
    review.
  - M2-R3 (`low`): R2.
  - M2-R4 (`low`): the jq folder is not on the shell PATH here; the guard uses python3
    first, so jq is the fallback only.
  - M2-R5 (`low`, from before this change): `framework-change-process.md` cites a gap
    analysis file that exists only in older copies.
  - M2-R6 (`info`): effects on error rate stay unmeasured until the fastdev pilot.
- Artifacts: this record.
- Next step: fastdev pilot (deferred by the human).

## Decision log

- 2026-10-19 DISCOVER decision: install jq user-locally from the verified official
  release — `sudo` needs a password — agent, within HD-2026-10-19-2.
- 2026-10-19 APPLY decision: keep a compatibility block in the steering file — the
  canonical framework stays unchanged and its cards lack three rules — agent.
- 2026-10-19 APPLY decision: keep the general secrets line from the removed Kimbap block
  — it is not specific to Kimbap — agent.
- 2026-10-19 APPLY decision: unresolved `medium` findings in fastdev need a human
  decision at completion — HD-2026-10-19-2 approved moving the gate, not removing it —
  agent.
- 2026-10-19 DEPLOY rework 1/2: guard blocked every call under jq — reproduction: the
  test suite with a jq-only PATH — `field()` returns success when no value is found —
  resolved.
- 2026-10-19 DEPLOY rework 1/2: fastdev card 305 words — reproduction: `wc -w` — two
  sentences shortened — resolved.
