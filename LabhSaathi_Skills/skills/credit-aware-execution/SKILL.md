---
name: credit-aware-execution
description: Use before large or repetitive Nexen operations to reduce Codebenders credit waste and protect the remaining project budget.
---

# Credit Aware Execution

## Purpose
Make progress measurable and avoid uncontrolled agent loops. The reported 16M credits are a finite resource; never consume them simply because they are available.

## Before work
1. Confirm the current phase and owner approval.
2. State the bounded task and expected output.
3. Inspect relevant files before asking the model to reread broad context.
4. Prefer targeted file reads, local scripts, deterministic checks and cached results.
5. Identify whether a remote AI/network action is truly needed.
6. If Nexen displays usage, record the starting value; do not fabricate a cost estimate.

## During work
- Use one lead agent by default.
- Avoid overlapping agents or repeated broad repository scans.
- Batch related source checks where safe.
- Reuse validated extraction outputs and embeddings when inputs are unchanged.
- Use mock AI for deterministic tests.
- Stop repeated retries after diagnosing the failure.
- Keep tasks small and report progress at phase checkpoints.

## Before expensive operations
Ask the product owner before mass scheme ingestion, large-scale embedding, whole-codebase rewrites, long autonomous runs, repeated remote inference or Cloudflare provisioning.

## Budget protection
If remaining credits are constrained, preserve P0 PS5 requirements, privacy controls, golden tests and demo hardening. Defer P2 and optional P1 features first. Never quote exact remaining credits unless read from the IDE.

## Report
Task, reason, local/remote operations, actual usage if visible, outputs, cache/reuse, failures and next bounded action.

## References and provenance
This is an original LabhSaathi-specific playbook. It uses the portable Agent Skills structure and is informed by publicly documented workflow concepts; it is not a verbatim copy of any third-party skill. See `../../docs/SKILL_SOURCES.md` for attribution and source links.
