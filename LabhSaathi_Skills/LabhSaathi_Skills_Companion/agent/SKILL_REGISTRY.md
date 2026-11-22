# LabhSaathi Skill Registry

Skills are original LabhSaathi-specific playbooks using the portable Agent Skills folder convention. They are informed by public conventions and workflow ideas from `agentskills/agentskills`, `anthropics/skills` and `obra/superpowers`; they are not copied repository files.

## Mandatory activation map

| Situation | Activate skills |
|---|---|
| New feature/product change | `product-discovery`, `ps5-requirements-guardian`, `phase-gate-controller`, `implementation-planning`, `local-first-architecture`, `credit-aware-execution` |
| Any code change | `test-driven-development`, `verification-before-completion`, `code-review` |
| Bug/failure | `systematic-debugging`, then `test-driven-development`, `verification-before-completion` |
| Citizen input/AI call | `sensitive-id-shield`, `conversational-intake-accessibility`, `privacy-and-public-service-safety` |
| Scheme/source/rule data | `scheme-data-curation`, `source-verification-versioning`, `eligibility-engine` |
| Search/recommendations | `scheme-discovery-search`, `eligibility-engine` |
| Documents/application | `document-readiness-application-workflow`, `middleman-shield-fee-transparency` |
| Renewal/reminders/share | `academic-renewal-calendar`, `whatsapp-checklist-sharing` |
| Graph/simulator/radar | `unified-eligibility-action-graph`, `eligibility-engine`, `scheme-change-radar` |
| UI design | `citizen-experience-design` |
| Data/schema work | `data-modeling-migrations`, `scheme-data-curation` |
| Cloudflare work (later only) | `cloudflare-migration-readiness`, `verification-before-completion` |
| Demo/testing | `synthetic-personas-golden-tests`, `demo-readiness` |
| Credit-heavy task | `credit-aware-execution` |
| Create or revise a skill | `skill-authoring-and-evaluation` |

## Skill inventory

1. `product-discovery`
2. `ps5-requirements-guardian`
3. `phase-gate-controller`
4. `implementation-planning`
5. `test-driven-development`
6. `systematic-debugging`
7. `verification-before-completion`
8. `code-review`
9. `local-first-architecture`
10. `data-modeling-migrations`
11. `scheme-data-curation`
12. `source-verification-versioning`
13. `eligibility-engine`
14. `sensitive-id-shield`
15. `privacy-and-public-service-safety`
16. `conversational-intake-accessibility`
17. `scheme-discovery-search`
18. `document-readiness-application-workflow`
19. `middleman-shield-fee-transparency`
20. `academic-renewal-calendar`
21. `whatsapp-checklist-sharing`
22. `unified-eligibility-action-graph`
23. `scheme-change-radar`
24. `citizen-experience-design`
25. `cloudflare-migration-readiness`
26. `synthetic-personas-golden-tests`
27. `demo-readiness`
28. `credit-aware-execution`
29. `skill-authoring-and-evaluation`

## Loading guidance

Load only the skills relevant to the current task, plus always-on repository rules in `AGENTS.md`. Do not concatenate every skill into the agent prompt. Skill folders may be imported individually or attached as bundled references. Keep any long implementation recipes in separate reference files where useful.
