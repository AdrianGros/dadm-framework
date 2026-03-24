# M01 — Dokumenten-Inventar und Struktur-Audit
**phase:** COMPLETED
**milestone:** M01
**date:** 2026-03-24
**status:** closed

---

## Inventartabelle

| # | Datei | Typ | Status | Bemerkung |
|---|-------|-----|--------|-----------|
| 01 | `README.md` | Navigation | `vollständig` | Alle neuen Dateien referenziert; fehlt: `docs/decisions/` |
| 02 | `framework/core/phases.md` | Core | `vollständig` | AWAITING_HUMAN-Übergang beschrieben; Phase-State formal korrekt |
| 03 | `framework/core/milestones.md` | Core | `lückenhaft` | Kein Verweis auf `severity-framework.md` für Risiken; kein Verweis auf `docs/decisions/` als Speicherort für Pläne |
| 04 | `framework/core/deliverables.md` | Core | `lückenhaft` | Beschreibt Retention-Klassen, verweist aber nicht auf `artifact-retention.md`; kein Verweis auf `severity-framework.md` |
| 05 | `framework/core/bootstrap.md` | Core | `lückenhaft` | Approval-Artifact inline definiert, kein Verweis auf Template; Scope-Deklaration nicht mit `guardrails.md` verknüpft |
| 06 | `framework/core/artifact-retention.md` | Core | `vollständig` | Keine ausgehenden Querverweise; inhaltlich vollständig |
| 07 | `framework/core/modules.md` | Core | `vollständig` | Referenz-Zieldateien vorhanden; kein Default-Modul-Beispiel |
| 08 | `framework/templates/human-decision-record.md` | Template | `vollständig` | Zirkuläre Referenz mit `guardrails.md` (akzeptabel) |
| 09 | `governance/guardrails.md` | Governance | `lückenhaft` | `ScopeGuard` aus `bootstrap.md` nicht in Operating Rules erwähnt |
| 10 | `governance/quality-principles.md` | Governance | `veraltet` | Vor MA-06–MA-12 geschrieben; keine Severity, Human Decision, Rework, Scope-Konzepte |
| 11 | `governance/evidence-policy.md` | Governance | `lückenhaft` | Referenziert "DAD-M starter-kit" — projektspezifisch, nicht framework-generisch; DT-Nutzungsaussage in Public-Framework fraglich |
| 12 | `governance/severity-framework.md` | Governance | `vollständig` | Redundanz mit `governance-matrix.md` und `phases.md` bei "architecture decision in Deploy" |
| 13 | `governance/governance-matrix.md` | Governance | `lückenhaft` | "Check areas" abstrakt; keine Default-Module benannt; Matrix setzt Module voraus die nicht existieren |
| 14 | `governance/rework-and-escalation.md` | Governance | `lückenhaft` | `rework-attempt` YAML-Format definiert aber nicht als Schema formalisiert; kein Verweis auf `deliverables.md` |
| 15 | `governance/policies/README.md` | Policy-Index | `lückenhaft` | Nur 2 von möglichen 5+ Policies vorhanden (fehlt: rework, approval, network) |
| 16 | `governance/policies/severity-policy.yaml` | Policy | `widersprüchlich` | `stop_return_to_apply` ist kein definierter Standard-Action-Wert; `any:` als YAML-Key für einen Wert ist semantisch unklar |
| 17 | `governance/policies/human-decision-policy.yaml` | Policy | `vollständig` | Pfad zu Template (forward slash) plattformabhängig — minor |
| 18 | `docs/overview.md` | Docs | `veraltet` | Beschreibt alten 4-Schritt-Bootstrap; keine neuen Konzepte (Severity, AWAITING_HUMAN, Scope Declaration, Approval) |
| 19 | `docs/getting-started.md` | Docs | `veraltet` | Safety boundaries ohne Scope-Deklaration; Milestone ohne Dependencies/Priority; kein Approval-Checkpoint |
| 20 | `docs/use-cases.md` | Docs | `vollständig` | Minor: kein Verweis auf Decision Log / Audit Trail bei "traceable decisions" |
| 21 | `docs/examples/rbac-case-example.md` | Docs | `veraltet` | Vor MA-06–MA-12; kein Phase-State, keine Severity, kein Scope-Deklaration, keine Human-Decision-Trigger |
| 22 | `docs/variants/education.md` | Docs | `vollständig` | Work-in-progress, korrekt markiert; Risiken ohne Severity-Labels |
| 23 | `docs/decisions/MILESTONE_PLAN_V1.md` | Entscheidung | `vollständig` | Nicht in README verzeichnet (neu erstellt) |

**Legende:** `vollständig` | `lückenhaft` | `veraltet` | `widersprüchlich`

---

## Statusverteilung

| Status | Anzahl | Dateien |
|--------|--------|---------|
| `vollständig` | 10 | 02, 06, 07, 08, 12, 17, 20, 22, 23 + README (01) |
| `lückenhaft` | 8 | 03, 04, 05, 09, 11, 13, 14, 15 |
| `veraltet` | 4 | 10, 18, 19, 21 |
| `widersprüchlich` | 1 | 16 |

---

## Referenzgraph

Wer verweist auf wen (ausgehende Referenzen pro Datei):

```
README.md
  → framework/core/phases.md
  → framework/core/milestones.md
  → framework/core/deliverables.md
  → framework/core/bootstrap.md
  → framework/core/artifact-retention.md
  → framework/core/modules.md
  → framework/templates/human-decision-record.md
  → governance/guardrails.md
  → governance/quality-principles.md
  → governance/evidence-policy.md
  → governance/severity-framework.md
  → governance/governance-matrix.md
  → governance/rework-and-escalation.md
  → governance/policies/
  → docs/overview.md
  → docs/getting-started.md
  → docs/use-cases.md
  → docs/examples/rbac-case-example.md
  → docs/variants/education.md

framework/core/phases.md
  → governance/guardrails.md
  → framework/templates/human-decision-record.md

framework/core/bootstrap.md
  → (keine expliziten Verweise — Lücke)

framework/core/deliverables.md
  → (keine expliziten Verweise — Lücke)

framework/core/milestones.md
  → (keine expliziten Verweise — Lücke)

framework/core/artifact-retention.md
  → (keine expliziten Verweise — Lücke)

framework/core/modules.md
  → governance/governance-matrix.md
  → governance/severity-framework.md
  → governance/policies/

governance/guardrails.md
  → governance/severity-framework.md
  → framework/templates/human-decision-record.md

governance/severity-framework.md
  → governance/guardrails.md
  → governance/rework-and-escalation.md

governance/governance-matrix.md
  → governance/severity-framework.md
  → framework/templates/human-decision-record.md
  → governance/rework-and-escalation.md
  → governance/guardrails.md

governance/rework-and-escalation.md
  → governance/severity-framework.md
  → governance/governance-matrix.md
  → framework/templates/human-decision-record.md
  → framework/core/phases.md

framework/templates/human-decision-record.md
  → governance/guardrails.md

governance/policies/README.md
  → governance/severity-framework.md
  → governance/guardrails.md

governance/policies/severity-policy.yaml
  → (implicit: governance/severity-framework.md)

governance/policies/human-decision-policy.yaml
  → framework/templates/human-decision-record.md

docs/overview.md
  → framework/core/bootstrap.md
  → docs/getting-started.md
  → docs/use-cases.md
  → docs/variants/education.md
  → framework/core/phases.md
  → governance/guardrails.md

docs/getting-started.md
  → framework/core/bootstrap.md
  → framework/core/deliverables.md
  → docs/examples/rbac-case-example.md

docs/use-cases.md
  → (keine expliziten Verweise)

docs/examples/rbac-case-example.md
  → (keine expliziten Verweise)

docs/variants/education.md
  → (keine expliziten Verweise)

docs/decisions/MILESTONE_PLAN_V1.md
  → (keine expliziten Verweise — noch nicht in README)
```

### Dateien ohne eingehende Referenzen (Waisen-Kandidaten)

| Datei | Eingehende Referenzen von |
|-------|--------------------------|
| `governance/quality-principles.md` | README.md (einzige) |
| `governance/evidence-policy.md` | README.md (einzige) |
| `docs/decisions/MILESTONE_PLAN_V1.md` | keine |
| `docs/use-cases.md` | README.md, docs/overview.md |
| `docs/variants/education.md` | README.md, docs/overview.md, docs/use-cases.md |

---

## Offene Fragen pro Datei (Auswahl)

| Datei | Offene Frage |
|-------|-------------|
| `milestones.md` | Wo werden Milestone-Pläne gespeichert? `docs/decisions/` fehlt als Konvention |
| `deliverables.md` | Warum sind Retention-Klassen hier beschrieben wenn sie in `artifact-retention.md` definiert sind? Redundanz oder Absicht? |
| `bootstrap.md` | Approval-Artifact: eigenes Template nötig oder ist `human-decision-record.md` als Basis geeignet? |
| `guardrails.md` | Fehlt: ScopeGuard als Operating Rule (nur in `bootstrap.md` beschrieben) |
| `quality-principles.md` | Alle 6 Prinzipien beziehen sich auf Zustand vor MA-06–MA-12. Werden sie erweitert oder neu gefasst? |
| `evidence-policy.md` | "DAD-M starter-kit material" ist interner Begriff. Ersatz durch framework-generische Formulierung nötig |
| `governance-matrix.md` | Welche Module existieren als Default? Matrix ohne Module ist abstrakt |
| `severity-policy.yaml` | `stop_return_to_apply` ist kein valider Action-Wert — welcher Action-Wert ist korrekt? |
| `docs/overview.md` | Komplette Überarbeitung nötig um neue Konzepte zu spiegeln |
| `rbac-case-example.md` | Zeigt DAD-M vor MA-06–MA-12. Vollständige Überarbeitung in M17 |

---

## Phase-Output

**Status:** COMPLETED
**Input Summary:** 23 Repo-Dateien gelesen; 20 MD + 2 YAML + 1 neuer Plan
**Artifacts:** Diese Datei `docs/decisions/M01_inventar_audit.md`
**Risks and Assumptions:**
- `low` — Inventar ist ein Snapshot; neue Dateien in M02–M20 müssen nachgepflegt werden
- `medium` — `severity-policy.yaml` hat einen inhaltlichen Fehler (`stop_return_to_apply`); muss in M09/M10 korrigiert werden
**Next Step:** M02 — Terminologie-Inventar
