---
name: code-review
description: Use after each meaningful implementation slice and before a phase gate to inspect correctness, safety, maintainability and scope compliance.
---

# Code Review

## Review order
1. Requirement/phase compliance.
2. Correctness and edge cases.
3. Privacy/security and sensitive-data boundaries.
4. Data provenance and eligibility integrity.
5. Accessibility and UX clarity.
6. Maintainability, duplication and performance.
7. Tests and documentation.

## LabhSaathi review questions
- Does any AI output directly determine eligibility? If yes, block.
- Can unknown be mistaken for false?
- Are the four status labels centralised and exact?
- Could a raw sensitive identifier reach storage/logs/analytics/AI?
- Does every displayed scheme claim have source and verification data?
- Is "Official application is free" backed by an authoritative fee record?
- Are deadlines and renewal dates source-backed?
- Does What-If or Near-Match duplicate the rule engine?
- Does the graph invent state not present in the canonical model?
- Does WhatsApp share include personal or sensitive data?
- Did the change introduce unrelated dependencies or remote resources?

## Findings format
Report severity (`BLOCKER`, `HIGH`, `MEDIUM`, `LOW`), file/area, evidence, impact and minimal correction. Do not bury blockers in a general summary.

## Gate behavior
Block phase approval for unresolved critical privacy, eligibility, source-truth or P0 regressions. Distinguish non-blocking polish from correctness defects.

## References and provenance
This is an original LabhSaathi-specific playbook. It uses the portable Agent Skills structure and is informed by publicly documented workflow concepts; it is not a verbatim copy of any third-party skill. See `../../docs/SKILL_SOURCES.md` for attribution and source links.
