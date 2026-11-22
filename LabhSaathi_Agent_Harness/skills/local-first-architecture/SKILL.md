---
name: local-first-architecture
description: Use when designing or changing persistence, backend, file storage, search, AI and scheduling so LabhSaathi works locally and can later move to Cloudflare.
---

# Local First Architecture

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
- pretend local AI is available if the chosen binding calls a remote service.

## References and provenance
This is an original LabhSaathi-specific playbook. It uses the portable Agent Skills structure and is informed by publicly documented workflow concepts; it is not a verbatim copy of any third-party skill. See `../../docs/SKILL_SOURCES.md` for attribution and source links.
