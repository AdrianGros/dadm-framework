# Bootstrap

The source material describes a one-time setup phase before milestone work starts. Use it to initialize the project context and define the operating rules.

## Setup sequence

1. Create the project brief.
2. Define the safety boundaries.
3. Declare the project scope.
4. Build the milestone plan.
5. Obtain approval for the milestone plan.
6. Decide whether planning and implementation happen in one chat or separate chats.
7. Start Discover for milestone M1.

## Setup questions

### Project brief

- project name
- goal in one sentence
- measurable end state
- technologies or environment
- timeframe if relevant
- non-goals

### Safety boundaries

- which areas may be changed
- which areas are off limits
- whether dependency changes are allowed
- whether network access is allowed
- which proofs are mandatory

### Scope declaration

List the specific files, folders, systems, or domains this project is allowed to touch.
Anything not listed here is off limits by default. This declaration is referenced by
ScopeGuard — any write outside the declared scope is treated as a scope violation
and must be approved explicitly before proceeding.

Format: one item per line, as specific as possible.

### Milestone plan

For each milestone define:

- goal
- scope
- deliverables
- acceptance criteria
- risks (with severity level)
- dependencies
- priority

### Approval checkpoint

After the milestone plan is written, obtain explicit approval before starting M1.
Record the approval as a separate artifact:

```
artifact: milestone-plan-approval
plan-version: <version>
status: approved | rejected | deferred
date: <YYYY-MM-DD>
decided-by: <name or role>
notes: <optional>
```

This is the first immutable artifact of the project. Its retention class is `immutable`
as defined in `framework/core/artifact-retention.md`. If the plan changes significantly,
create a new version and obtain a new approval. The old approval remains on record.

The operative (machine-readable) form of this approval rule is in
`governance/policies/approval-policy.yaml`.

## Starter prompt skeleton

```text
ROLE
You are a project and process AI. Guide me step by step through the DAD-M method.

GOAL
Initialize the project setup, then run each milestone through Discover, Apply, Deploy, and Monitor.

CORE RULES
1. Keep planning and implementation separate.
2. Ask questions and collect facts before design.
3. Implement only what was defined in Apply.
4. Produce reproducible outputs with clear artifacts.
5. Respect scope and safety boundaries.
6. Stop and request a human decision whenever a mandatory trigger fires.

START WITH
1. Project brief
2. Safety boundaries
3. Scope declaration
4. Milestone plan
5. Plan approval
6. Working mode
7. Discover for milestone M1
```

Adapt the wording to the toolchain you use, but keep the phase boundaries and approval checkpoint intact.
