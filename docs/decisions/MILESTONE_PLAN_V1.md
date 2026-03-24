# DAD-M Framework — Meilensteinplan V1
**version:** 1.0
**status:** approved
**date:** 2026-03-24
**basis:** Repo-Stand nach MA-06 bis MA-12 (Vibe-Guard Integration)
**ziel:** Das Repo als methodisch gesichertes Referenzdokument für nachgelagerte Software-Entwicklung etablieren

---

## Scope dieses Plans

Dieser Plan deckt ausschließlich den methodischen Kern ab.
Technische Implementierung (Guards, Sandbox, Frontend, API) liegt bei separater Verantwortung.

Drei Qualitätsdimensionen die alle 20 Meilensteine abdecken:

| Dimension | Kürzel | Bedeutung |
|-----------|--------|-----------|
| Wissenschaftliche Härtung | WH | Aussagen sind belegt, Begriffe definiert, Grenzen klar gezogen |
| Formulierungskorrektur | FK | Sprache ist präzise, konsistent und widerspruchsfrei |
| Ist/Soll-Vergleich | IS | Aktueller Stand ist dokumentiert, Zielzustand definiert, Gap benannt |

---

## Cluster A — Ist-Analyse (M01–M04)

Ziel: Vollständiger Überblick über den aktuellen Zustand des Repos.

---

### M01 — Dokumenten-Inventar und Struktur-Audit

**goal:** Alle 22 Repo-Dateien sind inventarisiert und strukturell bewertet.
**scope:** Gesamtes Repo `dadm-framework/`
**constraints:** Keine inhaltlichen Änderungen in diesem Meilenstein
**deliverables:**
- Inventartabelle: jede Datei mit Status (`vollständig / lückenhaft / veraltet / widersprüchlich`)
- Strukturdiagramm: welche Datei referenziert welche
- Liste offener Fragen pro Datei
**acceptance criteria:**
- Alle 22 Dateien sind in der Tabelle erfasst
- Jede Datei hat mindestens einen Status-Eintrag
- Referenzgraph ist vollständig (kein "hängende" Referenz ohne Zieldatei)
**risks:**
- `low` — Scope-Schleiche: keine Korrekturen während Inventur
- `medium` — Referenzkonflikte zwischen neuen und alten Dateien
**dependencies:** none
**priority:** P1

---

### M02 — Terminologie-Inventar

**goal:** Alle im Repo verwendeten Fachbegriffe sind erfasst und auf Konsistenz geprüft.
**scope:** Alle `.md` Dateien im Repo
**constraints:** Keine Änderungen an Dateien — nur Lesezugriff
**deliverables:**
- Begriffsregister: jeder Begriff mit Fundstelle(n) und verwendeter Definition
- Inkonsistenzliste: Begriffe die in verschiedenen Dateien unterschiedlich definiert oder verwendet werden
- Kandidatenliste für Glossar (M06)
**acceptance criteria:**
- Mindestens alle Kernbegriffe erfasst: Phase, Milestone, Artefakt, Deliverable, Finding, Severity, Scope, Guardrail, Human Decision, Rework
- Jeder Begriff hat mindestens eine Fundstelle
- Inkonsistenzliste ist vollständig (jede Abweichung ist dokumentiert)
**risks:**
- `low` — Begriffe die nur in einem Kontext sinnvoll sind werden falsch als inkonsistent markiert
**dependencies:** M01
**priority:** P1

---

### M03 — Konsistenz- und Lückenprüfung

**goal:** Alle inhaltlichen Widersprüche und Lücken zwischen Dokumenten sind identifiziert.
**scope:** Alle Governance- und Core-Dateien
**constraints:** Keine Korrekturen, nur Befunderfassung
**deliverables:**
- Widerspruchsliste: konkrete Stellen wo zwei Dokumente sich widersprechen
- Lückenliste: Konzepte die beschrieben aber nicht definiert sind; Referenzen auf nicht-existente Dokumente
- Redundanzliste: identische oder überlappende Inhalte in verschiedenen Dateien
**acceptance criteria:**
- Widerspruchsliste enthält Datei + Zeile + Gegenstück
- Lückenliste unterscheidet bewusste Auslassungen von echten Fehlstellen
- Redundanzliste enthält Entscheidungsvorschlag (zusammenführen / belassen / entfernen)
**risks:**
- `medium` — Subjektive Grenze zwischen Redundanz und notwendiger Wiederholung
**dependencies:** M01, M02
**priority:** P1

---

### M04 — Wissenschaftlichkeits-Audit

**goal:** Alle normativen Aussagen im Repo sind klassifiziert: belegt, begründet, oder unbegründet.
**scope:** Alle `.md` Dateien
**constraints:** Keine inhaltlichen Änderungen
**deliverables:**
- Aussagen-Audit: jede normative Aussage mit Klassifikation (`belegt` / `begründet` / `unbegründet / behauptet`)
- Liste der stärksten Behauptungen (Aussagen die am meisten Evidenz bräuchten)
- Empfehlung: abschwächen, belegen, oder streichen
**acceptance criteria:**
- Mindestens alle Aussagen in `quality-principles.md`, `guardrails.md`, `governance-matrix.md` sind klassifiziert
- Keine Aussage bleibt unkategorisiert
- Empfehlungsliste ist priorisiert
**risks:**
- `medium` — Grenze zwischen "begründet" und "belegt" ist interpretierbar; Kriterien vorher festlegen
**dependencies:** M01
**priority:** P1

---

## Cluster B — Soll-Definition (M05–M08)

Ziel: Den Zielzustand des Repos klar definieren, bevor Korrekturen beginnen.

---

### M05 — Ist/Soll-Gap-Analyse

**goal:** Gap zwischen aktuellem Repo-Zustand und Zielzustand als Referenzdokument ist vollständig dokumentiert.
**scope:** Konsolidierung aus M01–M04
**constraints:** Kein Einbauen von Lösungen — nur Gap-Dokumentation
**deliverables:**
- Gap-Matrix: jede identifizierte Lücke mit Kategorie (WH / FK / IS), Priorität, und Zieldatei
- Priorisierte Top-10 der kritischsten Gaps
- Zusammenfassung: was fehlt dem Repo um als belastbares Referenzdokument zu gelten
**acceptance criteria:**
- Alle Befunde aus M01–M04 sind in der Gap-Matrix erfasst
- Jede Lücke hat eine Kategorie-Zuordnung (WH / FK / IS)
- Top-10 ist begründet und in Abhängigkeiten geordnet
**risks:**
- `low` — Umfang kann groß werden; Fokus auf methodischen Kern halten
**dependencies:** M01, M02, M03, M04
**priority:** P1

---

### M06 — Glossar und Terminologie-Standard

**goal:** Ein verbindliches Glossar mit allen DAD-M-Kernbegriffen ist vorhanden.
**scope:** Neue Datei `docs/glossary.md`
**constraints:** Nur Begriffe die im Repo bereits verwendet werden; keine neuen Konzepte einführen
**deliverables:**
- `docs/glossary.md` mit allen Kernbegriffen, je einer autoritativen Definition, Abgrenzung zu verwandten Begriffen
- Aktualisierung aller Dateien die vom Glossar abweichende Definitionen enthalten (nur Terminologie-Ebene)
**acceptance criteria:**
- Mindestens 20 Kernbegriffe definiert
- Jede Definition hat max. 3 Sätze
- Kein Begriff im Glossar widerspricht einer anderen Glossar-Definition
- Alle Dateien aus M02-Inkonsistenzliste sind korrigiert oder explizit ausgenommen
**risks:**
- `medium` — Begriffe können kontextabhängig sein; ggf. Kontext-Notiz notwendig
**dependencies:** M02, M05
**priority:** P1

---

### M07 — Qualitätskriterien für Framework-Dokumente

**goal:** Messbare Qualitätskriterien für jedes Framework-Dokument sind definiert.
**scope:** Neue Datei `governance/document-quality.md`
**constraints:** Kriterien müssen ohne Tooling prüfbar sein (keine automatisierte Linting-Abhängigkeit)
**deliverables:**
- `governance/document-quality.md` mit Kriterien pro Dokumenttyp (Core, Governance, Template, Docs)
- Checkliste: was muss ein Dokument erfüllen bevor es als "fertig" gilt
- Bewertungsschema: wie wird eine Dokument-Revision abgenommen
**acceptance criteria:**
- Kriterien für mindestens 4 Dokumenttypen vorhanden
- Jede Checkliste hat max. 10 Punkte (Handhabbarkeit)
- Kriterien sind voneinander unabhängig (kein Punkt impliziert einen anderen)
**risks:**
- `low` — Gefahr zu abstrakter Kriterien; Kriterien müssen an konkreten Beispielen testbar sein
**dependencies:** M05
**priority:** P1

---

### M08 — Methodik-Abgrenzung und Referenzrahmen

**goal:** DAD-M ist methodisch klar abgegrenzt — was es ist, was es nicht ist, und zu welchen bekannten Methoden es sich verhält.
**scope:** Neue Datei `docs/methodology.md` + Ergänzung `docs/use-cases.md`
**constraints:** Keine Wertung anderer Methoden; nur sachliche Abgrenzung
**deliverables:**
- `docs/methodology.md`: Einordnung von DAD-M (was ist der methodische Anspruch, welche Probleme löst es, welche nicht)
- Abgrenzungstabelle: DAD-M vs. Scrum / Kanban / klassisches PM — nicht besser/schlechter, sondern anders
- Aktualisierung `docs/use-cases.md` mit präzisiertem Fit/No-Fit
**acceptance criteria:**
- Abgrenzungstabelle deckt mindestens 3 bekannte Methoden ab
- Keine Behauptung in `docs/methodology.md` ist unbegründet (lt. M04-Klassifikation)
- Fit/No-Fit in `use-cases.md` ist konsistent mit Abgrenzungstabelle
**risks:**
- `medium` — Abgrenzung kann als Wertung missverstanden werden; Formulierung sorgfältig wählen
**dependencies:** M04, M05
**priority:** P2

---

## Cluster C — Formulierungskorrektur (M09–M13)

Ziel: Alle Dokumente erfüllen den Terminologie-Standard und die Qualitätskriterien aus Cluster B.

---

### M09 — Core-Methodik korrigieren

**goal:** `phases.md`, `milestones.md`, `deliverables.md` sind terminologisch konsistent, präzise und lückenlos.
**scope:** `framework/core/phases.md`, `framework/core/milestones.md`, `framework/core/deliverables.md`
**constraints:** Keine inhaltlichen Erweiterungen — nur Korrekturen laut Gap-Matrix (M05) und Glossar (M06)
**deliverables:**
- Korrigierte Versionen der drei Dateien
- Change-Log: was wurde geändert und warum (Verweis auf Gap-ID aus M05)
**acceptance criteria:**
- Alle Terminologie-Abweichungen aus M02 für diese Dateien sind behoben
- Alle Widersprüche aus M03 für diese Dateien sind aufgelöst
- Alle Lücken aus M05 mit Prio P1 für diese Dateien sind geschlossen
- Dokument-Qualitätskriterien aus M07 erfüllt
**risks:**
- `medium` — Änderungen in Core-Dateien können Kaskadeneffekte auf andere Dateien haben
**dependencies:** M05, M06, M07
**priority:** P1

---

### M10 — Governance-Dokumente korrigieren

**goal:** Alle Governance-Dateien sind terminologisch konsistent, präzise, und intern widerspruchsfrei.
**scope:** `governance/guardrails.md`, `governance/quality-principles.md`, `governance/evidence-policy.md`, `governance/severity-framework.md`, `governance/governance-matrix.md`, `governance/rework-and-escalation.md`
**constraints:** Keine inhaltlichen Erweiterungen — nur Korrekturen
**deliverables:**
- Korrigierte Versionen aller sechs Dateien
- Change-Log mit Gap-Referenzen
- Konsistenzprüfung der YAML-Policies gegen die korrigierten Markdown-Dateien
**acceptance criteria:**
- Kein Governance-Dokument widerspricht einem anderen nach Korrektur
- YAML-Policies stimmen mit den korrigierten Markdown-Regeln überein
- Dokument-Qualitätskriterien aus M07 erfüllt
**risks:**
- `high` — Änderungen in `guardrails.md` oder `governance-matrix.md` können Bedeutungsverschiebungen erzeugen; jede Änderung explizit begründen
**dependencies:** M05, M06, M07, M09
**priority:** P1

---

### M11 — Bootstrap und Templates korrigieren

**goal:** `bootstrap.md` und alle Templates sind konsistent mit korrigierten Core- und Governance-Dateien.
**scope:** `framework/core/bootstrap.md`, `framework/templates/human-decision-record.md`
**constraints:** Keine neuen Schritte oder Templates — nur Korrekturen
**deliverables:**
- Korrigierte Versionen beider Dateien
- Change-Log mit Gap-Referenzen
**acceptance criteria:**
- Bootstrap-Sequenz ist konsistent mit Phase-States aus `phases.md`
- Human-Decision-Record-Template stimmt mit `human-decision-policy.yaml` überein
- Alle Pflichtfelder im Template entsprechen den definierten `required_decision_fields`
**risks:**
- `low` — Bootstrap und Template haben weniger systemische Abhängigkeiten als Core
**dependencies:** M09, M10
**priority:** P1

---

### M12 — Docs-Bereich korrigieren

**goal:** `overview.md`, `getting-started.md`, `use-cases.md`, `rbac-case-example.md` sind aktuell und konsistent mit dem Framework-Kern.
**scope:** `docs/overview.md`, `docs/getting-started.md`, `docs/use-cases.md`, `docs/examples/rbac-case-example.md`
**constraints:** Keine inhaltlichen Erweiterungen; Änderungen nur wenn Inkonsistenz mit Core oder Governance besteht
**deliverables:**
- Korrigierte Versionen aller vier Dateien
- Markierung welche Stellen im Beispiel (rbac-case-example) das neue Framework korrekt zeigen
**acceptance criteria:**
- Alle Begriffe in `docs/` entsprechen dem Glossar (M06)
- `overview.md` erwähnt neue Governance-Konzepte (Severity, Human Decision, Scope Declaration)
- `getting-started.md` spiegelt den aktualisierten Bootstrap-Prozess wider
- rbac-Beispiel zeigt DAD-M-konformen Ablauf inkl. Phase-States
**risks:**
- `medium` — Das Beispiel (rbac) kann nicht vollständig überarbeitet werden ohne Substanz zu verlieren; ggf. Anmerkungen statt Vollkorrektur
**dependencies:** M09, M10, M11
**priority:** P2

---

### M13 — Artifact-Retention und Modules korrigieren

**goal:** `artifact-retention.md` und `modules.md` sind klar formuliert und konsistent mit Governance.
**scope:** `framework/core/artifact-retention.md`, `framework/core/modules.md`
**constraints:** Keine inhaltlichen Erweiterungen
**deliverables:**
- Korrigierte Versionen beider Dateien
- Prüfung ob Module-Interface mit Governance-Matrix und Severity-Framework konsistent ist
**acceptance criteria:**
- Retention-Klassen sind eindeutig definiert ohne Überlappung
- Module-Interface stimmt mit `ModuleResult`-Konzept aus Governance-Matrix überein
- Keine unbegründeten normativen Aussagen (lt. M04)
**risks:**
- `low` — Beide Dateien sind neu eingeführt und haben weniger Altlast
**dependencies:** M09, M10
**priority:** P2

---

## Cluster D — Wissenschaftliche Härtung (M14–M17)

Ziel: Kernaussagen des Repos sind evidenzbasiert, Grenzen sind klar gezogen, Reproduzierbarkeit ist gewährleistet.

---

### M14 — Evidenzbasierung der Kernaussagen

**goal:** Alle normativen Aussagen mit Klassifikation `unbegründet / behauptet` aus M04 sind entweder belegt, abgeschwächt oder gestrichen.
**scope:** Alle Dateien mit unbegründeten Aussagen laut M04-Audit
**constraints:** Keine neuen starken Behauptungen einführen; im Zweifel abschwächen
**deliverables:**
- Überarbeitete Stellen mit Track-Change-Notation (alt → neu)
- Begründungsnotiz pro geänderter Aussage
- Aktualisiertes Aussagen-Audit (M04) als Abschluss-Snapshot
**acceptance criteria:**
- Keine Aussage mit Klassifikation `unbegründet / behauptet` bleibt im Repo
- Evidence Policy (`evidence-policy.md`) ist auf alle geänderten Aussagen angewandt
- Jede Abschwächung ist formuliert gemäß "narrower wording"-Prinzip
**risks:**
- `high` — Abschwächungen können Framework-Aussagen so schwach machen, dass sie unbrauchbar werden; Abwägung nötig
**dependencies:** M04, M09, M10, M12
**priority:** P1

---

### M15 — Reproduzierbarkeitsstandards

**goal:** Es ist explizit definiert was "reproduzierbar" im DAD-M-Kontext bedeutet und wie es nachgewiesen wird.
**scope:** `governance/quality-principles.md` (Erweiterung Prinzip 4), neue Datei `docs/reproducibility.md`
**constraints:** Standard muss ohne spezialisiertes Tooling anwendbar sein
**deliverables:**
- `docs/reproducibility.md`: Was macht einen DAD-M-Durchlauf reproduzierbar? Welche Artefakte sind Pflicht? Welche Proofs genügen?
- Überarbeitetes Prinzip 4 in `quality-principles.md` mit Verweis auf neue Datei
- Checkliste: kann ein unbekannter Dritter den Ablauf anhand der Artefakte nachvollziehen?
**acceptance criteria:**
- Reproduzierbarkeits-Checkliste hat mindestens 5 überprüfbare Punkte
- Standard ist ohne Vorkenntnisse über das Projekt erfüllbar
- Verweis aus `quality-principles.md` und `deliverables.md` auf neue Datei
**risks:**
- `medium` — Standard könnte zu streng und damit unrealistisch werden; Benchmarking an realem Beispiel empfohlen
**dependencies:** M09, M10, M14
**priority:** P2

---

### M16 — Change-Management für Framework-Erweiterungen

**goal:** Es gibt einen definierten Prozess wie das Framework selbst erweitert oder geändert wird.
**scope:** Neue Datei `governance/framework-change-process.md`
**constraints:** Prozess muss DAD-M-konform sein (kein Widerspruch zur eigenen Methodik)
**deliverables:**
- `governance/framework-change-process.md`: Wie wird eine Änderung am Framework vorgeschlagen, geprüft, und integriert?
- Trigger für Human Decision bei Framework-Änderungen (Schwellenwerte)
- Versions-Konvention: wann ist eine Änderung minor / major?
**acceptance criteria:**
- Prozess ist vollständig beschrieben (Eingang → Review → Entscheidung → Integration → Dokumentation)
- Versions-Konvention ist eindeutig (kein Interpretationsspielraum)
- Prozess ist konsistent mit Approval-Policy aus `bootstrap.md`
**risks:**
- `medium` — Prozess darf das Framework nicht zu starr machen; Iteration muss möglich bleiben
**dependencies:** M10, M14
**priority:** P2

---

### M17 — Methodik-Validierung am Referenzbeispiel

**goal:** Das rbac-Beispiel (`docs/examples/rbac-case-example.md`) wird zu einem vollständigen, DAD-M-konformen Durchlauf ausgebaut, der alle neuen Konzepte abdeckt.
**scope:** `docs/examples/rbac-case-example.md`
**constraints:** Kein neues Fachthema — nur das bestehende rbac-Beispiel verwenden
**deliverables:**
- Vollständig überarbeitetes Beispiel mit: Phase-States, Severity-Labels, Scope-Deklaration, Approval-Checkpoint, Decision-Log, mindestens einem Human-Decision-Trigger
- Kommentare im Beispiel die erklären welche Regel welches Verhalten erzeugt
**acceptance criteria:**
- Jede neue Framework-Komponente (aus MA-06 bis MA-12) kommt mindestens einmal im Beispiel vor
- Beispiel ist als vollständiger Ablauf lesbar ohne andere Framework-Dateien zu kennen
- Kein Widerspruch zwischen Beispiel und Framework-Dokumenten
**risks:**
- `medium` — rbac-Beispiel kann unter dem Gewicht aller neuen Konzepte unleserlich werden; Lesbarkeit hat Vorrang
**dependencies:** M09, M10, M11, M12, M13, M14, M15
**priority:** P2

---

## Cluster E — Referenzdokument-Finalisierung (M18–M20)

Ziel: Das Repo ist bereit als Referenz für nachgelagerte Software-Entwicklung.

---

### M18 — AI_CONTEXT.md und Software-Nutzungsanleitung

**goal:** Das Repo enthält eine explizite Anleitung wie es als Referenz für Software-Entwicklung genutzt wird.
**scope:** Neue Datei `AI_CONTEXT.md` (Root-Level), neue Datei `docs/software-reference.md`
**constraints:** Kein technischer Code; nur methodische Referenz-Dokumentation
**deliverables:**
- `AI_CONTEXT.md`: Kompaktes Kontextdokument für KI-Systeme die das Framework als Input nutzen — was ist DAD-M, wie ist das Repo aufgebaut, was darf ein System annehmen und was nicht
- `docs/software-reference.md`: Anleitung wie ein Software-Projekt das Framework als Referenz einbindet — welche Dateien sind Pflicht, welche sind optional, wie werden Updates des Frameworks konsumiert
**acceptance criteria:**
- `AI_CONTEXT.md` ist ≤ 500 Wörter (Kompaktheit ist Pflicht)
- `software-reference.md` unterscheidet klar: normative Referenz (Methodik) vs. informativer Kontext (Beispiele)
- Beide Dateien sind für jemanden ohne DAD-M-Vorwissen verständlich
**risks:**
- `medium` — AI_CONTEXT.md könnte zu viel oder zu wenig geben; Fokus auf das Wesentliche
**dependencies:** M09, M10, M11, M12, M13, M14, M15, M16
**priority:** P1

---

### M19 — README und Repo-Struktur finalisieren

**goal:** README und Repo-Struktur entsprechen dem Status eines stabilen Referenzdokuments v1.0.
**scope:** `README.md`, Repo-Verzeichnisstruktur
**constraints:** Keine neuen Inhalte einführen — nur strukturelle und sprachliche Finalisierung
**deliverables:**
- Finales `README.md` das alle aktuellen Dateien korrekt beschreibt und als Einstiegspunkt taugt
- Überprüfung ob Verzeichnisstruktur logisch und navigierbar ist
- Sicherstellung dass alle internen Links funktionieren
**acceptance criteria:**
- Alle 25+ Dateien sind im README verzeichnet oder explizit als "nicht-navigierbar" markiert
- Kein toter interner Link
- README-Sprache ist konsistent mit Glossar (M06)
- README erklärt den Unterschied zwischen Framework-Nutzung und Framework-Entwicklung
**risks:**
- `low` — Hauptrisiko sind tote Links durch Umbenennungen in früheren Meilensteinen
**dependencies:** M06, M09 bis M18
**priority:** P1

---

### M20 — Finaler Ist/Soll-Abgleich und Framework-Freigabe v1.0

**goal:** Das Framework ist gegen alle Soll-Kriterien aus Cluster B geprüft; Framework v1.0 wird freigegeben.
**scope:** Gesamtes Repo
**constraints:** Keine weiteren inhaltlichen Änderungen in diesem Meilenstein — nur Prüfung und Freigabe
**deliverables:**
- Abschluss-Gap-Matrix: Gap-Matrix aus M05 mit aktuellem Erledigungsstatus für alle 20 Meilensteine
- Restliste: dokumentierte offene Punkte die in V2 eingehen
- Freigabe-Artifact:
  ```
  artifact: framework-release
  version: 1.0
  status: approved
  date: <YYYY-MM-DD>
  decided-by: <name>
  open-items: <Verweis auf Restliste>
  ```
**acceptance criteria:**
- Alle P1-Gaps aus M05 sind geschlossen oder explizit in Restliste überführt
- Abschluss-Gap-Matrix hat keinen unbewerteten Eintrag
- Freigabe-Artifact ist ausgefüllt und als immutables Artefakt abgelegt
- Kein Widerspruch mehr zwischen den 20 Framework-Dateien (Stichprobe aus M03-Widerspruchsliste)
**risks:**
- `medium` — Restliste darf nicht zur "alles-rein"-Ablage werden; nur echte P2/P3 Items
- `low` — Freigabe könnte als "fertig" missverstanden werden; Versionierung kommunizieren
**dependencies:** M14, M15, M16, M17, M18, M19
**priority:** P1

---

## Meilenstein-Sequenz und Abhängigkeitsgraph

```
Cluster A — Ist-Analyse
  M01 (Inventar)
    ├─ M02 (Terminologie)
    ├─ M03 (Konsistenz)     ← braucht M01, M02
    └─ M04 (Wiss. Audit)

Cluster B — Soll-Definition
  M05 (Gap-Analyse)         ← braucht M01–M04
    ├─ M06 (Glossar)        ← braucht M02, M05
    ├─ M07 (Qualitäts-K.)   ← braucht M05
    └─ M08 (Abgrenzung)     ← braucht M04, M05

Cluster C — FK-Korrekturen
  M09 (Core FK)             ← braucht M05, M06, M07
    ├─ M10 (Governance FK)  ← braucht M05–M07, M09
    ├─ M11 (Bootstrap FK)   ← braucht M09, M10
    ├─ M12 (Docs FK)        ← braucht M09–M11
    └─ M13 (Retention FK)   ← braucht M09, M10

Cluster D — Wiss. Härtung
  M14 (Evidenz)             ← braucht M04, M09, M10, M12
    ├─ M15 (Reproduz.)      ← braucht M09, M10, M14
    ├─ M16 (Change-Mgmt)    ← braucht M10, M14
    └─ M17 (Referenz-Bsp.)  ← braucht M09–M15

Cluster E — Finalisierung
  M18 (AI_CONTEXT)          ← braucht M09–M16
  M19 (README Final)        ← braucht M06, M09–M18
  M20 (Freigabe v1.0)       ← braucht M14–M19
```

---

## Prioritäts-Übersicht

| Priorität | Meilensteine |
|-----------|-------------|
| P1 | M01, M02, M03, M04, M05, M06, M07, M09, M10, M11, M14, M18, M19, M20 |
| P2 | M08, M12, M13, M15, M16, M17 |

**P1-Pfad (kritischer Pfad):** M01 → M02 → M03 → M04 → M05 → M06 → M07 → M09 → M10 → M11 → M14 → M18 → M19 → M20
