# Modules

DAD-M phases produce findings through checks. In projects where those checks are
automated, a module system provides a structured, extensible way to define, activate,
and execute them.

## What a module is

A module is a single, self-contained check that:

- runs during one or more DAD-M phases
- receives input artifacts (files, code, documents)
- produces a structured result with zero or more findings
- assigns a severity level to each finding

Modules are independent of each other. One module's result does not affect another's
execution.

## Module interface

Every module exposes the same interface regardless of implementation language:

```
input:
  phase: DISCOVER | APPLY | DEPLOY | MONITOR
  artifacts: list of artifacts to check

output:
  module_name: <string>
  module_version: <string>
  phase: <phase>
  findings:
    - id: <unique within this result>
      severity: info | low | medium | high | critical
      category: <string>
      location: <optional — file, line, or artifact reference>
      message: <human-readable description>
```

If a module produces no findings, it returns an empty `findings` list, not an error.

## Module registry

Projects maintain a module registry that lists which modules are available and whether
each is active. The registry is a YAML file:

```yaml
modules:
  - name: <module-name>
    version: <semver>
    active: true | false
    phases: [DISCOVER, APPLY, DEPLOY, MONITOR]  # phases where this module runs
```

A module not listed in the registry does not run, even if it exists.

## Governance matrix integration

Each active module maps to the governance matrix (`governance/governance-matrix.md`).
The matrix determines whether a finding from that module is blocking or advisory
in each phase.

If a module is not in the governance matrix, its findings are treated as advisory
in all phases until the matrix is updated.

## Profiles

A profile is a named configuration that activates a specific subset of modules
and optionally overrides severity defaults. Profiles make it practical to run
DAD-M at different strictness levels in different contexts.

Suggested profile names:

| Profile | Intended context |
| --- | --- |
| `strict` | Production or regulated environments; all blocking checks active |
| `standard` | Regular project work; default configuration |
| `development` | Local iteration; reduced blocking checks |
| `fast` | Rapid prototyping; minimum required checks only |

A profile is declared in the project's safety boundaries:

```
active-profile: standard
```

If no profile is declared, `standard` applies. This default is a design choice: `standard`
is intended to represent a balanced starting point — active enough to catch significant
findings in typical project work, but not so restrictive that it blocks routine iterations.
Projects that require stronger controls should declare `strict` explicitly; projects that
need faster iteration should declare `development` or `fast`. Leaving the choice implicit
(no profile declared) defaults to `standard` as a conservative middle ground rather than
the least restrictive option.

The same profile names may also be used by a document-loading registry for AI runtime
context. In this repository, that runtime layer is defined in `runtime/file-registry.yaml`
and starts from `runtime/AI_BIOS.md`. Module profiles and document-load profiles are
parallel concepts: one selects checks, the other selects which framework documents are
loaded by default.

## Writing a new module

1. Define the module name and the phases it runs in.
2. Implement the interface: input artifacts → structured findings.
3. Add it to the module registry with `active: true`.
4. Update the governance matrix to specify blocking or advisory per phase.
5. Write at least one test case with a known input and expected output (golden output).
6. Document any severity overrides in `governance/policies/severity-policy.yaml`.

## Relationship to other documents

- Governance matrix: `governance/governance-matrix.md`
- Severity rules: `governance/severity-framework.md`
- YAML policies: `governance/policies/`
