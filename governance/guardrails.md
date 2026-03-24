# Guardrails

The DAD-M source material is strict about scope control. These guardrails keep the workflow reviewable and reduce drift.

## Operating rules

- collect facts before proposing a solution
- keep Discover limited to analysis and inventory
- keep Apply limited to design
- keep Deploy limited to implementing the approved design
- do not introduce new architecture decisions during Deploy
- do not make critical assumptions when an answer is missing
- work only inside the allowed files, folders, or systems (scope compliance)
- treat dependency changes and network use as explicit permissions, not defaults
- record risks and assumptions instead of hiding them
- produce reproducible outputs with concrete artifacts and proofs

For software implementations, scope compliance and other operating rules are enforced
through the module framework defined in `framework/core/modules.md`.

## Severity language

Risks and findings recorded in any phase output carry a severity level: `info`, `low`,
`medium`, `high`, or `critical`. This creates a shared language for how serious an issue
is and what the appropriate response should be.

See `governance/severity-framework.md` for the full scale and category-specific rules.

## Human decision triggers

Some situations require a human to review and record a decision before work continues.
These are not optional escalation paths — they are mandatory stops.

Mandatory human decision triggers:

1. A `critical` severity finding in any phase — automated handling is insufficient for
   stop-level issues; human judgment is the only valid resolution mechanism.
2. A `high` or `critical` security or privacy finding — these categories carry potential
   irreversible consequences and external compliance implications that exceed automated
   decision authority.
3. A scope change that crosses milestone boundaries — cross-milestone scope changes
   invalidate the previously approved milestone plan and require explicit re-approval.
4. A dependency change not covered by the approved safety boundaries — unplanned
   dependencies introduce risks (security vulnerabilities, version conflicts, compliance
   issues) that were not evaluated at plan time.
5. The rework limit has been reached without resolving the issue — repeated failure to
   resolve a finding signals a structural problem beyond the scope of intra-phase
   correction. See `governance/rework-and-escalation.md` for the rework limit definition.
6. A strategic architecture tradeoff with no clearly correct option — a deterministic
   rule cannot resolve a genuine tradeoff between valid alternatives; human judgment
   is required.

When a trigger fires, record it in the phase output with:
- a concise summary of what triggered it
- the blocking reasons
- the available options and their risks
- a recommended option
- references to the relevant evidence or artifacts

Do not continue to the next phase until the human decision is recorded.

## AWAITING_HUMAN — mandatory pause

When a human decision trigger fires, the milestone enters a paused state.
No phase output is marked complete. No new phase starts.
The pause ends when the decision is documented as an artifact.

Allowed human responses: `approve`, `reject`, `modify`, `defer`.

## Publication rules for this repository

- do not publish sensitive, confidential, or project-specific raw material without review
- do not imply official organizational approval or standardization
- prefer narrower wording when a stronger claim cannot be proven
