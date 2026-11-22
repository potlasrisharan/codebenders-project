# Skill Format and Methodology Sources

The LabhSaathi skills in this package are original project-specific instructions. They are not copied from third-party repositories. The following public projects informed the format and process patterns:

1. **Agent Skills specification** — https://github.com/agentskills/agentskills
   - Portable folder-per-skill structure with `SKILL.md`, YAML metadata and optional supporting resources.
   - Progressive disclosure: discover by metadata, load full instructions when triggered, read supporting resources only as needed.

2. **Anthropic Skills repository / skill-creator** — https://github.com/anthropics/skills/tree/main/skills/skill-creator
   - Skill anatomy, concise metadata, imperative instructions, scoped bundled resources and practical skill evaluations.

3. **obra/superpowers** — https://github.com/obra/superpowers
   - Workflow sequencing: discovery/brainstorming before design, small implementation plans, TDD, systematic debugging, review and verification before completion.

4. **obra/superpowers writing-plans skill** — https://github.com/obra/superpowers/tree/main/skills/writing-plans
   - Small tasks with explicit files, implementation actions and verification steps.

## Adaptations for LabhSaathi
- Added PS5-specific traceability and one-population/one-state pilot constraints.
- Added public-service safety, source provenance, fee transparency and anti-middleman rules.
- Added a deterministic three-valued eligibility model and fixed citizen-facing likelihood labels.
- Added Sensitive-ID Shield requirements for pre-storage/pre-log/pre-AI boundaries.
- Added local-first development and delayed Cloudflare migration controls.
- Added phase gates with explicit human approval and credit-aware execution.

## Licensing note
These skills are newly authored text. They do not include copied skill bodies or third-party code. Follow the linked repositories' own licenses if you later decide to import their actual files into your project.
