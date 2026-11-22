---
name: data-modeling-migrations
description: Use when creating or changing LabhSaathi schemas, migrations, indexes, repository contracts or data lifecycle rules.
---

# Data Modeling Migrations

## Workflow
1. Start from the PRD logical model and inspect the existing database.
2. Identify entities, ownership, cardinality, lifecycle and retention needs.
3. Model scheme identity separately from scheme versions and source revisions.
4. Model eligibility rules as validated structured data with explicit operators and condition grouping.
5. Keep public scheme data separate from citizen profile/claim data.
6. Keep public source references separate from extracted candidate text and approved rules.
7. Add migrations that can be applied from a clean database and tested incrementally.
8. Add indexes for actual filter/search patterns; avoid premature over-indexing.
9. Add constraints and validation at boundaries.
10. Write upgrade, rollback/export and seed-data instructions.

## Required entities
At minimum: schemes, jurisdictions, scheme_versions, eligibility_rules, required_documents, application_steps, sources, fees, source_changes, synthetic_profiles, eligibility_runs, eligibility_predicates, saved_schemes, claim_tasks, academic_years, renewal_events and audit_events.

## Data rules
- Never create Aadhaar/PAN columns or store identity-document images.
- Every active rule points to a scheme version and source evidence.
- Record verification/effective dates and status explicitly.
- Store enum values as stable machine values; map to human labels in one place.
- Unknown values must be representable without sentinel strings that can be confused with real values.
- Avoid persisting raw chat transcripts unless a clear purpose, consent and retention rule is approved.

## Migration acceptance
Fresh install, upgrade path, rollback/recovery note, schema validation, repository tests and fixture compatibility must pass.

## References and provenance
This is an original LabhSaathi-specific playbook. It uses the portable Agent Skills structure and is informed by publicly documented workflow concepts; it is not a verbatim copy of any third-party skill. See `../../docs/SKILL_SOURCES.md` for attribution and source links.
