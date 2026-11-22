# Phase Ledger — P6

- Project: LabhSaathi
- Current phase: `P6 — Scheme discovery, fixed labels & Near-Match`
- Status: `DONE_PENDING_APPROVAL`
- Owner approval: `PENDING`
- Branch/commit: local-only
- Credit usage checkpoint: local test run

## Scope
- In scope: Scheme discovery engine with multi-criteria filtering (`src/core/discovery/discovery-service.ts`), jurisdiction matching, transparent relevance scoring, Near-Match delta diagnosis (for borderline or 1-condition misses), national coverage notification for unverified states, and unit test suite (`tests/unit/discovery-service.test.ts`).
- Out of scope: AI vector embeddings (keyword and structured matching used to prevent false positives and credit waste).

## Tasks
- [x] Filter candidate schemes by state and central jurisdiction.
- [x] Run canonical P5 eligibility engine on each candidate.
- [x] Guarantee search ranking cannot alter or override deterministic likelihood labels.
- [x] Implement Near-Match Discovery identifying 1-condition delta advice.
- [x] Provide honest state coverage notices for partial/unverified states.
- [x] Unit tests for ranking, near-match, and state coverage notice.

## Acceptance Criteria
- [x] Results restricted to supported scope and jurisdiction.
- [x] Every result has a fixed likelihood label and rule trace.
- [x] Search ranking cannot decide eligibility.
- [x] Near-Match reuses canonical P5 eligibility engine.
- [x] Empty/unverified state explains next useful action.

## Evidence
- `tests/unit/discovery-service.test.ts`: 4 of 4 tests passed.
