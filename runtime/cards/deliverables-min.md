# Deliverables Minimal

Every phase output must contain:

- `status`
- `input_summary`
- `artifacts` with retention class
- `risks_and_assumptions` with severity labels
- `next_step`

Deploy additionally requires:

- `implementation_summary`
- `files_changed` (a commit range or `git diff --stat` is enough)
- `proofs`: able to fail (fail without the change, pass with it; an expected value that
  repeats the code's own computation proves nothing), signal lines only, secrets redacted
- `acceptance_checklist`

Decision log: append a decision when it is hard to reverse, surprising without context,
and the result of a real trade-off.

Write bullets; reference files, commits, and earlier outputs by path instead of copying them.

Use `framework/core/deliverables.md` when the runtime card is not specific enough.
