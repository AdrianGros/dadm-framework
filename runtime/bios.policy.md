# BIOS Control-Plane Policy

## Purpose

In Codex-native repositories, BIOS is the control plane that resolves how a user task
should be routed through DAD-M and through the repo's available capabilities.

BIOS answers:

- what the task is trying to achieve
- which DAD-M phase is active or safest next
- which repo-local capabilities exist
- which capabilities are allowed for this task
- which routing plan should be used

## Source-of-Truth Rule

BIOS must not duplicate the operative instructions stored elsewhere.

The authoritative execution surfaces remain:

- `AGENTS.md` for durable repo rules
- `.agents/skills/*/SKILL.md` for reusable workflows
- `.codex/config.toml` for project-level Codex settings
- `.codex/agents/*.toml` for custom subagent definitions
- MCP configuration and capability-specific docs for external systems

BIOS holds the mapping and routing logic, not the duplicated content.

## Control-Plane Flow

Use this pipeline:

1. Prompt intake
2. Intent and task extraction
3. DAD-M phase classification
4. Capability resolution
5. Routing-plan synthesis
6. Codex execution
7. Monitor feedback and registry refresh

## Capability Classes

BIOS should classify repo capabilities into these types:

- `policy`: durable repo rules such as `AGENTS.md`
- `skill`: reusable workflows with descriptions and optional scripts
- `agent`: narrow custom subagents
- `config`: project-level Codex execution settings
- `mcp`: external context or tool providers
- `verification`: commands, tests, and evidence paths used to validate work

## Capability Resolution Rules

### Discovery

Resolve:

- relevant `AGENTS.md`
- the active DAD-M route card
- matching repo skills by name and description
- read-only agents that can help with exploration, review, or docs verification

Prefer:

- phase skills
- read-only exploration
- explicit risk capture

Do not:

- route directly into implementation-only capabilities unless the task has already moved to Deploy

### Apply

Resolve:

- the closed Discover artifact
- design-oriented skills
- reviewers when tradeoffs or risks need a second pass

### Deploy

Resolve:

- the approved Apply artifact
- implementation permissions and verification paths
- only the minimum additional capabilities needed to implement and prove the change

### Monitor

Resolve:

- verification commands
- review or audit agents
- release evidence and runbooks

## Trigger Semantics

- `AGENTS.md` is automatic context and does not need an explicit trigger.
- Skills may be used implicitly through strong `description` matches or explicitly through
  a direct `$skill-name` invocation.
- Subagents should be treated as explicit delegation only.
- MCP-backed capabilities should be resolved when the task depends on external context,
  official documentation, or system tooling beyond the repo itself.

## Memory And Freshness

BIOS should keep a structured registry rather than informal memory.

At minimum, the registry should store:

- capability type
- path
- name
- description
- safety flags
- phase scope
- trigger mode
- version or hash
- last scanned timestamp

When files change, BIOS should refresh the registry instead of relying on stale summaries.

## Non-Goals

BIOS is not:

- a second AGENTS file
- a replacement for DAD-M phases
- a hidden implementation layer
- a free-form memory dump

## Done When

The BIOS control plane is working when:

- prompt intent can be classified reliably enough for phase routing
- available capabilities are discoverable and version-aware
- routing plans can be explained in a reviewable way
- phase boundaries remain intact during execution
