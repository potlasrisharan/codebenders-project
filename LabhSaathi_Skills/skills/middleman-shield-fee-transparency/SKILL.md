---
name: middleman-shield-fee-transparency
description: Use on every scheme detail page to present official portals, source-backed fee information and anti-scam guidance without unsupported claims.
---

# Middleman Shield Fee Transparency

## Purpose
Respond directly to PS5's middleman problem with factual, useful protection.

## Fee state model
Use exactly one internal state:
- `free_verified`: authoritative source confirms no application fee.
- `fee_verified`: authoritative source confirms a fee; store amount/description, currency, scope and source.
- `unknown`: authoritative fee information is unavailable, ambiguous or conflicting.

## Display rules
- Show "Official application is free" only for `free_verified`.
- Show the verified amount/fee description for `fee_verified`.
- Show "Fee information not verified" for `unknown`.
- Show the official application portal link separately from third-party guidance links.
- Display the scheme source and last-verified date.
- Show a concise warning: beware of unofficial agents promising guaranteed benefits, privileged processing or demanding unauthorised fees; use the official portal/department.
- State that LabhSaathi is an independent guidance tool and does not approve applications.

## Verification workflow
Confirm the application portal and fee claim from official scheme/department instructions. Record the exact source and date checked. If sources conflict, use `unknown` until reviewed.

## Do not
- state that every government service is free;
- accuse a named intermediary without evidence;
- claim a private service is fraudulent from a fee alone;
- display the word "free" without the verified state;
- imply that paying LabhSaathi improves eligibility or speed.

## References and provenance
This is an original LabhSaathi-specific playbook. It uses the portable Agent Skills structure and is informed by publicly documented workflow concepts; it is not a verbatim copy of any third-party skill. See `../../docs/SKILL_SOURCES.md` for attribution and source links.
