# LabhSaathi Agent Harness

A phase-controlled product and coding-agent harness for the ACE BUILDERS 2026 PS5 pilot.

## Start here
1. Read `PRD_LabhSaathi.md`.
2. Read `PS5_REQUIREMENTS.md`, then `PHASE_CONTROL.md` (PDF companion: `LabhSaathi_Phase_Control.pdf`).
3. Read `AGENTS.md`.
4. Follow `agent/INSTALLING_IN_NEXEN.md` and paste `agent/NEXEN_SYSTEM_PROMPT.md` into the lead agent.
5. Use `agent/BOOTSTRAP_PROMPT.md` as the first chat task.
6. Import/attach skill folders from `skills/*/SKILL.md` using Nexen's supported skill workflow.
7. Begin **P0 only**. Wait for product-owner approval before P1.

## Contents
- `PRD_LabhSaathi.md` — product requirements and system constraints.
- `PS5_REQUIREMENTS.md` — self-contained reference to the supplied PS5 brief, separated from product decisions.
- `PHASE_CONTROL.md` — detailed phase sequence, acceptance criteria and gates.
- `LabhSaathi_Phase_Control.pdf` — printable phase control companion.
- `AGENTS.md` — always-on agent operating contract.
- `agent/` — Nexen system prompt, install guide, bootstrap, skill registry, phase ledger and decisions.
- `skills/` — 29 original LabhSaathi-specific Agent Skills (`SKILL.md`).
- `evals/skill-evals.json` — two initial prompts per skill for harness validation.
- `docs/SKILL_SOURCES.md` and `docs/UPSTREAM_SKILL_CATALOG.md` — public sources and adaptation notes.
- `FEATURE_BACKLOG.md` — P0/P1/P2 prioritisation.

## Compatibility
Skills use the standard folder + `SKILL.md` + YAML `name`/`description` convention. Nexen may require importing each skill or adding it to a workspace registry; do not assume automatic discovery.

## Important
LabhSaathi is designed for users across India with state-aware discovery. The hackathon demo focuses on low-income college students in Telangana; the interface must disclose actual verified state/category coverage and never claim complete nationwide coverage prematurely. All scheme facts must be sourced and reviewed. Use synthetic profiles only. Do not deploy Cloudflare until P12 and explicit owner approval.

## Skills count
29 skills are included.
