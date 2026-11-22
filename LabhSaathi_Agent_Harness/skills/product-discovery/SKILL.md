---
name: product-discovery
description: Use before proposing or changing a LabhSaathi feature to clarify user problem, PS5 fit, scope, assumptions and measurable outcomes.
---

# Product Discovery

## Purpose
Turn an ambiguous request into an agreed product decision before implementation. LabhSaathi is a public-benefit navigation product, not a generic chatbot.

## Workflow
1. Read the relevant PRD section and current phase scope.
2. Identify the user, situation, job-to-be-done, current failure and desired outcome.
3. Map the request to PS5 requirements: plain-language input; explainable matching; checklist and application steps; reminders/tracking; official source and last-verified date.
4. Identify whether the request is P0, P1 or P2. Do not promote a future feature into the active phase without owner approval.
5. Write assumptions explicitly. Distinguish confirmed PS5 statements, product decisions and hypotheses.
6. Define one measurable user outcome and acceptance criteria.
7. Identify dependencies, data sources, privacy implications, failure states and excluded scope.
8. Present a short design note and wait for owner approval if the change alters product scope, data collection, external services or phase order.

## Required output
- User problem and intended outcome.
- PS5/PRD requirement mapping.
- Proposed solution and why it is preferable to a simpler option.
- In-scope and out-of-scope behaviour.
- Data/source dependencies.
- Privacy and accessibility implications.
- Acceptance criteria and risks.
- Phase recommendation.

## LabhSaathi constraints
- Never define success as "the AI answered"; define a citizen task completed or clarified.
- Preserve one-state/one-population hackathon pilot: low-income college students in Telangana.
- The future national architecture is not permission to claim nationwide coverage now.
- Do not assume an official scheme rule, fee, portal or deadline. Mark unknowns for research/review.

## Do not
- Jump directly into code.
- Expand scope because a feature sounds impressive.
- convert a user idea into a guaranteed eligibility or application claim.
- invent stakeholder research, user counts or measured impact.

## Completion check
A developer can implement the feature without having to guess the product outcome, boundaries or acceptance test.

## References and provenance
This is an original LabhSaathi-specific playbook. It uses the portable Agent Skills structure and is informed by publicly documented workflow concepts; it is not a verbatim copy of any third-party skill. See `../../docs/SKILL_SOURCES.md` for attribution and source links.
