# ACE BUILDERS Hackathon 2026 — Problem Statement 5

**Track:** Citizens and Public Services  
**Challenge title:** Claim What's Yours  
**Source:** Problem Statement 5 PDF supplied by the product owner in this conversation.

This file is a working text reference extracted from the supplied one-page PS5 brief. The original PDF remains the primary source if exact wording or layout needs to be checked.

## The Problem

India has hundreds of central and state schemes offering scholarships, pensions, health cover, housing support and farm benefits. Many eligible families never claim them. Information is scattered across websites and notices, eligibility rules are hard to read, the document list is unclear, and people end up depending on middlemen who charge for help that should be free.

## Who It Is For

Choose **one specific group of people likely to miss out, in one state**. Examples in the brief include:

- students from low-income families;
- senior citizens;
- small farmers;
- women entrepreneurs;
- daily-wage worker families.

LabhSaathi is intended for users across India with state-aware discovery. The hackathon demonstration focuses on low-income college students in Telangana to make the PS5 target cohort concrete. This is a product decision, not wording supplied by the PS5 brief. The initial verified dataset is not a claim of complete coverage for every Indian state.

## Your Challenge

Build a product where a person describes their situation in plain language, and it tells them which schemes they are likely to qualify for and why, which documents they need, and exactly how to apply and follow up.

## Your Solution Must Include

1. **Plain-language input:** typed or spoken; regional language if possible; not a long form.
2. **Eligibility matching with reasoning:** which schemes fit and which rule each match is based on.
3. **Personalised document checklist and application guide:** required documents and step-by-step instructions.
4. **Deadline reminders and application tracking:** help prevent actions from lapsing.
5. **Official sources and verification date:** every scheme linked to its official source, with the date it was last verified.

## Guardrails

- The product says **"likely eligible"**, never **"guaranteed"**.
- Do not collect Aadhaar numbers or other sensitive ID details.
- Use only publicly available scheme information.
- Store scheme rules as editable data because they change often.
- Test only with sample profiles.

## Questions to Get You Thinking

- How do you help a person who does not know which details matter?
- How does the product stay accurate when scheme rules change?
- Who pays: NGOs, CSR funds, banks, local service centres or state governments?

## LabhSaathi implementation decisions that go beyond the source brief

These are product decisions or design recommendations, not additional text from PS5:

- Use three-valued eligibility (`true`, `false`, `unknown`) and an explicit `I don't know` answer.
- Use four fixed citizen-facing labels: `Likely eligible`, `Need to confirm`, `Unlikely`, `Can't tell yet`.
- Implement Sensitive-ID Shield detection before storage, logging, analytics and AI/provider calls.
- Show fee statements only when supported by official evidence; otherwise mark the fee unverified.
- Provide a preview-first WhatsApp checklist share.
- Test six synthetic student personas with golden expected rule traces.
- Add an academic-year renewal calendar only when scheme renewal dates/windows are sourced.
- Merge the Benefit Action Graph and Eligibility Explanation Graph into one component.
- Keep Rejection Recovery, full NGO dashboard and Benefit Passport out of the MVP.

Do not silently represent these product decisions as explicit PS5 judging requirements.
