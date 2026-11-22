# LabhSaathi — Product Requirements Document

**Product:** LabhSaathi  
**Tagline:** Know your benefits. Understand your rights. Take action.  
**Document status:** Baseline PRD for phased implementation  
**Version:** 1.0  
**Date:** 22 November 2026  
**Owner:** Product owner / hackathon team  
**Target build environment:** Codebenders Nexen IDE; local-first development  
**Future infrastructure target:** Cloudflare Workers, D1, R2, Vectorize, Workers AI, Queues and Workflows

---

## 1. Executive summary

LabhSaathi is an AI-assisted public-benefit discovery and claim-navigation platform. It helps people across India describe their circumstances in natural language, discover relevant public schemes, understand why they may or may not match the published conditions, prepare the required documents, follow verified application instructions, and track time-sensitive next steps.

LabhSaathi is intended as a **national, state-aware platform for people across India**. Users should be able to describe their situation and select their relevant state/jurisdiction; the product must not hard-code Telangana as the only supported location. To satisfy PS5's focus on one specific group in one state, the hackathon demonstration will centre on **low-income college students in Telangana**. The initial verified dataset will prioritise relevant Central Government schemes and Telangana State schemes for that cohort, while the data model, jurisdiction engine and coverage registry are designed for all Indian states. The interface must clearly disclose which states/categories have verified data and must never imply that a state is fully covered when it is not.

LabhSaathi is not a government portal, scheme approval authority, legal adviser, document issuer, or application-submission service. It provides sourced guidance and preparation support. All user-facing eligibility outcomes are non-authoritative guidance labels, not official decisions.

The product's differentiator is the connected claim journey rather than a generic chatbot: intake → source-grounded discovery → three-valued rule evaluation → evidence explanation → document readiness → official application guidance → calendar and follow-up. Its signature visual experience is one **Unified Eligibility Action Graph**, combining the previously separate Benefit Action Graph and Eligibility Explanation Graph.

## 2. Problem statement and source requirements

The ACE BUILDERS 2026 PS5 brief, *Citizens and Public Services — Claim What's Yours*, describes public schemes for scholarships, pensions, health cover, housing support and farm benefits. It identifies scattered information, difficult eligibility rules, unclear document requirements and dependence on middlemen as barriers to claiming benefits.

The brief asks teams to choose **one specific group in one state**. The product must:

1. Accept plain-language typed or spoken input; regional-language input is encouraged.
2. Match likely schemes and explain the rule behind each match.
3. Produce a personalised document checklist and step-by-step application guide.
4. Support deadline reminders and application tracking.
5. Link every scheme to its official source and show the last verification date.

The brief's guardrails are binding:

- Say **"likely eligible"**, never guarantee an outcome.
- Do not collect Aadhaar numbers or other sensitive identity details.
- Use publicly available scheme information.
- Store scheme rules as editable data because they change.
- Test with sample profiles only.

The brief also asks how the product handles users who do not know which details matter, how it remains accurate when rules change, and who might pay for the service. These questions are addressed in the adaptive intake, source/version controls and proposed institutional business model.

## 3. Product vision and positioning

### Vision

Make public-benefit information understandable and actionable for people who are least able to navigate fragmented government information systems.

### Product promise

A citizen should be able to explain their situation in ordinary language and leave with:

- a short list of potentially relevant schemes;
- an understandable explanation of matched, unmet and unknown conditions;
- a personalised, source-grounded checklist;
- official application instructions and fee information where verified;
- a trackable set of next actions and renewal reminders.

### Positioning

LabhSaathi is a **benefit-claim readiness and navigation platform**, not merely a scheme directory or conversational Q&A bot.

### Principles

1. Evidence before confidence.
2. Unknown is not the same as false.
3. Eligibility rules are deterministic and inspectable.
4. AI interprets and explains; it does not invent policy or make the final eligibility decision.
5. Minimise personal data and keep sensitive identifiers out of storage and AI providers.
6. Show official sources, dates and uncertainty.
7. Build one complete vertical journey before expanding breadth.
8. Local-first now; provider-based Cloudflare migration later.

## 4. Target users and scope

### Primary hackathon demonstration persona

A low-income college student studying in Telangana who may not know which education-related public schemes exist, which profile details matter, what documents are needed, or where to apply.

### Secondary pilot participants

- A parent or guardian helping the student understand requirements.
- A college scholarship-cell staff member assisting with guidance (institutional/assisted workflow is a future extension unless needed for a limited demo).

### Out of scope for the hackathon pilot

- A claim of complete coverage of all Indian schemes or every scheme in every state before the dataset has been verified.
- Government login, identity verification, application submission or status scraping behind authenticated government accounts.
- Collection or upload of real Aadhaar, PAN, bank, caste, disability or other sensitive identity documents.
- Automatic legal or government eligibility determinations.
- Full NGO multi-tenant case management.
- Full rejection appeal automation.
- Benefit Passport / identity wallet.
- Production-grade payment processing or paid CSR tenant billing.

### Geographic and population scope

The product is designed for citizens across India with state-aware jurisdiction handling. The hackathon demo focuses on low-income college students in Telangana for the hackathon demonstration; the product accepts users across India and reports actual data coverage transparently. Central schemes may be relevant across states; State schemes must be filtered by their actual jurisdiction, domicile/residence, institution and other conditions. The initial verified records prioritise the Telangana student demo, but the architecture and state selector must support all Indian states. Maintain a state/category coverage registry so an empty result can distinguish "no matching scheme found in covered data" from "coverage not yet verified". A scheme must not be included merely because it appears in a search result.

## 5. Goals and non-goals

### Goals

- Complete all five PS5 must-have capabilities in a coherent user journey.
- Provide explainable three-valued eligibility evaluation.
- Prevent sensitive identifiers from being stored, logged or sent to AI.
- Maintain source traceability and editable/versioned rule records.
- Make application steps, document readiness and renewals actionable.
- Demonstrate the product reliably using 5–6 synthetic student personas and golden tests.
- Create a maintainable local project with clean interfaces for future Cloudflare services.

### Non-goals

- Guaranteeing benefit receipt or government approval.
- Replacing official portals or government departments.
- Scraping or republishing sources contrary to their terms or access controls.
- Ingesting unverified scheme data and presenting it as authoritative.
- Building many autonomous agents that duplicate work or consume credits without measurable value.

## 6. User journeys

### Journey A — discover a scholarship

1. User opens the pilot experience and sees a short explanation of what LabhSaathi does and does not do.
2. User describes their situation in Telugu or English (typed first; speech can follow if reliable).
3. Sensitive-ID Shield inspects the text before persistence, logging or AI processing. If a pattern is detected, sensitive content is blocked/redacted and the user is told why.
4. Intake extracts only relevant, non-sensitive attributes and asks adaptive follow-up questions.
5. Every question includes a one-line "Why we ask this" explanation and an explicit "I don't know" answer.
6. Scheme discovery filters the currently verified national/state-aware dataset by user-selected jurisdiction, coverage status and relevant profile attributes.
7. The eligibility engine evaluates each applicable rule as true, false or unknown.
8. Results show one of the fixed likelihood labels and per-condition reasoning.
9. User opens a scheme and sees official source, last verified date, application link, verified fee status, scam warning and required documents.
10. User saves the scheme, completes checklist actions and sees application steps and calendar events.

### Journey B — not enough information

The system must not force the user to guess. Unknown attributes remain unknown. The result becomes "Need to confirm" when citizen information is missing. If scheme rules or authoritative evidence are incomplete, conflicting or stale, the result becomes "Can't tell yet". LabhSaathi explains the missing item and suggests how to verify it from an official source.

### Journey C — What-If simulation

1. User opens a simulated profile scenario.
2. User changes one non-sensitive attribute (for example, education year or a broad income band).
3. The same eligibility engine recalculates the same scheme-rule set.
4. The UI shows what changed, which rule caused it and whether a prior result moved between fixed labels.
5. The simulation is clearly labelled as hypothetical and does not update the user's saved profile unless the user explicitly chooses to do so.

### Journey D — renewal

A scheme with a verified renewal period and date/season can create an academic-year renewal item. The item shows the applicable academic year, verified deadline/source, renewal checklist and status. No generic scholarship deadline may be invented.

## 7. Functional requirements

Priority scale: **P0** required for the PS5 demonstration; **P1** high-value differentiator; **P2** later/future.

### 7.1 Conversational citizen intake

- **FR-INT-01 (P0):** Accept a short natural-language description.
- **FR-INT-02 (P0):** Extract only attributes needed by the pilot rules.
- **FR-INT-03 (P0):** Ask adaptive follow-up questions instead of showing a long static form.
- **FR-INT-04 (P0):** Provide a one-line "Why we ask this" explanation for each question.
- **FR-INT-05 (P0):** Every relevant question supports "I don't know" and stores `unknown`, not `false`.
- **FR-INT-06 (P1):** Telugu and English interaction with plain-language explanations.
- **FR-INT-07 (P1):** Voice input after typed intake is reliable.
- **FR-INT-08 (P0):** Allow users to review and correct extracted profile attributes before matching.

### 7.2 Sensitive-ID Shield and privacy

- **FR-SEC-01 (P0):** Inspect user-entered text at the client boundary before any persistence or AI request.
- **FR-SEC-02 (P0):** Repeat inspection at the backend boundary; never trust client-only filtering.
- **FR-SEC-03 (P0):** Detect Aadhaar-like 12-digit patterns, PAN-like patterns and configurable sensitive identifier patterns.
- **FR-SEC-04 (P0):** Block or redact matched content before it reaches storage, logs, analytics, error reports or AI providers.
- **FR-SEC-05 (P0):** Display a short explanation and invite the user to restate the situation without the identifier.
- **FR-SEC-06 (P0):** Do not provide an input field requesting Aadhaar/PAN or sensitive ID numbers.
- **FR-SEC-07 (P0):** Do not retain the raw blocked value, including in diagnostic output.
- **FR-SEC-08 (P0):** WhatsApp share content must exclude sensitive details.
- **FR-SEC-09 (P0):** Use synthetic profiles only during the hackathon.
- **FR-SEC-10 (P1):** Provide a privacy panel explaining collected attributes, purpose, retention and deletion controls.

Detection is pattern-based prevention, not identity verification. False positives are possible (for example, a 12-digit number unrelated to Aadhaar). The UI should explain that the pattern resembles a sensitive identifier without asserting that it is genuine.

### 7.3 Scheme data and provenance

- **FR-DATA-01 (P0):** Store schemes as structured editable records.
- **FR-DATA-02 (P0):** Store jurisdiction: Central/State/district as applicable.
- **FR-DATA-03 (P0):** Store one or more official sources for every published scheme.
- **FR-DATA-04 (P0):** Store last-verified date, source department, rule version and verification status.
- **FR-DATA-05 (P0):** Preserve prior rule versions and effective dates.
- **FR-DATA-06 (P0):** Keep extracted source text/document reference separate from approved structured rules.
- **FR-DATA-07 (P0):** Unreviewed AI extraction cannot become an active eligibility rule.
- **FR-DATA-08 (P1):** Add duplicate detection and record completeness validation.
- **FR-DATA-09 (P1):** Add source conflict and stale-source queues.
- **FR-DATA-10 (P1):** Add ingestion audit history.
- **FR-DATA-11 (P1):** Maintain a state/category data-coverage registry (covered, partial, not yet verified) so users can see where scheme records have been reviewed.

### 7.4 Discovery and search

- **FR-SEARCH-01 (P0):** Filter by user-selected Indian jurisdiction, supported data coverage, category and known citizen attributes.
- **FR-SEARCH-02 (P0):** Search using natural-language situation descriptions.
- **FR-SEARCH-03 (P0):** Keep eligibility evaluation separate from semantic relevance ranking.
- **FR-SEARCH-04 (P0):** Never allow a vector similarity score to determine eligibility.
- **FR-SEARCH-05 (P1):** Provide scheme comparison and category filters.
- **FR-SEARCH-06 (P1):** Provide Near-Match Discovery using the same three-valued rules engine.
- **FR-SEARCH-07 (P1):** Support any Indian state selection and show coverage status; distinguish no match in verified coverage from insufficient state data.

### 7.5 Three-valued eligibility engine and fixed labels

- **FR-ELIG-01 (P0):** Every rule predicate returns `true`, `false` or `unknown`.
- **FR-ELIG-02 (P0):** Implement documented three-valued operators including AND, OR and NOT.
- **FR-ELIG-03 (P0):** Support mandatory, optional and alternative conditions only where source rules support them.
- **FR-ELIG-04 (P0):** Retain a per-condition trace: rule, input attribute, value state, evaluation, source and explanation.
- **FR-ELIG-05 (P0):** Support explicit `I don't know` answers.
- **FR-ELIG-06 (P0):** Use exactly four citizen-facing labels: `Likely eligible`, `Need to confirm`, `Unlikely`, `Can't tell yet`.
- **FR-ELIG-07 (P0):** Never display a bare `eligible`, `guaranteed` or `approved` as a result.
- **FR-ELIG-08 (P0):** Map unknown citizen attributes to `Need to confirm` when source/rules are trustworthy.
- **FR-ELIG-09 (P0):** Map unverified, conflicting, stale or unsupported rules to `Can't tell yet`.
- **FR-ELIG-10 (P0):** Map a failed mandatory condition to `Unlikely`, with the failing rule disclosed.
- **FR-ELIG-11 (P0):** Use `Likely eligible` only when all required conditions evaluate true against sufficiently verified, current rules.
- **FR-ELIG-12 (P0):** Add automated tests rejecting forbidden status wording in UI strings and API payloads.
- **FR-ELIG-13 (P1):** Near-Match and What-If must call this same engine; no duplicated evaluation logic.

Suggested result precedence: if evidence/rule integrity is insufficient, return `Can't tell yet`; otherwise if a mandatory condition is false, return `Unlikely`; otherwise if any required profile fact is unknown, return `Need to confirm`; otherwise return `Likely eligible`. Document and test precedence for mixed unknown/false cases.

### 7.6 Documents and application guidance

- **FR-DOC-01 (P0):** Generate a personalised checklist from approved scheme records and applicable conditions.
- **FR-DOC-02 (P0):** Distinguish mandatory, conditional and optional documents.
- **FR-DOC-03 (P0):** Explain why each document is needed and provide acquisition guidance only when sourced.
- **FR-DOC-04 (P0):** Show step-by-step application instructions.
- **FR-DOC-05 (P0):** Link to the official application portal.
- **FR-DOC-06 (P0):** Do not invent document alternatives or steps.
- **FR-DOC-07 (P1):** Printable summary and checklist.

### 7.7 Middleman Shield and fee transparency

- **FR-TRUST-01 (P0):** Every scheme page displays an official source and official application link when available.
- **FR-TRUST-02 (P0):** Show "Official application is free" only when an authoritative source confirms zero application fee.
- **FR-TRUST-03 (P0):** If an official fee exists, show the verified amount/description and source.
- **FR-TRUST-04 (P0):** If fee information is unavailable, display "Fee information not verified".
- **FR-TRUST-05 (P0):** Show a scam warning about unofficial agents promising guaranteed benefits or demanding unauthorised charges.
- **FR-TRUST-06 (P0):** Explain that LabhSaathi is independent and cannot approve or accelerate government applications.

### 7.8 Claim tracking, deadlines and academic-year renewal

- **FR-TRACK-01 (P0):** Allow a user to save a scheme to a personal action list.
- **FR-TRACK-02 (P0):** Track preparation/application/follow-up status using clear stages.
- **FR-TRACK-03 (P0):** Display deadline reminders where a verified date exists.
- **FR-TRACK-04 (P0):** Store source and verification date alongside each deadline.
- **FR-TRACK-05 (P1):** Academic-year renewal calendar for applicable scholarships.
- **FR-TRACK-06 (P1):** Store applicable academic year, renewal requirements, verified renewal date/window and status.
- **FR-TRACK-07 (P1):** If no verified deadline exists, show "Deadline not verified" rather than inventing one.
- **FR-TRACK-08 (P1):** Local notification/reminder simulation first; production delivery provider later.

### 7.9 WhatsApp sharing

- **FR-SHARE-01 (P1):** Generate a `https://wa.me/?text=` share URL with URL-encoded checklist text.
- **FR-SHARE-02 (P1):** Show a preview and require the user's action before opening WhatsApp.
- **FR-SHARE-03 (P1):** Include only scheme name, public instructions, checklist items and official link.
- **FR-SHARE-04 (P0):** Exclude personal profile details and all sensitive identifiers.
- **FR-SHARE-05 (P1):** Do not require WhatsApp Business API or send messages automatically.

### 7.10 Unified Eligibility Action Graph

- **FR-GRAPH-01 (P1):** Merge Benefit Action Graph and Eligibility Explanation Graph into one component.
- **FR-GRAPH-02 (P1):** Connect Citizen Profile → Scheme → Eligibility Conditions → Documents → Application → Follow-up.
- **FR-GRAPH-03 (P1):** Show satisfied, not satisfied, unknown and action-pending node states.
- **FR-GRAPH-04 (P1):** Clicking a condition reveals the exact rule, evaluated state, source and explanation.
- **FR-GRAPH-05 (P1):** Graph is a visualisation of the canonical engine/workflow state, never an independent source of truth.

### 7.11 What-If and Scheme Change Radar

- **FR-SIM-01 (P1):** Support non-sensitive hypothetical profile changes.
- **FR-SIM-02 (P1):** Reuse the canonical three-valued eligibility engine.
- **FR-SIM-03 (P1):** Show before/after label and changed predicates.
- **FR-SIM-04 (P1):** Mark results as hypothetical; do not update the saved profile implicitly.
- **FR-RADAR-01 (P1):** Compare new and prior source/rule versions.
- **FR-RADAR-02 (P1):** Flag affected schemes and prior match results for reassessment.
- **FR-RADAR-03 (P1):** For the demo, use controlled sample source/rule changes; do not claim live government monitoring unless implemented and verified.

### 7.12 Admin, analytics and future institutional products

- **FR-ADMIN-01 (P1):** Admin review queue for scheme records, sources, rules and fee data.
- **FR-ADMIN-02 (P1):** Show missing fields, stale sources, conflicts and unreviewed extraction.
- **FR-ADMIN-03 (P1):** Audit changes to published scheme rules.
- **FR-BIZ-01 (P2):** Proposed business model: free core citizen service; colleges' scholarship cells, NGOs and CSR programmes may fund institutional tools.
- **FR-BIZ-02 (P2):** CSR dashboard is a proposed paid product; do not present it as implemented unless built.
- **FR-BIZ-03 (P2):** Aggregate reporting must avoid identifying citizens or exposing small cohorts.

## 8. Non-functional requirements

### Security and privacy

- Sensitive-ID inspection at client and server boundaries.
- Do not log raw user message bodies by default.
- Do not include profile content in analytics/error telemetry unless explicitly scrubbed and necessary.
- Store only the minimum profile attributes necessary for matching.
- Keep personal profile data separate from public scheme indexes/embeddings.
- Use sample profiles only for the hackathon demo.
- Validate and encode share text; do not include personal attributes.
- Never expose secrets in source code or browser bundles.

### Reliability and correctness

- All eligibility outcomes must be reproducible from saved rule version + input state.
- Every displayed scheme must have source provenance.
- Every published date/fee/requirement must have a source and verification status.
- Rule evaluation must be unit-tested independently of AI.
- No success state without a successful operation.

### Usability and accessibility

- Mobile-first responsive design.
- Readable language, clear status labels and visible uncertainty.
- Keyboard accessible core flows.
- Strong contrast and sensible touch targets.
- Avoid requiring technical or legal vocabulary.
- Provide a correction path for AI-extracted profile facts.

### Performance

- Prioritise responsive local search and deterministic rule evaluation.
- Cache public scheme data safely; never confuse cached values with current verification.
- Avoid repeated AI calls for deterministic calculations.
- Lazy-load non-critical graph/admin features.

### Maintainability

- Modular feature boundaries.
- Typed data contracts and validated schemas.
- Versioned database migrations.
- Automated unit, integration and end-to-end smoke tests.
- Replaceable infrastructure adapters.

## 9. Proposed architecture

The agent must first inspect the existing workspace and respect the available stack. If no meaningful app exists, the default reference architecture is:

- Frontend: React + TypeScript (or the workspace's compatible existing frontend).
- API: modular TypeScript API; Hono is an option if compatible.
- Local database: SQLite/local D1 simulation behind a repository interface.
- File storage: local filesystem adapter for public source snapshots/fixtures.
- Search: deterministic database filters + full-text/keyword search initially; semantic search later.
- AI: provider interface with deterministic mock/local adapter during initial work.
- Jobs: local task runner for ingestion/renewal simulations.

### Provider interfaces

Define replaceable interfaces for:

- `SchemeRepository`
- `ProfileRepository`
- `EvidenceStore`
- `FileStorageProvider`
- `SearchProvider`
- `LanguageModelProvider`
- `EmbeddingProvider`
- `ReminderScheduler`
- `AuditLogProvider`

### Future Cloudflare mapping

| Capability | Local-first adapter | Future Cloudflare adapter |
|---|---|---|
| API/runtime | Local server/dev runtime | Workers |
| Relational data | SQLite or local D1 simulation | D1 |
| Public files/source snapshots | Local filesystem | R2 |
| Semantic retrieval | Local keyword/full-text search | Vectorize + D1 filters |
| AI and embeddings | Mock/local/selected provider | Workers AI or selected provider |
| Background ingestion | Local task runner | Queues / Workflows |
| Scheduled checks/reminders | Local scheduler simulation | Cron Triggers / Workflows |

No Cloudflare account resource should be created during initial phases. Migration is a later, separately approved phase after local tests pass.

## 10. Data model (logical)

Core entities:

- `schemes`: stable identity, name, summary, category, benefit description, status.
- `scheme_jurisdictions`: central/state/district scope and applicable geography.
- `scheme_versions`: version, effective dates, publication date, source state, review state.
- `eligibility_rules`: structured rule tree, rule type, required/alternative semantics, source reference.
- `required_documents`: document type, conditional rule, instructions and source.
- `application_steps`: ordered instructions, destination URL, source and applicability.
- `sources`: official source URL, department, source type, checked timestamp, content hash/reference.
- `coverage_registry`: state, scheme category, coverage status, last-reviewed date and reviewer/source notes.
- `fees`: fee status (`free_verified`, `fee_verified`, `unknown`), description, source and checked date.
- `source_changes`: old/new source versions, detected change, review state.
- `synthetic_profiles`: fictional profile fixtures and test tags.
- `eligibility_runs`: profile fixture, scheme version, engine version, evaluated timestamp, label.
- `eligibility_predicates`: predicate trace and true/false/unknown outcomes.
- `saved_schemes`: saved opportunity and user-facing state.
- `claim_tasks`: checklist/application/follow-up task with due-date provenance.
- `academic_years`: academic-year label and date boundaries for a given institution/context where supplied.
- `renewal_events`: scheme-specific renewal period, verified date/source, state.
- `audit_events`: non-sensitive administrative change history.

Do not add columns for Aadhaar, PAN, bank account, full document images or other sensitive identifiers.

## 11. Rule engine specification

### Predicate values

- `true`: evidence supports the condition.
- `false`: evidence supports that the condition is not met.
- `unknown`: missing, ambiguous or user-selected "I don't know".

### Core logic

For AND: any false → false; all true → true; otherwise unknown.  
For OR: any true → true; all false → false; otherwise unknown.  
For NOT: true ↔ false; unknown remains unknown.

Only encode alternative rules, exceptions and exclusions when the official source actually supports their logical meaning. Do not infer a new rule structure from informal prose without review.

### Result labels

- `Likely eligible`: all required predicates pass and source/rule integrity is sufficient.
- `Need to confirm`: one or more required citizen attributes are unknown while source/rule integrity is sufficient.
- `Unlikely`: at least one verified mandatory predicate fails.
- `Can't tell yet`: source/rule is missing, outdated, disputed, unsupported or insufficiently structured to safely evaluate.

Use a stable internal enum and a central display-label mapping. Add tests that scan UI strings and API responses for forbidden result wording such as bare "eligible", "guaranteed" or "approved".

## 12. Data acquisition and governance

### Source priority

1. Official Central Government ministry/department/portal source.
2. Official Telangana Government department/portal source.
3. Official institution/authority source where the scheme delegates application guidance.
4. Supporting sources may help discover records but cannot alone establish active eligibility rules.

### Ingestion workflow

Discover → capture source URL/date → extract candidate fields → normalise → validate schema → human review → publish approved version → index → periodically recheck.

Respect site terms, robots/access requirements, rate limits and copyright restrictions. Prefer official APIs, public datasets and permitted downloads. Do not bypass logins, CAPTCHAs, access controls or anti-bot systems. Store links and necessary structured facts; do not republish entire documents without permission.

### Source freshness

Each source record must include:

- canonical URL;
- department/issuer;
- scheme/version association;
- source document type;
- date checked;
- publication/effective date if available;
- content hash or archived snapshot reference where permissible;
- verification status;
- reviewer/review note if manually reviewed.

An outdated or conflicting source must prevent a confident label until reviewed.

## 13. Synthetic test personas and golden fixtures

Create six synthetic student personas. Use fictional values and fictional fixture schemes unless a real scheme's rules have been independently verified.

1. **Persona A — complete known profile:** all mandatory fixture conditions true → `Likely eligible`.
2. **Persona B — income unknown:** all known conditions pass, income is unknown → `Need to confirm`.
3. **Persona C — mandatory condition false:** a verified mandatory fixture rule fails → `Unlikely`.
4. **Persona D — jurisdiction uncertainty:** domicile/residence/institution jurisdiction cannot be resolved → `Need to confirm` if the rule is trusted and the citizen fact is unknown; otherwise `Can't tell yet` if the scheme rule itself is unclear.
5. **Persona E — incomplete education details:** one or more required facts unknown → `Need to confirm`.
6. **Persona F — source conflict/stale rule:** profile data may fit, but rule evidence is not trustworthy → `Can't tell yet`.

Golden tests assert per-predicate states, final labels, visible reasons, source references, no sensitive values in side effects, and no forbidden wording. These fixtures are for test correctness, not claims about actual benefit eligibility.

## 14. UX and screen inventory

P0 screens:

1. Landing / explain LabhSaathi.
2. Conversational intake.
3. Review extracted profile attributes.
4. Scheme results with fixed likelihood labels and source freshness.
5. Scheme detail with condition-by-condition reasoning, fee status, scam warning and official portal.
6. Personalised document checklist.
7. Application steps.
8. Saved schemes / claim tracker / reminders.
9. Minimal admin scheme review/source verification panel.

P1 screens/components:

10. Unified Eligibility Action Graph.
11. What-If simulator.
12. Scheme Change Radar.
13. Academic-year renewal calendar.
14. WhatsApp checklist preview/share.
15. Demo persona switcher (clearly marked demo-only).

P2 screens:

16. NGO caseworker dashboard.
17. Rejection recovery workspace.
18. Benefit Passport.
19. CSR impact dashboard.

## 15. Success metrics and acceptance targets

Hackathon acceptance targets (not public impact claims):

- 100% of five PS5 requirements mapped to at least one implemented and tested journey.
- 100% of displayed pilot schemes have an official source and a visible last-verified date or a visible unverified warning.
- 100% of active rules have an approved source reference and version.
- 100% of six golden personas return expected predicate traces and labels.
- 100% of sensitive-ID test inputs are blocked/redacted before persistence/logging/AI-provider invocation.
- 0 result-label test failures for forbidden terms.
- 0 undocumented invented fees/deadlines/documents in the demo dataset.
- Core journey completes on desktop and mobile viewport sizes.
- All critical automated tests pass before a phase gate is signed off.

Do not present internal fixture pass rates as real-world eligibility accuracy.

## 16. Risks and mitigations

| Risk | Mitigation |
|---|---|
| Outdated or conflicting government information | Store versions and source freshness; downgrade to `Can't tell yet`; review before publishing. |
| LLM invents a rule or deadline | Deterministic engine; AI only extracts candidate data; human approval required. |
| Sensitive ID enters logs or AI | Client + server input boundary filters; avoid request-body logging; negative tests. |
| Unclear state/domicile conditions | Represent jurisdiction predicates explicitly; retain unknown; explain what needs confirmation. |
| Scope grows beyond hackathon | Phase gates, P0/P1/P2 priorities, one complete pilot cohort. |
| Credit exhaustion | Small tasks, no large autonomous loops, mock external calls, report credit usage at each gate. |
| Cloudflare migration becomes rewrite | Provider interfaces and portable migrations; defer remote provisioning. |
| False "free application" claim | Fee enum with source-backed proof; display unknown when unverified. |
| Overlapping/combined benefits incorrectly suggested | Only encode documented compatibility/exclusion conditions. |
| WhatsApp share exposes profile details | Safe allow-list of share fields; preview confirmation; no personal profile by default. |

## 17. Phased delivery plan

The authoritative phase sequencing and gate requirements are in `PHASE_CONTROL.md` and the companion PDF. Phases should proceed in this order:

0. Harness/workspace audit and requirement baseline.
1. Design system and application shell.
2. Privacy boundary and Sensitive-ID Shield.
3. Scheme data foundation and source governance.
4. Conversational intake and profile review.
5. Three-valued eligibility engine and golden tests.
6. Scheme discovery, fixed labels and Near-Match.
7. Documents, application guidance and Middleman Shield.
8. Claim tracker, academic-year renewal and WhatsApp sharing.
9. Unified Eligibility Action Graph.
10. What-If simulator and Scheme Change Radar.
11. Demo hardening, accessibility, security and acceptance.
12. **P12 — Cloudflare migration** (post-local acceptance; separately approved).

A phase is not complete because code was generated. It is complete only when its acceptance criteria pass, evidence is recorded, the owner reviews the result and explicitly approves the next phase.

## 18. Business model hypothesis

The citizen-facing discovery and guidance experience remains free. Potential funding/customer segments:

- colleges' scholarship cells that need student guidance workflows and aggregate operational reporting;
- NGOs and community organisations assisting beneficiaries;
- CSR programmes seeking privacy-preserving aggregate impact reports;
- potentially public institutions in a later validated procurement model.

The CSR impact dashboard is a proposed institutional product, not a required citizen feature or a claim of existing customer demand. Any impact reporting must be aggregated, privacy-preserving and clear about its methodology.

## 19. Open decisions for Phase 0

The lead agent must inspect the workspace and produce recommendations instead of guessing:

- existing frontend/backend stack and whether a project already exists;
- supported Nexen tool names and available shell/test commands;
- whether local D1 simulation or SQLite is the better initial persistence option;
- source ingestion method permitted by Codebenders and target sites;
- initial verified Central + Telangana scheme shortlist for the student demo, plus state/category coverage metadata;
- actual deadline/renewal fields available from official sources;
- which language capabilities can be demonstrated reliably within the available credit budget.

## 20. Definition of product truth

LabhSaathi may say it found a relevant scheme, a rule matched, a document appears required, or an application step is listed **only when its stored evidence supports that statement**. It must not claim a citizen has been approved, that an application was submitted, that a fee is zero, or that a deadline is current unless the corresponding fact is verified. Uncertainty must be visible, actionable and understandable.
