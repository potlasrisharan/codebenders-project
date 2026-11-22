---
name: scheme-data-curation
description: Use when discovering, extracting, normalising, reviewing or importing public scheme information for the Telangana student pilot.
---

# Scheme Data Curation

## Purpose
Create a small, high-quality scheme dataset rather than a large collection of unverified snippets.

## Source workflow
1. Search official Central or Telangana Government sources first.
2. Confirm the source is genuinely official and relevant to the scheme/department.
3. Check terms of use, robots/access rules and download permissions; do not bypass controls.
4. Capture canonical URL, issuer, source type, document title, publication/effective date if available and date checked.
5. Extract candidate name, category, target group, jurisdiction, benefit, rules, documents, application steps, fees and deadlines.
6. Preserve original wording or a concise evidence excerpt with a page/section locator where possible.
7. Normalise fields without changing their legal meaning.
8. Validate required fields and referential links.
9. Mark extracted information `pending_review`; require human review before active eligibility use.
10. Record unresolved/ambiguous conditions as unknown and exclude them from confident matching.

## Curation priorities
For pilot student schemes, prioritise current eligibility, domicile/residence, institution/course coverage, income conditions, renewal conditions, documents, portal URL, fees and deadlines.

## Quality states
- `candidate`: extracted, not reviewed.
- `reviewed`: source and fields inspected.
- `approved`: safe for matching.
- `stale`: needs recheck.
- `conflict`: official sources disagree.
- `retired`: no longer active or no longer applicable, with evidence.

## Do not
- Fill missing facts from memory or secondary blog summaries.
- copy whole copyrighted documents into the app without permission.
- claim complete scheme coverage.
- let an LLM publish an active eligibility rule.
- use an example/fictional fixture as an actual scheme.

## Output
Return a scheme record, evidence register, validation result, review gaps and recommended state. Include a source-backed statement for each eligibility/document/fee/deadline field.

## References and provenance
This is an original LabhSaathi-specific playbook. It uses the portable Agent Skills structure and is informed by publicly documented workflow concepts; it is not a verbatim copy of any third-party skill. See `../../docs/SKILL_SOURCES.md` for attribution and source links.
