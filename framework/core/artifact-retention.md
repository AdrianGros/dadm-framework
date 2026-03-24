# Artifact Retention

DAD-M artifacts are not equally permanent. This document is the authoritative definition
of retention classes. The summary in `framework/core/deliverables.md` refers back here.

For the term *Artifact*, see `docs/glossary.md`.

## Retention classes

| Class | Meaning | Can be changed? |
| --- | --- | --- |
| `immutable` | Written once; the record cannot be altered after it is closed. | No. Create a new artifact if circumstances change. |
| `versioned` | Updated by creating new versions; old versions remain on record. | Only by incrementing the version. |
| `mutable` | Can be freely updated during active work. | Yes, until the artifact is closed. |

## Assignment by artifact type

| Artifact type | Retention class |
| --- | --- |
| Closed phase output | `immutable` |
| Approved milestone plan | `immutable` |
| Approval record | `immutable` |
| Human decision record | `immutable` |
| Rework attempt record | `immutable` |
| Active milestone plan (in progress) | `versioned` |
| Architecture documents | `versioned` |
| Working notes and drafts | `mutable` |
| Risk register (open milestone) | `mutable` |

## Why immutability matters

An immutable artifact is evidence. It shows what was known and decided at a specific
point in time. Retroactively editing it would undermine the decision log and make the
project history unreliable.

If a decision turns out to be wrong, the correct response is:

1. Record a new artifact that supersedes the previous one.
2. Reference the original artifact from the new one.
3. Leave the original unchanged.

## Practical guidance

In document-based projects, treat immutability as a convention:

- Store closed phase outputs in a read-only location or mark them `[CLOSED]` in the filename.
- Tag approved plan versions with version number and date; do not overwrite.
- Store human decision records alongside the phase output and do not edit them.

In tool-based projects, enforce immutability through write-protection on the relevant paths.

## Relationship to other documents

- `framework/core/deliverables.md` — summary of retention classes in phase output context
- `framework/core/bootstrap.md` — approval record as the first immutable artifact of a project
- `governance/guardrails.md` — immutability as a guardrail principle
