# Phase Ledger — P7

- Project: LabhSaathi
- Current phase: `P7 — Documents, application guidance & Middleman Shield`
- Status: `DONE_PENDING_APPROVAL`
- Owner approval: `PENDING`
- Branch/commit: local-only
- Credit usage checkpoint: local test run

## Scope
- In scope: Categorized document checklist (mandatory, conditional, optional), step-by-step application guidance with channels and official portal links, Middleman Shield component with fee transparency state (`free_verified` / `fee_verified` / `unknown`), scam warnings against unofficial agents/touts, independence disclaimer, and unit test coverage.
- Out of scope: Automated document parsing/uploading or government credential authentication.

## Tasks
- [x] Implement document checklist linked to source clauses and issuing authorities.
- [x] Implement sequential application instructions with official portal links.
- [x] Implement Middleman Shield component (`src/components/scheme/MiddlemanShieldCard.tsx`).
- [x] Enforce fee transparency state based on verified evidence.
- [x] Include prominent scam warnings against unapproved agents and fraudulent fees.
- [x] Add independent platform disclaimer.
- [x] Unit tests for guidance and fee states (`tests/unit/tracker-and-guidance.test.ts`).

## Acceptance Criteria
- [x] Checklist reflects applicable conditions without invented documents.
- [x] Every step has supporting source evidence.
- [x] Official portal link is verified.
- [x] Fee claim follows verified evidence state.
- [x] Scam warning appears on every scheme page.
- [x] No wording implies government approval or privileged processing.

## Evidence
- `tests/unit/tracker-and-guidance.test.ts`: 6 of 6 tests passed.
