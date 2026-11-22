---
name: source-verification-versioning
description: Use when reviewing official source quality, freshness, conflicts, scheme changes, last-verified dates or active rule versions.
---

# Source Verification Versioning

## Purpose
Maintain a traceable chain from each citizen-facing statement back to current source evidence.

## Verification workflow
1. Open the canonical source rather than relying on search snippets.
2. Confirm issuer/domain, page/document identity and scheme association.
3. Extract the relevant statement and page/section locator.
4. Record publication date, effective date and date checked separately; do not conflate them.
5. Compare with prior version and other authoritative sources.
6. Classify as current, stale, conflicting, unavailable or not applicable.
7. Route uncertain changes to human review.
8. Preserve prior version and effective period; never silently overwrite history.
9. Re-run affected golden profiles after a rule change.

## Source fields
`source_id`, canonical URL, issuer, title, document type, publication date, effective date, date checked, source status, content hash/snapshot pointer if legally permitted, reviewer note and associated scheme/rule version.

## Conflict policy
If authoritative sources conflict, show `Can't tell yet` for affected evaluation until the conflict is resolved. Record both sources and explain the conflict. Do not choose whichever page looks newer without assessing authority and applicability.

## Change Radar support
For each changed field, record old value, new value, evidence, effective date, impact candidate set and review status. A detected diff is not automatically an approved rule update.

## Do not
- claim continuous/live monitoring if only a manual check was performed;
- backdate verification;
- treat a crawler fetch time as a source's effective date;
- mark a source verified merely because its URL loads.

## References and provenance
This is an original LabhSaathi-specific playbook. It uses the portable Agent Skills structure and is informed by publicly documented workflow concepts; it is not a verbatim copy of any third-party skill. See `../../docs/SKILL_SOURCES.md` for attribution and source links.
