---
name: conversational-intake-accessibility
description: Use when designing the conversational profile intake, adaptive questions, language support, voice input and uncertainty handling.
---

# Conversational Intake Accessibility

## Purpose
Help someone who does not know which details matter without forcing a long form or pretending to understand uncertain facts.

## Conversation design
1. Begin with a short explanation of the service and its limitations.
2. Invite a brief natural-language description.
3. Run Sensitive-ID Shield before AI or storage.
4. Extract only fields needed by approved pilot rules.
5. Show extracted values for user review and correction.
6. Ask one focused follow-up at a time.
7. Include `I don't know` for factual questions where uncertainty is reasonable.
8. Include `Why we ask this` in simple language for every question.
9. Store unknown explicitly; never guess from unrelated context.
10. Stop asking once sufficient data exists for useful discovery.

## Accessibility
- Prefer short sentences and familiar wording.
- Offer Telugu and English in the pilot where the chosen model/content quality supports them.
- Preserve scheme names and key legal terms while explaining them simply.
- Do not assume literacy, smartphone familiarity or stable network.
- Keep typing as a complete baseline; voice is an enhancement.
- Make question, answer and error states keyboard/screen-reader accessible.

## AI boundary
AI may parse language into candidate profile fields and draft an explanation. Validate its output against a schema and allowed field list. Do not pass sensitive identifiers or whole conversation histories unnecessarily. AI cannot decide eligibility.

## Acceptance
A synthetic user can explain a situation naturally, review the extracted profile, choose "I don't know", understand why follow-ups are asked and continue without a long form.

## References and provenance
This is an original LabhSaathi-specific playbook. It uses the portable Agent Skills structure and is informed by publicly documented workflow concepts; it is not a verbatim copy of any third-party skill. See `../../docs/SKILL_SOURCES.md` for attribution and source links.
