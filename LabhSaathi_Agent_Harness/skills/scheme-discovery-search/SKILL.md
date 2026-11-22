---
name: scheme-discovery-search
description: Use when building scheme search, filtering, ranking, category browsing, semantic retrieval and Near-Match discovery.
---

# Scheme Discovery Search

## Purpose
Retrieve relevant candidate schemes while keeping retrieval relevance separate from eligibility.

## Search pipeline
1. Validate the minimal profile and pilot jurisdiction.
2. Apply deterministic filters for scheme status, scope, geography and category.
3. Use text/full-text search for natural-language intent.
4. Optionally add semantic retrieval behind a provider interface when useful.
5. Deduplicate candidates by stable scheme ID/version.
6. Run each candidate through the canonical three-valued eligibility engine.
7. Rank for presentation using transparent relevance signals (jurisdiction match, category relevance, source quality/freshness and user intent).
8. Display fixed likelihood label and evidence trace.

## Separation of concerns
A search score means "possibly relevant to the query". It does not mean a citizen satisfies any legal condition. Vector similarity must never override rule results. Do not generate a likely match from an unapproved scheme record.

## Near-Match
Near-Match is a view over canonical evaluation traces. It may highlight a scheme with mostly satisfied predicates and a small number of unknown conditions, but must not invent a percentage or imply a probability unless a validated method exists. Explain exactly which conditions remain unknown or unmet.

## Output
Candidate set, filters applied, ranking rationale, rule evaluation labels, excluded candidates and reason.

## Tests
Jurisdiction, out-of-scope schemes, inactive schemes, duplicates, unknown attributes, unverified rules, semantically similar but legally irrelevant results and source-quality ranking.

## References and provenance
This is an original LabhSaathi-specific playbook. It uses the portable Agent Skills structure and is informed by publicly documented workflow concepts; it is not a verbatim copy of any third-party skill. See `../../docs/SKILL_SOURCES.md` for attribution and source links.
