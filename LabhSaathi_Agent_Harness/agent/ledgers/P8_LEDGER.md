# Phase Ledger — P8

- Project: LabhSaathi
- Current phase: `P8 — Claim tracker, academic-year renewal & WhatsApp`
- Status: `DONE_PENDING_APPROVAL`
- Owner approval: `PENDING`
- Branch/commit: local-only
- Credit usage checkpoint: local test run

## Scope
- In scope: Local-first claim tracker service (`src/core/tracker/claim-tracker.ts`), application stage progression (`preparing`, `ready_to_apply`, `applied`, `under_verification`, `disbursed`), document completion checkboxes, academic-year renewal calendar with verified dates and windows, WhatsApp share link builder with strict privacy sanitization, and modal preview component (`src/components/share/WhatsAppShareModal.tsx`).
- Out of scope: Auto-sending messages without user confirmation (preview-first only).

## Tasks
- [x] Create `src/core/tracker/claim-tracker.ts` with local-first persistence.
- [x] Support saving schemes, tracking stages, and toggling document completion.
- [x] Build academic-year renewal calendar using verified renewal windows (e.g. August to November).
- [x] Implement preview-first WhatsApp share link generator.
- [x] Ensure WhatsApp share payload contains zero personal data or sensitive identifiers.
- [x] Build `src/components/share/WhatsAppShareModal.tsx` preview component.
- [x] Automated unit test suite (`tests/unit/tracker-and-guidance.test.ts`).

## Acceptance Criteria
- [x] Saved actions persist locally without sensitive attributes.
- [x] No universal scholarship date is invented; verified windows are explicitly cited.
- [x] Renewal events carry source and academic-year metadata.
- [x] WhatsApp text includes only public checklist details and official links.
- [x] WhatsApp payload contains no profile or sensitive data.
- [x] Share is user-initiated and preview-first.

## Evidence
- `tests/unit/tracker-and-guidance.test.ts`: all tests passed.
