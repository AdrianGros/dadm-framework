# M02 — Terminologie-Inventar
**phase:** COMPLETED
**milestone:** M02
**date:** 2026-03-24
**status:** closed

---

## Begriffsregister

Jeder Kernbegriff mit allen Fundstellen und der verwendeten Definition.

| Begriff | Definition (wie im Repo verwendet) | Fundstellen |
|---------|-----------------------------------|-------------|
| **Phase** | Einer der vier Arbeitsabschnitte: Discover, Apply, Deploy, Monitor | phases.md, milestones.md, overview.md, getting-started.md, guardrails.md, governance-matrix.md |
| **Phase State** | Expliziter Zustand eines aktiven Milestones (DISCOVER / APPLY / DEPLOY / MONITOR / COMPLETED / AWAITING_HUMAN) | phases.md |
| **Milestone** | Basiseinheit der Arbeit; läuft durch alle vier Phasen | milestones.md, phases.md, overview.md, getting-started.md |
| **Artifact / Artefakt** | Dokumentierter, überprüfbarer Output einer Phase (Dokument, Code, Report etc.) | deliverables.md, artifact-retention.md, overview.md, guardrails.md |
| **Deliverable** | Strukturierter Phase-Output (Status, Input Summary, Artifacts, Risks, Next Step) | deliverables.md, getting-started.md, phases.md |
| **Finding** | Ergebnis einer Prüfung mit Klassifikation, Kategorie und Severity | severity-framework.md, governance-matrix.md, rework-and-escalation.md, modules.md |
| **Severity** | Fünfstufige Klassifikation: info / low / medium / high / critical | severity-framework.md, guardrails.md, deliverables.md, governance-matrix.md, severity-policy.yaml |
| **Scope** | Definierter Arbeitsbereich; was darf geändert werden | bootstrap.md, phases.md, milestones.md, guardrails.md |
| **Scope Declaration** | Explizite Liste erlaubter Dateien/Bereiche als Pflicht-Setup-Artefakt | bootstrap.md |
| **Safety Boundaries** | Projektspezifische Regeln was erlaubt/verboten ist (Netz, Dependencies etc.) | bootstrap.md, getting-started.md, overview.md |
| **Guardrail** | Verhaltensregel die den Workflow steuerbar und reproduzierbar hält | guardrails.md, README.md |
| **Human Decision** | Formale menschliche Entscheidung bei Pflicht-Trigger | guardrails.md, human-decision-record.md, human-decision-policy.yaml |
| **Human Decision Trigger** | Bedingung die einen Pflicht-Stopp auslöst (6 definiert) | guardrails.md, human-decision-policy.yaml |
| **AWAITING_HUMAN** | Pause-Zustand eines Milestones bei offenem Human-Decision-Trigger | phases.md, guardrails.md |
| **Rework** | Intra-phasaler Korrektur-Loop bei medium/high Finding | rework-and-escalation.md, governance-matrix.md |
| **Rework Limit** | Maximale Anzahl automatischer Rework-Versuche pro Finding (default: 2) | rework-and-escalation.md |
| **Escalation** | Übergabe an Human Decision nach Rework-Limit oder Cross-Milestone-Finding | rework-and-escalation.md, guardrails.md |
| **Governance Matrix** | Tabelle: welche Checks in welcher Phase blocking vs. advisory | governance-matrix.md, modules.md |
| **Blocking** | Finding verhindert Phasenabschluss | governance-matrix.md |
| **Advisory** | Finding wird geloggt, blockiert nicht | governance-matrix.md |
| **Module** | Einzelne, selbständige Prüfeinheit mit einheitlichem Interface | modules.md, governance-matrix.md |
| **Module Registry** | YAML-Verzeichnis aktiver/inaktiver Module | modules.md |
| **Profile** | Benanntes Konfigurations-Set das Module-Aktivierung und Severity-Defaults steuert | modules.md |
| **Approval** | Formale Genehmigung des Milestone-Plans vor Arbeitsbeginn | bootstrap.md |
| **Approval Record / Approval Checkpoint** | Unveränderliches Genehmigungsartefakt | bootstrap.md |
| **Decision Log** | Append-only Protokoll aller wesentlichen Entscheidungen im Milestone | deliverables.md |
| **Retention Class** | Klassifikation der Veränderlichkeit eines Artefakts: immutable / versioned / mutable | artifact-retention.md, deliverables.md |
| **Immutable** | Unveränderlich nach Abschluss; kein Überschreiben | artifact-retention.md, deliverables.md, guardrails.md |
| **Proof** | Konkrete, überprüfbare Evidenz für Arbeitsergebnis (Test, Compile, Screenshot etc.) | deliverables.md, phases.md |
| **Bootstrap** | Einmaliger Setup-Prozess vor dem ersten Milestone | bootstrap.md, overview.md, getting-started.md |
| **Iteration Rule** | Monitor-Ergebnis eines Milestones wird Input für nächsten Discover | milestones.md, overview.md |

---

## Inkonsistenzliste

Begriffe die in verschiedenen Dateien unterschiedlich verwendet oder definiert werden:

| # | Begriff | Datei A | Formulierung A | Datei B | Formulierung B | Typ |
|---|---------|---------|----------------|---------|----------------|-----|
| I-01 | Artifact / Artefakt | deliverables.md, artifact-retention.md, modules.md | "artifact" (englisch) | quality-principles.md | "artifacts" | Sprachlich inkonsistent — Mix aus englisch/deutsch je nach Datei; kein Problem wenn Repo rein englisch, aber quality-principles.md ist englisch und konsistent — kein echter Fehler |
| I-02 | Safety Boundaries / Scope Declaration | bootstrap.md | Zwei separate Konzepte (Safety Boundaries + Scope Declaration) | getting-started.md, overview.md | Nur "Safety Boundaries" genannt; Scope Declaration fehlt | Lücke: getting-started.md / overview.md kennen Scope Declaration nicht |
| I-03 | Risks and Assumptions | deliverables.md | "Risks and Assumptions" als Phase-Output-Feld | milestones.md | "risks and assumptions" als Milestone-Feld | Konsistent, nur Großschreibung variiert — akzeptabel |
| I-04 | Deliverable | getting-started.md | Milestone hat "deliverables" als Planungsfeld | deliverables.md | "Deliverables" als strukturierter Phase-Output | Zwei Bedeutungen: (a) Planungs-Deliverable im Milestone-Schema, (b) Phase-Output-Format — nicht unterschieden |
| I-05 | Retention / Immutable | deliverables.md | Retention-Klassen inline beschrieben | artifact-retention.md | Retention-Klassen als eigene Datei definiert | Inhaltliche Redundanz ohne Querverweis |
| I-06 | Setup / Bootstrap | overview.md | "one-time setup step" | bootstrap.md | "Bootstrap" | Synonyme ohne Gleichsetzung; overview.md sollte auf bootstrap.md verweisen (tut es) — aber "Bootstrap" als Begriff erscheint nicht in overview.md |
| I-07 | Human Decision | guardrails.md | "Human decision" (lowercase d) | human-decision-policy.yaml | `human_decision` (snake_case) | Schreibweisen-Inkonsistenz zwischen Markdown und YAML — akzeptabel wenn Konvention dokumentiert wird |
| I-08 | Check / Module | governance-matrix.md | Spalten heißen "Check area" | modules.md | Einheit heißt "Module" | Terminologischer Versatz: Matrix spricht von "checks", Modules-Dokument von "modules" — selbe Sache, unterschiedlicher Name |
| I-09 | Advisory | governance-matrix.md | "advisory only (logged, but no governance action)" | rework-and-escalation.md | Advisory Findings "are not ignored" und werden in Risks and Assumptions aufgenommen | Konsistent in der Aussage, aber unterschiedliche Detailtiefe |
| I-10 | Plan / Milestone Plan | bootstrap.md | "Milestone plan" als Setup-Ergebnis | milestones.md | "milestone plan" mit Versions-Header | Beide beschreiben dasselbe, keine echte Inkonsistenz |

---

## Kandidatenliste für Glossar (M06)

Priorität nach Häufigkeit und Kritikalität für Software-Referenz:

**Pflicht (P1):**
Phase, Phase State, Milestone, Artifact, Deliverable, Finding, Severity, Scope, Guardrail, Human Decision, AWAITING_HUMAN, Rework, Blocking, Advisory, Module, Profile, Approval, Immutable, Proof, Bootstrap

**Sinnvoll (P2):**
Scope Declaration, Safety Boundaries, Human Decision Trigger, Rework Limit, Escalation, Governance Matrix, Module Registry, Retention Class, Decision Log, Iteration Rule

---

## Phase-Output

**Status:** COMPLETED
**Input Summary:** Alle 23 Repo-Dateien auf Terminologie geprüft
**Artifacts:** Diese Datei `docs/decisions/M02_terminologie_inventar.md`
**Risks and Assumptions:**
- `low` — Repo ist vollständig englisch, Inkonsistenzen I-01 bis I-10 sind alle behebbar
- `medium` (I-04) — Doppelbedeutung von "Deliverable" kann zu Verwirrung führen; M06-Glossar muss beide Bedeutungen trennen
- `medium` (I-08) — "Check" vs. "Module" ist der kritischste Terminologie-Versatz; betrifft Governance-Matrix direkt
**Next Step:** M03 — Konsistenz- und Lückenprüfung
