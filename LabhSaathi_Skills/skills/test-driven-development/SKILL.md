---
name: test-driven-development
description: Use for every behavior change in LabhSaathi, especially eligibility, privacy filtering, source handling, sharing and workflow state.
---

# Test Driven Development

## Purpose
Use a disciplined red-green-refactor loop so public-benefit guidance is testable and regressions are caught early.

## Procedure
1. Pick one acceptance criterion.
2. Write the smallest test that demonstrates the required behavior.
3. Run it and confirm it fails for the expected reason (RED).
4. Implement the smallest code change that makes it pass (GREEN).
5. Run the focused test, then relevant neighboring tests.
6. Refactor without changing behavior.
7. Run typecheck/lint/build where available.
8. Record actual command output in the phase ledger.

## High-priority LabhSaathi test areas
- Three-valued AND/OR/NOT semantics.
- Exact fixed likelihood labels and forbidden wording.
- Mixed false/unknown rule precedence.
- Sensitive ID rejected before storage/logger/AI mock receives data.
- Source status and stale/conflicting rule handling.
- Fee status and conditional "Official application is free" display.
- Deadline unknown state; no fabricated date.
- WhatsApp share allow-list and personal-data exclusion.
- What-If and Near-Match reuse the same eligibility engine.
- Academic-year renewal source/date provenance.

## Test quality
Prefer meaningful assertions on behavior and side effects. Avoid tests that merely assert implementation details or snapshot a large unstable UI. Use synthetic fixtures only.

## Do not
- Write implementation first and add a superficial test afterward.
- Mock the exact function being tested so no real logic runs.
- make a test pass by weakening the acceptance criterion.
- claim a test passed without running it.

## Completion check
The failing-before/passing-after behavior is recorded and adjacent regressions are checked.

## References and provenance
This is an original LabhSaathi-specific playbook. It uses the portable Agent Skills structure and is informed by publicly documented workflow concepts; it is not a verbatim copy of any third-party skill. See `../../docs/SKILL_SOURCES.md` for attribution and source links.
