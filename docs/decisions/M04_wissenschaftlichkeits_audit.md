# M04 — Wissenschaftlichkeits-Audit
**phase:** COMPLETED
**milestone:** M04
**date:** 2026-03-24
**status:** closed

---

## Klassifikationsschema

| Klasse | Bedeutung |
|--------|-----------|
| `belegt` | Aussage ist durch Quellenangabe, Messbarkeit oder nachweisbare Praxis gestützt |
| `begründet` | Aussage folgt logisch aus definierten Framework-Prinzipien; keine externe Quelle nötig |
| `behauptet` | Normative Aussage ohne explizite Begründung; plausibel aber nicht abgeleitet |
| `projektspezifisch` | Aussage ist korrekt für den Entstehungskontext, aber nicht generisch gültig |

---

## Aussagen-Audit

### governance/quality-principles.md

| ID | Aussage | Klasse | Anmerkung |
|----|---------|--------|-----------|
| A-01 | "Facts, design, implementation, and validation should stay distinct." | `begründet` | Folgt aus Phasentrennung; implizit durch phases.md operationalisiert |
| A-02 | "Project knowledge should be externalized into documents, code, prompts, reports, or other reviewable outputs." | `begründet` | Grundlage für Reproduzierbarkeit; folgt aus Prinzip 4 |
| A-03 | "Large work should be split into milestones with explicit scope and acceptance criteria." | `begründet` | Folgt aus Milestone-Konzept in milestones.md |
| A-04 | "Outputs should be concrete enough that another person can review what happened and why." | `begründet` | Reproduzierbarkeitsdefinition; aber "concrete enough" ist nicht operationalisiert — deliverables.md liefert die Operationalisierung ohne Querverweis |
| A-05 | "Humans define goals, constraints, and final decisions. The framework does not replace judgment." | `begründet` | Grundprinzip; aber guardrails.md hat dies längst mit 6 Triggern + 4 Aktionen operationalisiert — Prinzip 5 hinkt der Realität hinterher |
| A-06 | "When evidence is incomplete, document limits or use narrower wording instead of stronger claims." | `begründet` | Spiegelt evidence-policy.md |

### governance/guardrails.md

| ID | Aussage | Klasse | Anmerkung |
|----|---------|--------|-----------|
| A-07 | 6 Human Decision Triggers (hard_rule_conflict, critical_security_or_privacy, etc.) | `behauptet` | Warum genau diese 6? Auswahl ist plausibel aber nicht aus einem Prinzip abgeleitet |
| A-08 | Erlaubte Antworten: approve / reject / modify / defer | `begründet` | Vollständige Abdeckung der logisch möglichen Entscheidungsoptionen |
| A-09 | 5 UI-Pflichtfelder (summary, blocking_reasons, options_with_risks, recommended_option, evidence_refs) | `behauptet` | Plausibel für informierte Entscheidungen; keine Herleitung |

### governance/severity-framework.md

| ID | Aussage | Klasse | Anmerkung |
|----|---------|--------|-----------|
| A-10 | 5 Schweregrade: info / low / medium / high / critical | `begründet` | Industry-Standard-Einteilung (analog CVSS, OWASP); keine formale Quellenangabe |
| A-11 | `medium` → rework, `high` → rework, `critical` → human_decision (Default) | `behauptet` | Warum nicht medium → human_decision? Grenzziehung ist eine Designentscheidung ohne explizite Begründung |
| A-12 | Privacy: ab `medium` immer → human_decision | `begründet` | Folgt aus DSGVO-Logik (personenbezogene Daten = besondere Sorgfaltspflicht); kein Quellennachweis aber logisch ableitbar |
| A-13 | Rework limit default: 2 | `behauptet` | Woher kommt die Zahl 2? Keine Begründung; pragmatische Wahl ohne Herleitung |

### governance/governance-matrix.md

| ID | Aussage | Klasse | Anmerkung |
|----|---------|--------|-----------|
| A-14 | Security findings: blocking in allen Phasen | `begründet` | Folgt aus Security-Override in severity-framework.md |
| A-15 | Test coverage quality: advisory in Discover/Apply/Deploy, blocking in Monitor | `behauptet` | Warum nicht blocking ab Deploy? Keine Begründung für späte Aktivierung |
| A-16 | Change risk: blocking erst in Deploy und Monitor (nicht Discover/Apply) | `behauptet` | Intuitiv sinnvoll aber nicht begründet |
| A-17 | "The matrix below represents the default configuration. Projects can adjust it in their safety boundaries section, provided the change is explicitly approved." | `begründet` | Konsistent mit Approval-Policy und bootstrap.md |

### framework/core/modules.md

| ID | Aussage | Klasse | Anmerkung |
|----|---------|--------|-----------|
| A-18 | Profil-Namen: strict / standard / development / fast | `behauptet` | Plausible Konvention; keine Herleitung; analogie zu anderen Tools (ESLint etc.) implizit |
| A-19 | "If no profile is declared, `standard` applies." | `behauptet` | Konservative Standardwahl ist begründbar aber nicht explizit begründet |

### docs/overview.md

| ID | Aussage | Klasse | Anmerkung |
|----|---------|--------|-----------|
| A-20 | "AI-assisted project work becomes more reliable when analysis, design, implementation, and review are kept separate." | `behauptet` | Kern-These des gesamten Frameworks; empirisch nicht belegt; plausibel durch Analogie zu Softwareentwicklungs-Best-Practices |
| A-21 | "Without structure, AI-assisted project work often runs into the same problems: facts and assumptions get mixed, implementation starts before the design is stable, decisions are hard to trace afterward, outputs are difficult to reproduce." | `behauptet` | Plausible Erfahrungsaussage; keine Messung, keine Studie; als "oft" formuliert — schwächer als "immer" |

### docs/use-cases.md

| ID | Aussage | Klasse | Anmerkung |
|----|---------|--------|-----------|
| A-22 | "DAD-M fits best when work spans multiple steps, produces visible artifacts, and benefits from reviewable outputs." | `begründet` | Folgt direkt aus Framework-Design; korrekte Selbstbeschreibung |
| A-23 | "Less suitable: one-off questions with no follow-up work" | `begründet` | Methodisch konsistent; kein Overhead nötig wo kein Lifecycle entsteht |

### docs/variants/education.md

| ID | Aussage | Klasse | Anmerkung |
|----|---------|--------|-----------|
| A-24 | Prinzipien: "validation before explanation, discover before depth, truth before fluency, concepts before complexity, application before trust, monitoring before closure" | `behauptet` | Didaktisch plausibel; keine Referenz auf Lernforschung (z.B. Bloom, Sweller, Kirschner) |
| A-25 | "require some form of application, reconstruction, or transfer before treating a result as stable" | `behauptet` | Entspricht Konzepten aus Kognitionswissenschaft (Transfer, Elaboration) — aber ohne Quellenangabe |

### governance/evidence-policy.md

| ID | Aussage | Klasse | Anmerkung |
|----|---------|--------|-----------|
| A-26 | "Used regularly in project context by project managers in a Deutsche Telekom Technik environment." | `belegt` | Einzige belegte Nutzungsaussage im gesamten Repo; korrekt und konservativ |
| A-27 | "If sources conflict, prefer the narrower and more defensible wording." | `begründet` | Epistemisch korrekte Regel; folgt aus Conservative Documentation Prinzip |
| A-28 | Source hierarchy: "DAD-M starter-kit material used during curation" als gültige Quelle | `projektspezifisch` | Interner Begriff; nicht anwendbar auf externe Nutzer des Frameworks |

---

## Stärkste Behauptungen — Top-7 (höchste Evidenzbedürftigkeit)

| Rang | ID | Aussage (gekürzt) | Empfehlung |
|------|----|--------------------|------------|
| 1 | A-20 | "AI-assisted work becomes more reliable with phase separation" | Abschwächen auf "designed to improve"; als Design-Annahme kennzeichnen |
| 2 | A-07 | Genau 6 Human Decision Trigger | Begründung ergänzen: "Diese sechs decken die häufigsten…" oder als "initial set" kennzeichnen |
| 3 | A-13 | Rework limit = 2 | Begründung ergänzen: "pragmatischer Standardwert; projektspezifisch anpassbar" |
| 4 | A-11 | medium → rework (nicht escalate) | Schwellenwert-Rationale ergänzen: "medium ist behebbar ohne Human-Overhead" |
| 5 | A-24 | Education-Prinzipien ohne Lernwissenschaft-Bezug | Als "working principles" kennzeichnen, nicht als bewiesene Didaktik |
| 6 | A-15 | Test coverage erst in Monitor blocking | Begründung ergänzen: "vor Deploy keine sinnvolle Prüfungsgrundlage" |
| 7 | A-28 | "starter-kit material" als Quellhierarchie | Ersetzen durch framework-generische Formulierung (M10/M14) |

---

## Phase-Output

**Status:** COMPLETED
**Input Summary:** 28 normative Aussagen aus 8 Schlüsseldokumenten klassifiziert
**Artifacts:** Diese Datei `docs/decisions/M04_wissenschaftlichkeits_audit.md`
**Risks and Assumptions:**
- `high` (A-20) — Die Kern-These des Frameworks ist `behauptet`; muss in M14 als Design-Annahme explizit markiert werden, nicht als Faktum
- `medium` (A-07, A-13) — Human Decision Trigger-Anzahl und Rework-Limit sind ohne Begründung; schwächen wissenschaftliche Glaubwürdigkeit
- `medium` (A-28) — `evidence-policy.md` Source-Hierarchie ist projektspezifisch; schränkt Framework-Wiederverwendbarkeit ein
- `low` (A-24, A-25) — Education-Variant-Prinzipien sind `behauptet` aber Datei ist korrekt als WIP markiert; akzeptabel für jetzt
**Next Step:** M05 — Ist/Soll-Gap-Analyse
