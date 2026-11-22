---
name: skill-authoring-and-evaluation
description: Use when creating, revising, registering or testing a LabhSaathi agent skill so the instructions remain focused, discoverable, portable and behaviorally useful.
---

# Skill Authoring and Evaluation

## Purpose
Create skills that reliably change agent behavior for a specific LabhSaathi workflow. A skill is a procedural playbook, not a second product specification or a large context dump.

## Authoring workflow
1. Identify the repeated task or failure that justifies a skill.
2. Define explicit activation triggers: when the agent should read the skill and when it should not.
3. Identify the expected input, preconditions, authoritative project references and output contract.
4. Write concise YAML frontmatter with a unique lowercase hyphenated `name` and a clear `description`.
5. Keep the main `SKILL.md` focused on the procedure. Put long schemas, examples or reference material in linked `references/` files only when needed.
6. Include LabhSaathi constraints relevant to the skill: PS5, phase gates, privacy, source provenance, fixed likelihood labels, three-valued evaluation and local-first development.
7. Include a clear stop condition and a completion checklist.
8. Register the skill in `agent/SKILL_REGISTRY.md` with activation guidance.
9. Add at least two realistic prompt scenarios to `evals/skill-evals.json`.
10. Validate frontmatter, folder/name match, file length, registry entry and evaluation entries.

## Evaluation workflow
1. Create realistic pressure prompts that combine a normal request with at least one likely shortcut or conflict.
2. Run the prompt without the new skill if the environment allows; record the baseline behavior without exposing secrets.
3. Run the same scenario with the skill active.
4. Compare whether the agent follows the intended procedure, handles uncertainty and respects phase/safety boundaries.
5. Revise the skill if it is too broad, triggers too often, omits an edge case or produces unnecessary work.
6. Do not claim a skill is behaviorally validated merely because YAML parses or prompts exist.

## Quality requirements
- One clear purpose per skill.
- Description states when it should activate.
- Actionable steps, not vague aspirations.
- Specific LabhSaathi examples and guardrails.
- No copied third-party text unless reuse is licensed and attribution obligations are met.
- No hidden instructions, exfiltration behavior, destructive automation or permission escalation.
- No claim that Nexen automatically loads skills unless verified in the IDE.
- Prefer progressive disclosure: load registry/metadata at startup and full skill body only when relevant.

## Skill review checklist
- [ ] Unique name matches the containing folder.
- [ ] YAML frontmatter parses.
- [ ] Description is useful for activation.
- [ ] Procedure is bounded and testable.
- [ ] Authority and safety constraints are explicit.
- [ ] At least two realistic eval prompts exist.
- [ ] Registry and docs are updated.
- [ ] Nexen behavior has been tested or is explicitly marked untested.

## Example
**Weak:** "Be careful when working with scheme data."

**Better:** "Open the official scheme source, record its URL and date checked, extract candidate rules, mark them pending review, and do not activate them until a reviewer approves the structured record."

## Common failure modes
- Creating one giant skill that tries to control all development.
- Duplicating the PRD in every skill.
- Adding generic prompts that do not test the skill's main trigger.
- Marking a skill as validated based only on static format checks.
- Adding too many always-loaded instructions and defeating progressive disclosure.

## Completion report
State the skill created/changed, trigger, files changed, eval prompts added, format checks, behavior test performed (or not performed), and known limitations.

## References and provenance
This is an original LabhSaathi-specific skill informed by public Agent Skills and skill-authoring workflow documentation; no third-party skill body is copied. See `../../docs/SKILL_SOURCES.md`.
