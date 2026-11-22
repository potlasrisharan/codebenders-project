---
name: cloudflare-migration-readiness
description: Use only in the separately approved Cloudflare migration phase after the local implementation has passed its acceptance gates.
---

# Cloudflare Migration Readiness

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
- make Vectorize the eligibility database.

## References and provenance
This is an original LabhSaathi-specific playbook. It uses the portable Agent Skills structure and is informed by publicly documented workflow concepts; it is not a verbatim copy of any third-party skill. See `../../docs/SKILL_SOURCES.md` for attribution and source links.
