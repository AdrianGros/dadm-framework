# Deliverables

The framework favors explicit outputs over informal conversation history. This document defines the standard phase output structure, the decision log, and artifact retention.

For term definitions see `docs/glossary.md`.

## Standard phase output

For each phase, record:

- **Status** — one of: in progress / complete / blocked / awaiting human decision
- **Input Summary** — what inputs this phase worked from
- **Artifacts** — list of artifacts produced, with retention class
- **Risks and Assumptions** — findings and open issues; each entry carries a severity label (`info` / `low` / `medium` / `high` / `critical`). Any entry at `medium` or above must be resolved or explicitly accepted before the next phase begins. Any `critical` entry triggers a mandatory **AWAITING_HUMAN** pause.
- **Next Step** — what begins after this phase

## Additional Deploy output

For Deploy, add:

- **Implementation Summary** — what was built
- **Files Changed** — specific list
- **Proofs** — concrete evidence (see Proof section below)
- **Acceptance Checklist** — items from the acceptance criteria, checked
- **Next Steps** — follow-up actions

## Decision log

Every milestone maintains a decision log. Record significant decisions as they happen — not only human decision events.

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

## Artifact retention

Every artifact produced in a phase has a retention class. For the full definition of each class and which artifact types belong to each, see `framework/core/artifact-retention.md`.

Summary:

| Class | Can be changed after closing? |
| --- | --- |
| `immutable` | No |
| `versioned` | Only by creating a new version |
| `mutable` | Yes, during active work |

Closed phase outputs and human decision records are always `immutable`.

## Variant-specific extensions

The core framework keeps deliverables intentionally simple, but documented variants can extend them when the domain requires it.

For example, a DAD-M Education variant can add:

- Knowledge Status
- Risks / Open Points (with severity labels)
- explicit markers such as `Secured`, `Simplification`, `Interpretation`, and `Uncertain / context-dependent`

These extensions are useful when the output is meant to support learning, explanation, or knowledge verification rather than implementation work alone.
