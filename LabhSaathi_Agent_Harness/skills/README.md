# LabhSaathi Skills

These are 29 original skills tailored to the LabhSaathi product and its phased development harness. Every skill has an individual folder containing `SKILL.md` with Agent Skills-style YAML frontmatter.

## Bootstrap first
1. product-discovery
2. ps5-requirements-guardian
3. phase-gate-controller
4. implementation-planning
5. local-first-architecture
6. credit-aware-execution

## Add on demand
Use `agent/SKILL_REGISTRY.md` to activate specialist skills by task. Do not load all 28 skill bodies into the system prompt at once; load only metadata/registry at startup and read the relevant `SKILL.md` when needed (progressive disclosure).

The exact Nexen skill import workflow must be confirmed in the IDE. Portable format does not guarantee automatic skill discovery in every agent client.


Skill maintenance: use `skill-authoring-and-evaluation` when adding or revising skill folders.
