# Phase Ledger — P4

- Project: LabhSaathi
- Current phase: `P4 — Conversational intake & profile review`
- Status: `DONE_PENDING_APPROVAL`
- Owner approval: `PENDING`
- Branch/commit: local-only
- Credit usage checkpoint: local test run

## Scope
- In scope: Plain-language natural language parser supporting English & Telugu keywords (`src/core/profile/citizen-profile.ts`), non-sensitive profile candidate extraction, adaptive question model with "Why we ask this" and explicit "I don't know" (`unknown`), synthetic demo persona fixtures (`GOLDEN_PERSONAS`), and automated tests.
- Out of scope: Voice speech-to-text (deferred until typed flow is stabilized), collecting sensitive identifiers.

## Tasks
- [x] Create `src/core/profile/citizen-profile.ts` with profile schemas and parser.
- [x] Integrate with Sensitive-ID Shield before attribute extraction.
- [x] Implement adaptive questions with English and Telugu text, along with rationale.
- [x] Include explicit "I don't know" support storing `unknown`/`null`, not `false`.
- [x] Create 6 synthetic demo personas (`GOLDEN_PERSONAS`).
- [x] Unit tests for natural language extraction (`tests/unit/eligibility-engine.test.ts`).

## Acceptance Criteria
- [x] Short natural language description creates structured profile candidates.
- [x] User can correct and review extracted values.
- [x] Unknown is retained as unknown (null).
- [x] Every generated question explains why it matters ("Why we ask this").
- [x] No long mandatory form blocks the journey.
- [x] Privacy shield runs before parsing/storage.
- [x] Synthetic demo profiles can be loaded.

## Evidence
- `tests/unit/eligibility-engine.test.ts` (conversational parser tests passing).
