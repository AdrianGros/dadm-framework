# Guardrails

The DAD-M source material is strict about scope control. These guardrails keep the workflow reviewable and reduce drift.

## Operating rules

- collect facts before proposing a solution
- keep Discover limited to analysis and inventory
- keep Apply limited to design
- keep Deploy limited to implementing the approved design
- do not introduce new architecture decisions during Deploy
- do not make critical assumptions when an answer is missing
- work only inside the allowed files, folders, or systems
- treat dependency changes and network use as explicit permissions, not defaults
- record risks and assumptions instead of hiding them
- produce reproducible outputs with concrete artifacts and proofs

## Publication rules for this repository

- do not publish sensitive, confidential, or project-specific raw material without review
- do not imply official organizational approval or standardization
- prefer narrower wording when a stronger claim cannot be proven
