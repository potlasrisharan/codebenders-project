/**
 * Scheme Data Foundation & Provenance Schema (P3)
 * Implements FR-DATA-01 through FR-DATA-11, ADR-003, ADR-005.
 */

import { z } from 'zod';

export const JurisdictionTypeSchema = z.enum(['central', 'state', 'district']);
export type JurisdictionType = z.infer<typeof JurisdictionTypeSchema>;

export const VerificationStatusSchema = z.enum(['verified', 'draft', 'pending_review', 'stale']);
export type VerificationStatus = z.infer<typeof VerificationStatusSchema>;

export const FeeStatusSchema = z.enum(['free_verified', 'fee_verified', 'unknown']);
export type FeeStatus = z.infer<typeof FeeStatusSchema>;

export const CoverageStatusSchema = z.enum(['covered', 'partial', 'not_yet_verified']);
export type CoverageStatus = z.infer<typeof CoverageStatusSchema>;

export const LikelihoodLabelSchema = z.enum([
  'Likely eligible',
  'Need to confirm',
  'Unlikely',
  "Can't tell yet",
]);
export type LikelihoodLabel = z.infer<typeof LikelihoodLabelSchema>;

export const DocumentRequirementTypeSchema = z.enum(['mandatory', 'conditional', 'optional']);
export type DocumentRequirementType = z.infer<typeof DocumentRequirementTypeSchema>;

export const SchemeSourceSchema = z.object({
  id: z.string(),
  name: z.string(),
  department: z.string(),
  portalUrl: z.string().url(),
  lastVerifiedDate: z.string(), // ISO format YYYY-MM-DD
  verifiedBy: z.string(),
  documentReference: z.string().optional(),
});
export type SchemeSource = z.infer<typeof SchemeSourceSchema>;

export const SchemeDocumentSchema = z.object({
  id: z.string(),
  name: z.string(),
  description: z.string(),
  requirementType: DocumentRequirementTypeSchema,
  conditionExplanation: z.string().optional(),
  issuingAuthority: z.string(),
  sourceEvidence: z.string(),
});
export type SchemeDocument = z.infer<typeof SchemeDocumentSchema>;

export const ApplicationStepSchema = z.object({
  stepNumber: z.number().int().positive(),
  title: z.string(),
  description: z.string(),
  portalUrl: z.string().url().optional(),
  channel: z.enum(['online_portal', 'meeseva_csc', 'college_cell', 'district_office']),
});
export type ApplicationStep = z.infer<typeof ApplicationStepSchema>;

export const RuleOperatorSchema = z.enum([
  'EQUALS',
  'IN',
  'LESS_THAN_OR_EQUAL',
  'GREATER_THAN_OR_EQUAL',
  'BETWEEN',
  'BOOLEAN',
]);
export type RuleOperator = z.infer<typeof RuleOperatorSchema>;

export const RulePredicateSchema = z.object({
  id: z.string(),
  parameter: z.string(), // e.g. "state", "educationLevel", "familyIncome", "attendance"
  operator: RuleOperatorSchema,
  expectedValue: z.union([z.string(), z.number(), z.boolean(), z.array(z.string()), z.array(z.number())]),
  isMandatory: z.boolean(),
  conditionName: z.string(),
  sourceClause: z.string(),
});
export type RulePredicate = z.infer<typeof RulePredicateSchema>;

export const SchemeCategorySchema = z.union([
  z.enum([
    'scholarship',
    'education_aid',
    'fellowship',
    'welfare',
    'agriculture',
    'healthcare',
    'housing',
    'women_child',
    'employment',
    'social_security',
    'skills_msme',
  ]),
  z.string(),
]);
export type SchemeCategory = z.infer<typeof SchemeCategorySchema>;

export const SchemeRecordSchema = z.object({
  id: z.string(),
  slug: z.string(),
  name: z.string(),
  shortDescription: z.string(),
  fullDescription: z.string().optional(),
  category: SchemeCategorySchema,
  jurisdiction: JurisdictionTypeSchema,
  state: z.string(), // e.g. "Telangana", "All India", "Assam"
  department: z.string().optional(),
  ministry: z.string().optional(),
  portalUrl: z.string().optional(),
  version: z.string(),
  verificationStatus: VerificationStatusSchema,
  lastVerifiedDate: z.string(),
  sources: z.array(SchemeSourceSchema).min(1),
  feeStatus: FeeStatusSchema,
  feeDetails: z.string().optional(),
  renewalSupported: z.boolean(),
  renewalWindow: z.string().optional(), // e.g. "August to November (Academic Year)"
  documents: z.array(SchemeDocumentSchema),
  applicationSteps: z.array(ApplicationStepSchema),
  rules: z.array(RulePredicateSchema),
  scamWarning: z.string(),
});
export type SchemeRecord = z.infer<typeof SchemeRecordSchema>;

export const StateCoverageItemSchema = z.object({
  stateCode: z.string(),
  stateName: z.string(),
  coverageStatus: CoverageStatusSchema,
  schemeCount: z.number().int().nonnegative(),
  lastAuditDate: z.string(),
  notes: z.string(),
});
export type StateCoverageItem = z.infer<typeof StateCoverageItemSchema>;
