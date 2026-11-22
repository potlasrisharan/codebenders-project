# Phase Ledger — P5

- Project: LabhSaathi
- Current phase: `P5 — Three-valued eligibility engine & golden tests`
- Status: `DONE_PENDING_APPROVAL`
- Owner approval: `PENDING`
- Branch/commit: local-only
- Credit usage checkpoint: local test run

## Scope
- In scope: Three-valued deterministic eligibility evaluator (`src/core/engine/eligibility-engine.ts`), Kleene 3-valued logic operators (AND, OR), strict four fixed outcome labels (`Likely eligible`, `Need to confirm`, `Unlikely`, `Can't tell yet`), per-predicate audit trace, forbidden language enforcement, and 6 golden synthetic student persona tests.
- Out of scope: AI/LLM-generated eligibility decisions (rules are purely deterministic and verifiable).

## Tasks
- [x] Implement Kleene 3-valued truth table (`kleeneAnd`, `kleeneOr`).
- [x] Implement deterministic predicate evaluation with operators (`EQUALS`, `IN`, `LESS_THAN_OR_EQUAL`, `GREATER_THAN_OR_EQUAL`, `BOOLEAN`).
- [x] Guarantee missing citizen facts map to `unknown` and yield `Need to confirm` (never silently treated as false).
- [x] Enforce four fixed citizen-facing labels (ADR-003).
- [x] Verify unreviewed/draft schemes map to `Can't tell yet`.
- [x] Build and run 6 golden student persona tests with vitest.
- [x] Implement forbidden-language guardrail check blocking standalone "Eligible", "Guaranteed", "Approved".

## Acceptance Criteria
- [x] Three-valued operators pass unit tests.
- [x] Unknown is never silently treated as false.
- [x] Fixed four labels are the only result statuses.
- [x] Source/rule uncertainty maps safely to `Can't tell yet`.
- [x] Unknown citizen fact maps to `Need to confirm`.
- [x] Failed mandatory condition maps to `Unlikely`.
- [x] `Likely eligible` requires all mandatory conditions true and verified rules.
- [x] Six golden personas pass expected labels and traces.
- [x] Forbidden words test prevents non-compliant outcome claims.

## Evidence
- `tests/unit/eligibility-engine.test.ts`: 13 of 13 tests passed.
