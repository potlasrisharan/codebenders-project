# P0 Architecture Baseline - LabhSaathi

**Phase:** P0 - Workspace audit & harness baseline (documentation only)
**Status:** PROPOSAL - pending product-owner approval at the P0 gate. Not approved.
**Scope of this note:** Describes the workspace as found, the proposed stack and architecture, and the open decisions for the gate. No application code, package.json, wrangler configuration, Cloudflare resource, or remote service was created or changed.
**Authority:** PS5_REQUIREMENTS.md, PRD_LabhSaathi.md, PHASE_CONTROL.md, AGENTS.md, then skills. ADR-001 to ADR-006 in agent/DECISIONS.md are binding; ADR-007 (appended with this note) is a proposal.

---

## 1. Workspace inventory

**Workspace root:** contains only the harness folder `LabhSaathi_Agent_Harness/`.

**Harness contents (observed):**
- `PHASE_CONTROL.md` - delivery control, phases P0-P12 and gates.
- `AGENTS.md` - agent operating contract (authority order, always-on rules, workflow).
- `PS5_REQUIREMENTS.md` - working text reference for ACE BUILDERS Problem Statement 5.
- `PRD_LabhSaathi.md` - product requirements baseline (v1.0).
- `agent/DECISIONS.md` - architecture decision log, ADR-001 to ADR-006 before this note.
- `docs/SKILL_SOURCES.md`, `docs/UPSTREAM_SKILL_CATALOG.md` - skill source references.
- `AGENTS.md` and `PHASE_CONTROL.md` refer to `agent/SKILL_REGISTRY.md`, `agent/PHASE_LEDGER_TEMPLATE.md` and `skills/*/SKILL.md`. These were referenced but not inspected in this P0 documentation pass.

**Not present:**
- No application code (no src/, worker/, db/, tests/).
- No package.json, lockfile, tsconfig, Vite or Wrangler configuration.
- No git repository in the workspace root.
- No phase ledger yet (the P0 ledger is a later step after owner review of this baseline).

**Existing stack:** none. No framework, package manager or runtime is established, so there is no existing stack to preserve and no existing working feature to protect.

**Baseline commands:** typecheck, lint, test and build were NOT run. The P0 agent had no shell and the owner asked for no commands to be run. Baseline failures: none recorded, because nothing was executed. This must be run by a shell-capable agent before P1 (see section 10).

---

## 2. Proposed stack

| Layer | Proposal | Notes |
|---|---|---|
| Frontend | React + TypeScript + Vite | Single-page app; typed components. |
| Routing | React Router (lightweight) | Routes from P1: Intake, Matches, Scheme Detail, Checklist, Tracker, Admin Review. Acceptance is open decision 5. |
| Validation | Zod | Runtime validation at client and server boundaries. Version policy is open decision 6. |
| API client | Typed API client | Shared request/response types with the Worker API. |
| API | Hono on Cloudflare Workers | Routes under `/api/v1`. |
| Unit / integration tests | Vitest | With `@cloudflare/vitest-plugin` when Worker bindings are tested. |
| End-to-end tests | Playwright | Route smoke (P1), journeys (P11). |
| Cloudflare build target | `@cloudflare/vite-plugin` + Workers Static Assets | Proposed target only. NOT configured in P0 or P1. |

**Official references (proposal basis):**
- React on Workers guide: https://developers.cloudflare.com/workers/framework-guides/web-apps/react/
- Vite plugin: https://developers.cloudflare.com/workers/vite-plugin/
- Workers best practices: https://developers.cloudflare.com/workers/best-practices/workers-best-practices/
- D1 local development: https://developers.cloudflare.com/d1/best-practices/local-development/
- R2 local development: https://developers.cloudflare.com/r2/local-development/
- Vitest integration: https://developers.cloudflare.com/workers/testing/vitest-integration/

---

## 3. Architecture style

- **Style:** modular monolith. One deployable frontend and one API surface, organised by feature and domain module. No microservices.
- **Ports and adapters:** domain logic (eligibility, Sensitive-ID Shield, label mapping, fee state) depends only on port interfaces. Adapters implement them (local fixture-backed first, Cloudflare-backed later).
- **Ports:**
  - `SchemeRepository` - read/write scheme records and versions.
  - `SourceRegister` - source provenance, verification status and last-verified date.
  - `RuleRepository` - editable rule data; rules are data, not code.
  - `CitizenProfileStore` - browser IndexedDB adapter; the default and only profile store in MVP.
  - `AIProvider` - MockAIProvider only in MVP. Never decides eligibility.
  - `SearchProvider` - structured and keyword search first; semantic optional and never a source of eligibility status.
  - `SourceSnapshotStore` - R2-backed, future; not MVP.
  - `Clock` - injectable time for deadlines, verification ages and tests.
  - `RedactingLogger` - the only logger the app may use; redacts before output.

---

## 4. Storage

- **Phase P2-P5 (local adapter first):** fixture-backed local repositories behind the ports above. Scheme and rule data are versioned fixture files with source metadata.
- **Phase P3 onward:** a D1-compatible adapter with SQL migrations, introduced after owner approval of the storage decision.
- **Local engine choice (SQLite vs Wrangler local D1):** deferred to P3. Wrangler local D1 (SQLite-backed) is the preferred candidate, subject to stack-compatibility inspection in P3 as PHASE_CONTROL.md requires.
- **KV is never the authoritative store.** It may hold a rebuildable cache only.
- Migrations must run from a clean local database (P3 acceptance).

---

## 5. Cloudflare service mapping

| Service | MVP decision | Phase | Rationale |
|---|---|---|---|
| Workers | Target runtime for the Hono API. Local handler runs in P2. Remote deployment only in P12. | P2 (local), P12 (remote) | Matches the directive's Hono-on-Workers target. No remote resource before approval (ADR-001). |
| Workers Static Assets | Proposed target for the built SPA. Not configured in P1. | P12 | Keeps frontend hosting on the same Cloudflare target without configuring it early. |
| D1 | Target for the relational store via a D1-compatible adapter and SQL migrations. | P3 (local adapter and migrations), P12 (remote) | Relational scheme, version and source data. Local engine choice made in P3. |
| R2 | Not in MVP. Future store for permitted source snapshots only. | P12 | Only permitted public snapshots, with source, licence and access metadata (P12 acceptance). |
| Vectorize | Not in MVP unless a measured semantic-search gain justifies it. | P12 (conditional) | PHASE_CONTROL.md: add only if measured value justifies it. Keyword/structured search first. |
| Workers AI | Not used. MockAIProvider only. | P12 (conditional) | Requires data minimisation, provider boundary and cost checks first. |
| Queues | Not in MVP. | P12 (conditional) | Only if ingestion jobs require it. |
| Workflows | Not in MVP. | P12 (conditional) | Only if a multi-step ingestion process requires it. |
| KV | Optional, rebuildable cache only. Never authoritative. | P12 (optional) | Avoids stale or split truth. |
| Cron Triggers | Future source re-checks. Not MVP; no live government monitoring is claimed. | Post-P12 | Scheme Change Radar is demonstrated with controlled fixtures (P10). |
| Durable Objects | Not introduced. | - | No stateful coordination need identified. |

---

## 6. Directive-vs-phase reconciliation

**Directive:** build Cloudflare-ready code from the beginning.

**Constraints:**
- PHASE_CONTROL.md places Cloudflare configuration in P12, with separate written approval.
- ADR-001 forbids remote provisioning before a dedicated approved phase.
- AGENTS.md: develop locally first; never deploy or create Cloudflare resources without explicit approval.

**Resolution (proposed):**
- P0-P11 build local adapters behind the port interfaces in section 3, with Cloudflare-compatible boundaries (Workers-compatible handlers, D1-compatible SQL, R2-compatible snapshot interface).
- `wrangler.jsonc`, bindings, D1/R2 resources and deployment are deferred to P12, unless the owner approves an earlier configuration-only step.

**Open decision:** Cloudflare configuration timing (see section 11, item 3).

---

## 7. Proposed project structure

Created incrementally, per phase. None of these folders is created in P0.

```
src/
  app/
  routes/
  components/ui/
  components/layout/
  features/<feature>/
  domain/<area>/
  shared/
  styles/
worker/
  index.ts
  routes/v1/
  middleware/
  services/
  repositories/
  adapters/
  jobs/
db/
  migrations/
  seeds/
  fixtures/
tests/
  unit/
  integration/
  e2e/
  golden/
docs/
  architecture/
  api/
  deployment/
  decisions/
```

- The app sits at the workspace root beside `LabhSaathi_Agent_Harness/`.
- `worker/jobs` and `db/` are created only when first needed (`db/` in P3; `worker/jobs` only if ingestion jobs are approved).
- `docs/architecture` is created by this P0 note.

---

## 8. Environments

- **local** (default): no remote resources. All adapters are local.
- **staging** and **production**: planned as separate environments, each with its own D1 database and R2 bucket, with bindings declared explicitly per environment. Declared only at P12.
- **No identifiers are recorded here.** No database IDs, bucket IDs, account IDs or secrets are invented or stored in this repository. Secrets live outside source control (P12).

---

## 9. Privacy architecture

- **Citizen profile and tracker data:** stored in browser IndexedDB by default.
- **No server persistence of profiles.** The server does not store citizen profiles in MVP.
- **Eligibility API input:** only minimum validated, redacted, non-sensitive attributes.
- **Request bodies:** not stored and not logged.
- **Sensitive-ID Shield (ADR-004):** runs at the client boundary before local persistence or network send, and again at the server boundary before handlers, logging, queueing or AI/provider calls. Detects Aadhaar-like, PAN-like and configurable patterns, including formatted and space-separated forms. Raw blocked input is never placed in logs, errors, traces or test failure messages.
- **The product never asks for Aadhaar or PAN** (ADR-004; PHASE_CONTROL P2).
- **AI never decides eligibility.** The deterministic evaluator never calls AI (ADR-002).
- **Sample data only** for demo and tests; labelled as synthetic.

---

## 10. Testing strategy and package scripts

**Strategy:**
- Unit tests (Vitest): three-valued operators, label mapping, Shield patterns, fee state, checklist conditions.
- Golden tests (Vitest, `tests/golden`): six synthetic personas with expected labels and rule traces (P5).
- Integration tests (Vitest, with `@cloudflare/vitest-plugin` once Worker bindings are tested): API contract, repositories, migrations.
- End-to-end tests (Playwright): route smoke (P1), six persona journeys and privacy assertions (P11).
- Privacy assertions: downstream storage, logger and AI mocks receive only safe text (P2).

**Required package script names:**

| Script | Purpose | Introduced |
|---|---|---|
| `dev` | Local development server | P1 |
| `build` | Production build | P1 |
| `preview` | Preview production build locally | P1 |
| `typecheck` | TypeScript check | P1 |
| `lint` | Lint | P1 |
| `test` | Unit and golden tests (Vitest) | P1 |
| `test:integration` | Integration tests | P3 |
| `test:e2e` | Playwright end-to-end tests | P1 (route smoke) |
| `db:migrate:local` | Apply SQL migrations to the local database | P3 |
| `db:seed:local` | Load curated or synthetic seed data locally | P3 |
| `deploy:staging` | Deploy to staging | P12 only |
| `deploy:production` | Deploy to production | P12 only |

The deploy scripts are declared only at P12. They are not present in P0 or P1.

---

## 11. Open decisions for the P0 gate

1. **Stack approval:** approve or amend React + TypeScript + Vite, React Router, Zod, typed API client, Hono on Workers, Vitest, Playwright.
2. **Storage adapter timing:** approve fixture-backed local adapters for P2-P5 and a D1-compatible adapter with SQL migrations from P3, with the local engine choice (SQLite vs Wrangler local D1) made in P3.
3. **Cloudflare configuration timing:** confirm that `wrangler.jsonc`, bindings and D1/R2 resources wait for P12, or approve a configuration-only step earlier. No remote provisioning either way without approval.
4. **Client persistence:** raw IndexedDB vs a thin wrapper library. Proposal: a thin, owned wrapper behind `CitizenProfileStore`, to be decided in P4 when profile persistence is first built.
5. **React Router acceptance:** approve React Router (lightweight) for P1 routing.
6. **Zod version policy:** pin a major version and upgrade only by deliberate change. Version to be chosen at P1 install time, which requires shell access.

---

**Document status:** P0 proposal. Not approved. No phase has been approved. The P0 phase ledger (DONE_PENDING_APPROVAL) is written only after the owner reviews this note and the baseline checks in section 1 are run by a shell-capable agent.
