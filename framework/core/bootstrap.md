# Bootstrap

The source material describes a one-time setup phase before milestone work starts. Use it to initialize the project context and define the operating rules.

## Setup sequence

1. Create the project brief.
2. Define the safety boundaries.
3. Build the milestone plan.
4. Decide whether planning and implementation happen in one chat or separate chats.
5. Start Discover for milestone M1.

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

### Milestone plan

For each milestone define:

- goal
- scope
- deliverables
- acceptance criteria
- risks

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

START WITH
1. Project brief
2. Safety boundaries
3. Milestone plan
4. Working mode
5. Discover for milestone M1
```

Adapt the wording to the toolchain you use, but keep the phase boundaries intact.
