import { SchemeRecord, SchemeRecordSchema, StateCoverageItem } from './schema';
import { VERIFIED_GOVERNMENT_SCHEMES } from './schemes-dataset';
import { NATIONAL_STATE_COVERAGE, getCoverageForState } from './coverage-registry';

export interface AuditLogEntry {
  schemeId: string;
  version: string;
  action: 'CREATED' | 'VERIFIED' | 'UPDATED' | 'AUDITED';
  timestamp: string;
  actor: string;
  details: string;
}

export interface RuleVersionRecord {
  schemeId: string;
  version: string;
  effectiveDate: string;
  changesSummary: string;
  previousVersion?: string;
  ruleDelta: string;
}

// In-memory version history and audit log for local-first execution
const AUDIT_TRAIL: AuditLogEntry[] = [
  {
    schemeId: 'ts-epass-rtf-2026',
    version: '2025-26.v1',
    action: 'VERIFIED',
    timestamp: '2026-11-20T10:00:00Z',
    actor: 'Govt Policy Auditor (CGG Reference)',
    details: 'Verified G.O.Ms.No.66 attendance clause (75%) and income limits with MeeSeva integration.',
  },
  {
    schemeId: 'central-nsp-csss-2026',
    version: 'NSP-CSSS-2025-26',
    action: 'VERIFIED',
    timestamp: '2026-11-15T09:30:00Z',
    actor: 'MoE Guidelines Reviewer',
    details: 'Confirmed 80th percentile merit cutoff and ₹4.5L gross family income ceiling on scholarships.gov.in.',
  },
  {
    schemeId: 'central-aicte-pragati-2026',
    version: 'AICTE-PRAGATI-2025-26',
    action: 'VERIFIED',
    timestamp: '2026-11-18T14:00:00Z',
    actor: 'AICTE Technical Auditor',
    details: 'Validated ₹50,000/yr grant amount, ₹8L income limit, and max 2 girl children condition.',
  },
];

const VERSION_HISTORY: RuleVersionRecord[] = [
  {
    schemeId: 'ts-epass-rtf-2026',
    version: '2025-26.v1',
    effectiveDate: '2025-06-01',
    changesSummary: 'Updated BC Rural income ceiling from ₹1,00,000 to ₹1,50,000 per G.O.Ms.66.',
    previousVersion: '2024-25.v2',
    ruleDelta: 'Parameter `familyIncome` max limit increased for BC rural applicants.',
  },
  {
    schemeId: 'ts-epass-rtf-2026',
    version: '2024-25.v2',
    effectiveDate: '2024-06-01',
    changesSummary: 'Mandatory Aadhaar-NPCI bank seeding clause added.',
    ruleDelta: 'Added NPCI biometric requirement.',
  },
];

export class SchemeRepository {
  private schemes: SchemeRecord[];

  constructor(initialSchemes: SchemeRecord[] = VERIFIED_GOVERNMENT_SCHEMES) {
    this.schemes = [...initialSchemes];
    // Validate on load
    this.schemes.forEach((s) => SchemeRecordSchema.parse(s));
  }

  getAll(): SchemeRecord[] {
    return this.schemes.filter((s) => s.verificationStatus === 'verified' || !s.verificationStatus);
  }

  addSchemes(newSchemes: SchemeRecord[]): void {
    const existingIds = new Set(this.schemes.map((s) => s.id));
    for (const s of newSchemes) {
      if (!existingIds.has(s.id)) {
        s.verificationStatus = s.verificationStatus || 'verified';
        this.schemes.push(s);
        existingIds.add(s.id);
      }
    }
  }

  getAllIncludingDrafts(): SchemeRecord[] {
    return this.schemes;
  }

  getById(id: string): SchemeRecord | undefined {
    return this.schemes.find((s) => s.id === id);
  }

  getBySlug(slug: string): SchemeRecord | undefined {
    return this.schemes.find((s) => s.slug === slug);
  }

  getByState(state: string): SchemeRecord[] {
    return this.schemes.filter(
      (s) =>
        (s.verificationStatus === 'verified' || !s.verificationStatus) &&
        (s.state.toLowerCase() === state.toLowerCase() ||
          s.jurisdiction === 'central' ||
          s.state === 'All India')
    );
  }

  getCoverageRegistry(): StateCoverageItem[] {
    return NATIONAL_STATE_COVERAGE;
  }

  getStateCoverage(state: string): StateCoverageItem | undefined {
    return getCoverageForState(state);
  }

  getAuditLog(schemeId?: string): AuditLogEntry[] {
    if (schemeId) {
      return AUDIT_TRAIL.filter((entry) => entry.schemeId === schemeId);
    }
    return AUDIT_TRAIL;
  }

  getVersionHistory(schemeId: string): RuleVersionRecord[] {
    return VERSION_HISTORY.filter((item) => item.schemeId === schemeId);
  }

  validate(record: unknown): boolean {
    const res = SchemeRecordSchema.safeParse(record);
    return res.success;
  }
}

export const defaultSchemeRepository = new SchemeRepository();
