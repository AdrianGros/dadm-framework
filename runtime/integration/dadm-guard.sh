#!/usr/bin/env bash
# dadm-guard: PreToolUse hook for Claude Code that blocks tool calls crossing the
# DAD-M safety boundaries before they run (governance/security-baseline.md).
#
# Adapted from mattpocock/skills, skills/misc/git-guardrails-claude-code
# (MIT License, Copyright (c) 2026 Matt Pocock; see THIRD_PARTY_NOTICES.md).
# Changes: fails closed when the input cannot be parsed (the original allowed
# everything without jq), parses with python3 and falls back to jq, checks Read and
# Grep inputs, and adds remote-exec, privilege, secret-file, and dependency groups.
#
# Install and test: runtime/integration/README.md
# Exit 0 allows the call; exit 2 blocks it and returns stderr to the agent.
# DADM_GUARD_ALLOW_DEPS=1 in the harness environment disables the dependency group
# for projects whose safety boundaries allow dependency changes.
# A pattern guard catches mistakes; it is not a sandbox against a deliberate adversary.

set -u

input=$(cat)

field() {
  # $1: object holding the keys ("tool_input", or "" for the top level); then keys.
  # Prints the first non-empty string value. Input that is not a JSON object fails.
  local scope=$1
  shift
  if command -v python3 >/dev/null 2>&1; then
    printf '%s' "$input" | python3 -I -c '
import json, sys
data = json.load(sys.stdin)
scope = (data.get(sys.argv[1]) if sys.argv[1] else data) or {}
print(next((scope[k] for k in sys.argv[2:] if isinstance(scope.get(k), str) and scope[k]), ""))' "$scope" "$@"
  elif command -v jq >/dev/null 2>&1; then
    local key value
    for key in "$@"; do
      value=$(printf '%s' "$input" | jq -rn --arg o "$scope" --arg k "$key" '
        input
        | if type != "object" then error("tool input is not a JSON object") else . end
        | (if $o == "" then . else (.[$o] // {}) end)[$k] // ""
        | strings') || return 1
      if [ -n "$value" ]; then
        printf '%s' "$value"
        return 0
      fi
    done
    return 0
  else
    return 1
  fi
}

refuse() {
  echo "BLOCKED by dadm-guard [parser]: cannot read the tool input (needs python3 or jq, and a JSON object); refusing to run unchecked." >&2
  exit 2
}

cmd=$(field tool_input command) || refuse
path=$(field tool_input file_path path) || refuse
glob=$(field tool_input glob) || refuse
workdir=$(field "" cwd) || refuse
[ -n "$workdir" ] || workdir=$PWD

block() {
  # $1 group, $2 subject, $3 rule
  printf 'BLOCKED by dadm-guard [%s]: %s\nDAD-M rule: %s\nAsk the human to approve or run it.\n' \
    "$1" "${2:0:200}" "$3" >&2
  exit 2
}

has() { printf '%s\n' "$1" | grep -Eq -- "$2"; }
# Templates such as .env.example hold no secrets.
scrub() { printf '%s\n' "$1" | sed -E 's/\.env\.(example|sample|template|dist|defaults)//g'; }
# One line per command segment, split at && || ; and |.
segments() { printf '%s\n' "$1" | sed -E 's/(&&|\|\||;|\|)/\n/g'; }

CMD_START='(^|[;&|({`[:space:]])'
GIT_CMD="${CMD_START}git([[:space:]]+-C[[:space:]]+[^[:space:]]+)?[[:space:]]+"
OPEN_QUOTE="[\"'<]?"
PATH_CHARS="[^[:space:];&|\"']"
NAME_CHARS="[^[:space:];&|/\"']"
SECRET_NAME="(\.env(\.[[:alnum:]_.-]+)?|\.envrc|\.netrc|\.git-credentials|\.npmrc|\.pypirc|credentials|\.kube/config|\.docker/config\.json|id_(rsa|dsa|ecdsa|ed25519)|${NAME_CHARS}+\.(pem|key|p12|pfx|keystore|jks))"
NAME_END='([^[:alnum:]_.-]|$)'
READ_CMD="${CMD_START}(cat|less|more|head|tail|bat|nl|strings|xxd|od|hexdump|base64|grep|egrep|fgrep|rg|ag|awk|sed|cut|sort|diff|jq|yq|scp|rsync|curl|wget)[[:space:]]"
SECRET_RULE="Secret files stay out of the model context and are never sent elsewhere (security-baseline, section 1)."

if [ -n "$path" ] && has "$(scrub "$path")" "(^|/)${SECRET_NAME}\$"; then
  block secrets "$path" "$SECRET_RULE"
fi

if [ -n "$glob" ]; then
  # Check the glob with its wildcards read as a gap and as a filler character.
  for variant in "$(scrub "$glob" | sed -E 's/[][*?{}!]/ /g')" "$(scrub "$glob" | sed -E 's/[][*?{}!]/x/g')"; do
    has "$variant" "(^|[/,[:space:]])${SECRET_NAME}${NAME_END}" && block secrets "$glob" "$SECRET_RULE"
  done
fi

[ -z "$cmd" ] && exit 0

# Join continued lines; blank commit messages, which are text, not commands.
cmd=$(printf '%s' "$cmd" | sed -e ':a' -e '/\\$/{N;s/\\\n//;ba}' |
  sed -E "s/(-m|--message)([[:space:]]+|=)(\"[^\"]*\"|'[^']*')/\\1 MSG/g")

for p in \
  "${GIT_CMD}push([[:space:]]|\$)" \
  "${GIT_CMD}reset[[:space:]]+([^;&|]*[[:space:]])?--hard" \
  "${GIT_CMD}clean[[:space:]]+([^;&|]*[[:space:]])?(-[[:alpha:]]*f|--force)" \
  "${GIT_CMD}branch[[:space:]]+([^;&|]*[[:space:]])?-D([[:space:]]|\$)" \
  "${GIT_CMD}checkout[[:space:]]+([^;&|]*[[:space:]])?(\.|-f|--force)([[:space:]]|\$)" \
  "${GIT_CMD}restore[[:space:]]+([^;&|]*[[:space:]])?\.([[:space:]]|\$)" \
  "${GIT_CMD}stash[[:space:]]+(clear|drop)([[:space:]]|\$)"; do
  has "$cmd" "$p" && block git "$cmd" \
    "Destructive or outward-facing git commands need explicit human approval (security-baseline, section 4)."
done

for p in \
  "(curl|wget)[^|;&]*\|[[:space:]]*(sudo[[:space:]]+)?([^[:space:]|;&]*/)?(env[[:space:]]+)?(ba|z|da|k|fi)?sh([[:space:]]|\$)" \
  "(curl|wget)[^|;&]*\|[[:space:]]*(sudo[[:space:]]+)?([^[:space:]|;&]*/)?(python[0-9.]*|node|perl|ruby|php)([[:space:]]+-)?[[:space:]]*(\$|[;&|)])" \
  '(ba|z)?sh[[:space:]]+(-c[[:space:]]+)?.?(<\(|\$\()[[:space:]]*(curl|wget)'; do
  has "$cmd" "$p" && block remote-exec "$cmd" \
    "Downloaded code is read before it runs (security-baseline, section 2)."
done

has "$cmd" "${CMD_START}(sudo|doas|pkexec)[[:space:]]|${CMD_START}su[[:space:]]+(-|root)" && block privilege "$cmd" \
  "Privilege escalation needs explicit human approval (security-baseline, section 4)."

has "$(scrub "$cmd")" "${READ_CMD}([^;&|]*[[:space:]=@])?${OPEN_QUOTE}(${PATH_CHARS}*/)?${SECRET_NAME}${NAME_END}" &&
  block secrets "$cmd" "$SECRET_RULE"

[ "${DADM_GUARD_ALLOW_DEPS:-0}" = "1" ] && exit 0

DEPS_RULE="Dependency changes need approval under the safety boundaries (trigger 4; security-baseline, section 3)."
for p in \
  "${CMD_START}(npm|pnpm|bun)[[:space:]]+(install|i|add)[[:space:]]+(-[^[:space:]]+[[:space:]]+)*[^-[:space:];&|]" \
  "${CMD_START}yarn[[:space:]]+(global[[:space:]]+)?add[[:space:]]" \
  "${CMD_START}(uv[[:space:]]+(add|pip[[:space:]]+install)|poetry[[:space:]]+add|pipx[[:space:]]+(install|run)|cargo[[:space:]]+(add|install)|go[[:space:]]+get|gem[[:space:]]+install|composer[[:space:]]+require)[[:space:]]" \
  "${CMD_START}(uvx|bunx|pnpx)[[:space:]]" \
  "${CMD_START}(pnpm|yarn|bun)[[:space:]]+dlx[[:space:]]" \
  "${CMD_START}go[[:space:]]+install[[:space:]]+[^.[:space:]]" \
  "${CMD_START}dotnet[[:space:]]+add[[:space:]].*package" \
  "${CMD_START}(apt|apt-get|dnf|yum|zypper|brew|snap|flatpak)[[:space:]]+install[[:space:]]" \
  "${CMD_START}(pacman|yay|paru)[[:space:]]+-S[^si]" \
  "${CMD_START}(claude|codex|copilot)[[:space:]]+plugin[[:space:]]+(install|add|marketplace[[:space:]]+add)" \
  "${CMD_START}gemini[[:space:]]+(skills|extensions)[[:space:]]+install"; do
  has "$cmd" "$p" && block dependencies "$cmd" "$DEPS_RULE"
done

# pip: requirement files and the local project are exempt, per command segment.
while IFS= read -r seg; do
  if has "$seg" "pip3?[[:space:]]+install[[:space:]]" &&
    ! has "$seg" "pip3?[[:space:]]+install[[:space:]]+(-r|--requirement|(-e|--editable)[[:space:]]+\.|\.([[:space:]]|\$))"; then
    block dependencies "$cmd" "$DEPS_RULE"
  fi
done < <(segments "$cmd")

# npx and npm exec download any package that is not installed locally.
NPX_RE='(^|[[:space:]])(npx|npm[[:space:]]+exec)([[:space:]]+-[^[:space:]]*)*[[:space:]]+([^-[:space:]][^[:space:]]*)'
while IFS= read -r seg; do
  if [[ $seg =~ $NPX_RE ]] && [ ! -x "$workdir/node_modules/.bin/${BASH_REMATCH[4]}" ]; then
    block dependencies "$cmd" "Running a package that is not installed downloads it. $DEPS_RULE"
  fi
done < <(segments "$cmd")

exit 0
