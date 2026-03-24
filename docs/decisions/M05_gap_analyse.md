# M05 — Ist/Soll-Gap-Analyse
**phase:** COMPLETED
**milestone:** M05
**date:** 2026-03-24
**status:** closed

---

## Ist-Zustand (Zusammenfassung)

Nach Abschluss von M01–M04:

- **23 Dateien** im Repo (20 MD + 2 YAML + 1 Plan)
- **10 vollständig**, 8 lückenhaft, 4 veraltet, 1 widersprüchlich
- **9 Widersprüche** (W-01–W-09), davon 3 kritisch (W-01, W-02, W-04)
- **18 Lücken** (L-01–L-18), davon 5 fehlende Dateien (L-13–L-17)
- **6 Redundanzen** (R-01–R-06), davon 1 aktionspflichtig (R-01)
- **28 normative Aussagen** klassifiziert: 4 belegt, 14 begründet, 9 behauptet, 1 projektspezifisch

---

## Gap-Matrix

Alle identifizierten Gaps mit Kategorie, Priorität, Zieldatei und zuständigem Meilenstein.

| Gap-ID | Beschreibung | Dim. | Prio | Zieldatei | Meilenstein |
|--------|-------------|------|------|-----------|-------------|
| G-001 | `severity-policy.yaml`: `stop_return_to_apply` ist kein valider Action-Wert (W-01) | FK | P1 | `governance/policies/severity-policy.yaml` | M10 |
| G-002 | `docs/overview.md` zeigt veralteten 4-Schritt-Bootstrap (W-02) | FK | P1 | `docs/overview.md` | M12 |
| G-003 | `docs/getting-started.md` fehlt Scope Declaration + Approval Checkpoint (W-03, W-04) | FK | P1 | `docs/getting-started.md` | M12 |
| G-004 | `docs/getting-started.md` Milestone-Schema ohne Dependencies/Priority (W-03) | FK | P1 | `docs/getting-started.md` | M12 |
| G-005 | `governance/evidence-policy.md` verwendet interne Projektbegriffe (W-09, A-28) | WH | P1 | `governance/evidence-policy.md` | M10 |
| G-006 | `governance/quality-principles.md` komplett veraltet — keine neuen Konzepte (W-07, W-08) | FK+WH | P1 | `governance/quality-principles.md` | M10 |
| G-007 | Kern-These A-20 ist als Faktum formuliert, ist aber Design-Annahme | WH | P1 | `docs/overview.md` | M14 |
| G-008 | Human Decision Trigger (6×) ohne Begründung (A-07) | WH | P1 | `governance/guardrails.md` | M14 |
| G-009 | Rework-Limit = 2 ohne Begründung (A-13) | WH | P1 | `governance/rework-and-escalation.md` | M14 |
| G-010 | `deliverables.md` beschreibt Retention-Klassen ohne Verweis auf `artifact-retention.md` (L-02, W-05) | FK | P1 | `framework/core/deliverables.md` | M09 |
| G-011 | `milestones.md` kein Hinweis auf `docs/decisions/` als Speicherort (L-01) | FK | P1 | `framework/core/milestones.md` | M09 |
| G-012 | `guardrails.md` Operating Rules: ScopeGuard fehlt (L-04) | FK | P1 | `governance/guardrails.md` | M10 |
| G-013 | `quality-principles.md` Prinzip 5 hinkt hinter Human-Decision-Mechanismus her (W-07) | FK+WH | P1 | `governance/quality-principles.md` | M10 |
| G-014 | `quality-principles.md` Prinzip 4 nicht mit deliverables.md verknüpft (W-08) | FK | P1 | `governance/quality-principles.md` | M10 |
| G-015 | Fehlende Datei: `docs/glossary.md` (L-13) | WH | P1 | `docs/glossary.md` | M06 |
| G-016 | Fehlende Datei: `governance/document-quality.md` (L-16) | WH | P1 | `governance/document-quality.md` | M07 |
| G-017 | Fehlende Datei: `docs/methodology.md` (L-14) | WH | P2 | `docs/methodology.md` | M08 |
| G-018 | `governance-matrix.md` "Check areas" statt "Modules" (I-08, W-06) | FK | P1 | `governance/governance-matrix.md` | M10 |
| G-019 | `governance-matrix.md` hat keine Default-Module als Beispiel (L-06) | IS | P2 | `governance/governance-matrix.md` | M10 |
| G-020 | `governance/policies/` fehlen: rework-policy, approval-policy, scope-policy (L-07) | IS | P2 | `governance/policies/` | M11 |
| G-021 | `rework-and-escalation.md` `rework-attempt:` ohne Querverweis zu `deliverables.md` (L-08) | FK | P1 | `governance/rework-and-escalation.md` | M10 |
| G-022 | `artifact-retention.md` hat keine ausgehenden Querverweise (L-09) | FK | P1 | `framework/core/artifact-retention.md` | M13 |
| G-023 | `bootstrap.md` Approval-Artifact ohne Template-Verweis (L-03) | FK | P1 | `framework/core/bootstrap.md` | M11 |
| G-024 | `docs/rbac-case-example.md` zeigt Pre-MA-06-DAD-M; veraltet (M01 Status: veraltet) | IS | P2 | `docs/examples/rbac-case-example.md` | M17 |
| G-025 | Education-Prinzipien ohne Lernwissenschaft-Bezug (A-24, A-25) | WH | P2 | `docs/variants/education.md` | M14 |
| G-026 | `deliverables.md` + `artifact-retention.md` Redundanz Retention-Klassen (R-01) | FK | P1 | `framework/core/deliverables.md` | M09 |
| G-027 | `severity-framework.md` + `governance-matrix.md` Redundanz Kategorie-Overrides (R-04) | FK | P2 | `governance/governance-matrix.md` | M10 |
| G-028 | `severity-policy.yaml` `any:` als YAML-Key semantisch unklar | FK | P1 | `governance/policies/severity-policy.yaml` | M10 |
| G-029 | `README.md` fehlt Eintrag für `docs/decisions/MILESTONE_PLAN_V1.md` (L-18) | FK | P1 | `README.md` | M19 |
| G-030 | Fehlende Datei: `docs/reproducibility.md` (L-15) | WH | P2 | `docs/reproducibility.md` | M15 |
| G-031 | Fehlende Datei: `governance/framework-change-process.md` (L-17) | IS | P2 | `governance/framework-change-process.md` | M16 |
| G-032 | Fehlende Datei: `AI_CONTEXT.md` und `docs/software-reference.md` | IS | P1 | `AI_CONTEXT.md`, `docs/software-reference.md` | M18 |
| G-033 | Severity Threshold-Begründung medium→rework fehlt (A-11) | WH | P1 | `governance/severity-framework.md` | M14 |
| G-034 | Default-Profile `standard` ohne Begründung (A-19) | WH | P2 | `framework/core/modules.md` | M13 |

**Gesamt: 34 Gaps**

---

## Top-10 kritischste Gaps (P1, höchste Auswirkung)

| Rang | Gap-ID | Warum kritisch |
|------|--------|----------------|
| 1 | G-001 | YAML-Policy enthält ungültigen Wert — bricht jede maschinelle Nutzung |
| 2 | G-007 | Kern-These als Faktum formuliert — wissenschaftliche Glaubwürdigkeit des gesamten Repos |
| 3 | G-006 | `quality-principles.md` als einzige vollständig veraltete Governance-Datei — Widerspruch zur gelebten Praxis |
| 4 | G-002 + G-003 | `overview.md` + `getting-started.md` veraltet — Erstnutzer initialisieren Framework falsch |
| 5 | G-015 | Kein Glossar — Terminologie-Inkonsistenz kann sich in M09–M13 weiter fortpflanzen |
| 6 | G-012 | ScopeGuard fehlt in Operating Rules — Kernprinzip ohne Guardrail-Erwähnung |
| 7 | G-032 | Keine `AI_CONTEXT.md` — primäres Ziel (Software-Referenz) nicht erfüllt |
| 8 | G-018 | "Check" vs. "Module" — kritischer Terminologie-Versatz direkt in Governance-Matrix |
| 9 | G-008 | Human Decision Trigger ohne Begründung — schwächste Stelle in Human-Accountability |
| 10 | G-005 | `evidence-policy.md` projektspezifisch — schränkt Framework-Wiederverwendbarkeit ein |

---

## Dimensionsverteilung

| Dimension | Gaps | Anteil |
|-----------|------|--------|
| Wissenschaftliche Härtung (WH) | 11 | 32 % |
| Formulierungskorrektur (FK) | 17 | 50 % |
| Ist/Soll-Vergleich (IS) | 6 | 18 % |

**Formulierungskorrektur ist die dominierende Dimension** — der Framework-Kern ist methodisch richtig, muss aber sprachlich und strukturell präzisiert werden.

---

## Zusammenfassung: Was fehlt dem Repo um als belastbares Referenzdokument zu gelten

1. **Konsistenz der Einstiegsdokumente** — `overview.md` und `getting-started.md` sind für Erstnutzer irreführend
2. **Glossar** — ohne gemeinsame Sprache sind Terminologie-Fehler beim Software-Einbau vorprogrammiert
3. **Begründete Kern-These** — die wichtigste Aussage des Frameworks muss als Design-Annahme, nicht als Faktum stehen
4. **Korrektes YAML** — `severity-policy.yaml` hat einen Fehler der maschinelle Nutzung verhindert
5. **AI_CONTEXT.md** — das primäre Ziel (Referenzdokument für Software) hat noch keine eigene Datei

---

## Phase-Output

**Status:** COMPLETED
**Input Summary:** Konsolidierung aus M01 (Inventar), M02 (Terminologie), M03 (Konsistenz/Lücken), M04 (Wiss. Audit)
**Artifacts:** Diese Datei `docs/decisions/M05_gap_analyse.md`
**Risks and Assumptions:**
- `medium` — 34 Gaps ist mehr als erwartet; Priorisierung ist kritisch um nicht in Perfektionismus zu verfallen
- `low` — P2-Gaps können ohne Risiko in V2 verschoben werden wenn nötig
**Next Step:** M06 — Glossar und Terminologie-Standard
