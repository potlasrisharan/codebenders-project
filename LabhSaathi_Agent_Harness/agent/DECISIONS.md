# Architecture Decision Log

## ADR-001 — Local-first, Cloudflare-ready architecture

**Status:** Proposed baseline  
**Decision:** Implement local adapters first and place persistence, file storage, search, AI and scheduling behind interfaces.  
**Reason:** The product owner wants to develop locally, then migrate to their Cloudflare account later without a rewrite.  
**Consequences:** Avoid coupling feature logic directly to a hosted provider. Keep migrations portable. Do not provision remote Cloudflare resources until a dedicated approved phase.

## ADR-002 — Three-valued deterministic eligibility

**Status:** Accepted product constraint  
**Decision:** Rule predicates return `true`, `false` or `unknown`; an LLM cannot independently decide eligibility.  
**Reason:** Missing citizen information must not be mistaken for a failed condition, and rule evaluation must be auditable/reproducible.  
**Consequences:** All search, Near-Match and What-If results consume one canonical engine and trace.

## ADR-003 — Fixed public likelihood labels

**Status:** Accepted product constraint  
**Decision:** Use only `Likely eligible`, `Need to confirm`, `Unlikely`, `Can't tell yet` for citizen-facing result statuses.  
**Consequences:** Central enum/label mapping and automated forbidden-word tests are required.

## ADR-004 — Sensitive identifiers are not product data

**Status:** Accepted product constraint  
**Decision:** Detect Aadhaar-like, PAN-like and configurable identifier patterns at client and server boundaries before persistence/logging/AI. Do not solicit these identifiers.  
**Consequences:** Input filtering must precede any side effect. Do not retain raw blocked values in diagnostics.

## ADR-005 — Source-backed fee language

**Status:** Accepted product constraint  
**Decision:** Show "Official application is free" only with authoritative evidence of no fee. Use verified fee or "Fee information not verified" otherwise.  
**Consequences:** Fee status requires its own source/provenance fields.

## ADR-006 — One Unified Eligibility Action Graph

**Status:** Accepted product constraint  
**Decision:** Combine Benefit Action Graph and Eligibility Explanation Graph into one component.  
**Consequences:** Graph is a rendering of canonical engine/workflow state, not a second logic engine.

## ADR-007 — Proposed: React/Vite/TypeScript frontend with Hono on Cloudflare Workers, local-first storage adapters

**Status:** PROPOSED — PENDING OWNER APPROVAL (P0 gate). Not accepted.  
**Decision (proposed):** Frontend in React + TypeScript + Vite with React Router, Zod validation and a typed API client. API in Hono on Cloudflare Workers under `/api/v1`, Vitest and Playwright for tests. Storage through ports: fixture-backed local adapters for P2-P5, then a D1-compatible adapter with SQL migrations from P3 after approval. KV is never authoritative. Cloudflare configuration and bindings are deferred to P12 per ADR-001.  
**Reason:** Matches the directive's Cloudflare target while keeping every resource local until a separate approval, as PHASE_CONTROL.md requires.  
**Consequences:** No package.json, wrangler configuration or remote resource is created by this ADR. Local engine choice (SQLite vs Wrangler local D1) is deferred to P3. Full baseline in `docs/architecture/P0_ARCHITECTURE_BASELINE.md`.

