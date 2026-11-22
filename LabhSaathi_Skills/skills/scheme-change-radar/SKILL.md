---
name: scheme-change-radar
description: Use to detect and explain changes between scheme source/rule versions and identify prior results that need reassessment.
---

# Scheme Change Radar

## Purpose
Make change awareness auditable. A detected difference is a review signal, not automatic permission to rewrite active rules.

## Workflow
1. Load the prior approved source/rule version and a new candidate source.
2. Normalise comparable fields while preserving original evidence.
3. Compute field-level differences: old value, new value, source, effective date, detection date and confidence.
4. Classify changes (eligibility, benefit, documents, application steps, fee, deadline, jurisdiction, status).
5. Route candidate changes to human review.
6. After approval, create a new scheme version; retain the previous version.
7. Identify prior eligibility runs using the affected version and mark them `reassessment_recommended`.
8. Re-evaluate only through the canonical eligibility engine.

## Demo mode
Use controlled sample rule changes for the hackathon. Label them as simulated. Do not claim live monitoring unless a real, verified monitoring pipeline exists.

## Output
Change summary, old/new evidence, effective-date state, review state, affected scheme versions, potentially affected results and next review action.

## Acceptance
A reviewer can trace every displayed change to both versions and the source. No prior result is silently overwritten.

## References and provenance
This is an original LabhSaathi-specific playbook. It uses the portable Agent Skills structure and is informed by publicly documented workflow concepts; it is not a verbatim copy of any third-party skill. See `../../docs/SKILL_SOURCES.md` for attribution and source links.
