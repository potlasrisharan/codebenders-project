---
name: verification-before-completion
description: Use before reporting any LabhSaathi task, feature or phase as complete; verify claims against actual runtime and test evidence.
---

# Verification Before Completion

## Purpose
Prevent unsupported completion claims. A generated file, successful edit or green-looking UI is not enough.

## Verification checklist
1. Identify the exact acceptance criteria for the task.
2. Run the focused test(s).
3. Run relevant regression tests.
4. Run typecheck/lint/build using actual project scripts where available.
5. Start the local app and exercise the real flow when UI/API behavior changed.
6. Inspect browser/terminal errors and network/storage side effects.
7. For data-driven features, inspect a representative stored record and source/version trace.
8. For privacy features, prove the raw test value did not reach persistence, logs, analytics or provider mocks.
9. For eligibility, verify each predicate trace and the fixed result label.
10. Record exact commands and outcomes; clearly state anything not tested.

## Language discipline
Say "verified by test X" only if test X was run. Say "not tested" when not tested. Distinguish mocked behavior from a live external integration. Never present synthetic demo data as real public impact.

## LabhSaathi release blockers
- Any critical P0 test failure.
- Sensitive identifier leakage.
- Unsupported scheme source or rule.
- An incorrect/confident eligibility label.
- Unsupported "free" fee statement or invented deadline.
- Broken official application link.
- Share payload exposing personal profile information.

## Completion report
List acceptance criteria, verification commands/results, manual flows exercised, changed files, known limitations and blockers.

## References and provenance
This is an original LabhSaathi-specific playbook. It uses the portable Agent Skills structure and is informed by publicly documented workflow concepts; it is not a verbatim copy of any third-party skill. See `../../docs/SKILL_SOURCES.md` for attribution and source links.
