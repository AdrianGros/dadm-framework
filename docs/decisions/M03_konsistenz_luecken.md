# M03 — Konsistenz- und Lückenprüfung
**phase:** COMPLETED
**milestone:** M03
**date:** 2026-03-24
**status:** closed

---

## Widerspruchsliste

Stellen wo zwei Dokumente sich direkt widersprechen oder unvereinbar sind.

| ID | Datei A | Stelle A | Datei B | Stelle B | Art des Widerspruchs |
|----|---------|----------|---------|----------|----------------------|
| W-01 | `severity-policy.yaml` | `stop_return_to_apply` als Action-Wert | `governance-matrix.md`, `rework-and-escalation.md`, `guardrails.md` | Definierte Actions: allow / allow_with_notes / rework / escalate / block / human_decision | `stop_return_to_apply` existiert als Action-Wert in keiner Markdown-Quelle — YAML definiert etwas das nirgendwo spezifiziert ist |
| W-02 | `docs/overview.md` | Setup: 4 Schritte (brief, safety boundaries, milestone plan, deliverable format) | `framework/core/bootstrap.md` | Setup: 7 Schritte (+ scope declaration, approval checkpoint, working mode) | overview.md zeigt veralteten Bootstrap-Stand; 3 Pflichtschritte fehlen vollständig |
| W-03 | `docs/getting-started.md` | Milestone-Schema: goal, scope, deliverables, acceptance criteria, risks | `framework/core/milestones.md` | Milestone-Schema: + dependencies, priority (P1/P2/P3) | getting-started.md zeigt unvollständiges Milestone-Schema; Benutzer der Einführung kennen dependencies/priority nicht |
| W-04 | `docs/getting-started.md` | "Set safety boundaries" als einziger Scope-Schritt | `framework/core/bootstrap.md` | "Scope declaration" als separater, eigener Setup-Schritt nach Safety Boundaries | getting-started.md kennt Scope Declaration nicht — Nutzer können Framework nicht korrekt initialisieren |
| W-05 | `framework/core/deliverables.md` | Beschreibt Retention-Klassen (immutable / versioned / mutable) inline mit Erklärungen | `framework/core/artifact-retention.md` | Definiert identische Retention-Klassen als autoritative Quelle | Inhaltliche Dopplung ohne Querverweis; unterschiedliche Detailtiefe kann zu Abweichungen führen |
| W-06 | `governance/governance-matrix.md` | Spaltenbezeichnung: "Check area" (Prüfbereich) | `framework/core/modules.md` | Einheit: "Module" | Selbes Konzept, zwei Namen; Nutzer können nicht erkennen dass "Check area" = "Module" |
| W-07 | `governance/quality-principles.md` | Prinzip 5: "Humans define goals, constraints, and final decisions" — kein Mechanismus | `governance/guardrails.md` | 6 definierte Human-Decision-Trigger + AWAITING_HUMAN-Zustand + 4 erlaubte Aktionen | Prinzip 5 ist inhaltlich überholt; guardrails.md operationalisiert es vollständig, quality-principles.md weiß nichts davon |
| W-08 | `governance/quality-principles.md` | Prinzip 4: "Outputs should be concrete enough that another person can review what happened and why." — keine Operationalisierung | `framework/core/deliverables.md` | Decision Log, Proof-Set, Retention Classes als konkrete Anforderungen | Prinzip 4 und seine Umsetzung in deliverables.md sind nicht verknüpft |
| W-09 | `governance/evidence-policy.md` | Source hierarchy Punkt 2: "DAD-M starter-kit material used during curation" | Gesamtes Framework | Framework ist als generisches, wiederverwendbares System beschrieben | Interne Projektbegriffe ("starter-kit", "curation task") stehen in öffentlichem Referenzdokument — konzeptioneller Widerspruch zum generischen Anspruch |

---

## Lückenliste

Konzepte die beschrieben aber nicht definiert sind; Referenzen auf nicht-existente Dokumente; fehlende Querverweise.

| ID | Datei | Beschreibung der Lücke | Typ |
|----|-------|------------------------|-----|
| L-01 | `framework/core/milestones.md` | Kein Hinweis wo Milestone-Pläne gespeichert werden (`docs/decisions/` fehlt als Konvention) | Fehlender Querverweis |
| L-02 | `framework/core/deliverables.md` | Beschreibt Retention-Klassen aber verweist nicht auf `artifact-retention.md` als autoritative Quelle | Fehlender Querverweis |
| L-03 | `framework/core/bootstrap.md` | Approval-Artifact inline definiert; kein Verweis auf Template oder `governance/policies/` | Fehlender Querverweis |
| L-04 | `governance/guardrails.md` | Operating Rules enthalten keinen ScopeGuard-/Scope-Declaration-Eintrag, obwohl beides in bootstrap.md als Pflicht definiert | Inhaltliche Lücke |
| L-05 | `governance/quality-principles.md` | Alle 6 Prinzipien ohne Verweis auf zugehörige operative Dokumente (severity-framework, guardrails, deliverables) | Fehlende Querverweise (6×) |
| L-06 | `governance/governance-matrix.md` | Matrix definiert abstrakte "Check areas" ohne Default-Module zu benennen; kein Beispiel | Fehlender Inhalt |
| L-07 | `governance/policies/` | Nur 2 von ~5 nötigen YAML-Policies vorhanden; fehlen: rework-policy, approval-policy, scope-policy | Fehlende Dateien |
| L-08 | `governance/rework-and-escalation.md` | `rework-attempt:` YAML-Format definiert aber kein Schema und kein Querverweis zu deliverables.md | Fehlender Querverweis + fehlendes Schema |
| L-09 | `framework/core/artifact-retention.md` | Keine ausgehenden Querverweise (weder zu deliverables.md noch zu bootstrap.md Approval) | Fehlende Querverweise |
| L-10 | `docs/overview.md` | Keine neuen Konzepte aus MA-06–MA-12 erwähnt (Severity, AWAITING_HUMAN, Scope Declaration, Decision Log) | Inhaltliche Lücke (veraltet) |
| L-11 | `docs/getting-started.md` | Scope Declaration, Approval Checkpoint, Dependencies/Priority im Milestone komplett fehlend | Inhaltliche Lücke (veraltet) |
| L-12 | `docs/variants/education.md` | Risks/Open Points ohne Severity-Labels; kein Verweis auf severity-framework.md | Fehlender Querverweis |
| L-13 | Gesamtes Repo | Kein `docs/glossary.md` vorhanden (M06 erstellt es) | Fehlende Datei |
| L-14 | Gesamtes Repo | Kein `docs/methodology.md` vorhanden (M08 erstellt es) | Fehlende Datei |
| L-15 | Gesamtes Repo | Kein `docs/reproducibility.md` vorhanden (M15 erstellt es) | Fehlende Datei |
| L-16 | Gesamtes Repo | Kein `governance/document-quality.md` vorhanden (M07 erstellt es) | Fehlende Datei |
| L-17 | Gesamtes Repo | Kein `governance/framework-change-process.md` vorhanden (M16 erstellt es) | Fehlende Datei |
| L-18 | `README.md` | `docs/decisions/MILESTONE_PLAN_V1.md` nicht verzeichnet | Fehlender Eintrag |

---

## Redundanzliste

Identische oder stark überlappende Inhalte in verschiedenen Dateien.

| ID | Dateien | Überlappender Inhalt | Empfehlung |
|----|---------|----------------------|------------|
| R-01 | `deliverables.md` + `artifact-retention.md` | Retention-Klassen (immutable / versioned / mutable) sind in beiden Dateien beschrieben | `deliverables.md` kürzen auf Verweis: "Für Retention-Klassen siehe `artifact-retention.md`" |
| R-02 | `phases.md` + `guardrails.md` | AWAITING_HUMAN-Zustand in beiden Dateien erklärt | Belassen — unterschiedliche Perspektive (phases.md: Zustandsdiagramm; guardrails.md: Regel) |
| R-03 | `phases.md` + `governance-matrix.md` | "Architecture decision in Deploy" als Stopp-Bedingung in beiden Dateien | Belassen — phases.md erklärt das Prinzip, governance-matrix.md operationalisiert es |
| R-04 | `severity-framework.md` + `governance-matrix.md` | Kategorie-Overrides (Security high → human_decision etc.) in beiden Dateien | `severity-framework.md` ist autoritative Quelle; `governance-matrix.md` sollte nur referenzieren statt duplizieren |
| R-05 | `overview.md` + `getting-started.md` | Beide beschreiben den Setup-Prozess (Brief, Boundaries, Plan) | Belassen — overview.md ist Überblick, getting-started.md ist Schritt-für-Schritt; unterschiedliche Tiefe |
| R-06 | `bootstrap.md` + `getting-started.md` | Bootstrap-Setup-Schritte in beiden Dateien beschrieben | `getting-started.md` sollte auf `bootstrap.md` verweisen statt zu duplizieren; aktuell veraltet (W-03, W-04) |

---

## Phase-Output

**Status:** COMPLETED
**Input Summary:** Vollständige Kreuzprüfung aller 23 Dateien auf Basis von M01 + M02
**Artifacts:** Diese Datei `docs/decisions/M03_konsistenz_luecken.md`
**Risks and Assumptions:**
- `high` (W-01) — `severity-policy.yaml` enthält ungültigen Action-Wert; muss in M10 korrigiert werden bevor YAML-Policies produktiv genutzt werden
- `high` (W-02, W-03, W-04) — `docs/overview.md` und `docs/getting-started.md` sind so veraltet dass Neueinsteiger das Framework falsch initialisieren würden; M12 ist Pflicht-P1
- `medium` (W-09) — `evidence-policy.md` verwendet interne Projektbegriffe; schwächt den generischen Anspruch des Repos
- `low` (R-01 bis R-06) — Redundanzen sind beherrschbar; keine blockieren den Betrieb
**Next Step:** M04 — Wissenschaftlichkeits-Audit
