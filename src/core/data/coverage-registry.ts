import { StateCoverageItem } from './schema';

export const NATIONAL_STATE_COVERAGE: StateCoverageItem[] = [
  {
    stateCode: 'TS',
    stateName: 'Telangana',
    coverageStatus: 'covered',
    schemeCount: 4,
    lastAuditDate: '2026-11-20',
    notes: 'Pilot cohort (College Students in Telangana) fully verified with official ePASS & department rules.',
  },
  {
    stateCode: 'PAN',
    stateName: 'All India (Central)',
    coverageStatus: 'covered',
    schemeCount: 3,
    lastAuditDate: '2026-11-18',
    notes: 'National Scholarship Portal (NSP) and AICTE central schemes cataloged and verified.',
  },
  {
    stateCode: 'AP',
    stateName: 'Andhra Pradesh',
    coverageStatus: 'partial',
    schemeCount: 1,
    lastAuditDate: '2026-11-10',
    notes: 'Jagananna Vidya Deevena & Vasathi Deevena cataloged; awaiting rule parity review.',
  },
  {
    stateCode: 'KA',
    stateName: 'Karnataka',
    coverageStatus: 'partial',
    schemeCount: 1,
    lastAuditDate: '2026-11-10',
    notes: 'State Scholarship Portal (SSP) post-matric metadata present; verification in progress.',
  },
  {
    stateCode: 'MH',
    stateName: 'Maharashtra',
    coverageStatus: 'partial',
    schemeCount: 1,
    lastAuditDate: '2026-11-08',
    notes: 'MahaDBT post-matric scholarship cataloged; detailed rule criteria pending.',
  },
  {
    stateCode: 'TN',
    stateName: 'Tamil Nadu',
    coverageStatus: 'not_yet_verified',
    schemeCount: 0,
    lastAuditDate: '2026-11-01',
    notes: 'State welfare scheme data has not been fully verified against official Gazettes yet.',
  },
  {
    stateCode: 'KL',
    stateName: 'Kerala',
    coverageStatus: 'not_yet_verified',
    schemeCount: 0,
    lastAuditDate: '2026-11-01',
    notes: 'Department regulations pending legal review.',
  },
  {
    stateCode: 'UP',
    stateName: 'Uttar Pradesh',
    coverageStatus: 'not_yet_verified',
    schemeCount: 0,
    lastAuditDate: '2026-11-01',
    notes: 'UP Scholarship portal rules pending automated ingestion audit.',
  },
];

export function getCoverageForState(stateName: string): StateCoverageItem | undefined {
  return NATIONAL_STATE_COVERAGE.find(
    (item) => item.stateName.toLowerCase() === stateName.toLowerCase()
  );
}
