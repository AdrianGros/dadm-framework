# Harness Integration

How to wire DAD-M into an agent harness without paying for it on every turn.

## 1. Minimal pointer for CLAUDE.md or AGENTS.md

Steering files are loaded into every session, so they should only point to DAD-M, not
restate it. Every rule copied into a steering file is paid for on every turn of every
session, including sessions in projects that do not use DAD-M, and it drifts from the
framework when the framework changes. Paste this block and adjust the path:

```markdown
## DAD-M

If `.dadm-workspace.yaml` exists in the project root, read
`<framework_root>/runtime/AI_BIOS.md` first and follow its load order; the workspace file
names the profile. Keep project artifacts in the workspace (`./dadm/`) and framework files
in `<framework_root>`. Without that file, DAD-M does not apply.
```

Keep only settings that the framework cannot know (paths, workspace-specific bootstrap
defaults) next to the pointer.

## 2. Guard hook (Claude Code)

`dadm-guard.sh` blocks tool calls that cross the safety boundaries before they run:
destructive or outward-facing git commands, piping downloads into a shell, `sudo`,
reading or sending secret files (also through the Read and Grep tools), dependency and
plugin installs, and running packages that are not installed locally (`npx`, `uvx`,
`pnpm dlx`). Rules: `governance/security-baseline.md`.

Install for one project:

```bash
mkdir -p .claude/hooks
cp <framework_root>/runtime/integration/dadm-guard.sh .claude/hooks/
chmod +x .claude/hooks/dadm-guard.sh
```

Merge into `.claude/settings.json` (keep existing hooks):

```json
{
  "hooks": {
    "PreToolUse": [
      {
        "matcher": "Bash|Read|Grep",
        "hooks": [
          { "type": "command", "command": "\"$CLAUDE_PROJECT_DIR\"/.claude/hooks/dadm-guard.sh" }
        ]
      }
    ]
  }
}
```

For all projects, copy the script to `~/.claude/hooks/` and register it in
`~/.claude/settings.json` with that path instead.

Test after installing or editing patterns:

```bash
bash <framework_root>/runtime/integration/dadm-guard.test.sh
```

Notes:

- The hook needs `python3` or `jq`. Without either it blocks every call (fails closed).
- If the safety boundaries allow dependency changes without per-change approval, start
  the harness with `DADM_GUARD_ALLOW_DEPS=1`.
- Pattern matching catches mistakes, not a deliberate adversary: commands hidden in
  scripts or quoted strings pass. Keep the human decision triggers as the real control.

## 3. Optional skill pack

Which skills from mattpocock/skills fit which phase, and which were adopted into the
cards: `docs/integrations/mattpocock-skills.md`.
