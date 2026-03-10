# RBAC Milestone Example

This page is a public DAD-M milestone example for designing a role-based access control system in a modular community operations platform.

It is intentionally anonymized. Product-specific names, internal labels, environment details, and operational identifiers have been removed or generalized. The goal is to show how DAD-M structures a technical architecture milestone, not to reproduce an internal implementation brief line by line.

## What this example demonstrates

- how Discover separates access analysis from solution design
- how Apply turns that analysis into a concrete RBAC architecture
- how Deploy prepares rollout, migration, and safe defaults
- how Monitor keeps the authorization model reviewable over time

## Public source treatment

For this public version, the original source material was handled in three buckets:

- retained: the DAD-M phase structure, RBAC core entities, deny-by-default logic, scoping model, testing expectations, and rollout concerns
- anonymized: project name, module names, role labels tied to a specific community, and product-specific operator language
- excluded: live-environment references, internal identifiers, and any implementation detail not needed to explain the method

## Milestone context

The example milestone assumes a system that already has multiple modules, administrative actions, and user-facing workflows. The task is to replace ad-hoc permission checks with a reusable authorization model that can later support database persistence, audit logging, and additional interfaces.

---

## Discover

### Goal

Understand which actions must be protected, which role families are needed, and where authorization decisions should live in the architecture.

### Example protected-action inventory

| Area | Example actions | Why protection is needed |
| --- | --- | --- |
| configuration | view settings, update settings, change module state | affects platform behavior |
| user administration | view user profile, suspend account, adjust role assignment | changes access and identity state |
| operations | run staff tools, trigger moderation workflows, review queues | can affect other users or system health |
| workflow modules | read records, update records, close records | requires separation between read and manage rights |
| system administration | manage seeds, inspect audit data, override blocked workflows | highest-risk actions |

### Example role families

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

This example separates permission names from where they apply:

- `global`: applies across the whole platform
- `tenant`: applies only inside one tenant or workspace boundary
- `module`: applies to a specific subsystem
- `own_resource`: applies only to resources owned by the acting user

### Architecture impact analysis

The Discover phase should identify where authorization decisions currently appear or should appear:

- entry points such as commands, endpoints, or operator actions
- service boundaries where business rules should be enforced
- repository boundaries where direct data writes need protection
- audit/logging paths for denied actions and privileged operations
- persistence requirements for roles, permissions, and assignments

### Risks and open decisions

- role names may drift into business-language overload if not normalized early
- role checks can become too broad if permissions are not separated from role labels
- scope handling can become inconsistent if entry points and services evaluate it differently
- emergency override paths can silently weaken the model if they are not explicitly documented

### Discover deliverables

- protected-action matrix
- role-family matrix
- permission naming rules
- scope model
- architecture impact summary
- open decisions and risks

---

## Apply

### Goal

Turn the authorization analysis into a reusable RBAC architecture with clear entities, central permission resolution, and testable access checks.

### Chosen public architecture

The public example uses five persistent core entities:

- `users`
- `roles`
- `permissions`
- `user_roles`
- `role_permissions`

Runtime evaluation is handled through a small authorization layer:

- permission registry for canonical names
- role service for assignment operations
- permission resolver for aggregating effective permissions
- access-check helper or decorator for central enforcement
- audit hook for denials and sensitive actions

### Example data-model shape

| Entity | Purpose |
| --- | --- |
| users | identity of the acting subject |
| roles | named permission bundles |
| permissions | atomic actions that may be granted |
| user_roles | assigns roles to users, optionally with scope |
| role_permissions | binds permissions to roles, optionally with scope rules |

### Example mapping

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

The example test plan covers:

- positive permission resolution
- deny-by-default behavior
- multiple-role aggregation
- empty-role behavior
- unknown permission handling
- scope mismatch failures
- denial logging for rejected access

### Apply deliverables

- architecture overview
- schema draft
- file-structure proposal
- role-to-permission mapping
- check-helper pattern
- test concept

---

## Deploy

### Goal

Prepare the RBAC model for safe introduction into an existing system without weakening current controls.

### Rollout considerations

- create schema migrations before switching enforcement on
- seed a minimal set of standard roles and permissions
- start with central logging of denials and privileged actions
- integrate checks at entry points first, then harden service boundaries
- keep default permissions narrow during rollout

### Example rollout order

1. Introduce schema and permission registry.
2. Seed baseline permissions and conservative role bundles.
3. Add the permission resolver and access-check helper.
4. Connect the highest-risk administrative workflows first.
5. Expand coverage to other modules after validation.

### Rollback strategy

- keep the old access path available only during a controlled transition window
- gate new enforcement behind a documented rollout switch if needed
- record denial spikes and broken workflows before widening permissions

### Deploy deliverables

- migration plan
- seed plan
- rollout order
- rollback strategy
- denial logging plan

---

## Monitor

### Goal

Verify that the authorization model remains correct, narrow, and maintainable after rollout.

### Control checklist

- are permissions resolved correctly for each scope type
- are any roles broader than they need to be
- are common workflows missing required permissions
- are denied actions logged clearly enough for investigation
- do new modules follow the same naming and scope rules
- is permission creep visible in role bundles over time

### Typical failure scenarios

- a role receives broad administrative permissions to solve one local issue
- tenant-scoped actions are accidentally evaluated as global
- direct service calls bypass centralized checks
- denials are not logged, making failures hard to diagnose
- new modules invent inconsistent permission names

### Monitor deliverables

- audit checklist
- review points for role breadth
- common failure scenarios
- extension recommendations
- refactor notes for future modules

---

## Why this is a useful DAD-M example

This example shows the value of DAD-M on a technical milestone that could easily collapse into unstructured implementation. Discover keeps the access problem factual. Apply defines the model before code spreads. Deploy treats rollout as part of the solution instead of an afterthought. Monitor keeps the permission system from quietly drifting into over-privileged behavior.
