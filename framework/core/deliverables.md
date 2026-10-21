# Deliverables

The framework favors explicit outputs over informal conversation history. This document defines the standard phase output structure, the decision log, and artifact retention.

For term definitions see `docs/glossary.md`.

## Standard phase output

For each phase, record:

- **Status** — one of: in progress / complete / blocked / awaiting human decision
- **Input Summary** — what inputs this phase worked from
- **Artifacts** — list of artifacts produced, with retention class
- **Risks and Assumptions** — findings and open issues; each entry carries a severity label (`info` / `low` / `medium` / `high` / `critical`). Any entry at `medium` or above must be resolved or explicitly accepted before the next phase begins (profile `fastdev`: `medium` by milestone completion, see Profile variant below). Any `critical` entry triggers a mandatory **AWAITING_HUMAN** pause.
- **Next Step** — what begins after this phase

## Additional Deploy output

For Deploy, add:

- **Implementation Summary** — what was built
- **Files Changed** — specific list; a commit range or `git diff --stat` output satisfies
  this, because the version control system is the source of truth
- **Proofs** — concrete evidence (see Proof section below)
- **Acceptance Checklist** — items from the acceptance criteria, checked
- **Next Steps** — follow-up actions

## Decision log

Every milestone maintains a decision log. Record significant decisions as they happen — not only human decision events.

A decision is significant when all three hold: it is hard to reverse, it would surprise a
reader without context, and it resulted from a real trade-off between alternatives.
Obvious or easily reversed choices stay out of the log, which keeps it short enough to be
read. (Test adapted from the criteria for architecture decision records in
`domain-modeling`, mattpocock/skills.)

Each entry:

```
date: <YYYY-MM-DD>
decision: <what was decided>
reason: <why>
decided-by: <human or agent>
refs: <artifact or document that supports this decision>
```

The decision log is append-only. Entries are never edited or removed after the fact.

## Proof examples

Proofs depend on the project. Concrete examples from the source material:

- compile checks
- test results
- grep results
- screenshots
- service status checks
- curl results

Choose proofs that show the work is real and reviewable without overstating the result.

### Proof quality

- **Able to fail.** A proof shows the result failing without the change and passing with
  it (for example, a test that is red before the change and green after). Where that is
  not feasible, state why.
- **Independent expectation.** A test whose expected value repeats the code's own
  computation passes by construction and proves nothing; expected values come from the
  spec, a worked example, or a known-good literal.
- **Signal only.** Quote the lines that carry the evidence, not full logs.
- **Redacted.** Secrets and personal data are replaced with `<REDACTED>` before the proof
  is recorded (`governance/security-baseline.md`).

## Artifact retention

Every artifact produced in a phase has a retention class. For the full definition of each class and which artifact types belong to each, see `framework/core/artifact-retention.md`.

Summary:

| Class | Can be changed after closing? |
| --- | --- |
| `immutable` | No |
| `versioned` | Only by creating a new version |
| `mutable` | Yes, during active work |

Closed phase outputs and human decision records are always `immutable`.

## Profile variant: fastdev

Under the `fastdev` profile (`runtime/profiles/fastdev.yaml`), a milestone produces one
human-readable **milestone record** (`framework/templates/milestone-record.md`) instead
of separate phase outputs, rework records, and a separate decision log. The record maps
the standard fields as follows:

| Standard field | Milestone record |
| --- | --- |
| Status | header `status` |
| Input Summary | Discover: Inputs, Current state |
| Artifacts | Deploy: Changes; Log: human decision links |
| Risks and Assumptions | Discover: Risks; Monitor: Review, Accepted risks |
| Next Step | Monitor: Follow-ups |
| Implementation Summary, Files Changed, Proofs | Deploy section |
| Acceptance Checklist | Monitor: Acceptance |
| Decision log, rework attempts | Log section |

Human decision records stay separate artifacts in every profile. Bootstrap artifacts,
including the milestone plan approval, are unchanged.

## Variant-specific extensions

The core framework keeps deliverables intentionally simple, but documented variants can extend them when the domain requires it.

For example, a DAD-M Education variant can add:

- Knowledge Status
- Risks / Open Points (with severity labels)
- explicit markers such as `Secured`, `Simplification`, `Interpretation`, and `Uncertain / context-dependent`

These extensions are useful when the output is meant to support learning, explanation, or knowledge verification rather than implementation work alone.
