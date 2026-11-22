---
name: whatsapp-checklist-sharing
description: Use when generating user-initiated WhatsApp checklist shares via a wa.me URL without an API integration.
---

# Whatsapp Checklist Sharing

## Purpose
Make it easy to share public guidance with family while preventing accidental disclosure of private profile information.

## Workflow
1. Build share text from an explicit allow-list: scheme name, public checklist item labels, generic application steps, official portal link and source/verification note.
2. Do not include the user's name, profile, income, date of birth, phone, identifiers, conversation transcript, eligibility trace or application status.
3. Run Sensitive-ID Shield / sensitive-content checks on the final text.
4. URL-encode the text for `https://wa.me/?text=...`.
5. Show the exact preview in the UI.
6. Require an explicit user click to open WhatsApp.
7. Make clear the product opens a share composer; it does not send a message automatically.

## Failure handling
If the payload is too long, offer a shorter checklist or printable summary. If no safe official link exists, omit it and label the source gap. Do not use a third-party URL shortener.

## Tests
- Encoding/decoding round trip.
- Sensitive profile attributes absent.
- Aadhaar/PAN-like test fixtures absent.
- User click required; no auto-navigation on render.
- Only approved public content included.

## References and provenance
This is an original LabhSaathi-specific playbook. It uses the portable Agent Skills structure and is informed by publicly documented workflow concepts; it is not a verbatim copy of any third-party skill. See `../../docs/SKILL_SOURCES.md` for attribution and source links.
