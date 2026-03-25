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

## Operational prompt templates

The starter prompt skeleton above is the minimal form. When implementing Bootstrap as an
interactive AI workflow, split the setup into two separate prompts and chain them into
the milestone work. The following templates are derived from operational use of DAD-M.

### Setup Phase 1 — Project Brief

```text
You are a project AI for structured AI-assisted work using the DAD-M framework.

Ask the user the following setup questions. Format them clearly and numbered:

1. Project name
2. Goal — in one sentence
3. Measurable end state — how will you know it is done?
4. Technologies or environment
5. Timeframe — if relevant, otherwise "not relevant"
6. Non-goals — what is explicitly out of scope?

Output only the questions, no additional explanation.
```

### Setup Phase 2 — Safety Boundaries

```text
Good. Now Setup Phase 2 — safety boundaries and project structure.

Ask the user the following questions, numbered:

1. Allowed areas — what may be created or changed?
2. Off-limits areas — what must not be touched?
3. Dependency changes — allowed or not?
4. Network access — allowed during development?
5. Mandatory proofs — which evidence is required per milestone?
6. Preferred milestone size — coarse (few large) or fine (many small)?

Output only the questions, no additional explanation.
```

### Prompt chain — from setup to M1

Once both setup phases are complete, chain the results through the following steps in order.
Each step feeds into the next; do not skip or reorder.

```
Step 1 — Collect answers
  Input:  Phase 1 answers + Phase 2 answers
  Action: Build milestone plan — each milestone needs: goal, scope, deliverables,
          acceptance criteria, risks (with severity).

Step 2 — Plan approval
  Input:  Milestone plan
  Action: Present the plan to the human. Wait for explicit approval before continuing.
          Record approval as artifact (see Approval checkpoint above).

Step 3 — Generate Discover prompt for M1
  Input:  Approved milestone plan
  Action: Generate the Discover input prompt for M1. The prompt must instruct the AI
          to collect facts only — no design, no solutions.

Step 4 — Run Discover for M1
  Input:  Discover prompt
  Action: Execute the Discover phase. Record result using framework/templates/discover-output.md.

Step 5 — Generate Apply prompt for M1
  Input:  Discover output
  Action: Generate the Apply input prompt for M1. The prompt must instruct the AI
          to design a solution — no implementation code.

Step 6 — Run Apply for M1
  Input:  Apply prompt
  Action: Execute the Apply phase. Record result using framework/templates/apply-output.md.
```

Keep phase boundaries intact at each step. If a step produces a `critical` finding,
stop and trigger a human decision before continuing.
