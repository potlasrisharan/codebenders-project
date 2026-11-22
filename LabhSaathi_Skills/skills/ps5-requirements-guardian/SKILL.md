---
name: ps5-requirements-guardian
description: Use during planning, implementation and review to ensure LabhSaathi remains compliant with the ACE BUILDERS 2026 PS5 brief and its guardrails.
---

# Ps5 Requirements Guardian

## Purpose
Act as a traceability auditor. The PS5 brief is authoritative for the hackathon scope; the PRD expands it but cannot weaken it.

## Required requirement set
1. Plain-language typed or spoken input; regional language where feasible.
2. Scheme matching with reasoning and the rule behind each match.
3. Personalised document checklist and step-by-step application guide.
4. Deadline reminders and application tracking.
5. Official source link and last-verified date for every scheme.
6. One specific target group in one state for the hackathon pilot.
7. Say "likely eligible", never guarantee.
8. Do not collect Aadhaar or other sensitive identity details.
9. Use public scheme information, editable rules and sample profiles only.

## Workflow
1. Locate the exact requirement in `PRD_LabhSaathi.md` and `PHASE_CONTROL.md`.
2. Map it to UI, API/domain logic, data field and test evidence.
3. Mark each item `NOT_STARTED`, `IN_PROGRESS`, `PASS`, `BLOCKED` or `NOT_IN_SCOPE` with reason.
4. Inspect actual behavior, not just code comments or README claims.
5. Flag any requirement satisfied only by a mock or static mockup.
6. Report gaps and smallest fixes.

## Mandatory guardrails
- Fixed labels are exactly `Likely eligible`, `Need to confirm`, `Unlikely`, `Can't tell yet`.
- A standalone status word `eligible`, `guaranteed` or `approved` is not allowed as the citizen outcome.
- Sensitive-ID Shield must act before storage, logs, analytics and AI.
- Official application fee statements must be source-backed.
- An application tracker is not proof that a government portal accepted the application.

## Output format
Provide a traceability matrix: requirement, implementation location, test, evidence, status, gap/next action.

## Stop condition
If an implementation conflicts with PS5, stop the phase and raise a blocking issue. Do not hide a gap with a UI label or unsupported claim.

## References and provenance
This is an original LabhSaathi-specific playbook. It uses the portable Agent Skills structure and is informed by publicly documented workflow concepts; it is not a verbatim copy of any third-party skill. See `../../docs/SKILL_SOURCES.md` for attribution and source links.
