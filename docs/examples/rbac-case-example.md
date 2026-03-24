# RBAC Milestone Example

This page is a public DAD-M milestone example for designing a role-based access control
system in a modular community operations platform.

It is intentionally anonymized. Product-specific names, internal labels, environment
details, and operational identifiers have been removed or generalized. The goal is to
show how DAD-M structures a technical architecture milestone, not to reproduce an
internal implementation brief line by line.

## What this example demonstrates

- the complete milestone definition format (all required fields)
- how Discover separates access analysis from solution design
- how Apply turns that analysis into a concrete RBAC architecture
- how Deploy prepares rollout, migration, and safe defaults
- how Monitor keeps the authorization model reviewable over time
- severity-labeled risks at each phase
- the standard phase output format (Status, Input Summary, Artifacts, Risks, Next Step)
- the decision log as an append-only record

## Public source treatment

For this public version, the original source material was handled in three buckets:

- retained: the DAD-M phase structure, RBAC core entities, deny-by-default logic, scoping model, testing expectations, and rollout concerns
- anonymized: project name, module names, role labels tied to a specific community, and product-specific operator language
- excluded: live-environment references, internal identifiers, and any implementation detail not needed to explain the method

---

## Milestone definition

**goal:** Design and specify a reusable RBAC authorization model to replace ad-hoc permission checks.

**scope:**
- Authorization model definition (entities, permission registry, role-permission mapping)
- Access evaluation principles and check pattern
- Rollout and migration plan
- Monitor checklist for ongoing compliance

**constraints:**
- Must not weaken currently active access controls during transition
- Permission names must follow the established namespace convention
- No live-environment data may appear in any public artifact

**deliverables:**
- Protected-action matrix (Discover)
- Role-family and permission mapping (Discover + Apply)
- Architecture specification with data model and check pattern (Apply)
- Migration and rollout plan (Deploy)
- Monitor checklist (Monitor)

**acceptance criteria:**
- All role families are defined with example permissions
- Deny-by-default principle is explicit in the architecture
- Scope model covers global, tenant, module, and own_resource
- Rollout order ensures no security regression
- Monitor checklist covers permission creep and scope drift

**risks and assumptions:**

| Severity | Risk |
| --- | --- |
| `medium` | Role names may drift into business-language overload if not normalized early |
| `medium` | Scope handling can become inconsistent if entry points and services evaluate it differently |
| `low` | Permission registry may not cover all edge cases discovered during Deploy |
| `info` | Emergency override paths not specified in this milestone; must be documented separately |

**dependencies:** none

**priority:** P1

---

## Discover

**phase-state:** COMPLETED

### Goal

Understand which actions must be protected, which role families are needed, and where
authorization decisions should live in the architecture.

### Protected-action inventory

| Area | Example actions | Why protection is needed |
| --- | --- | --- |
| configuration | view settings, update settings, change module state | affects platform behavior |
| user administration | view user profile, suspend account, adjust role assignment | changes access and identity state |
| operations | run staff tools, trigger moderation workflows, review queues | can affect other users or system health |
| workflow modules | read records, update records, close records | requires separation between read and manage rights |
| system administration | manage seeds, inspect audit data, override blocked workflows | highest-risk actions |

### Role families

| Role family | Purpose |
| --- | --- |
| platform_admin | full administrative control, still subject to logging |
| tenant_admin | administrative control inside one tenant or workspace |
| operations_moderator | moderation or support workflows without full admin rights |
| support_agent | case handling and limited workflow execution |
| member | standard user permissions |
| service_account | non-human integration actor with narrowly scoped rights |

### Permission naming concept

Use a predictable namespace so permissions remain readable and expandable:

- `user.read`
- `user.manage`
- `config.read`
- `config.update`
- `case.read`
- `case.manage`
- `moderation.execute`
- `audit.read`
- `system.admin`

### Scope model

- `global` — applies across the whole platform
- `tenant` — applies only inside one tenant or workspace boundary
- `module` — applies to a specific subsystem
- `own_resource` — applies only to resources owned by the acting user

### Architecture impact analysis

Authorization decisions currently appear or should appear at:

- entry points such as commands, endpoints, or operator actions
- service boundaries where business rules should be enforced
- repository boundaries where direct data writes need protection
- audit/logging paths for denied actions and privileged operations
- persistence requirements for roles, permissions, and assignments

### Phase output — Discover

**Status:** complete

**Input Summary:** Milestone definition, system context description, existing permission check patterns.

**Artifacts:**

| Artifact | Retention |
| --- | --- |
| Protected-action matrix (this document) | `immutable` |
| Role-family matrix (this document) | `immutable` |
| Permission naming rules (this document) | `immutable` |
| Scope model (this document) | `immutable` |
| Architecture impact summary (this document) | `immutable` |

**Risks and Assumptions:**

| Severity | Entry |
| --- | --- |
| `medium` | Role names may drift into business overload — must be enforced via naming rules before Apply closes |
| `low` | Emergency override paths are not in scope; must be documented as a follow-up milestone |
| `info` | Permission inventory covers example actions only; additional protected actions may emerge during Apply |

**Next Step:** Apply — design the RBAC architecture from the Discover findings.

---

## Apply

**phase-state:** COMPLETED

### Goal

Turn the authorization analysis into a reusable RBAC architecture with clear entities,
central permission resolution, and testable access checks.

### Architecture

Five persistent core entities:

- `users`
- `roles`
- `permissions`
- `user_roles`
- `role_permissions`

Runtime evaluation through a small authorization layer:

- permission registry for canonical names
- role service for assignment operations
- permission resolver for aggregating effective permissions
- access-check helper or decorator for central enforcement
- audit hook for denials and sensitive actions

### Data model

| Entity | Purpose |
| --- | --- |
| users | identity of the acting subject |
| roles | named permission bundles |
| permissions | atomic actions that may be granted |
| user_roles | assigns roles to users, optionally with scope |
| role_permissions | binds permissions to roles, optionally with scope rules |

### Role-to-permission mapping

| Role family | Example permissions |
| --- | --- |
| platform_admin | `config.update`, `audit.read`, `system.admin`, `user.manage` |
| tenant_admin | `config.read`, `config.update`, `user.read`, `user.manage` within tenant scope |
| operations_moderator | `case.read`, `case.manage`, `moderation.execute` |
| support_agent | `case.read`, `case.manage` |
| member | `user.read`, `case.read` on allowed or owned resources |
| service_account | only the module-specific permissions required for its task |

### Access-evaluation principles

- deny by default
- aggregate permissions through roles rather than hard-coded role checks
- evaluate scope explicitly
- log denied and high-risk actions
- keep authorization rules separate from business logic where possible

### Example check pattern

```python
def require_permission(actor, permission_name, scope):
    effective_permissions = permission_resolver.resolve(actor, scope)
    if permission_name not in effective_permissions:
        audit_log.permission_denied(actor=actor, permission=permission_name, scope=scope)
        raise AccessDenied(permission_name)
```

### Test concept

- positive permission resolution
- deny-by-default behavior
- multiple-role aggregation
- empty-role behavior
- unknown permission handling
- scope mismatch failures
- denial logging for rejected access

### Phase output — Apply

**Status:** complete

**Input Summary:** Discover phase output — protected-action matrix, role families, permission naming rules, scope model, architecture impact summary.

**Artifacts:**

| Artifact | Retention |
| --- | --- |
| Architecture specification (this document) | `immutable` |
| Data model (this document) | `immutable` |
| Role-to-permission mapping (this document) | `immutable` |
| Check pattern (this document) | `immutable` |
| Test concept (this document) | `immutable` |

**Risks and Assumptions:**

| Severity | Entry |
| --- | --- |
| `medium` | Check pattern assumes a centralized permission resolver; distributed service calls that bypass this resolver would silently weaken the model |
| `low` | Test concept covers authorization layer only; integration tests across module boundaries are out of scope for this milestone |
| `info` | Data model uses five core entities; additional entities (e.g., permission groups) may be needed for future extensions |

**Next Step:** Deploy — implement the approved architecture and prepare rollout.

---

## Deploy

**phase-state:** COMPLETED

### Goal

Prepare the RBAC model for safe introduction into an existing system without weakening
current controls.

### Rollout considerations

- create schema migrations before switching enforcement on
- seed a minimal set of standard roles and permissions
- start with central logging of denials and privileged actions
- integrate checks at entry points first, then harden service boundaries
- keep default permissions narrow during rollout

### Rollout order

1. Introduce schema and permission registry.
2. Seed baseline permissions and conservative role bundles.
3. Add the permission resolver and access-check helper.
4. Connect the highest-risk administrative workflows first.
5. Expand coverage to other modules after validation.

### Rollback strategy

- keep the old access path available only during a controlled transition window
- gate new enforcement behind a documented rollout switch if needed
- record denial spikes and broken workflows before widening permissions

### Phase output — Deploy

**Status:** complete

**Input Summary:** Apply phase output — architecture specification, data model, check pattern, test concept.

**Implementation Summary:** RBAC schema, permission registry, role-service, permission resolver, access-check helper, and audit hook defined and specified. Rollout order and rollback strategy documented.

**Files Changed:** (in a real project, list specific files; this example uses placeholder format)

- `db/migrations/` — schema for users, roles, permissions, user_roles, role_permissions
- `src/auth/` — permission registry, role service, permission resolver, access-check helper
- `src/audit/` — denial logging hook

**Proofs:** (in a real project, list concrete evidence; example types)

- Test suite covers all test concept scenarios (positive resolution, deny-by-default, scope mismatch)
- Seeded roles verified against role-to-permission mapping

**Acceptance Checklist:**

- [x] All role families defined with example permissions
- [x] Deny-by-default principle implemented in check helper
- [x] Scope model covers global, tenant, module, own_resource
- [x] Rollout order ensures no security regression
- [x] Denial logging active before rollout begins

**Artifacts:**

| Artifact | Retention |
| --- | --- |
| Migration plan (this document) | `immutable` |
| Seed plan (this document) | `immutable` |
| Rollout order (this document) | `immutable` |
| Rollback strategy (this document) | `immutable` |

**Risks and Assumptions:**

| Severity | Entry |
| --- | --- |
| `high` | If denial spikes appear after rollout, the rollback window must be kept open until root cause is confirmed |
| `medium` | Service-level authorization (bypassing entry-point checks) is not covered; must be addressed in a follow-up milestone |
| `info` | Rollout switch adds temporary complexity; remove it once rollout is complete |

**Next Step:** Monitor — validate that the authorization model remains correct and maintainable.

---

## Monitor

**phase-state:** COMPLETED

### Goal

Verify that the authorization model remains correct, narrow, and maintainable after rollout.

### Control checklist

- [ ] Permissions resolved correctly for each scope type
- [ ] No roles broader than they need to be
- [ ] Common workflows have required permissions
- [ ] Denied actions logged clearly enough for investigation
- [ ] New modules follow the same naming and scope rules
- [ ] Permission creep is not visible in role bundles over time

### Typical failure scenarios

- a role receives broad administrative permissions to solve one local issue
- tenant-scoped actions are accidentally evaluated as global
- direct service calls bypass centralized checks
- denials are not logged, making failures hard to diagnose
- new modules invent inconsistent permission names

### Phase output — Monitor

**Status:** complete

**Input Summary:** Deploy phase output — implemented RBAC model, rollout result, denial logs.

**Artifacts:**

| Artifact | Retention |
| --- | --- |
| Monitor checklist (this document) | `immutable` |
| Failure scenario registry (this document) | `immutable` |

**Risks and Assumptions:**

| Severity | Entry |
| --- | --- |
| `medium` | Permission creep is a persistent risk; the control checklist must be re-run at the start of each subsequent milestone that adds new roles or permissions |
| `low` | Service-level bypass risk (identified in Deploy) remains open; carry forward to next Discover |

**Next Step:** Carry open risks (service-level bypass) into next Discover as documented inputs.

---

## Decision log

```
date: <project date>
decision: deny-by-default adopted as the access-evaluation baseline
reason: any permission model that grants by default requires exhaustive coverage to remain secure; deny-by-default limits the blast radius of missing permission definitions
decided-by: human
refs: Apply phase output (access-evaluation principles)
```

```
date: <project date>
decision: emergency override paths excluded from this milestone scope
reason: emergency paths require separate security review; including them would expand scope beyond the defined milestone boundary
decided-by: human
refs: Discover phase output (risks and assumptions)
```

---

## Why this is a useful DAD-M example

This example shows the value of DAD-M on a technical milestone that could easily
collapse into unstructured implementation. Discover keeps the access problem factual.
Apply defines the model before code spreads. Deploy treats rollout as part of the
solution instead of an afterthought. Monitor keeps the permission system from quietly
drifting into over-privileged behavior.

The structure also demonstrates the severity scale in practice: `high` risks require
active attention before the phase closes, `medium` risks are tracked and carried forward,
and `info` entries document assumptions without blocking progress.
