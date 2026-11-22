---
name: privacy-and-public-service-safety
description: Use for data collection, retention, consent, profile storage, analytics, assisted access, sharing and public-service trust decisions.
---

# Privacy And Public Service Safety

## Privacy principles
1. Minimise: collect only attributes required by approved pilot rules.
2. Explain: state why each attribute is requested.
3. Respect uncertainty: offer "I don't know" where appropriate.
4. Protect: Sensitive-ID Shield before any side effect.
5. Separate: public scheme data must not be mixed with private profile data or public embeddings.
6. Control: provide review, correction and deletion controls when profile persistence exists.
7. Avoid exposure: no personal profile data in public URLs, share links, analytics or demo screenshots.

## Workflow
- Build a data inventory: attribute, purpose, source, required/optional, storage, retention and deletion path.
- Review every new field for necessity.
- Review every new external provider for what data it receives.
- Review logs, crash reports, browser storage, URL parameters, exports and WhatsApp payloads.
- Use synthetic personas for demos and tests.
- Use consent-bound access if an assisted/NGO mode is introduced.

## Safety language
- LabhSaathi is independent guidance, not a government authority.
- It cannot approve, accelerate or guarantee benefits.
- Users should apply through the official portal/department.
- Scam warnings must be factual and avoid accusing named services without evidence.

## Required review output
Data flow, minimised fields, provider boundaries, retention/deletion plan, threat scenarios, mitigations and test evidence.

## Stop conditions
Stop if a feature requires real sensitive identity data, unapproved data sharing, secret exposure, uncontrolled public access or misleading authority claims.

## References and provenance
This is an original LabhSaathi-specific playbook. It uses the portable Agent Skills structure and is informed by publicly documented workflow concepts; it is not a verbatim copy of any third-party skill. See `../../docs/SKILL_SOURCES.md` for attribution and source links.
