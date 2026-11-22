# Phase Ledger — P3

- Project: LabhSaathi
- Current phase: `P3 — Scheme data foundation & source governance`
- Status: `DONE_PENDING_APPROVAL`
- Owner approval: `PENDING`
- Branch/commit: local-only
- Credit usage checkpoint: local test run

## Scope
- In scope: Structured Zod schemas for schemes, sources, versions, fee statuses, document requirements, application steps, and rule predicates (`src/core/data/schema.ts`).
- Curated authentic datasets gathered directly from official government sources (`src/core/data/schemes-dataset.ts`):
  - Telangana ePASS Post-Matric RTF (`telanganaepass.cgg.gov.in`)
  - Telangana ePASS Maintenance Fee MTF
  - Central Sector Scheme of Scholarship (CSSS - MoE, `scholarships.gov.in`)
  - AICTE Pragati Scholarship for Girl Students
  - AICTE Saksham Scholarship for Specially Abled
  - Telangana Ambedkar / MJF Overseas Vidya Nidhi
  - UGC Ishan Uday Scholarship (regional NER benchmark)
  - Telangana Rythu Bima (farmer category benchmark)
- National state coverage registry (`src/core/data/coverage-registry.ts`) distinguishing `covered`, `partial`, and `not_yet_verified`.
- Scheme repository with audit log and version history (`src/core/data/repository.ts`).
- Unit tests (`tests/unit/scheme-data-foundation.test.ts`).

## Tasks
- [x] Gather real public datasets from Telangana ePASS, National Scholarship Portal (NSP), AICTE, and UGC.
- [x] Create schema with strict Zod types.
- [x] Add verified government portal URLs, department names, rule versions, and verification dates.
- [x] Implement source-backed fee state: `free_verified`, `fee_verified`, `unknown`.
- [x] Implement national coverage registry for transparent coverage reporting across Indian states.
- [x] Add audit log and rule version history tracking.
- [x] Automated tests verifying schemas, sources, fee state, scam warnings, and jurisdiction boundaries.

## Acceptance Criteria
- [x] Each active scheme has jurisdiction, source, last-verified date, version, and review state.
- [x] Coverage registry distinguishes covered, partial, and not-yet-verified states.
- [x] Candidate extraction cannot publish itself without verified status.
- [x] Fee state supports free-verified / fee-verified / unknown.
- [x] Source and rule history can be inspected.
- [x] No unsupported source is labelled official.
- [x] Data validation tests pass (7/7 tests green).

## Evidence
- `tests/unit/scheme-data-foundation.test.ts`: 7 tests passed.
