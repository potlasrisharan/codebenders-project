# LabhSaathi Skill Registry

Skills are original LabhSaathi-specific playbooks using the portable Agent Skills folder convention. They are informed by public conventions and workflow ideas from `agentskills/agentskills`, `anthropics/skills` and `obra/superpowers`; they are not copied repository files.

## Mandatory activation map

| Situation | Activate skills |
|---|---|
| New feature/product change | `product-discovery`, `ps5-requirements-guardian`, `phase-gate-controller`, `implementation-planning`, `local-first-architecture`, `credit-aware-execution` |
| Any code change | `test-driven-development`, `verification-before-completion`, `code-review` |
| Bug/failure | `systematic-debugging`, then `test-driven-development`, `verification-before-completion` |
| Citizen input/AI call | `sensitive-id-shield`, `conversational-intake-accessibility`, `privacy-and-public-service-safety` |
| Scheme/source/rule data | `scheme-data-curation`, `source-verification-versioning`, `eligibility-engine` |
| Search/recommendations | `scheme-discovery-search`, `eligibility-engine` |
| Documents/application | `document-readiness-application-workflow`, `middleman-shield-fee-transparency` |
| Renewal/reminders/share | `academic-renewal-calendar`, `whatsapp-checklist-sharing` |
| Graph/simulator/radar | `unified-eligibility-action-graph`, `eligibility-engine`, `scheme-change-radar` |
| UI design | `citizen-experience-design` |
| Data/schema work | `data-modeling-migrations`, `scheme-data-curation` |
| Cloudflare work (later only) | `cloudflare-migration-readiness`, `verification-before-completion` |
| Demo/testing | `synthetic-personas-golden-tests`, `demo-readiness` |
| Credit-heavy task | `credit-aware-execution` |
| Create or revise a skill | `skill-authoring-and-evaluation` |

## Skill inventory

Relative paths are relative to `LabhSaathi_Agent_Harness/`.

| # | Exact skill name | Purpose | When to activate | Relative path |
|---|---|---|---|---|
| 1 | `product-discovery` | Clarify user problem, PS5 fit, scope, assumptions and measurable outcomes before proposing or changing a feature. | Use before proposing or changing a LabhSaathi feature. | `skills/product-discovery/SKILL.md` |
| 2 | `ps5-requirements-guardian` | Traceability audit against the ACE BUILDERS 2026 PS5 brief and its guardrails. | Use during planning, implementation and review. | `skills/ps5-requirements-guardian/SKILL.md` |
| 3 | `phase-gate-controller` | Enforce one-phase-at-a-time delivery, owner approval and evidence-based gates. | Use at phase start, checkpoint and completion. | `skills/phase-gate-controller/SKILL.md` |
| 4 | `implementation-planning` | Break an approved feature into small, verifiable tasks with exact files, tests and rollback notes. | Use after an approved design. | `skills/implementation-planning/SKILL.md` |
| 5 | `test-driven-development` | Red-green-refactor discipline for behaviour changes. | Use for every behaviour change, especially eligibility, privacy filtering, source handling, sharing and workflow state. | `skills/test-driven-development/SKILL.md` |
| 6 | `systematic-debugging` | Evidence-led root-cause diagnosis before editing. | Use when LabhSaathi behaviour, tests, local services or build steps fail. | `skills/systematic-debugging/SKILL.md` |
| 7 | `verification-before-completion` | Verify completion claims against runtime and test evidence. | Use before reporting any task, feature or phase as complete. | `skills/verification-before-completion/SKILL.md` |
| 8 | `code-review` | Review correctness, safety, maintainability and scope compliance. | Use after each meaningful implementation slice and before a phase gate. | `skills/code-review/SKILL.md` |
| 9 | `local-first-architecture` | Keep domain logic independent of infrastructure so LabhSaathi works locally and can later move to Cloudflare. | Use when designing or changing persistence, backend, file storage, search, AI or scheduling. | `skills/local-first-architecture/SKILL.md` |
| 10 | `data-modeling-migrations` | Schema, migration, index, repository and data lifecycle rules. | Use when creating or changing LabhSaathi schemas, migrations, indexes, repository contracts or data lifecycle rules. | `skills/data-modeling-migrations/SKILL.md` |
| 11 | `scheme-data-curation` | Curate a small, high-quality set of public scheme information for the Telangana student pilot. | Use when discovering, extracting, normalising, reviewing or importing public scheme information for the Telangana student pilot. | `skills/scheme-data-curation/SKILL.md` |
| 12 | `source-verification-versioning` | Traceable source quality, freshness, conflicts and active rule versions. | Use when reviewing official source quality, freshness, conflicts, scheme changes, last-verified dates or active rule versions. | `skills/source-verification-versioning/SKILL.md` |
| 13 | `eligibility-engine` | Deterministic, conservative three-valued eligibility evaluation with fixed labels. | Use when implementing or changing LabhSaathi eligibility rules, fixed labels, Near-Match, What-If or predicate explanations. | `skills/eligibility-engine/SKILL.md` |
| 14 | `sensitive-id-shield` | Block or redact Aadhaar/PAN-like identity numbers before any side effect. | Use whenever user text, profile intake, API requests, logs, analytics, persistence, uploads, sharing or AI calls could contain identity numbers. | `skills/sensitive-id-shield/SKILL.md` |
| 15 | `privacy-and-public-service-safety` | Minimisation, consent, retention, analytics, sharing and public-service trust. | Use for data collection, retention, consent, profile storage, analytics, assisted access, sharing and public-service trust decisions. | `skills/privacy-and-public-service-safety/SKILL.md` |
| 16 | `conversational-intake-accessibility` | Adaptive, accessible profile intake with explicit uncertainty handling. | Use when designing the conversational profile intake, adaptive questions, language support, voice input and uncertainty handling. | `skills/conversational-intake-accessibility/SKILL.md` |
| 17 | `scheme-discovery-search` | Relevant candidate retrieval and ranking kept separate from eligibility. | Use when building scheme search, filtering, ranking, category browsing, semantic retrieval and Near-Match discovery. | `skills/scheme-discovery-search/SKILL.md` |
| 18 | `document-readiness-application-workflow` | Honest document checklists, application steps and tracker tasks. | Use when generating personalised document checklists, acquisition guidance, application instructions, saved tasks and follow-up steps. | `skills/document-readiness-application-workflow/SKILL.md` |
| 19 | `middleman-shield-fee-transparency` | Official portal, source-backed fee state and anti-scam guidance on scheme detail pages. | Use on every scheme detail page. | `skills/middleman-shield-fee-transparency/SKILL.md` |
| 20 | `academic-renewal-calendar` | Scholarship renewal reminders and academic-year calendar events without invented dates. | Use for scholarship renewal reminders, academic-year periods, renewal checklists and calendar events. | `skills/academic-renewal-calendar/SKILL.md` |
| 21 | `whatsapp-checklist-sharing` | User-initiated WhatsApp checklist shares via wa.me, without private profile data. | Use when generating user-initiated WhatsApp checklist shares via a wa.me URL without an API integration. | `skills/whatsapp-checklist-sharing/SKILL.md` |
| 22 | `unified-eligibility-action-graph` | One inspectable graph joining eligibility explanations with document and claim actions. | Use when building or modifying the single graph that joins eligibility explanations with document and claim actions. | `skills/unified-eligibility-action-graph/SKILL.md` |
| 23 | `scheme-change-radar` | Auditable detection and explanation of scheme source and rule changes. | Use to detect and explain changes between scheme source/rule versions and identify prior results that need reassessment. | `skills/scheme-change-radar/SKILL.md` |
| 24 | `citizen-experience-design` | Screens, interactions, accessibility and first-time-user comprehension. | Use for LabhSaathi screens, interactions, visual hierarchy, responsive design, accessibility and first-time-user comprehension. | `skills/citizen-experience-design/SKILL.md` |
| 25 | `cloudflare-migration-readiness` | Cloudflare migration audit and rollout plan, only in the approved migration phase. | Use only in the separately approved Cloudflare migration phase after the local implementation has passed its acceptance gates. | `skills/cloudflare-migration-readiness/SKILL.md` |
| 26 | `synthetic-personas-golden-tests` | Synthetic profiles, rule fixtures and golden regression suites. | Use when building or validating test profiles, rule fixtures, expected results and regression suites for LabhSaathi. | `skills/synthetic-personas-golden-tests/SKILL.md` |
| 27 | `demo-readiness` | Repeatable hackathon demo, acceptance report and business-model explanation without overstating functionality. | Use to prepare a repeatable hackathon demonstration, acceptance report and business-model explanation without overstating functionality. | `skills/demo-readiness/SKILL.md` |
| 28 | `credit-aware-execution` | Bounded, budget-conscious Nexen operations. | Use before large or repetitive Nexen operations to reduce Codebenders credit waste and protect the remaining project budget. | `skills/credit-aware-execution/SKILL.md` |
| 29 | `skill-authoring-and-evaluation` | Create, revise, register and test LabhSaathi agent skills. | Use when creating, revising, registering or testing a LabhSaathi agent skill so the instructions remain focused, discoverable, portable and behaviourally useful. | `skills/skill-authoring-and-evaluation/SKILL.md` |

All 29 names are unique. Canonical location: LabhSaathi_Agent_Harness/skills/. The LabhSaathi_Skills/ folder holds duplicate copies of the same skills; do not import those a second time under the same name.

## Bootstrap mapping (discovery and planning)

1. `skills/product-discovery/SKILL.md`
2. `skills/ps5-requirements-guardian/SKILL.md`
3. `skills/phase-gate-controller/SKILL.md`
4. `skills/implementation-planning/SKILL.md`
5. `skills/local-first-architecture/SKILL.md`
6. `skills/credit-aware-execution/SKILL.md`

Read these six skill files at the start of a discovery or planning task. Do not load other skills unless the activation map says to.

Bootstrap activation is a workspace configuration. It does not mean the skills are registered in the Nexen Skills UI; that needs the user's Import .md action.

## Loading guidance

Load only the skills relevant to the current task, plus always-on repository rules in `AGENTS.md`. Do not concatenate every skill into the agent prompt. Skill folders may be imported individually or attached as bundled references. Keep any long implementation recipes in separate reference files where useful.

Before starting a task, find the matching row in the Mandatory activation map and read only the SKILL.md files for those skills, using the relative paths in the inventory. Do not read or load all skills.
