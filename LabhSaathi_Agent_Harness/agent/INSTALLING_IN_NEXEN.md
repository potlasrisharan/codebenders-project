# Installing the LabhSaathi Harness in Codebenders Nexen

This guide uses only capabilities visible or inferable from the Nexen Agent Builder screenshot. Exact import behavior can vary by Codebenders version; verify the available controls in your workspace rather than assuming a command exists.

## A. Prepare the workspace

1. Extract `LabhSaathi_Agent_Harness.zip` into the Codebenders workspace root.
2. Confirm these files are visible at the root: `AGENTS.md`, `PS5_REQUIREMENTS.md`, `PRD_LabhSaathi.md`, `PHASE_CONTROL.md`, `FEATURE_BACKLOG.md`.
3. Keep the full `agent/`, `skills/`, `evals/` and `docs/` folders in the workspace.
4. Make sure the PS5 source PDF is available to Nexen as a reference if the workspace does not already contain it.

## B. Create the lead agent

In Nexen > Agents > New agent:

- Name: `labhsaathi-lead-architect`
- Description: `Lead product architect and senior engineering coordinator for LabhSaathi. Plans, implements and verifies one approved phase at a time using a local-first architecture with future Cloudflare migration.`
- System prompt: paste `agent/NEXEN_SYSTEM_PROMPT.md` (the prompt text after its introductory line).
- Scope: `This workspace`.
- Model: inherit/default to begin with.
- Max turns: use a bounded setting for planning and implementation tasks (e.g. 12-16); raise only for a clearly scoped task.
- Capabilities: enable repository read, edit and shell equivalents that Nexen actually provides.
- Network: leave disabled until a specific approved task needs public-source research or package installation.

Do not grant Cloudflare account deployment/provisioning access during P0-P11.

## C. Register the skills

The bundle contains 28 portable Agent Skills folders. Each folder contains a `SKILL.md` with YAML frontmatter (`name` and `description`) and task instructions.

1. Open Nexen's Skills area.
2. Use its available create/import mechanism for one skill at a time.
3. Start with the six bootstrap skills listed below.
4. Use the exact skill folder name as its name and paste the corresponding `SKILL.md` content if Nexen asks for text.
5. If Nexen supports folder-based skill import, import the full skill folder rather than flattening it; this preserves room for future references/scripts.
6. If Nexen does not automatically discover project skills, attach `agent/SKILL_REGISTRY.md` and tell the lead agent which skill files it should read for the current task.

### Six bootstrap skills

- `product-discovery`
- `ps5-requirements-guardian`
- `phase-gate-controller`
- `implementation-planning`
- `local-first-architecture`
- `credit-aware-execution`

The full registry and activation matrix are in `agent/SKILL_REGISTRY.md`.

## D. Attach project references

Use Nexen's reference/bundled-file control, if available, to attach:

- `AGENTS.md`
- `PS5_REQUIREMENTS.md`
- `PRD_LabhSaathi.md`
- `PHASE_CONTROL.md`
- `FEATURE_BACKLOG.md`
- `agent/SKILL_REGISTRY.md`
- `agent/PHASE_LEDGER_TEMPLATE.md`

If it cannot attach directories, attach these files individually. Keep the source files in the workspace as well.

## E. Start the agent

Open the agent chat and paste `agent/BOOTSTRAP_PROMPT.md`. This begins P0 discovery only. It explicitly prohibits implementation, mass ingestion and Cloudflare provisioning until the owner approves the plan.

## F. Owner approval sequence

1. Review P0 report and proposed stack.
2. Approve P1 only after confirming the existing project can be safely changed.
3. Approve each phase separately using its acceptance report.
4. Do not approve P2 until the Sensitive-ID Shield test proves no raw sensitive fixture reaches storage/logging/AI mocks.
5. Do not approve P5 until the rule engine, fixed labels and six golden personas pass.
6. Do not approve P11 until all P0/PS5 checks pass.
7. Do not start P12 until P11 is accepted and Cloudflare provisioning/deployment is explicitly authorised.

## Compatibility note

The skill format is portable, but Nexen's exact skill activation and import mechanism may differ from other coding-agent clients. This package does not assume that a Claude Code plugin command or another agent's CLI is available inside Codebenders.
