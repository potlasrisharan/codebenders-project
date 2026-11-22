/**
 * Scheme Discovery & Near-Match Service (P6)
 * Implements FR-SEARCH-01 through FR-SEARCH-06, ADR-002, ADR-003.
 *
 * Guarantees:
 * 1. Search ranking CANNOT decide or override deterministic eligibility.
 * 2. Every result carries an official P5 canonical trace and fixed likelihood label.
 * 3. Near-Match identifies candidates where exactly 1 condition is unmet or unknown.
 */

import { SchemeRecord } from '../data/schema';
import { SchemeRepository, defaultSchemeRepository } from '../data/repository';
import { CitizenProfile } from '../profile/citizen-profile';
import { evaluateSchemeEligibility, EligibilityResult } from '../engine/eligibility-engine';

export interface NearMatchInsight {
  isNearMatch: boolean;
  deltaCondition?: string;
  advice?: string;
}

export interface DiscoveredSchemeItem {
  scheme: SchemeRecord;
  eligibility: EligibilityResult;
  nearMatch: NearMatchInsight;
  relevanceScore: number;
}

export interface DiscoveryQuery {
  state?: string;
  category?: string;
  keyword?: string;
  includeUnlikely?: boolean;
}

export class DiscoveryService {
  constructor(private repo: SchemeRepository = defaultSchemeRepository) {}

  discover(profile: CitizenProfile, query: DiscoveryQuery = {}): {
    items: DiscoveredSchemeItem[];
    coverageNotice?: string;
    totalSchemesConsidered: number;
  } {
    const targetState = query.state || profile.domicileState || 'All India';
    const stateCoverage = this.repo.getStateCoverage(targetState);

    // Get candidate schemes filtered by state/central jurisdiction (or All India nationwide)
    let candidates = this.repo.getByState(targetState);

    // Apply category filter if requested
    if (query.category) {
      candidates = candidates.filter((s) => s.category === query.category);
    }

    // Apply keyword search if provided
    if (query.keyword && query.keyword.trim().length > 0) {
      const kw = query.keyword.toLowerCase().trim();
      candidates = candidates.filter(
        (s) =>
          s.name.toLowerCase().includes(kw) ||
          s.shortDescription.toLowerCase().includes(kw) ||
          s.rules.some((r) => r.conditionName.toLowerCase().includes(kw))
      );
    }

    // Evaluate canonical eligibility for every candidate scheme
    const evaluatedItems: DiscoveredSchemeItem[] = candidates.map((scheme) => {
      const eligibility = evaluateSchemeEligibility(scheme, profile);

      // Analyze for Near-Match: exactly 1 failed condition
      const failedTraces = eligibility.predicateTraces.filter((t) => t.isMandatory && t.result === 'false');
      const unknownTraces = eligibility.predicateTraces.filter((t) => t.isMandatory && t.result === 'unknown');

      let nearMatch: NearMatchInsight = { isNearMatch: false };

      if (failedTraces.length === 1 && unknownTraces.length === 0) {
        const failedCondition = failedTraces[0];
        nearMatch = {
          isNearMatch: true,
          deltaCondition: failedCondition.conditionName,
          advice: `You meet all other conditions! If your "${failedCondition.conditionName}" changes (${failedCondition.sourceClause}), you would be Likely eligible.`,
        };
      } else if (failedTraces.length === 0 && unknownTraces.length === 1) {
        const unk = unknownTraces[0];
        nearMatch = {
          isNearMatch: true,
          deltaCondition: unk.conditionName,
          advice: `Provide confirmation for "${unk.conditionName}" to move from "Need to confirm" to "Likely eligible".`,
        };
      }

      // Compute transparent relevance score
      let relevanceScore = 0;
      if (eligibility.overallLabel === 'Likely eligible') relevanceScore += 100;
      else if (eligibility.overallLabel === 'Need to confirm') relevanceScore += 60;
      else if (eligibility.overallLabel === "Can't tell yet") relevanceScore += 30;
      else relevanceScore += 10;

      if (scheme.state.toLowerCase() === targetState.toLowerCase()) {
        relevanceScore += 20; // Exact state match
      } else if (scheme.jurisdiction === 'central') {
        relevanceScore += 15; // National scheme
      }

      if (nearMatch.isNearMatch) {
        relevanceScore += 15;
      }

      return {
        scheme,
        eligibility,
        nearMatch,
        relevanceScore,
      };
    });

    // Filter out unlikely if query requests hiding
    let filtered = evaluatedItems;
    if (query.includeUnlikely === false) {
      filtered = evaluatedItems.filter((i) => i.eligibility.overallLabel !== 'Unlikely');
    }

    // Sort by relevance score descending
    filtered.sort((a, b) => b.relevanceScore - a.relevanceScore);

    let coverageNotice: string | undefined;
    if (stateCoverage && stateCoverage.coverageStatus !== 'covered') {
      coverageNotice =
        stateCoverage.coverageStatus === 'partial'
          ? `Data for ${stateCoverage.stateName} is partially verified (${stateCoverage.schemeCount} scheme(s) cataloged). More official state orders are undergoing review.`
          : `Official data coverage for ${stateCoverage.stateName} is not yet verified in this release. Central/All-India schemes are shown above.`;
    }

    return {
      items: filtered,
      coverageNotice,
      totalSchemesConsidered: candidates.length,
    };
  }
}

export const defaultDiscoveryService = new DiscoveryService();
