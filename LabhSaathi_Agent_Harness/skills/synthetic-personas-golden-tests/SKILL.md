---
name: synthetic-personas-golden-tests
description: Use when building or validating test profiles, rule fixtures, expected results and regression suites for LabhSaathi.
---

# Synthetic Personas Golden Tests

## Purpose
Provide reproducible evidence that the eligibility engine handles normal, incomplete and unsafe-to-evaluate cases. These are synthetic fixtures, not real people or real eligibility claims.

## Required six personas
A. Complete known profile: all mandatory fixture conditions true → `Likely eligible`.
B. Income unknown: trusted rules; one required citizen attribute unknown → `Need to confirm`.
C. Mandatory condition false: trusted rule clearly fails → `Unlikely`.
D. Jurisdiction uncertainty: citizen fact unknown under a trusted rule → `Need to confirm`; unclear rule itself → `Can't tell yet`.
E. Education details incomplete: required attribute unknown → `Need to confirm`.
F. Source conflict/stale rule: profile appears to fit but evidence is unsafe → `Can't tell yet`.

## Fixture design
- Use made-up names, ages and profile attributes.
- Use fictional scheme fixtures unless the real scheme rules have been verified and reviewed.
- Keep expected predicate outcomes explicit.
- Keep the expected final label and reason explicit.
- Include source/rule version metadata in fixtures.
- Include boundary values and alternative conditions.

## Golden test assertions
- Per-predicate true/false/unknown result.
- Fixed likelihood label.
- Human explanation points to rule/source.
- Unknown never silently converted to false.
- Sensitive identifier test data does not leave the test boundary.
- What-If and Near-Match reuse the canonical evaluator.
- No forbidden result wording appears in UI/API outputs.

## Maintenance
When an approved scheme rule changes, update fixture version and expected traces with a review note. Never change expected output merely to make a failing test green; verify the source first.

## References and provenance
This is an original LabhSaathi-specific playbook. It uses the portable Agent Skills structure and is informed by publicly documented workflow concepts; it is not a verbatim copy of any third-party skill. See `../../docs/SKILL_SOURCES.md` for attribution and source links.
