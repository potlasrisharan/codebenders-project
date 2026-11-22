---
name: implementation-planning
description: Use after an approved design to break a LabhSaathi feature into small, verifiable tasks with exact files, tests and rollback notes.
---

# Implementation Planning

## Purpose
Produce an implementation plan that another coding agent can follow without guessing.

## Planning procedure
1. Read PRD, active phase and relevant skill/reference files.
2. Inspect existing architecture, naming patterns and tests before proposing file changes.
3. State the feature goal and non-goals.
4. Identify dependencies and data contracts.
5. Split work into small sequential tasks. Each task should change one coherent behavior and have a checkable result.
6. For behavior changes, put tests before implementation in the task sequence.
7. Name likely files/modules, but verify paths against the workspace.
8. Include migration/compatibility impact and failure states.
9. Specify test, typecheck, lint, build and manual verification commands that actually exist.
10. Add rollback or safe-disable strategy.

## Plan header
- Goal
- Architecture
- Tech stack observed
- PRD/phase reference
- Global constraints
- Assumptions
- Risks

## Task format
For each task specify: action, files, expected behavior, test-first step, implementation step, verification command and completion evidence.

## LabhSaathi-specific checks
- Include Sensitive-ID Shield impacts whenever text input, persistence, logs, analytics, share or AI provider code is touched.
- Include rule/source version and unknown-state behavior whenever eligibility or scheme data is touched.
- Reuse canonical eligibility service for Near-Match and What-If.
- No Cloudflare remote resources in local phases.

## Keep plans economical
Prefer the simplest implementation that satisfies the approved requirement. Do not introduce a new dependency or additional agent unless the benefit is clear and approved.

## References and provenance
This is an original LabhSaathi-specific playbook. It uses the portable Agent Skills structure and is informed by publicly documented workflow concepts; it is not a verbatim copy of any third-party skill. See `../../docs/SKILL_SOURCES.md` for attribution and source links.
