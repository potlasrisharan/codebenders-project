# Phase Ledger — P9

- Project: LabhSaathi
- Current phase: `P9 — Unified Eligibility Action Graph`
- Status: `DONE_PENDING_APPROVAL`
- Owner approval: `PENDING`
- Branch/commit: local-only
- Credit usage checkpoint: local test run

## Scope
- In scope: Unified visual and linear graph component (`src/components/graph/UnifiedActionGraph.tsx`) combining rule conditions, document readiness, official application actions, and academic-year follow-up/renewals.
- Visual statuses: satisfied (green), unmet (red), unknown/action needed (amber), pending action (blue).
- Interactive drawer displaying source clause, official portal links, and explanations.
- Accessible linear list fallback for mobile and screen-reader accessibility.
- Vitest component tests (`tests/unit/unified-action-graph.test.tsx`).
- Out of scope: Separate duplicate Benefit/Explanation graphs (consolidated into one per ADR-006).

## Tasks
- [x] Merge Benefit Action Graph and Eligibility Explanation Graph into one signature component.
- [x] Connect graph directly to canonical P5 eligibility traces.
- [x] Connect documents to P7 checklist items and completion states.
- [x] Implement interactive node click drawer with official evidence and portal links.
- [x] Support responsive accessible list toggle.
- [x] Component test suite verifying all 3 stages, node clicks, and accessibility mode.

## Acceptance Criteria
- [x] No duplicate separate graph implementations.
- [x] Graph strictly reflects canonical P5 engine and tracker state.
- [x] Clicking nodes reveals official rule trace and source.
- [x] Unknown state is visually and textually distinguishable from false.
- [x] Accessible list fallback is usable on small screens and assistive devices.
- [x] Zero derived or hallucinated eligibility claims.

## Evidence
- `tests/unit/unified-action-graph.test.tsx`: 3 of 3 tests passed.
