---
name: unified-eligibility-action-graph
description: Use when building or modifying the single graph that joins eligibility explanations with document and claim actions.
---

# Unified Eligibility Action Graph

## Purpose
Provide one visual, inspectable journey from profile facts to next actions. This replaces separate Benefit Action Graph and Eligibility Explanation Graph components.

## Graph model
Profile → Scheme → Eligibility Conditions → Documents → Application → Follow-up.

## State model
- `satisfied`: source-backed predicate evaluates true.
- `not_satisfied`: verified predicate evaluates false.
- `unknown`: citizen attribute/condition is unknown.
- `action_pending`: a checklist/application task remains.
- `not_applicable`: conditional node does not apply, with rule trace.
- `evidence_unavailable`: source/rule integrity prevents safe explanation.

## Workflow
1. Consume canonical eligibility traces and claim-task state.
2. Map trace/task records to display nodes; do not calculate eligibility in the graph component.
3. Display node label, status, source, last-verified date and short explanation.
4. On selection, reveal the exact rule/condition and the reason for its state.
5. Provide a linear/list fallback for small screens and assistive technologies.
6. Distinguish hypothetical What-If view from saved citizen state.
7. Keep graph updates deterministic when profile, source or task version changes.

## Visual guidance
Use restrained visual status cues plus text/icon labels; do not rely on colour alone. Avoid graph clutter. Provide a clear "next useful action" and show unknown states visibly.

## Acceptance
Graph nodes reconcile with the canonical engine and tracker for every golden persona. There is one reusable graph component and no second copy of eligibility logic.

## References and provenance
This is an original LabhSaathi-specific playbook. It uses the portable Agent Skills structure and is informed by publicly documented workflow concepts; it is not a verbatim copy of any third-party skill. See `../../docs/SKILL_SOURCES.md` for attribution and source links.
