# Upstream Skill Catalog and Adaptation Map

This project ships original LabhSaathi-specific skills. It does not bundle verbatim third-party `SKILL.md` bodies. Use the following public projects as optional upstream learning sources; verify their current license and client compatibility before importing actual upstream files.

| Public source | Useful upstream skill/pattern | LabhSaathi adaptation |
|---|---|---|
| [agentskills/agentskills](https://github.com/agentskills/agentskills) | Portable folder format, metadata, progressive disclosure | All 28 project skills use `skills/<name>/SKILL.md` with YAML `name` and `description`. |
| [anthropics/skills](https://github.com/anthropics/skills) | Skill-creator anatomy, procedural instructions, supporting references and evaluation prompts | Project-specific skill authoring, registry and initial eval prompts. |
| [obra/superpowers](https://github.com/obra/superpowers) | Brainstorming before code, writing plans, TDD, systematic debugging, review and verification | `product-discovery`, `implementation-planning`, `test-driven-development`, `systematic-debugging`, `code-review`, `verification-before-completion`, `phase-gate-controller`. |
| [obra/superpowers writing-plans](https://github.com/obra/superpowers/tree/main/skills/writing-plans) | Small tasks with explicit verification | Feature-level task contract and phase-specific acceptance checks. |
| [obra/superpowers verification-before-completion](https://github.com/obra/superpowers/tree/main/skills/verification-before-completion) | Evidence before completion claims | Mandatory fresh command output and gate evidence. |
| [obra/superpowers systematic-debugging](https://github.com/obra/superpowers/tree/main/skills/systematic-debugging) | Reproduce, isolate, hypothesise, fix and prevent | Debug workflow with LabhSaathi privacy and eligibility trace checks. |
| [obra/superpowers writing-skills](https://github.com/obra/superpowers/tree/main/skills/writing-skills) and Anthropic skill-creator | Skill authoring, metadata and evaluation patterns | `skill-authoring-and-evaluation` and the project skill eval prompts. |

## Why upstream files are not copied here

The package uses publicly documented formats and workflow concepts, then authors original skills specific to LabhSaathi. This avoids assuming every upstream file has the same license, platform compatibility or fit for Nexen. If you later want to install an upstream skill verbatim, inspect the individual license and use its official installation path where available.
