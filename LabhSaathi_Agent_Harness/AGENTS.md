# LabhSaathi Agent Operating Contract

This file is the repository-level instruction source for Nexen and any compatible coding agent. The PRD is the product authority; `PHASE_CONTROL.md` is the delivery authority; skill files are procedural playbooks.

## 1. Authority order

1. Original hackathon PS5 PDF and its explicit guardrails; `PS5_REQUIREMENTS.md` is the workspace text reference.
2. Approved `PRD_LabhSaathi.md`.
3. Approved `PHASE_CONTROL.md` and current phase ticket.
4. This `AGENTS.md` operating contract.
5. Relevant `skills/*/SKILL.md` playbooks.
6. Agent assumptions (lowest authority; must be surfaced).

If instructions conflict, stop and report the conflict. Do not silently reinterpret PS5 or weaken privacy/safety requirements.

## 2. Always-on rules

- Develop locally first. Never deploy or create Cloudflare resources without explicit approval.
- Implement strictly one phase and one feature slice at a time.
- Do not start the next phase until the current phase acceptance gate is evidenced and the product owner approves it.
- Inspect the repository before editing. Preserve its existing stack and functioning behavior unless a migration is approved.
- Use synthetic profiles only for the hackathon demo. Do not request or store Aadhaar, PAN, bank numbers, identity-document images or other unnecessary sensitive identifiers. Keep the product state-aware for users across India; show verified data coverage instead of hard-coding one state or implying nationwide completeness.
- Sensitive-ID Shield must run before persistence, logging, analytics and AI/provider calls at both client and server boundaries.
- Eligibility is deterministic three-valued logic: `true`, `false`, `unknown`. AI may extract/explain but cannot decide eligibility.
- Citizen-facing outcome labels are exactly: `Likely eligible`, `Need to confirm`, `Unlikely`, `Can't tell yet`.
- Never use a bare `eligible`, `guaranteed` or `approved` as an eligibility result.
- Do not claim an application was submitted or approved unless the product actually completed that operation through a verified integration (not in MVP).
- Every published scheme claim needs source provenance, verification date/status and rule version.
- Show "Official application is free" only when an authoritative source confirms the fee is zero. Otherwise show verified fee or "Fee information not verified".
- No invented eligibility conditions, fees, deadlines, document alternatives, portals, appeal rights or benefit amounts.
- Near-Match and What-If reuse the exact canonical eligibility engine.
- Merge Benefit Action Graph and Eligibility Explanation Graph into one Unified Eligibility Action Graph.
- WhatsApp share is user-initiated, preview-first and excludes profile/sensitive details.
- Use small focused edits, test before claiming success, and report actual evidence.
- Do not run expensive or broad AI loops when deterministic code/data is sufficient.

## 3. Required workflow for every feature

1. Read the PRD section and applicable phase-control section.
2. Activate relevant skills from `agent/SKILL_REGISTRY.md`.
3. Inspect relevant code, tests and existing patterns.
4. Write a bite-sized plan with files, acceptance criteria and verification commands.
5. Add/update tests first for behavior changes where practical.
6. Implement the minimum coherent slice.
7. Run focused tests, relevant full tests, typecheck/lint/build as available.
8. Review security/privacy, accessibility, data provenance and regression implications.
9. Update docs, phase ledger and decisions.
10. Report changed files, evidence, limitations, credit usage and proposed next step.

## 4. Phase control protocol

- Only one phase may be `IN_PROGRESS` at a time.
- Each phase requires: scope, task checklist, test evidence, acceptance criteria, known risks, owner approval.
- Mark `BLOCKED` when a source, credential, permission or requirement is missing. Do not invent a workaround that changes product truth.
- Mark `DONE_PENDING_APPROVAL` only when technical checks pass; the phase is not closed until owner approval.
- If a phase fails, fix within its scope. Do not add new features to distract from failing acceptance criteria.
- Keep P0 requirements ahead of P1 and P2 ideas.

## 5. Cost and context discipline

- Prefer local mocks and fixtures over remote AI/service calls during early phases.
- Avoid rereading large files when a relevant section is enough.
- Do not launch multiple agents on overlapping tasks.
- Before expensive operations, state why the call is necessary and estimate relative cost (low/medium/high); wait if the operation is outside an approved phase.
- Record approximate Nexen credit usage at each phase checkpoint if the IDE exposes it. Never invent exact credit estimates.
- If credits are running low, stop P2 work first, then optional P1 work. Protect core PS5 acceptance and privacy tests.

## 6. Phase 0 default action

Start with discovery only. Inspect the repository, create the plan/docs, validate the existing toolchain and report. Do not build the full application, ingest bulk data, provision remote services or deploy.
