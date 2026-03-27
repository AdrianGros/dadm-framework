# Repo Curation Guide (No Repetition, No AI-Speak)

## Objective

Make the repository easy to trust for human reviewers in under 10 minutes.

## Curation rules

1. One concept, one canonical file.
2. Cross-link instead of re-explaining.
3. Replace vague words ("robust", "powerful", "innovative") with evidence.
4. Keep claims falsifiable and time-bounded.
5. Distinguish clearly:
   - current capability
   - validated next step
   - open research question

## Writing anti-patterns to remove

- "state-of-the-art" without comparison
- "end-to-end" without boundary definition
- "AI-native" without operational meaning
- repeated summaries across README, overview, and docs

## Style standard

- short paragraphs (max 4 lines)
- active voice and concrete verbs
- numbers where possible
- one table per topic, not per paragraph
- one glossary term per concept

## Structural curation checklist

- README links to one overview, not many competing intros.
- Each folder has one short `README.md` with purpose and entry points.
- Decision logs stay in `docs/decisions/`.
- Presentation assets stay in `docs/presentation/`.
- Discover artifacts stay in `docs/discovery/`.

## Release checklist for external sharing

1. Remove duplicate topic pages or convert to links.
2. Verify all external links and contact addresses.
3. Verify no confidential data in examples.
4. Add "what we can prove today" section to README or deck.
5. Run one non-team readability review before publishing.
