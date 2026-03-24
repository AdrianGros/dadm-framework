# Evidence Policy

DAD-M artifacts and public statements must be traceable to available source material
and phrased no stronger than the evidence allows. This policy applies to all artifacts
produced under the framework, including framework documentation itself.

## Source hierarchy

Acceptable sources for claims in a DAD-M artifact, in descending priority:

1. Direct observations from the current project (verified outputs, proofs, test results)
2. Framework documentation and governance documents in this repository
3. Explicitly cited external sources, referenced by URL or document title
4. Domain knowledge stated with appropriate qualification (e.g., "typically", "in most cases")

If sources conflict, prefer the narrower and more defensible wording. Claims that
cannot be traced to any of the above must either be omitted or marked as assumptions.

## Strength of claims

The wording of a claim must match the strength of the evidence:

| Evidence level | Allowed phrasing |
| --- | --- |
| Directly observable, reproducible | "is", "does", "produces" |
| Reported or inferred | "appears to", "is likely to", "suggests" |
| Assumption or hypothesis | "assumes that", "may", "could" |
| Unknown | "not determined", "outside scope" |

Normative statements ("must", "should", "may not") require a traceable reason — either
by reference to a framework principle, a guardrail, or a governance document. An
unsupported normative claim must not appear in a framework or governance artifact.

## Claims that must not appear in framework artifacts

- Official adoption claims without documented evidence
- Company-wide or industry-standard claims without citation
- Formal approval claims without an approval record artifact
- Invented usage metrics or invented business impact claims
- Claims that go beyond what the source material supports

## Publication control

- Do not publish raw project material that was created for internal use only.
- Do not publish project-specific documents as general framework content.
- If a statement cannot be traced to a source, omit it or mark the limitation clearly.
- Prefer narrower wording when a stronger claim cannot be proven.

## Application to framework documentation itself

This policy applies to the framework's own documentation. Any claim about how the
framework behaves, what it guarantees, or who uses it must satisfy the same evidence
standard as any project artifact produced under the framework.

For deployment-specific usage statements (e.g., known organizational users), those
statements belong in `docs/methodology.md` under a clearly scoped section, not in
general framework governance documents.

## Relationship to other documents

- `governance/quality-principles.md` — Principle 6 (Conservative documentation)
- `governance/guardrails.md` — Publication rules for this repository
- `governance/document-quality.md` — Evidence standard for normative statements
