---
name: sensitive-id-shield
description: Use whenever user text, profile intake, API requests, logs, analytics, persistence, uploads, sharing or AI calls could contain identity numbers.
---

# Sensitive Id Shield

## Purpose
Prevent sensitive identity identifiers from entering LabhSaathi's stored or transmitted data. The product must not ask for Aadhaar/PAN or other unnecessary sensitive IDs.

## Threat boundary
The shield must operate at both:
1. Client boundary, before local persistence, analytics, network request or AI call.
2. Server/API boundary, before request-body logging, storage, queueing, analytics or provider invocation.

A client-only filter is insufficient because requests can bypass the UI.

## Detection
- Detect Aadhaar-like 12-digit sequences, including common spacing/hyphen formatting.
- Detect PAN-like patterns (for example, the common 10-character letter/digit structure) without claiming the identifier is authentic.
- Maintain configurable patterns for other high-risk identifiers when the product owner approves them.
- Avoid collecting or scanning unrelated files unless upload functionality is explicitly approved; the hackathon MVP should not accept identity documents.

## Processing contract
1. Receive text into a short-lived in-memory boundary handler.
2. Detect sensitive patterns before any side effect.
3. If detected, block or redact the matching content.
4. Do not persist, log, trace, send to analytics, enqueue or call AI with the raw content.
5. Return a safe warning: "This looks like a sensitive identity number. LabhSaathi does not need it. Please remove it and describe your situation without the number."
6. Allow a safe retry.

## Logging rules
- Never log the raw request body by default.
- Never include matched substring, prefix/suffix, checksum or a reversible hash in telemetry.
- Log only that a pattern class was detected and a redaction/block occurred, with no identifier value.
- Ensure test failure output does not print the fixture secret.

## False positives
A 12-digit sequence may not be Aadhaar. Explain that it resembles a sensitive identifier; do not assert authenticity. Provide an alternative path for ordinary text that accidentally triggered a block, while still not forwarding the suspected value.

## Acceptance tests
- Compact and formatted Aadhaar-like fixture blocked.
- PAN-like fixture blocked.
- Benign profile text allowed.
- Client and server independently enforce.
- Storage/logger/analytics/AI mocks receive no raw value.
- WhatsApp share excludes identity patterns.
- Error and debug output contain only safe metadata.

## Do not
- attempt to validate a real person's ID;
- ask the user to enter the identifier to check eligibility;
- retain raw blocked data for support/debugging;
- rely on regex as proof an identifier is genuine.

## References and provenance
This is an original LabhSaathi-specific playbook. It uses the portable Agent Skills structure and is informed by publicly documented workflow concepts; it is not a verbatim copy of any third-party skill. See `../../docs/SKILL_SOURCES.md` for attribution and source links.
