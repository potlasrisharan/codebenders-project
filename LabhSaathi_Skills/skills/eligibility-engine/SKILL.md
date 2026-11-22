---
name: eligibility-engine
description: Use when implementing or changing LabhSaathi eligibility rules, fixed labels, Near-Match, What-If or predicate explanations.
---

# Eligibility Engine

## Purpose
Make eligibility reproducible, inspectable and conservative. This is the only authoritative rule evaluation engine.

## Three-valued domain
Each predicate evaluates to exactly one of:
- `true`: available evidence satisfies the condition.
- `false`: available evidence establishes the condition is not satisfied.
- `unknown`: missing, ambiguous or explicitly "I don't know".

AND: any false → false; all true → true; otherwise unknown.  
OR: any true → true; all false → false; otherwise unknown.  
NOT: true ↔ false; unknown remains unknown.

## Evaluation workflow
1. Load an approved scheme version and verified rule tree.
2. Validate rule shape and supported operators.
3. Read only required non-sensitive profile attributes.
4. Evaluate predicates without an LLM.
5. Preserve a trace: predicate ID, rule version, attribute key, input state (not unnecessary raw values), output, source, effective period and explanation.
6. Check source/rule integrity separately from citizen attribute completeness.
7. Apply the centrally defined label precedence.
8. Return the result and trace; do not infer application approval.

## Fixed public labels
- `Likely eligible`: every mandatory condition is true and source/rule integrity is sufficient.
- `Need to confirm`: the rule is trustworthy but one or more required citizen attributes are unknown.
- `Unlikely`: a verified mandatory condition is false.
- `Can't tell yet`: source, rule, jurisdiction interpretation or supported operator is missing, stale, conflicting or otherwise unsafe to evaluate.

Use the precedence defined in the PRD. Keep it in one central mapping and test mixed states.

## Question contract
Every missing required attribute can produce a concise question, an explicit `I don't know` option and a one-line `Why we ask this` explanation. Do not ask for attributes that no active pilot rule uses.

## Reuse contract
Scheme search, Near-Match, What-If and Action Graph all consume the same evaluator output. Do not create feature-specific eligibility calculations.

## Prohibited behavior
- LLM deciding or overriding predicates.
- treating missing as false.
- using semantic similarity as proof.
- displaying bare "eligible", "guaranteed" or "approved".
- evaluating unreviewed rule extraction as active policy.

## Tests
Cover operators, boundary values, missing data, unknown answer, mixed false/unknown, unsupported operator, stale source, source conflict, rule version, four labels and all six golden personas.

## References and provenance
This is an original LabhSaathi-specific playbook. It uses the portable Agent Skills structure and is informed by publicly documented workflow concepts; it is not a verbatim copy of any third-party skill. See `../../docs/SKILL_SOURCES.md` for attribution and source links.
