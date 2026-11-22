---
name: phase-gate-controller
description: Use at phase start, checkpoint and completion to enforce one-phase-at-a-time delivery, owner approval and evidence-based gates.
---

# Phase Gate Controller

## Purpose
Keep implementation phase-by-phase and feature-by-feature. The product owner, not the agent, approves phase transitions.

## Workflow
1. Read the current phase from `PHASE_CONTROL.md` and the phase ledger.
2. Confirm the previous phase is `APPROVED` and only one phase is `IN_PROGRESS`.
3. Confirm scope, prerequisites, tasks, acceptance criteria and explicit exclusions.
4. If no approval exists, perform planning/reporting only; do not implement.
5. During the phase, reject unrelated scope and add it to the backlog.
6. At the end, collect test output, screenshots, source register updates, changed-file list, privacy review and known limitations.
7. Set `DONE_PENDING_APPROVAL`; present a concise gate report.
8. Wait for explicit owner approval before the next phase.

## State semantics
- `NOT_STARTED`: no work.
- `IN_PROGRESS`: explicitly approved work.
- `BLOCKED`: missing source, permission, fact or capability.
- `DONE_PENDING_APPROVAL`: technical evidence is complete; owner decision pending.
- `APPROVED`: owner accepted the gate.

## Gate report
- Phase and objective.
- Completed tasks.
- Acceptance criterion-by-criterion status.
- Exact verification commands and actual results.
- Changed files.
- Open defects and limitations.
- Privacy/data/source findings.
- Credit usage if actually exposed by Nexen.
- Recommendation: approve, fix or block.

## Do not
- Auto-advance after tests pass.
- Mark a failed criterion as passed because a workaround exists.
- Start two phases concurrently.
- Treat code generation or screen rendering as acceptance proof.

## Completion check
The phase ledger is complete and the product owner has made an explicit decision.

## References and provenance
This is an original LabhSaathi-specific playbook. It uses the portable Agent Skills structure and is informed by publicly documented workflow concepts; it is not a verbatim copy of any third-party skill. See `../../docs/SKILL_SOURCES.md` for attribution and source links.
