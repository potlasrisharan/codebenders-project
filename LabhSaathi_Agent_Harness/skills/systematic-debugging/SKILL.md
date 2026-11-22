---
name: systematic-debugging
description: Use when LabhSaathi behavior, tests, local services or build steps fail; diagnose the root cause before editing.
---

# Systematic Debugging

## Purpose
Replace guess-and-patch debugging with evidence-led diagnosis.

## Four-stage workflow
1. **Reproduce:** Capture exact steps, inputs (synthetic only), command, expected and actual behavior.
2. **Localise:** Inspect logs/stack traces without exposing sensitive values; isolate the failing layer (UI, API, adapter, data, rule engine, provider, build tooling).
3. **Hypothesise:** List the smallest plausible causes and choose a test that distinguishes them.
4. **Fix and prevent:** Correct the root cause, add a regression test, rerun focused and full relevant checks.

## LabhSaathi safety during debugging
- Never paste raw Aadhaar/PAN-like strings into logs, issue titles, test failure messages or AI debugging prompts.
- Use redacted fixtures such as `[SENSITIVE_IDENTIFIER_REDACTED]`.
- If a rule result is wrong, inspect input state, rule tree, scheme version, source status and evaluator trace separately.
- If a result label is wrong, inspect the central status mapping rather than patching a single screen.
- If a date is wrong, inspect timezone, academic-year source, effective date and deadline provenance.

## Required report
Reproduction, evidence, root cause, minimal fix, regression test, verification output and any remaining uncertainty.

## Do not
- Make multiple unrelated edits before reproducing.
- Silence exceptions or hide failed requests.
- change verified scheme rules to fit a test expectation.
- use production personal data for a debugging reproduction.

## References and provenance
This is an original LabhSaathi-specific playbook. It uses the portable Agent Skills structure and is informed by publicly documented workflow concepts; it is not a verbatim copy of any third-party skill. See `../../docs/SKILL_SOURCES.md` for attribution and source links.
