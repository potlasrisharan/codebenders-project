# LabhSaathi — Phase Control & Release Gates

**Purpose:** Prevent uncontrolled implementation, scope creep, credit waste and unsafe claims.  
**Rule:** One active phase at a time. No phase advances without evidence and explicit product-owner approval.  
**Execution environment:** Local-first in Codebenders/Nexen. Cloudflare provisioning is a later controlled migration.

---

## 1. How to use this document

This is the delivery control document. The PRD says **what** LabhSaathi must do. This document says **in what order**, **what can be built**, **how it is tested**, and **what evidence is required to close each phase**.

For every phase:

1. Read the phase scope and prerequisites.
2. Activate relevant skills from `agent/SKILL_REGISTRY.md`.
3. Create a small task plan with exact files and checks.
4. Work only on the approved phase and its feature slices.
5. Run the defined tests and record actual output.
6. Complete the phase ledger.
7. Stop at `DONE_PENDING_APPROVAL` and report to the product owner.
8. Start the next phase only after explicit approval.

A phase is not complete because files were generated or the screen looks good. It is complete when all acceptance criteria have evidence.

## 2. Release-control states

| State | Meaning | Allowed action |
|---|---|---|
| `NOT_STARTED` | No work has begun | Plan only |
| `IN_PROGRESS` | Owner approved this phase | Work within phase scope |
| `BLOCKED` | Required fact/source/permission/tool is missing | Report blocker; do not guess |
| `DONE_PENDING_APPROVAL` | Technical gate passed | Present evidence; wait |
| `APPROVED` | Product owner accepted the gate | May plan next phase |

Only one phase may be `IN_PROGRESS`. Never auto-approve a phase.

## 3. Global stop conditions

Stop the current task and report immediately if:

- a proposed implementation requires real Aadhaar/PAN or other sensitive ID data;
- raw sensitive input could enter logs, analytics, persistence or an AI provider;
- an eligibility rule, fee, deadline, document alternative or official link lacks evidence;
- a source conflicts with another authoritative source and the conflict cannot be resolved;
- the agent is about to provision or deploy Cloudflare resources without approval;
- the implementation requires destructive edits or migration of user data;
- a required tool/permission is unavailable;
- Nexen credit consumption is unexpectedly high or a broad autonomous loop is repeating work.

## 4. Phase summary

| Phase | Name | Main deliverable | Gate |
|---|---|---|---|
| P0 | Workspace audit & harness baseline | Stack inventory, requirement matrix, local commands, plan | Owner approves technical baseline |
| P1 | App shell & design system | Responsive navigation and coherent visual foundation | Core shell works at mobile/desktop |
| P2 | Privacy boundary & Sensitive-ID Shield | Client/server input guard and redaction tests | No sensitive test value reaches side effects |
| P3 | Scheme data foundation | Schema, source provenance, versioning, review state, curated fixtures | No active rule without approved source/version |
| P4 | Conversational intake | Adaptive questions, why-ask, I-don't-know, profile review | Profile extracted and corrected safely |
| P5 | Three-valued eligibility engine | Deterministic rules, four labels, golden tests | All rule and wording tests pass |
| P6 | Scheme discovery & Near-Match | Jurisdiction filtering, ranked search, near-match | Search ranking cannot decide eligibility |
| P7 | Documents, application guidance & Middleman Shield | Checklist, sourced steps, fee transparency and scam warning | Scheme page shows evidence and safe fee state |
| P8 | Claim tracker, renewal calendar & WhatsApp | Saved schemes, reminders, academic-year events, safe share | No invented deadline; share excludes personal data |
| P9 | Unified Eligibility Action Graph | One visual graph for explanation and action progress | Graph matches canonical engine/workflow state |
| P10 | What-If & Scheme Change Radar | Hypothetical re-evaluation and controlled rule diff | Same engine reused; changes traceable |
| P11 | Demo hardening & final acceptance | Accessibility, responsive QA, security and demo proof | PS5 acceptance matrix passes |
| P12 | Cloudflare migration (later) | Approved production adapter/bindings and deployment | Separate written approval + migration tests |

---

# 5. Detailed phase controls

## P0 — Workspace audit & harness baseline

**Goal:** Understand the actual Codebenders workspace before changing it.

**Prerequisites:** Product owner provides access to the existing workspace and PS5 source PDF.

**Tasks:**
- Inspect repository structure, existing framework, package manager, scripts and current app state.
- Identify existing design conventions and working features to preserve.
- Confirm exact Nexen tool names, shell access, skill import method and available test runner.
- Create PS5 requirement-to-screen/API/data/test matrix.
- Create baseline local run, typecheck, lint, test and build commands.
- Record existing failures before changes; do not attribute pre-existing failures to new code.
- Propose architecture and data storage adapter. Choose local SQLite or Wrangler local D1 only after inspecting stack compatibility.
- Write phase 1 plan with file paths, small tasks and measurable acceptance criteria.

**Out of scope:** App implementation, remote AI, bulk data ingestion, Cloudflare provisioning, deployment.

**Acceptance criteria:**
- [ ] Workspace inventory exists.
- [ ] Existing stack and constraints are documented.
- [ ] PS5 mapping covers all five required capabilities and guardrails.
- [ ] Local commands are verified or blockers reported.
- [ ] Existing baseline failures are recorded.
- [ ] Proposed architecture preserves existing working features.
- [ ] P1 plan is reviewable and small enough to execute incrementally.

**Evidence:** command output, file inventory, requirement matrix, architecture note, baseline test report.

**Gate:** Product owner approves stack and architecture before P1.

## P1 — Application shell & design system

**Goal:** Build a cohesive, accessible shell without implementing eligibility logic yet.

**Tasks:**
- Establish app layout, navigation, responsive breakpoints and core theme tokens.
- Create reusable buttons, inputs, cards, status chips, alerts, empty/loading/error states.
- Add landing/introduction screen explaining independent guidance and limitations.
- Create route placeholders for Intake, Matches, Scheme Detail, Checklist, Tracker and Admin Review.
- Add mobile-first layouts and keyboard navigation basics.

**Out of scope:** Real profile processing, real scheme data, AI, rule evaluation.

**Acceptance criteria:**
- [ ] App starts locally using documented command.
- [ ] All route placeholders load without console/runtime errors.
- [ ] Mobile and desktop layouts are usable.
- [ ] Keyboard focus and labels are visible.
- [ ] Design tokens/components are reused rather than duplicated.
- [ ] No existing animation/working feature is removed without approval.

**Evidence:** screenshots at agreed viewport sizes, route smoke test, build output, accessibility checklist.

**Gate:** Owner approves visual shell before P2.

## P2 — Privacy boundary & Sensitive-ID Shield

**Goal:** Prevent sensitive identifiers from reaching persistence, logs, analytics or AI.

**Tasks:**
- Define a shared, tested detection/redaction contract for Aadhaar-like, PAN-like and configurable patterns.
- Run filtering at the client boundary before local persistence or network send.
- Repeat validation at the API/server boundary before handlers, logging, queueing or provider calls.
- Ensure raw rejected input is not included in logs, error telemetry, traces or test failure messages.
- Display a calm explanation and allow restatement without the identifier.
- Add test seams proving downstream storage/logger/AI mocks receive only safe text.
- Audit WhatsApp/share payload helper for sensitive data exclusion.

**Out of scope:** Identity verification; checking whether a number belongs to a person; collecting identifiers.

**Acceptance criteria:**
- [ ] Pattern fixtures for Aadhaar-like and PAN-like strings are blocked/redacted.
- [ ] Ordinary non-sensitive text passes.
- [ ] User sees explanation and can retry.
- [ ] Client and server boundaries both enforce filtering.
- [ ] No raw blocked string appears in storage, logs, analytics or AI mock call capture.
- [ ] Tests include formatted/space-separated inputs and false-positive messaging.
- [ ] No UI asks for Aadhaar/PAN.

**Evidence:** automated test report, redacted mock-call capture, manual UX test.

**Gate:** Privacy boundary must pass before AI-backed intake or any persistent profile data.

## P3 — Scheme data foundation & source governance

**Goal:** Establish trustworthy, editable, versioned scheme records.

**Tasks:**
- Implement scheme, jurisdiction, state/category coverage, version, source, rule-candidate, fee, document and application-step schemas.
- Add migrations and repository interfaces.
- Define source capture and verification statuses.
- Add human review/publish flow or a lightweight admin fixture workflow.
- Create a small curated demo dataset only from verified public sources; represent national state/category coverage explicitly.
- Keep source document/reference separate from approved structured data.
- Add schema validation, duplicate detection and required-field checks.
- Create controlled fixtures for tests separate from real scheme records.

**Out of scope:** Mass scraping, nationwide completeness claims, AI autopublishing of rules.

**Acceptance criteria:**
- [ ] Migrations run from a clean local database.
- [ ] Each active scheme has jurisdiction, source, last-verified date, version and review state.
- [ ] Coverage registry distinguishes covered, partial and not-yet-verified state/category combinations.
- [ ] Candidate extraction cannot publish itself.
- [ ] Fee state supports free-verified / fee-verified / unknown.
- [ ] Source and rule history can be inspected.
- [ ] No unsupported source is labelled official.
- [ ] Data validation tests pass.

**Evidence:** migration logs, schema diagram, sample records, validation tests, source register.

**Gate:** Owner reviews first curated scheme records before matching work.

## P4 — Conversational intake & profile review

**Goal:** Turn plain-language descriptions into a minimal, correctable non-sensitive profile.

**Tasks:**
- Define profile attributes needed by the verified pilot rules only.
- Implement typed conversation first.
- Extract candidate fields to a structured schema with confidence/unknown state.
- Ask adaptive follow-up questions only for needed attributes.
- Include an explicit "I don't know" option and a "Why we ask this" line for each question.
- Show review/edit confirmation before saving the profile.
- Route all text through Sensitive-ID Shield before AI or storage.
- Use a deterministic/mock provider initially if no approved inference is available.

**Out of scope:** Voice until typed flow is stable; sensitive ID fields; real personal profiles.

**Acceptance criteria:**
- [ ] A short natural-language description creates structured profile candidates.
- [ ] User can correct extracted values.
- [ ] Unknown is retained as unknown.
- [ ] Every generated question explains why it matters.
- [ ] No long mandatory form blocks the journey.
- [ ] Shield runs before AI/storage.
- [ ] Synthetic demo profiles can be loaded.

**Evidence:** three sample conversation transcripts (synthetic), profile validation tests, privacy test.

**Gate:** Owner approves question set and profile schema before P5.

## P5 — Three-valued eligibility engine & golden tests

**Goal:** Make rule evaluation deterministic, explainable and testable.

**Tasks:**
- Implement true/false/unknown predicate representation.
- Implement AND/OR/NOT semantics and documented mandatory/alternative rule grouping.
- Separate rule integrity/source trust from citizen attribute state.
- Centralise fixed status mapping and display strings.
- Store per-predicate trace: rule ID/version, source, value state, result and explanation.
- Create 5–6 synthetic student personas and golden fixtures.
- Add forbidden-language tests for `eligible`, `guaranteed`, `approved` as standalone result terms.
- Define mixed false/unknown precedence and test it.

**Out of scope:** AI-generated eligibility decision; What-If UI; benefit combination inference.

**Acceptance criteria:**
- [ ] Three-valued operators pass unit tests.
- [ ] Unknown is never silently treated as false.
- [ ] Fixed four labels are the only result statuses.
- [ ] Source/rule uncertainty maps safely to `Can't tell yet`.
- [ ] Unknown citizen fact maps to `Need to confirm` where the rules are sound.
- [ ] Failed mandatory condition maps to `Unlikely` with explanation.
- [ ] `Likely eligible` requires all required conditions true and trusted current rules.
- [ ] Six golden personas pass expected labels and traces.
- [ ] AI provider is not invoked by the deterministic evaluator.

**Evidence:** unit/golden test output, trace snapshots and status-wording test output.

**Gate:** No scheme discovery result may be shipped before P5 approval.

## P6 — Scheme discovery, fixed labels & Near-Match

**Goal:** Find relevant schemes without confusing similarity with qualification.

**Tasks:**
- Filter schemes by user-selected Indian jurisdiction, verified data coverage and relevant target group.
- Implement structured filters first; add keyword search if useful.
- Optionally add semantic retrieval behind SearchProvider, but never use similarity score as eligibility evidence.
- Run canonical eligibility engine after candidate retrieval.
- Rank results using transparent relevance signals (jurisdiction, category, known profile fit, source quality, freshness).
- Add result explanation and Near-Match Discovery.

**Acceptance criteria:**
- [ ] Results are restricted to supported scope.
- [ ] Every result has a fixed likelihood label.
- [ ] Every label links to a trace and source.
- [ ] Semantic/keyword score cannot override deterministic rule status.
- [ ] Near-Match reuses the same rule engine.
- [ ] Empty/no-match state explains next useful action.

**Evidence:** search test matrix, screenshots, golden-persona result snapshots.

**Gate:** Owner approves discovery relevance and explanations before P7.

## P7 — Documents, application guidance & Middleman Shield

**Goal:** Move the user from a potential match to an informed application plan.

**Tasks:**
- Implement mandatory/conditional/optional document checklist.
- Link each item to source evidence and why it is required.
- Render step-by-step application guidance from reviewed data.
- Show official portal link and scheme source.
- Implement fee status: free verified / fee verified / unknown.
- Show "Official application is free" only for `free_verified` records.
- Add scam warning against unofficial agents promising guaranteed benefit or unauthorised charges.
- State that LabhSaathi is independent and does not approve applications.

**Acceptance criteria:**
- [ ] Checklist reflects applicable conditions.
- [ ] No invented document or alternative.
- [ ] Every step has supporting source.
- [ ] Official portal link is correct and reviewable.
- [ ] Fee claim follows evidence state.
- [ ] Scam warning appears on every scheme page.
- [ ] No wording implies government approval or privileged processing.

**Evidence:** scheme-page review, source checklist, UI tests for fee states.

**Gate:** Owner approves the public-facing scheme page claims before P8.

## P8 — Claim tracker, academic-year renewal & WhatsApp

**Goal:** Make the guidance actionable over time.

**Tasks:**
- Implement save scheme and status stages (preparing, ready to apply, applied, follow-up, completed/closed as appropriate).
- Add deadline items only when source-verified.
- Add academic-year renewal calendar for schemes with verified renewal windows.
- Include academic year, renewal requirements, source and reminder status.
- Add local reminder simulation and notification preferences.
- Generate WhatsApp `wa.me` URL from allow-listed checklist text.
- Show preview and require user click; never auto-send.

**Acceptance criteria:**
- [ ] Saved actions persist locally without sensitive attributes.
- [ ] Deadline unknown is shown honestly.
- [ ] No universal scholarship date is invented.
- [ ] Renewal events carry source and academic-year metadata.
- [ ] WhatsApp text includes only public checklist/instruction details and official links.
- [ ] WhatsApp payload contains no profile/sensitive data.
- [ ] Share is user-initiated and preview-first.

**Evidence:** tracker workflow tests, calendar fixture, encoded URL test and privacy assertions.

**Gate:** Owner approves claim workflow before P9.

## P9 — Unified Eligibility Action Graph

**Goal:** Make eligibility reasoning and follow-through visible in one component.

**Tasks:**
- Build one graph connecting Profile → Scheme → Conditions → Documents → Application → Follow-up.
- Display satisfied, unmet, unknown and action-pending states.
- Allow each condition node to show rule, source, last-verified date and explanation.
- Connect graph state to the canonical eligibility trace and tracker.
- Support accessible list/linear fallback for small screens and assistive technologies.

**Acceptance criteria:**
- [ ] No duplicate separate Benefit/Explanation graph implementations.
- [ ] Graph always reflects canonical state.
- [ ] Clicking nodes reveals trace/evidence.
- [ ] Unknown state is visually and textually distinguishable.
- [ ] Mobile fallback is usable.
- [ ] Graph has no invented or derived eligibility values.

**Evidence:** interaction tests, screenshot review and trace-to-graph consistency test.

**Gate:** Owner approves signature experience before P10.

## P10 — What-If simulator & Scheme Change Radar

**Goal:** Demonstrate rule reuse and change awareness.

**Tasks:**
- Implement hypothetical non-sensitive attribute changes.
- Re-run the same eligibility engine against the same rule version.
- Show before/after status and changed predicate details.
- Ensure simulation never silently changes saved profile.
- Implement version diff for controlled sample rule/source changes.
- Show old rule/new rule, effective date if available, review state and potentially affected prior runs.
- Do not claim live government monitoring; demo with controlled fixtures unless a verified monitoring pipeline exists.

**Acceptance criteria:**
- [ ] Simulator calls canonical engine.
- [ ] User sees hypothetical state clearly.
- [ ] Original profile remains unchanged until explicit confirmation.
- [ ] Scheme Change Radar shows version diff and source evidence.
- [ ] Impacted prior results are marked for reassessment, not silently overwritten.
- [ ] Controlled demo scenario is repeatable.

**Evidence:** simulator tests, diff fixture, before/after screenshots.

**Gate:** Owner approves differentiators before P11.

## P11 — Demo hardening & PS5 acceptance

**Goal:** Make the product reliable, honest and judge-ready.

**Tasks:**
- Run complete PS5 requirement matrix.
- Run all unit/integration/e2e tests, typecheck, lint and production build.
- Perform keyboard, contrast, responsive and accessibility review.
- Verify all scheme sources, last-verified dates, fee states and deadlines.
- Run six persona journeys end-to-end.
- Check no sensitive inputs in logs/storage/network/AI captures.
- Check fixed outcome wording across screens and API.
- Prepare demo script, known-limitations list and business-model slide.
- Label all sample/demo data clearly.

**Acceptance criteria:**
- [ ] All P0 requirements pass.
- [ ] All six golden personas pass end-to-end.
- [ ] No critical privacy/security issue remains.
- [ ] All displayed scheme claims have evidence/verification status.
- [ ] No false "free" fee claim or invented deadline.
- [ ] No result uses forbidden wording.
- [ ] Demo can be repeated from a clean local state.
- [ ] Business model is described as a hypothesis/proposal, not existing revenue.

**Evidence:** test reports, acceptance matrix, demo recording/screenshots, source register, issue list.

**Gate:** Product owner accepts hackathon build. Freeze new P1/P2 features after this gate.

## P12 — Cloudflare migration (post-local acceptance, separate approval)

**Goal:** Replace local adapters with Cloudflare-backed services without rewriting domain logic.

**Prerequisites:** P11 approved; production data and secrets policy reviewed; Cloudflare account owner explicitly approves provisioning/deployment.

**Tasks:**
- Audit local schema and adapter boundaries.
- Create D1 schema/migrations and verify import/seed strategy.
- Configure Workers API and environment bindings.
- Configure R2 only for permitted source snapshots/files.
- Add Vectorize only if measured semantic-search value justifies it.
- Add Workers AI only after data minimisation, provider boundary and cost checks.
- Add Queues/Workflows for ingestion jobs only if required.
- Configure secrets outside source control.
- Add staging and rollback plan.
- Run migration parity tests and security review.

**Acceptance criteria:**
- [ ] Explicit owner approval recorded.
- [ ] No secrets committed.
- [ ] D1 migrations and data constraints verified.
- [ ] Same eligibility golden tests pass on migrated adapters.
- [ ] Sensitive-ID tests pass across all provider paths.
- [ ] R2 objects have source/license/access metadata.
- [ ] No public endpoint exposes private profile data.
- [ ] Rollback plan tested or documented.
- [ ] Deployment health checks and cost alerts configured where available.

**Evidence:** migration log, test reports, deployed environment URL only after approval, rollback note.

**Gate:** Separate written approval for production deployment and data use.

---

## 6. Feature-level execution contract

Every feature task must fit this template:

- **Feature ID / name:**
- **PRD requirements:**
- **Current phase:**
- **User value:**
- **In scope / out of scope:**
- **Data/source dependencies:**
- **Files/modules expected to change:**
- **Tests to write first:**
- **Acceptance criteria:**
- **Privacy/security checks:**
- **UI/accessibility checks:**
- **Verification commands and actual output:**
- **Rollback approach:**
- **Credit impact:** low / medium / high (IDE-reported actuals if available)

No feature enters implementation without a phase and acceptance criteria.

## 7. Credit budget policy

The current available Codebenders budget was reported by the product owner as approximately **16 million credits**. Treat this as a finite budget, not a target to consume.

- Do not estimate exact feature costs unless Nexen provides measurable usage data.
- Record actual credits before/after each meaningful task when visible.
- Prefer one lead agent and deterministic local scripts over many overlapping agents.
- Use mock AI until a remote call materially improves a feature.
- Batch source research and data validation; do not reprocess unchanged records.
- Cache embeddings and only rebuild changed content.
- Ask before bulk ingestion, long autonomous runs, large codebase rewrites or repeated remote inference.
- Stop optional P2 work when credit reserves become constrained; preserve P0, privacy and test gates.

## 8. Phase ledger checklist

For each phase, record:

- status and owner approval;
- tasks checked off;
- changed files;
- test commands and actual results;
- screenshots/logs/evidence paths;
- data/source verification details;
- privacy/security findings;
- known limitations and blockers;
- rollback/recovery option;
- next recommendation.

Use `agent/PHASE_LEDGER_TEMPLATE.md`. Never mark a phase approved on behalf of the product owner.
