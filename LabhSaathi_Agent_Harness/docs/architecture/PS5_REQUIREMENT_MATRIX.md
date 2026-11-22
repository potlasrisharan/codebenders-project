# PS5 Requirement Matrix - LabhSaathi

**Phase:** P0 documentation. Maps each requirement to phase, route, API, data and tests.
**Sources:** PS5_REQUIREMENTS.md (working text), PRD_LabhSaathi.md, PHASE_CONTROL.md (phase numbers), AGENTS.md, ADR-001 to ADR-006.
**Important:** No API endpoints are built in P0. The endpoints below are planned, with the phase that first needs each one.

**Routes (from P1):** Intake, Matches, Scheme Detail, Checklist, Tracker, Admin Review. A landing/introduction screen is added in P1.

---

## 1. PS5 required capabilities

| Requirement | Source | Phase | Screen/route | API endpoint(s) | Data/domain | Required tests |
|---|---|---|---|---|---|---|
| **R1 Plain-language input** (typed first; spoken and regional language optional) | PS5 Solution 1; PRD intake | P4 (typed flow). Voice: not scheduled (see Coverage gaps). | `/intake` | `POST /api/v1/eligibility/evaluate` receives validated attributes only. Extraction endpoint: not named in directive (gap CG2). | CitizenProfile (IndexedDB); profile attribute schema limited to pilot rules; extraction candidates with confidence and unknown state | Short description yields profile candidates; user can correct values; unknown retained as unknown; every question has "Why we ask this"; no long mandatory form; Shield runs before AI and storage; synthetic profiles load |
| **R2 Eligibility matching with reasoning** (which schemes fit and which rule) | PS5 Solution 2; PRD rule engine | P5 (engine), P6 (discovery), P9 (graph explanation) | `/matches`, `/schemes/:id` | `POST /api/v1/eligibility/evaluate`, `POST /api/v1/eligibility/explain`, `POST /api/v1/schemes/search` | Rule, Predicate (true/false/unknown), Trace (rule ID/version, source, value state, result, explanation), Scheme, Persona fixtures | Three-valued operator unit tests; mixed false/unknown precedence; six golden persona traces; forbidden-term tests; search score cannot change status; Near-Match uses same engine |
| **R3 Personalised document checklist and application guide** | PS5 Solution 3; PRD checklist | P7 | `/schemes/:id`, `/checklist` | `GET /api/v1/schemes/:id`, `GET /api/v1/schemes/:id/sources` | DocumentRequirement (mandatory/conditional/optional), ApplicationStep, FeeState (free_verified / fee_verified / unknown), official portal link | Checklist reflects applicable conditions; no invented document or alternative; every step has a source; fee wording follows evidence state; scam warning present on every scheme page; no implied government approval |
| **R4 Deadline reminders and application tracking** | PS5 Solution 4; PRD tracker | P8 (local simulation). Real notifications: not in MVP (gap CG3). | `/tracker` | None in directive list. Saved tracker data is client-side. Deadline source via `GET /api/v1/schemes/:id`. | SavedScheme; TrackerStage; Deadline (source-verified only, else "unknown"); RenewalEvent (academic year, source) | Tracker stage workflow; deadline unknown shown honestly; no universal date invented; reminder simulation; renewal events carry source and academic-year metadata; tracker storage excludes sensitive attributes |
| **R5 Official sources and verification date** | PS5 Solution 5; PRD source register | P3 (data and provenance), P7 (shown on scheme page) | `/schemes/:id`, `/admin-review` | `GET /api/v1/schemes`, `GET /api/v1/schemes/:id/sources` | Scheme, SourceRecord (official/unsupported status, last-verified date, licence), Version (rule version) | Each active scheme has jurisdiction, source, last-verified date, version and review state; no unsupported source labelled official; source history inspectable; date displayed on each scheme |

## 2. Guardrails (PS5 and PRD)

| Requirement | Source | Phase | Screen/route | API endpoint(s) | Data/domain | Required tests |
|---|---|---|---|---|---|---|
| **G1 Say "likely eligible", never "guaranteed"** | PS5 guardrail; AGENTS.md | P5 (label mapping), P11 (copy review) | All result surfaces: `/matches`, `/schemes/:id`, `/tracker` | `POST /api/v1/eligibility/evaluate`, `POST /api/v1/eligibility/explain` | Central fixed label map; four labels only | Forbidden-term tests for bare `eligible`, `guaranteed`, `approved`; label snapshot test; owner copy review |
| **G2 No Aadhaar or sensitive ID collection** | PS5 guardrail; ADR-004 | P2 (Shield), enforced on every later phase | `/intake` (no such field); all input | All endpoints that accept free text: server-side Shield | Shield patterns (Aadhaar-like, PAN-like, configurable) | Formatted and spaced fixtures blocked; ordinary text passes; raw value absent from storage, logs and AI mock capture; no UI field asks for Aadhaar/PAN |
| **G3 Public information only** | PS5 guardrail; PRD | P3 | `/admin-review` | Admin ingestion and review endpoints (section 4) | SourceRecord licence and provenance; no private data in scheme records | Source register check; candidate records require public source reference |
| **G4 Rules stored as editable data** | PS5 guardrail; PRD | P3 (data), P10 (versioned change) | `/admin-review` | Admin review, verification and version publication endpoints | Rule and scheme tables/fixtures under `db/` and `db/seeds`; versioned | Rules load from data, not code; schema validation; duplicate detection; version history |
| **G5 Test only with sample profiles** | PS5 guardrail; AGENTS.md | P4 (synthetic profiles load), P5 (six personas) | All screens showing sample data (labelled) | None (fixture load) | Six synthetic personas in `tests/golden` | Sample label present on sample profile and sample scheme data; no real personal data in fixtures |

## 3. Directive additions (product decisions, not PS5 judging text)

| Requirement | Source | Phase | Screen/route | API endpoint(s) | Data/domain | Required tests |
|---|---|---|---|---|---|---|
| **D1 Sensitive-ID Shield** (client and server) | Directive; ADR-004; PHASE_CONTROL P2 | P2 | `/intake`, all input | Server validation on every write or evaluate call; `POST /api/v1/feedback` (P11) | Shield contract (shared detection and redaction) | Client and server both enforce; storage, logger and AI mocks receive safe text; user sees explanation and can retry |
| **D2 Three-valued engine** (true/false/unknown) | Directive; ADR-002 | P5 | `/matches` | `POST /api/v1/eligibility/evaluate` | Predicate; AND/OR/NOT semantics; mandatory and alternative grouping | Truth tables; unknown never treated as false; `Can't tell yet` for source uncertainty |
| **D3 Four fixed labels** (icon plus text) | Directive; ADR-003 | P1 (chip component), P5 (mapping) | `/matches`, `/schemes/:id`, `/tracker` | Labels returned by evaluate | Label enum and display strings | Only four labels appear; each has icon and text; wording test across screens and API |
| **D4 "I don't know" and "Why we ask"** | Directive; PHASE_CONTROL P4 | P4 | `/intake` | None | Question set with explanation text per attribute | Each question has explanation; "I don't know" stores unknown; no mandatory form |
| **D5 Near-Match Discovery** | Directive; PHASE_CONTROL P6 | P6 | `/matches` (near-match section) | `POST /api/v1/schemes/search`, `POST /api/v1/eligibility/evaluate` | Same engine; near-miss predicate list | Near-Match reuses canonical engine; similarity never sets status; empty state gives next action |
| **D6 Unified Eligibility Action Graph** (one component) | Directive; ADR-006; PRD | P9 | `/schemes/:id` graph; `/checklist`; `/tracker` | `POST /api/v1/eligibility/explain` | Graph model rendered from trace and workflow state | Graph matches canonical trace; node click reveals evidence; unknown distinguishable; list fallback works on mobile; no second logic engine |
| **D7 What-If simulator** | Directive; PHASE_CONTROL P10 | P10 | `/matches` (What-If panel) | `POST /api/v1/eligibility/evaluate` (hypothetical input, not saved) | HypotheticalProfile (in memory); saved profile unchanged | Same engine used; before/after shown; saved profile unchanged until explicit confirm |
| **D8 Scheme Change Radar** (controlled fixtures) | Directive; PHASE_CONTROL P10 | P10 | `/admin-review` (diff view) | Admin version and diff endpoints (section 4) | RuleVersion diff; affected prior results marked for reassessment | Diff fixture; prior results marked, not overwritten; no claim of live monitoring |
| **D9 Middleman Shield** (fee transparency and scam warning) | Directive; PRD; ADR-005 | P7 | `/schemes/:id` | `GET /api/v1/schemes/:id` | FeeState; scam warning copy; LabhSaathi independence statement | "Official application is free" only for free_verified; warning on every scheme page; no approval wording |
| **D10 WhatsApp wa.me share** (preview first, user click) | Directive; PHASE_CONTROL P8 | P8 (share), P2 (payload audit) | `/tracker` (share preview) | None. URL built client-side. | Allow-listed checklist text and official links only | Encoded URL test; payload has no profile or sensitive data; never auto-sent |
| **D11 Six synthetic personas** | Directive; PHASE_CONTROL P5 | P5 (golden), P11 (end-to-end) | All screens, labelled as sample | `POST /api/v1/eligibility/evaluate` | Persona fixtures in `tests/golden` | Six golden traces and labels pass; six end-to-end journeys pass (P11) |
| **D12 Academic-year renewal calendar** | Directive; PHASE_CONTROL P8 | P8 | `/tracker` (calendar) | `GET /api/v1/schemes/:id` (renewal window fields) | RenewalWindow with academic year, requirements, source | Only sourced windows shown; no universal scholarship date; events carry source and academic year |
| **D13 Scheme ingestion, review, source versioning** | Directive; PHASE_CONTROL P3, P10 | P3 (fixture workflow, review, publish), P10 (version diff) | `/admin-review` | Admin endpoints (section 4) | Candidate, reviewed Scheme, SourceRecord, Version history | Candidate cannot publish itself; publish requires review; version history inspectable; duplicate and required-field checks; migrations run from clean DB |

## 4. API endpoints and first-need phase

No endpoint is built in P0. "First needed" means the earliest phase whose acceptance criteria require the endpoint.

| Endpoint | Auth | First needed | Purpose | Notes |
|---|---|---|---|---|
| `GET /api/v1/health` | Public | P2 | Liveness and contract check for the local API | P1 is shell only with no API (PHASE_CONTROL P1). Health check added with first server boundary (Shield) in P2. |
| `GET /api/v1/schemes` | Public | P3 | List published schemes with source and verification metadata | Only reviewed, published records returned. |
| `GET /api/v1/schemes/:id` | Public | P3 (data); P7 (checklist, fee, steps) | Scheme detail, version, verification date, fee state | Fee state rendered per ADR-005. |
| `GET /api/v1/schemes/:id/sources` | Public | P3 | Source register entries for a scheme | Official status only where supported. |
| `POST /api/v1/schemes/search` | Public | P6 | Structured and keyword discovery within supported scope | Score never affects eligibility status. |
| `POST /api/v1/eligibility/evaluate` | Public | P5 | Deterministic three-valued evaluation with trace | Receives minimum validated redacted attributes only; not stored; Shield at server. |
| `POST /api/v1/eligibility/explain` | Public | P5 | Explanation text and trace for a given evaluation | Uses the same engine output; no AI decision. |
| `GET /api/v1/categories` | Public | P3 | Category coverage (covered / partial / not yet verified) | Coverage registry (P3 acceptance). |
| `GET /api/v1/jurisdictions` | Public | P3 | Jurisdiction and state coverage registry | Discloses verified coverage; never implies full national coverage. |
| `POST /api/v1/feedback` | Public | P11 (proposed) | User feedback on results or content | No phase in PHASE_CONTROL names it; see gap CG6. Body passes Shield; not stored with profile data. |
| `POST /api/v1/admin/ingestion-jobs` (proposed path) | Protected | P3 (fixture import only) | Start an ingestion or import job | Bulk ingestion needs owner approval (PHASE_CONTROL P3, section 7). Auth model: gap CG5. |
| `GET /api/v1/admin/jobs/:id` (proposed path) | Protected | P3 | Job status | Queues and Workflows not in MVP. |
| `POST /api/v1/admin/candidates/:id/review` (proposed path) | Protected | P3 | Human review of extracted candidate | Candidate cannot publish itself. |
| `POST /api/v1/admin/sources/:id/verify` (proposed path) | Protected | P3 | Record source verification status and date | Unsupported sources cannot be labelled official. |
| `POST /api/v1/admin/schemes/:id/versions` (proposed path) | Protected | P3 | Publish a reviewed version | Requires approved review state. |
| `GET /api/v1/admin/schemes/:id/versions/diff` (proposed path) | Protected | P10 | Version diff for Scheme Change Radar | Controlled fixtures only. |

The admin paths are proposed names. The directive gives only the category of protected admin endpoints.

---

## 5. Coverage gaps

Each item below is a PS5 or directive requirement that no phase P1-P11 fully covers, or that is only partly covered. Owner decision is needed on each.

- **CG1 Voice input and regional language.** PS5 says "typed or spoken; regional language if possible." PHASE_CONTROL.md defers voice until the typed flow is stable, and assigns no phase to voice or regional language. **Not covered.** Owner must decide: accept as out of MVP, or add to a later phase.
- **CG2 Intake extraction endpoint.** P4 needs an AI-or-mock extraction step, but the directive endpoint list has no extraction route. Where extraction runs (client or server) and which endpoint serves it is not decided. Decide in P4, with Shield before any provider call.
- **CG3 Deadline and reminder delivery.** PS5 asks for "deadline reminders." P8 provides a local reminder simulation only. Real notifications are outside the MVP. **Partly covered.** Owner must accept the simulation as the MVP limit.
- **CG4 Real deadline data.** Deadlines appear only where source-verified. For most schemes none may be verified, so the tracker will show "unknown." This is correct behaviour, but it depends on owner-supplied verified sources in P3.
- **CG5 Admin authentication.** Admin endpoints are protected, but the auth model (for example, a local admin token, or a role model) is not specified in any document. Decide before P3.
- **CG6 Feedback endpoint.** `POST /api/v1/feedback` is in the directive but in no phase. Proposed: P11. Owner to confirm.
- **CG7 Live monitoring.** Scheme Change Radar is in P10 as a controlled fixture demo only. Live government monitoring is not claimed or covered, consistent with PHASE_CONTROL P10.
- **CG8 Verified coverage breadth.** PS5 requires every scheme linked to an official source with a verification date. The first verified dataset is small and curated (P3). Coverage is disclosed per state and category, not claimed as complete. Coverage depends on owner-supplied verified sources.
- **CG9 Business model question.** PS5 asks who pays. PHASE_CONTROL P11 requires it to be described as a hypothesis, not revenue. Covered at P11 only.
- **CG10 Out-of-MVP items.** Rejection Recovery, full NGO dashboard and Benefit Passport are out of MVP (PS5_REQUIREMENTS.md). They are intentionally absent from this matrix.
