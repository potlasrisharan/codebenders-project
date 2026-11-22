# Phase Ledger — P10

- Project: LabhSaathi
- Current phase: `P10 — What-If simulator & Scheme Change Radar`
- Status: `DONE_PENDING_APPROVAL`
- Owner approval: `PENDING`
- Branch/commit: local-only
- Credit usage checkpoint: local test run

## Scope
- In scope: What-If simulation engine (`src/core/simulator/what-if-service.ts`) supporting hypothetical non-sensitive parameter overrides, delta evaluation, label shift tracking, immutability of the user's active profile, Scheme Change Radar version diff tracker (old version vs new version, effective dates, rule deltas, applicant impact), reassessment alerts, and unit test suite (`tests/unit/what-if-service.test.ts`).
- Out of scope: Live scraping of government notifications (demonstrated using verified controlled government orders).

## Tasks
- [x] Build What-If simulation service consuming the canonical P5 eligibility engine.
- [x] Protect active profile against silent mutation during what-if queries.
- [x] Calculate delta summary and affected predicate conditions.
- [x] Build Scheme Change Radar version diff engine.
- [x] Build reassessment alert queue for tracked schemes.
- [x] Unit test coverage for attendance deltas, unknown-to-eligible deltas, profile immutability, and version diffs.

## Acceptance Criteria
- [x] Simulator calls canonical P5 engine.
- [x] User sees hypothetical state and delta clearly.
- [x] Original profile remains unchanged unless explicitly committed.
- [x] Scheme Change Radar shows version diff and source evidence.
- [x] Impacted prior results are marked for reassessment, not silently overwritten.
- [x] Controlled demo scenarios are repeatable and deterministic.

## Evidence
- `tests/unit/what-if-service.test.ts`: 4 of 4 tests passed.
