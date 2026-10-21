#!/usr/bin/env python3
"""Build a structured BIOS capability registry for a target repository.

The framework (this script) can live outside the repository it scans -
REPO_ROOT is never inferred from this file's location. Pass --repo-root
explicitly, or run from within the target workspace and rely on the cwd
default.
"""

from __future__ import annotations

import argparse
import datetime as dt
import hashlib
import json
import re
import tomllib
from pathlib import Path


RUNTIME_DIR = Path(__file__).resolve().parent
REPO_ROOT = Path.cwd()
OUTPUT_PATH = REPO_ROOT / "dadm" / "bios.registry.json"
# Skill roots and the explicit-invocation prefix of the harness that reads them.
SKILL_ROOTS = (
    (Path(".agents") / "skills", "$"),
    (Path(".claude") / "skills", "/"),
)


def sha256_text(text: str) -> str:
    return hashlib.sha256(text.encode("utf-8")).hexdigest()


def read_text(path: Path) -> str:
    return path.read_text(encoding="utf-8")


def iso_utc(ts: float) -> str:
    return dt.datetime.fromtimestamp(ts, tz=dt.timezone.utc).isoformat()


def rel(path: Path) -> str:
    return path.relative_to(REPO_ROOT).as_posix()


def extract_skill_frontmatter(text: str) -> dict[str, str]:
    if not text.startswith("---\n"):
        return {}
    end = text.find("\n---", 4)
    if end == -1:
        return {}
    block = text[4:end].strip()
    data: dict[str, str] = {}
    for line in block.splitlines():
        if ":" not in line:
            continue
        key, value = line.split(":", 1)
        data[key.strip()] = value.strip().strip('"').strip("'")
    return data


def infer_phase_scope(name: str) -> list[str]:
    lowered = name.lower()
    scopes = []
    for phase in ("discover", "apply", "deploy", "monitor"):
        if phase in lowered:
            scopes.append(phase)
    return scopes or ["cross_phase"]


def scan_agents_md() -> list[dict]:
    items = []
    for path in sorted(REPO_ROOT.rglob("AGENTS.md")):
        text = read_text(path)
        stat = path.stat()
        items.append(
            {
                "type": "policy",
                "path": rel(path),
                "name": "AGENTS.md",
                "description": "Durable repository or directory-scoped Codex rules.",
                "scope": "repo_or_directory",
                "trigger_mode": "automatic",
                "sha256": sha256_text(text),
                "last_scanned_utc": iso_utc(stat.st_mtime),
            }
        )
    return items


def find_skill_files(skills_root: Path) -> list[Path]:
    # rglob does not descend into symlinked skill folders (how linked skill
    # installs usually look), so check each direct child explicitly as well.
    # Dangling symlinks are skipped.
    found = set(skills_root.rglob("SKILL.md")) | set(skills_root.glob("*/SKILL.md"))
    return sorted(path for path in found if path.exists())


def scan_skills() -> list[dict]:
    items = []
    for root, prefix in SKILL_ROOTS:
        skills_root = REPO_ROOT / root
        if not skills_root.exists():
            continue

        for path in find_skill_files(skills_root):
            text = read_text(path)
            meta = extract_skill_frontmatter(text)
            stat = path.stat()
            skill_name = meta.get("name") or path.parent.name
            user_invoked = meta.get("disable-model-invocation", "").lower() == "true"
            resolved = path.resolve()
            items.append(
                {
                    "type": "skill",
                    "path": rel(path),
                    "resolved_path": str(resolved),
                    "name": skill_name,
                    "description": meta.get("description", ""),
                    "phase_scope": infer_phase_scope(skill_name),
                    "trigger_mode": "explicit_only" if user_invoked else "implicit_or_explicit",
                    "explicit_prefix": f"{prefix}{skill_name}",
                    "safety_flags": {
                        "repo_local": resolved.is_relative_to(REPO_ROOT),
                        "user_invoked_only": user_invoked,
                        "writes_by_default": "deploy" in skill_name.lower(),
                    },
                    "sha256": sha256_text(text),
                    "last_scanned_utc": iso_utc(stat.st_mtime),
                }
            )
    return items


def scan_custom_agents() -> list[dict]:
    items = []
    agents_root = REPO_ROOT / ".codex" / "agents"
    if not agents_root.exists():
        return items

    for path in sorted(agents_root.glob("*.toml")):
        with path.open("rb") as fh:
            data = tomllib.load(fh)
        text = read_text(path)
        stat = path.stat()
        mcp_servers = sorted((data.get("mcp_servers") or {}).keys())
        items.append(
            {
                "type": "agent",
                "path": rel(path),
                "name": data.get("name", path.stem),
                "description": data.get("description", ""),
                "model": data.get("model"),
                "model_reasoning_effort": data.get("model_reasoning_effort"),
                "sandbox_mode": data.get("sandbox_mode", "workspace-write"),
                "mcp_servers": mcp_servers,
                "trigger_mode": "explicit_only",
                "safety_flags": {
                    "read_only": data.get("sandbox_mode") == "read-only",
                    "uses_mcp": bool(mcp_servers),
                },
                "sha256": sha256_text(text),
                "last_scanned_utc": iso_utc(stat.st_mtime),
            }
        )
    return items


def scan_codex_config() -> dict | None:
    path = REPO_ROOT / ".codex" / "config.toml"
    if not path.exists():
        return None
    with path.open("rb") as fh:
        data = tomllib.load(fh)
    text = read_text(path)
    stat = path.stat()
    return {
        "type": "config",
        "path": rel(path),
        "agents": data.get("agents", {}),
        "sha256": sha256_text(text),
        "last_scanned_utc": iso_utc(stat.st_mtime),
    }


def scan_runtime_control_plane() -> list[dict]:
    # Framework-owned files (RUNTIME_DIR) may live outside REPO_ROOT when
    # framework_root is shared across workspaces, so report them as
    # absolute paths rather than repo-relative ones.
    items = []
    for filename in ("bios.policy.md", "bios.routing.yaml"):
        path = RUNTIME_DIR / filename
        text = read_text(path)
        stat = path.stat()
        items.append(
            {
                "type": "control_plane",
                "path": str(path),
                "name": filename,
                "sha256": sha256_text(text),
                "last_scanned_utc": iso_utc(stat.st_mtime),
            }
        )
    return items


def build_registry() -> dict:
    policies = scan_agents_md()
    skills = scan_skills()
    agents = scan_custom_agents()
    config = scan_codex_config()
    control_plane = scan_runtime_control_plane()

    return {
        "version": 1,
        "generated_at_utc": dt.datetime.now(dt.timezone.utc).isoformat(),
        "repo_root": str(REPO_ROOT),
        "summary": {
            "policies": len(policies),
            "skills": len(skills),
            "agents": len(agents),
            "has_project_config": config is not None,
        },
        "control_plane": control_plane,
        "project_config": config,
        "policies": policies,
        "skills": skills,
        "agents": agents,
    }


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument(
        "--repo-root",
        type=Path,
        default=Path.cwd(),
        help="Workspace to scan (default: current directory).",
    )
    parser.add_argument(
        "--output",
        type=Path,
        default=None,
        help="Output path (default: <repo-root>/dadm/bios.registry.json).",
    )
    return parser.parse_args()


def main() -> int:
    global REPO_ROOT, OUTPUT_PATH
    args = parse_args()
    REPO_ROOT = args.repo_root.resolve()
    OUTPUT_PATH = (args.output or (REPO_ROOT / "dadm" / "bios.registry.json")).resolve()
    OUTPUT_PATH.parent.mkdir(parents=True, exist_ok=True)

    registry = build_registry()
    OUTPUT_PATH.write_text(json.dumps(registry, indent=2), encoding="utf-8")
    print(f"[bios-registry] wrote {OUTPUT_PATH}")
    print(json.dumps(registry["summary"], indent=2))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
