from pathlib import Path
import json, textwrap
root = Path('/mnt/data/LabhSaathi_Agent_Harness')
skills = {}

def add(name, desc, body):
    skills[name] = (desc, textwrap.dedent(body).strip())

add('product-discovery', 'Use before proposing or changing a LabhSaathi feature to clarify user problem, PS5 fit, scope, assumptions and measurable outcomes.', '''
## Purpose
Turn an ambiguous request into an agreed product decision before implementation. LabhSaathi is a public-benefit navigation product, not a generic chatbot.

## Workflow
1. Read the relevant PRD section and current phase scope.
2. Identify the user, situation, job-to-be-done, current failure and desired outcome.
3. Map the request to PS5 requirements: plain-language input; explainable matching; checklist and application steps; reminders/tracking; official source and last-verified date.
4. Identify whether the request is P0, P1 or P2. Do not promote a future feature into the active phase without owner approval.
5. Write assumptions explicitly. Distinguish confirmed PS5 statements, product decisions and hypotheses.
6. Define one measurable user outcome and acceptance criteria.
7. Identify dependencies, data sources, privacy implications, failure states and excluded scope.
8. Present a short design note and wait for owner approval if the change alters product scope, data collection, external services or phase order.

## Required output
- User problem and intended outcome.
- PS5/PRD requirement mapping.
- Proposed solution and why it is preferable to a simpler option.
- In-scope and out-of-scope behaviour.
- Data/source dependencies.
- Privacy and accessibility implications.
- Acceptance criteria and risks.
- Phase recommendation.

## LabhSaathi constraints
- Never define success as "the AI answered"; define a citizen task completed or clarified.
- Preserve one-state/one-population hackathon pilot: low-income college students in Telangana.
- The future national architecture is not permission to claim nationwide coverage now.
- Do not assume an official scheme rule, fee, portal or deadline. Mark unknowns for research/review.

## Do not
- Jump directly into code.
- Expand scope because a feature sounds impressive.
- convert a user idea into a guaranteed eligibility or application claim.
- invent stakeholder research, user counts or measured impact.

## Completion check
A developer can implement the feature without having to guess the product outcome, boundaries or acceptance test.''')

add('ps5-requirements-guardian', 'Use during planning, implementation and review to ensure LabhSaathi remains compliant with the ACE BUILDERS 2026 PS5 brief and its guardrails.', '''
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
If an implementation conflicts with PS5, stop the phase and raise a blocking issue. Do not hide a gap with a UI label or unsupported claim.''')

add('phase-gate-controller', 'Use at phase start, checkpoint and completion to enforce one-phase-at-a-time delivery, owner approval and evidence-based gates.', '''
## Purpose
Keep implementation phase-by-phase and feature-by-feature. The product owner, not the agent, approves phase transitions.

## Workflow
1. Read the current phase from `PHASE_CONTROL.md` and the phase ledger.
2. Confirm the previous phase is `APPROVED` and only one phase is `IN_PROGRESS`.
3. Confirm scope, prerequisites, tasks, acceptance criteria and explicit exclusions.
4. If no approval exists, perform planning/reporting only; do not implement.
5. During the phase, reject unrelated scope and add it to the backlog.
6. At the end, collect test output, screenshots, source register updates, changed-file list, privacy review and known limitations.
7. Set `DONE_PENDING_APPROVAL`; present a concise gate report.
8. Wait for explicit owner approval before the next phase.

## State semantics
- `NOT_STARTED`: no work.
- `IN_PROGRESS`: explicitly approved work.
- `BLOCKED`: missing source, permission, fact or capability.
- `DONE_PENDING_APPROVAL`: technical evidence is complete; owner decision pending.
- `APPROVED`: owner accepted the gate.

## Gate report
- Phase and objective.
- Completed tasks.
- Acceptance criterion-by-criterion status.
- Exact verification commands and actual results.
- Changed files.
- Open defects and limitations.
- Privacy/data/source findings.
- Credit usage if actually exposed by Nexen.
- Recommendation: approve, fix or block.

## Do not
- Auto-advance after tests pass.
- Mark a failed criterion as passed because a workaround exists.
- Start two phases concurrently.
- Treat code generation or screen rendering as acceptance proof.

## Completion check
The phase ledger is complete and the product owner has made an explicit decision.''')

add('implementation-planning', 'Use after an approved design to break a LabhSaathi feature into small, verifiable tasks with exact files, tests and rollback notes.', '''
## Purpose
Produce an implementation plan that another coding agent can follow without guessing.

## Planning procedure
1. Read PRD, active phase and relevant skill/reference files.
2. Inspect existing architecture, naming patterns and tests before proposing file changes.
3. State the feature goal and non-goals.
4. Identify dependencies and data contracts.
5. Split work into small sequential tasks. Each task should change one coherent behavior and have a checkable result.
6. For behavior changes, put tests before implementation in the task sequence.
7. Name likely files/modules, but verify paths against the workspace.
8. Include migration/compatibility impact and failure states.
9. Specify test, typecheck, lint, build and manual verification commands that actually exist.
10. Add rollback or safe-disable strategy.

## Plan header
- Goal
- Architecture
- Tech stack observed
- PRD/phase reference
- Global constraints
- Assumptions
- Risks

## Task format
For each task specify: action, files, expected behavior, test-first step, implementation step, verification command and completion evidence.

## LabhSaathi-specific checks
- Include Sensitive-ID Shield impacts whenever text input, persistence, logs, analytics, share or AI provider code is touched.
- Include rule/source version and unknown-state behavior whenever eligibility or scheme data is touched.
- Reuse canonical eligibility service for Near-Match and What-If.
- No Cloudflare remote resources in local phases.

## Keep plans economical
Prefer the simplest implementation that satisfies the approved requirement. Do not introduce a new dependency or additional agent unless the benefit is clear and approved.''')

add('test-driven-development', 'Use for every behavior change in LabhSaathi, especially eligibility, privacy filtering, source handling, sharing and workflow state.', '''
## Purpose
Use a disciplined red-green-refactor loop so public-benefit guidance is testable and regressions are caught early.

## Procedure
1. Pick one acceptance criterion.
2. Write the smallest test that demonstrates the required behavior.
3. Run it and confirm it fails for the expected reason (RED).
4. Implement the smallest code change that makes it pass (GREEN).
5. Run the focused test, then relevant neighboring tests.
6. Refactor without changing behavior.
7. Run typecheck/lint/build where available.
8. Record actual command output in the phase ledger.

## High-priority LabhSaathi test areas
- Three-valued AND/OR/NOT semantics.
- Exact fixed likelihood labels and forbidden wording.
- Mixed false/unknown rule precedence.
- Sensitive ID rejected before storage/logger/AI mock receives data.
- Source status and stale/conflicting rule handling.
- Fee status and conditional "Official application is free" display.
- Deadline unknown state; no fabricated date.
- WhatsApp share allow-list and personal-data exclusion.
- What-If and Near-Match reuse the same eligibility engine.
- Academic-year renewal source/date provenance.

## Test quality
Prefer meaningful assertions on behavior and side effects. Avoid tests that merely assert implementation details or snapshot a large unstable UI. Use synthetic fixtures only.

## Do not
- Write implementation first and add a superficial test afterward.
- Mock the exact function being tested so no real logic runs.
- make a test pass by weakening the acceptance criterion.
- claim a test passed without running it.

## Completion check
The failing-before/passing-after behavior is recorded and adjacent regressions are checked.''')

add('systematic-debugging', 'Use when LabhSaathi behavior, tests, local services or build steps fail; diagnose the root cause before editing.', '''
## Purpose
Replace guess-and-patch debugging with evidence-led diagnosis.

## Four-stage workflow
1. **Reproduce:** Capture exact steps, inputs (synthetic only), command, expected and actual behavior.
2. **Localise:** Inspect logs/stack traces without exposing sensitive values; isolate the failing layer (UI, API, adapter, data, rule engine, provider, build tooling).
3. **Hypothesise:** List the smallest plausible causes and choose a test that distinguishes them.
4. **Fix and prevent:** Correct the root cause, add a regression test, rerun focused and full relevant checks.

## LabhSaathi safety during debugging
- Never paste raw Aadhaar/PAN-like strings into logs, issue titles, test failure messages or AI debugging prompts.
- Use redacted fixtures such as `[SENSITIVE_IDENTIFIER_REDACTED]`.
- If a rule result is wrong, inspect input state, rule tree, scheme version, source status and evaluator trace separately.
- If a result label is wrong, inspect the central status mapping rather than patching a single screen.
- If a date is wrong, inspect timezone, academic-year source, effective date and deadline provenance.

## Required report
Reproduction, evidence, root cause, minimal fix, regression test, verification output and any remaining uncertainty.

## Do not
- Make multiple unrelated edits before reproducing.
- Silence exceptions or hide failed requests.
- change verified scheme rules to fit a test expectation.
- use production personal data for a debugging reproduction.''')

add('verification-before-completion', 'Use before reporting any LabhSaathi task, feature or phase as complete; verify claims against actual runtime and test evidence.', '''
## Purpose
Prevent unsupported completion claims. A generated file, successful edit or green-looking UI is not enough.

## Verification checklist
1. Identify the exact acceptance criteria for the task.
2. Run the focused test(s).
3. Run relevant regression tests.
4. Run typecheck/lint/build using actual project scripts where available.
5. Start the local app and exercise the real flow when UI/API behavior changed.
6. Inspect browser/terminal errors and network/storage side effects.
7. For data-driven features, inspect a representative stored record and source/version trace.
8. For privacy features, prove the raw test value did not reach persistence, logs, analytics or provider mocks.
9. For eligibility, verify each predicate trace and the fixed result label.
10. Record exact commands and outcomes; clearly state anything not tested.

## Language discipline
Say "verified by test X" only if test X was run. Say "not tested" when not tested. Distinguish mocked behavior from a live external integration. Never present synthetic demo data as real public impact.

## LabhSaathi release blockers
- Any critical P0 test failure.
- Sensitive identifier leakage.
- Unsupported scheme source or rule.
- An incorrect/confident eligibility label.
- Unsupported "free" fee statement or invented deadline.
- Broken official application link.
- Share payload exposing personal profile information.

## Completion report
List acceptance criteria, verification commands/results, manual flows exercised, changed files, known limitations and blockers.''')

add('code-review', 'Use after each meaningful implementation slice and before a phase gate to inspect correctness, safety, maintainability and scope compliance.', '''
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
Block phase approval for unresolved critical privacy, eligibility, source-truth or P0 regressions. Distinguish non-blocking polish from correctness defects.''')

add('local-first-architecture', 'Use when designing or changing persistence, backend, file storage, search, AI and scheduling so LabhSaathi works locally and can later move to Cloudflare.', '''
## Purpose
Keep domain logic independent from infrastructure and avoid a future rewrite.

## Workflow
1. Inspect current stack and reuse it unless a clear constraint requires change.
2. Identify domain services vs provider-specific adapters.
3. Define interfaces for database repositories, file storage, search, AI/embeddings, scheduling and audit.
4. Implement local adapters first (SQLite/local D1 simulation, local filesystem, keyword search, mock AI and local task runner as appropriate).
5. Keep configuration in environment files; never commit secrets.
6. Write adapter contract tests so local and future Cloudflare implementations satisfy the same behavior.
7. Document data export/import and migration requirements.

## Architecture boundaries
- Eligibility engine must be deterministic and provider-independent.
- Scheme/source records must not depend on vector search availability.
- AI must be a replaceable provider and must receive only scrubbed/minimised data.
- Reminders must store due-date provenance separately from delivery provider.
- File references must be abstract object keys/metadata, not hard-coded machine paths.

## Cloudflare mapping (later phase)
- API/runtime: Workers.
- Relational storage: D1.
- Public source documents/snapshots: R2, subject to source terms.
- Semantic retrieval: Vectorize plus D1 structured filters.
- AI/embeddings: Workers AI or another approved provider.
- Background ingestion: Queues/Workflows only when justified.
- Scheduled refresh/reminders: Cron/Workflows where appropriate.

## Do not
- Provision remote Cloudflare resources during local phases.
- Make the app require Supabase/Firebase.
- use vector similarity as an eligibility decision.
- couple business logic to Workers globals or D1 SQL details.
- pretend local AI is available if the chosen binding calls a remote service.''')

add('data-modeling-migrations', 'Use when creating or changing LabhSaathi schemas, migrations, indexes, repository contracts or data lifecycle rules.', '''
## Workflow
1. Start from the PRD logical model and inspect the existing database.
2. Identify entities, ownership, cardinality, lifecycle and retention needs.
3. Model scheme identity separately from scheme versions and source revisions.
4. Model eligibility rules as validated structured data with explicit operators and condition grouping.
5. Keep public scheme data separate from citizen profile/claim data.
6. Keep public source references separate from extracted candidate text and approved rules.
7. Add migrations that can be applied from a clean database and tested incrementally.
8. Add indexes for actual filter/search patterns; avoid premature over-indexing.
9. Add constraints and validation at boundaries.
10. Write upgrade, rollback/export and seed-data instructions.

## Required entities
At minimum: schemes, jurisdictions, scheme_versions, eligibility_rules, required_documents, application_steps, sources, fees, source_changes, synthetic_profiles, eligibility_runs, eligibility_predicates, saved_schemes, claim_tasks, academic_years, renewal_events and audit_events.

## Data rules
- Never create Aadhaar/PAN columns or store identity-document images.
- Every active rule points to a scheme version and source evidence.
- Record verification/effective dates and status explicitly.
- Store enum values as stable machine values; map to human labels in one place.
- Unknown values must be representable without sentinel strings that can be confused with real values.
- Avoid persisting raw chat transcripts unless a clear purpose, consent and retention rule is approved.

## Migration acceptance
Fresh install, upgrade path, rollback/recovery note, schema validation, repository tests and fixture compatibility must pass.''')

add('scheme-data-curation', 'Use when discovering, extracting, normalising, reviewing or importing public scheme information for the Telangana student pilot.', '''
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
Return a scheme record, evidence register, validation result, review gaps and recommended state. Include a source-backed statement for each eligibility/document/fee/deadline field.''')

add('source-verification-versioning', 'Use when reviewing official source quality, freshness, conflicts, scheme changes, last-verified dates or active rule versions.', '''
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
- mark a source verified merely because its URL loads.''')

add('eligibility-engine', 'Use when implementing or changing LabhSaathi eligibility rules, fixed labels, Near-Match, What-If or predicate explanations.', '''
## Purpose
Make eligibility reproducible, inspectable and conservative. This is the only authoritative rule evaluation engine.

## Three-valued domain
Each predicate evaluates to exactly one of:
- `true`: available evidence satisfies the condition.
- `false`: available evidence establishes the condition is not satisfied.
- `unknown`: missing, ambiguous or explicitly "I don't know".

AND: any false → false; all true → true; otherwise unknown.  
OR: any true → true; all false → false; otherwise unknown.  
NOT: true ↔ false; unknown remains unknown.

## Evaluation workflow
1. Load an approved scheme version and verified rule tree.
2. Validate rule shape and supported operators.
3. Read only required non-sensitive profile attributes.
4. Evaluate predicates without an LLM.
5. Preserve a trace: predicate ID, rule version, attribute key, input state (not unnecessary raw values), output, source, effective period and explanation.
6. Check source/rule integrity separately from citizen attribute completeness.
7. Apply the centrally defined label precedence.
8. Return the result and trace; do not infer application approval.

## Fixed public labels
- `Likely eligible`: every mandatory condition is true and source/rule integrity is sufficient.
- `Need to confirm`: the rule is trustworthy but one or more required citizen attributes are unknown.
- `Unlikely`: a verified mandatory condition is false.
- `Can't tell yet`: source, rule, jurisdiction interpretation or supported operator is missing, stale, conflicting or otherwise unsafe to evaluate.

Use the precedence defined in the PRD. Keep it in one central mapping and test mixed states.

## Question contract
Every missing required attribute can produce a concise question, an explicit `I don't know` option and a one-line `Why we ask this` explanation. Do not ask for attributes that no active pilot rule uses.

## Reuse contract
Scheme search, Near-Match, What-If and Action Graph all consume the same evaluator output. Do not create feature-specific eligibility calculations.

## Prohibited behavior
- LLM deciding or overriding predicates.
- treating missing as false.
- using semantic similarity as proof.
- displaying bare "eligible", "guaranteed" or "approved".
- evaluating unreviewed rule extraction as active policy.

## Tests
Cover operators, boundary values, missing data, unknown answer, mixed false/unknown, unsupported operator, stale source, source conflict, rule version, four labels and all six golden personas.''')

add('sensitive-id-shield', 'Use whenever user text, profile intake, API requests, logs, analytics, persistence, uploads, sharing or AI calls could contain identity numbers.', '''
## Purpose
Prevent sensitive identity identifiers from entering LabhSaathi's stored or transmitted data. The product must not ask for Aadhaar/PAN or other unnecessary sensitive IDs.

## Threat boundary
The shield must operate at both:
1. Client boundary, before local persistence, analytics, network request or AI call.
2. Server/API boundary, before request-body logging, storage, queueing, analytics or provider invocation.

A client-only filter is insufficient because requests can bypass the UI.

## Detection
- Detect Aadhaar-like 12-digit sequences, including common spacing/hyphen formatting.
- Detect PAN-like patterns (for example, the common 10-character letter/digit structure) without claiming the identifier is authentic.
- Maintain configurable patterns for other high-risk identifiers when the product owner approves them.
- Avoid collecting or scanning unrelated files unless upload functionality is explicitly approved; the hackathon MVP should not accept identity documents.

## Processing contract
1. Receive text into a short-lived in-memory boundary handler.
2. Detect sensitive patterns before any side effect.
3. If detected, block or redact the matching content.
4. Do not persist, log, trace, send to analytics, enqueue or call AI with the raw content.
5. Return a safe warning: "This looks like a sensitive identity number. LabhSaathi does not need it. Please remove it and describe your situation without the number."
6. Allow a safe retry.

## Logging rules
- Never log the raw request body by default.
- Never include matched substring, prefix/suffix, checksum or a reversible hash in telemetry.
- Log only that a pattern class was detected and a redaction/block occurred, with no identifier value.
- Ensure test failure output does not print the fixture secret.

## False positives
A 12-digit sequence may not be Aadhaar. Explain that it resembles a sensitive identifier; do not assert authenticity. Provide an alternative path for ordinary text that accidentally triggered a block, while still not forwarding the suspected value.

## Acceptance tests
- Compact and formatted Aadhaar-like fixture blocked.
- PAN-like fixture blocked.
- Benign profile text allowed.
- Client and server independently enforce.
- Storage/logger/analytics/AI mocks receive no raw value.
- WhatsApp share excludes identity patterns.
- Error and debug output contain only safe metadata.

## Do not
- attempt to validate a real person's ID;
- ask the user to enter the identifier to check eligibility;
- retain raw blocked data for support/debugging;
- rely on regex as proof an identifier is genuine.''')

add('privacy-and-public-service-safety', 'Use for data collection, retention, consent, profile storage, analytics, assisted access, sharing and public-service trust decisions.', '''
## Privacy principles
1. Minimise: collect only attributes required by approved pilot rules.
2. Explain: state why each attribute is requested.
3. Respect uncertainty: offer "I don't know" where appropriate.
4. Protect: Sensitive-ID Shield before any side effect.
5. Separate: public scheme data must not be mixed with private profile data or public embeddings.
6. Control: provide review, correction and deletion controls when profile persistence exists.
7. Avoid exposure: no personal profile data in public URLs, share links, analytics or demo screenshots.

## Workflow
- Build a data inventory: attribute, purpose, source, required/optional, storage, retention and deletion path.
- Review every new field for necessity.
- Review every new external provider for what data it receives.
- Review logs, crash reports, browser storage, URL parameters, exports and WhatsApp payloads.
- Use synthetic personas for demos and tests.
- Use consent-bound access if an assisted/NGO mode is introduced.

## Safety language
- LabhSaathi is independent guidance, not a government authority.
- It cannot approve, accelerate or guarantee benefits.
- Users should apply through the official portal/department.
- Scam warnings must be factual and avoid accusing named services without evidence.

## Required review output
Data flow, minimised fields, provider boundaries, retention/deletion plan, threat scenarios, mitigations and test evidence.

## Stop conditions
Stop if a feature requires real sensitive identity data, unapproved data sharing, secret exposure, uncontrolled public access or misleading authority claims.''')

add('conversational-intake-accessibility', 'Use when designing the conversational profile intake, adaptive questions, language support, voice input and uncertainty handling.', '''
## Purpose
Help someone who does not know which details matter without forcing a long form or pretending to understand uncertain facts.

## Conversation design
1. Begin with a short explanation of the service and its limitations.
2. Invite a brief natural-language description.
3. Run Sensitive-ID Shield before AI or storage.
4. Extract only fields needed by approved pilot rules.
5. Show extracted values for user review and correction.
6. Ask one focused follow-up at a time.
7. Include `I don't know` for factual questions where uncertainty is reasonable.
8. Include `Why we ask this` in simple language for every question.
9. Store unknown explicitly; never guess from unrelated context.
10. Stop asking once sufficient data exists for useful discovery.

## Accessibility
- Prefer short sentences and familiar wording.
- Offer Telugu and English in the pilot where the chosen model/content quality supports them.
- Preserve scheme names and key legal terms while explaining them simply.
- Do not assume literacy, smartphone familiarity or stable network.
- Keep typing as a complete baseline; voice is an enhancement.
- Make question, answer and error states keyboard/screen-reader accessible.

## AI boundary
AI may parse language into candidate profile fields and draft an explanation. Validate its output against a schema and allowed field list. Do not pass sensitive identifiers or whole conversation histories unnecessarily. AI cannot decide eligibility.

## Acceptance
A synthetic user can explain a situation naturally, review the extracted profile, choose "I don't know", understand why follow-ups are asked and continue without a long form.''')

add('scheme-discovery-search', 'Use when building scheme search, filtering, ranking, category browsing, semantic retrieval and Near-Match discovery.', '''
## Purpose
Retrieve relevant candidate schemes while keeping retrieval relevance separate from eligibility.

## Search pipeline
1. Validate the minimal profile and pilot jurisdiction.
2. Apply deterministic filters for scheme status, scope, geography and category.
3. Use text/full-text search for natural-language intent.
4. Optionally add semantic retrieval behind a provider interface when useful.
5. Deduplicate candidates by stable scheme ID/version.
6. Run each candidate through the canonical three-valued eligibility engine.
7. Rank for presentation using transparent relevance signals (jurisdiction match, category relevance, source quality/freshness and user intent).
8. Display fixed likelihood label and evidence trace.

## Separation of concerns
A search score means "possibly relevant to the query". It does not mean a citizen satisfies any legal condition. Vector similarity must never override rule results. Do not generate a likely match from an unapproved scheme record.

## Near-Match
Near-Match is a view over canonical evaluation traces. It may highlight a scheme with mostly satisfied predicates and a small number of unknown conditions, but must not invent a percentage or imply a probability unless a validated method exists. Explain exactly which conditions remain unknown or unmet.

## Output
Candidate set, filters applied, ranking rationale, rule evaluation labels, excluded candidates and reason.

## Tests
Jurisdiction, out-of-scope schemes, inactive schemes, duplicates, unknown attributes, unverified rules, semantically similar but legally irrelevant results and source-quality ranking.''')

add('document-readiness-application-workflow', 'Use when generating personalised document checklists, acquisition guidance, application instructions, saved tasks and follow-up steps.', '''
## Purpose
Turn a potential scheme match into an honest, actionable preparation plan.

## Workflow
1. Load the approved scheme version and applicable rules.
2. Identify documents explicitly required by source-backed rules.
3. Distinguish mandatory, conditional and optional items only when the source supports that classification.
4. Explain why each document is requested and which condition triggers it.
5. Provide acquisition instructions only when official source guidance exists.
6. Build ordered application steps from verified instructions.
7. Include the official destination link and source date.
8. Create tracker tasks with status and due-date provenance.
9. Show unknown information rather than inventing alternatives or steps.

## Task states
Use a small documented state model, such as `not_started`, `in_progress`, `ready`, `submitted_by_user`, `follow_up_needed`, `completed` and `blocked`. Do not infer government portal submission from a user merely opening the link.

## Safety
- Never ask to upload Aadhaar/PAN or sensitive identity documents.
- Never present a document checklist as legal advice or an official final checklist unless the source says so.
- Never invent an alternative document.
- Never claim LabhSaathi submitted the application.

## Acceptance
A user can understand each checklist item, its source, why it applies and the next action; unclear instructions are visibly marked for confirmation.''')

add('middleman-shield-fee-transparency', 'Use on every scheme detail page to present official portals, source-backed fee information and anti-scam guidance without unsupported claims.', '''
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
- imply that paying LabhSaathi improves eligibility or speed.''')

add('academic-renewal-calendar', 'Use for scholarship renewal reminders, academic-year periods, renewal checklists and calendar events.', '''
## Purpose
Help students avoid missing recurring scholarship renewal steps without inventing universal academic dates.

## Data needed
For each renewal event, store scheme ID/version, academic year, renewal window/date, timezone, source URL, date checked, required renewal documents, institution/course applicability and status.

## Workflow
1. Confirm that the scheme actually has a renewal process.
2. Extract the renewal period and requirements from an official source.
3. Record date precision: exact date, date window, month/season or unknown.
4. Associate the renewal with a specific academic year and applicable student cohort.
5. Create calendar/reminder records only from verified dates/windows.
6. Display the source and last-verified date beside the event.
7. If dates are missing, show "Renewal date not verified" and no fabricated reminder.
8. Allow a user to mark a task complete or snoozed without implying official renewal submission.

## Calendar states
`upcoming`, `due_soon`, `due`, `overdue`, `completed`, `date_unverified`, `not_applicable`.

## Rules
Use Asia/Kolkata for local display unless the app's configured locale requires otherwise. Do not assume every institution shares the same academic calendar. Scheme-specific dates override generic calendar assumptions.

## Acceptance
Every reminder can be traced to a scheme version and source; synthetic demo events are clearly marked as sample data.''')

add('whatsapp-checklist-sharing', 'Use when generating user-initiated WhatsApp checklist shares via a wa.me URL without an API integration.', '''
## Purpose
Make it easy to share public guidance with family while preventing accidental disclosure of private profile information.

## Workflow
1. Build share text from an explicit allow-list: scheme name, public checklist item labels, generic application steps, official portal link and source/verification note.
2. Do not include the user's name, profile, income, date of birth, phone, identifiers, conversation transcript, eligibility trace or application status.
3. Run Sensitive-ID Shield / sensitive-content checks on the final text.
4. URL-encode the text for `https://wa.me/?text=...`.
5. Show the exact preview in the UI.
6. Require an explicit user click to open WhatsApp.
7. Make clear the product opens a share composer; it does not send a message automatically.

## Failure handling
If the payload is too long, offer a shorter checklist or printable summary. If no safe official link exists, omit it and label the source gap. Do not use a third-party URL shortener.

## Tests
- Encoding/decoding round trip.
- Sensitive profile attributes absent.
- Aadhaar/PAN-like test fixtures absent.
- User click required; no auto-navigation on render.
- Only approved public content included.''')

add('unified-eligibility-action-graph', 'Use when building or modifying the single graph that joins eligibility explanations with document and claim actions.', '''
## Purpose
Provide one visual, inspectable journey from profile facts to next actions. This replaces separate Benefit Action Graph and Eligibility Explanation Graph components.

## Graph model
Profile → Scheme → Eligibility Conditions → Documents → Application → Follow-up.

## State model
- `satisfied`: source-backed predicate evaluates true.
- `not_satisfied`: verified predicate evaluates false.
- `unknown`: citizen attribute/condition is unknown.
- `action_pending`: a checklist/application task remains.
- `not_applicable`: conditional node does not apply, with rule trace.
- `evidence_unavailable`: source/rule integrity prevents safe explanation.

## Workflow
1. Consume canonical eligibility traces and claim-task state.
2. Map trace/task records to display nodes; do not calculate eligibility in the graph component.
3. Display node label, status, source, last-verified date and short explanation.
4. On selection, reveal the exact rule/condition and the reason for its state.
5. Provide a linear/list fallback for small screens and assistive technologies.
6. Distinguish hypothetical What-If view from saved citizen state.
7. Keep graph updates deterministic when profile, source or task version changes.

## Visual guidance
Use restrained visual status cues plus text/icon labels; do not rely on colour alone. Avoid graph clutter. Provide a clear "next useful action" and show unknown states visibly.

## Acceptance
Graph nodes reconcile with the canonical engine and tracker for every golden persona. There is one reusable graph component and no second copy of eligibility logic.''')

add('scheme-change-radar', 'Use to detect and explain changes between scheme source/rule versions and identify prior results that need reassessment.', '''
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
A reviewer can trace every displayed change to both versions and the source. No prior result is silently overwritten.''')

add('citizen-experience-design', 'Use for LabhSaathi screens, interactions, visual hierarchy, responsive design, accessibility and first-time-user comprehension.', '''
## Design objective
Make a public-benefit workflow understandable to a first-time digital user with limited time, variable literacy and a mobile-first context.

## Design process
1. Identify the user's current task and primary decision on the screen.
2. Put the next meaningful action first; avoid dashboard clutter.
3. Use plain language; explain official terminology inline.
4. Keep source, verification date, uncertainty and limitations visible near the claim they support.
5. Distinguish the four fixed likelihood labels with text, icon and colour (never colour alone).
6. Provide loading, empty, error, offline and stale-source states.
7. Support keyboard navigation, visible focus, labels, contrast and scalable text.
8. Check narrow mobile viewport and desktop layout.
9. Reuse tokens/components and preserve existing good design patterns.

## LabhSaathi screen rules
- Do not use a green "approved" check for a likely match.
- Display `Likely eligible`, not `Eligible`.
- Show "Why we ask this" at the point of asking.
- Make "I don't know" easy to find.
- On scheme detail pages, keep official portal, fee state, source date and scam warning discoverable.
- The Action Graph needs a readable list fallback.

## Do not
- invent authority logos/seals;
- mimic a government portal in a way that implies official status;
- hide warnings in footnotes;
- use tiny text for critical caveats;
- redesign the entire app when implementing one feature.''')

add('cloudflare-migration-readiness', 'Use only in the separately approved Cloudflare migration phase after the local implementation has passed its acceptance gates.', '''
## Activation guard
Do not activate this skill for normal local development. Require an explicit owner-approved P12 migration task and confirmed Cloudflare account permissions.

## Pre-migration audit
- Inventory local adapters, schema, migrations, file references, provider interfaces and secrets.
- Confirm data classification and whether any personal data exists; prefer a clean synthetic/demo dataset.
- Check Cloudflare product limits/pricing and current docs before selecting bindings.
- Create a staging and rollback plan.

## Target mapping
- Workers for API/runtime.
- D1 for relational data.
- R2 for source documents/snapshots only where source terms permit.
- Vectorize only where semantic search shows measurable value; keep structured D1 filtering as eligibility truth.
- Workers AI or a selected provider behind the AI interface; enforce minimisation and shield first.
- Queues/Workflows for ingestion/rechecks only when workload requires them.
- Cron Triggers/Workflows for scheduled checks/reminders where appropriate.

## Migration workflow
1. Create environment-specific bindings and secrets outside source control.
2. Apply versioned D1 migrations to staging.
3. Seed controlled fixtures.
4. Run adapter contract tests and all eligibility/privacy golden tests.
5. Verify R2 access controls and object provenance.
6. Test request authentication, CORS, rate limiting and error handling.
7. Run staging smoke tests and confirm observability does not capture sensitive input.
8. Record deployment, rollback and cost controls.
9. Ask for explicit production approval.

## Do not
- deploy without approval;
- put secrets in code or prompts;
- assume all local AI bindings are actually local;
- move raw profile/chat data without a data migration review;
- make Vectorize the eligibility database.''')

add('synthetic-personas-golden-tests', 'Use when building or validating test profiles, rule fixtures, expected results and regression suites for LabhSaathi.', '''
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
When an approved scheme rule changes, update fixture version and expected traces with a review note. Never change expected output merely to make a failing test green; verify the source first.''')

add('demo-readiness', 'Use to prepare a repeatable hackathon demonstration, acceptance report and business-model explanation without overstating functionality.', '''
## Demo narrative
Demonstrate one student journey from natural-language intake to sourced scheme guidance and a next action. A suggested sequence:
1. Explain the independent guidance role.
2. Enter a synthetic low-income Telangana college-student scenario.
3. Demonstrate Sensitive-ID Shield with an obviously fictional test pattern; do not use a real identifier.
4. Answer adaptive questions, including one `I don't know` response and a visible "Why we ask this".
5. Show scheme results with one of the four fixed labels and condition traces.
6. Open scheme detail: official source, last-verified date, fee state and scam warning.
7. Show personalised checklist and application steps.
8. Save the scheme and show a sourced renewal/deadline event (clearly marked sample if simulated).
9. Share a safe WhatsApp checklist preview.
10. Show the Unified Eligibility Action Graph.
11. Change a What-If attribute and show the same engine's updated trace.
12. Show a controlled Scheme Change Radar diff as simulated data.

## Demo integrity
- Label synthetic profiles, fictional fixtures and simulated change events.
- Do not claim live government integration, actual application submission, complete scheme coverage or real-world eligibility accuracy unless verified.
- Keep a known-limitations slide.
- Keep a backup local dataset and repeatable reset script.

## Business model slide
Explain as a hypothesis: core citizen product free; possible institutional buyers include colleges' scholarship cells, NGOs and CSR programmes; CSR impact dashboard is a proposed paid institutional product. Do not imply paying clients exist.

## Readiness checklist
Fresh local start, no console errors, demo persona seed, all P0 checks pass, source register available, share payload safe, no secrets, predictable demo path and recovery instructions.''')

add('credit-aware-execution', 'Use before large or repetitive Nexen operations to reduce Codebenders credit waste and protect the remaining project budget.', '''
## Purpose
Make progress measurable and avoid uncontrolled agent loops. The reported 16M credits are a finite resource; never consume them simply because they are available.

## Before work
1. Confirm the current phase and owner approval.
2. State the bounded task and expected output.
3. Inspect relevant files before asking the model to reread broad context.
4. Prefer targeted file reads, local scripts, deterministic checks and cached results.
5. Identify whether a remote AI/network action is truly needed.
6. If Nexen displays usage, record the starting value; do not fabricate a cost estimate.

## During work
- Use one lead agent by default.
- Avoid overlapping agents or repeated broad repository scans.
- Batch related source checks where safe.
- Reuse validated extraction outputs and embeddings when inputs are unchanged.
- Use mock AI for deterministic tests.
- Stop repeated retries after diagnosing the failure.
- Keep tasks small and report progress at phase checkpoints.

## Before expensive operations
Ask the product owner before mass scheme ingestion, large-scale embedding, whole-codebase rewrites, long autonomous runs, repeated remote inference or Cloudflare provisioning.

## Budget protection
If remaining credits are constrained, preserve P0 PS5 requirements, privacy controls, golden tests and demo hardening. Defer P2 and optional P1 features first. Never quote exact remaining credits unless read from the IDE.

## Report
Task, reason, local/remote operations, actual usage if visible, outputs, cache/reuse, failures and next bounded action.''')

# Write files
for name, (desc, body) in skills.items():
    d = root / 'skills' / name
    d.mkdir(parents=True, exist_ok=True)
    content = f'''---\nname: {name}\ndescription: {desc}\n---\n\n# {name.replace('-', ' ').title()}\n\n{body}\n\n## References and provenance\nThis is an original LabhSaathi-specific playbook. It uses the portable Agent Skills structure and is informed by publicly documented workflow concepts; it is not a verbatim copy of any third-party skill. See `../../docs/SKILL_SOURCES.md` for attribution and source links.\n'''
    (d / 'SKILL.md').write_text(content, encoding='utf-8')

# Evals - two realistic prompts per skill, compact and generic.
evals = []
for idx, (name, (desc, body)) in enumerate(skills.items(), 1):
    evals.append({
        'skill_name': name,
        'evals': [
            {'id': 1, 'prompt': f'Use the {name} skill for a realistic LabhSaathi task. Explain your plan and produce the skill-required output for: {desc}', 'expected_output': 'Follows the skill workflow, stays within PS5/local-first guardrails, and reports evidence/uncertainty explicitly.', 'files': []},
            {'id': 2, 'prompt': f'An implementation request touches a boundary covered by {name}. Review the PRD and phase constraints, identify risks, and provide a bounded next action with acceptance criteria.', 'expected_output': 'Identifies relevant requirements, does not invent facts, includes tests and stops at the proper approval gate.', 'files': []}
        ]
    })
(root / 'evals' / 'skill-evals.json').write_text(json.dumps({'project':'LabhSaathi','format':'initial prompt-based skill evaluations; tune against Nexen behavior','skills':evals}, indent=2), encoding='utf-8')

# skill sources / inspiration documentation
(root / 'docs' / 'SKILL_SOURCES.md').write_text('''# Skill Format and Methodology Sources\n\nThe LabhSaathi skills in this package are original project-specific instructions. They are not copied from third-party repositories. The following public projects informed the format and process patterns:\n\n1. **Agent Skills specification** — https://github.com/agentskills/agentskills\n   - Portable folder-per-skill structure with `SKILL.md`, YAML metadata and optional supporting resources.\n   - Progressive disclosure: discover by metadata, load full instructions when triggered, read supporting resources only as needed.\n\n2. **Anthropic Skills repository / skill-creator** — https://github.com/anthropics/skills/tree/main/skills/skill-creator\n   - Skill anatomy, concise metadata, imperative instructions, scoped bundled resources and practical skill evaluations.\n\n3. **obra/superpowers** — https://github.com/obra/superpowers\n   - Workflow sequencing: discovery/brainstorming before design, small implementation plans, TDD, systematic debugging, review and verification before completion.\n\n4. **obra/superpowers writing-plans skill** — https://github.com/obra/superpowers/tree/main/skills/writing-plans\n   - Small tasks with explicit files, implementation actions and verification steps.\n\n## Adaptations for LabhSaathi\n- Added PS5-specific traceability and one-population/one-state pilot constraints.\n- Added public-service safety, source provenance, fee transparency and anti-middleman rules.\n- Added a deterministic three-valued eligibility model and fixed citizen-facing likelihood labels.\n- Added Sensitive-ID Shield requirements for pre-storage/pre-log/pre-AI boundaries.\n- Added local-first development and delayed Cloudflare migration controls.\n- Added phase gates with explicit human approval and credit-aware execution.\n\n## Licensing note\nThese skills are newly authored text. They do not include copied skill bodies or third-party code. Follow the linked repositories' own licenses if you later decide to import their actual files into your project.\n''', encoding='utf-8')

# root README
(root / 'README.md').write_text(f'''# LabhSaathi Agent Harness\n\nA phase-controlled product and coding-agent harness for the ACE BUILDERS 2026 PS5 pilot.\n\n## Start here\n1. Read `PRD_LabhSaathi.md`.\n2. Read `PHASE_CONTROL.md` (PDF companion: `LabhSaathi_Phase_Control.pdf`).\n3. Read `AGENTS.md`.\n4. Configure Nexen using `agent/NEXEN_AGENT_CONFIG.md`.\n5. Paste `agent/BOOTSTRAP_PROMPT.md` into the lead agent.\n6. Import/attach skill folders from `skills/*/SKILL.md` using Nexen's supported skill workflow.\n7. Begin **P0 only**. Wait for product-owner approval before P1.\n\n## Contents\n- `PRD_LabhSaathi.md` — product requirements and system constraints.\n- `PHASE_CONTROL.md` — detailed phase sequence, acceptance criteria and gates.\n- `LabhSaathi_Phase_Control.pdf` — printable phase control companion.\n- `AGENTS.md` — always-on agent operating contract.\n- `agent/` — Nexen setup, bootstrap, skill registry, phase ledger and decisions.\n- `skills/` — {len(skills)} original LabhSaathi-specific Agent Skills (`SKILL.md`).\n- `evals/skill-evals.json` — two initial prompts per skill for harness validation.\n- `docs/SKILL_SOURCES.md` — public sources and adaptation notes.\n- `FEATURE_BACKLOG.md` — P0/P1/P2 prioritisation.\n\n## Compatibility\nSkills use the standard folder + `SKILL.md` + YAML `name`/`description` convention. Nexen may require importing each skill or adding it to a workspace registry; do not assume automatic discovery.\n\n## Important\nThe hackathon pilot is low-income college students in Telangana. The architecture may expand later, but the pilot must not claim complete national scheme coverage. All scheme facts must be sourced and reviewed. Use synthetic profiles only. Do not deploy Cloudflare until P12 and explicit owner approval.\n\n## Skills count\n{len(skills)} skills are included.\n''', encoding='utf-8')

print(f'Created {len(skills)} skills')
for name in skills:
    print(name)
