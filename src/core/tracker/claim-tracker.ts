/**
 * Claim Tracker, Renewal Calendar & WhatsApp Sharing (P8)
 * Implements FR-TRK-01 through FR-TRK-07, FR-SEC-08, ADR-005.
 *
 * Local-first: Uses browser localStorage with memory fallback.
 * Privacy safe: Never persists sensitive identifiers.
 */

import { SchemeRecord } from '../data/schema';
import { sanitizeSharePayload } from '../privacy/sensitive-id-shield';

export type ClaimStage = 'preparing' | 'ready_to_apply' | 'applied' | 'under_verification' | 'disbursed';

export interface TrackedClaim {
  id: string;
  schemeId: string;
  schemeName: string;
  officialPortalUrl: string;
  savedAt: string; // ISO date
  stage: ClaimStage;
  completedDocumentIds: string[];
  applicationReferenceNumber?: string;
  notes?: string;
  renewalWindow?: string;
  academicYear?: string;
}

export interface RenewalCalendarEvent {
  schemeId: string;
  schemeName: string;
  academicYear: string;
  windowDescription: string;
  status: 'upcoming' | 'open_now' | 'closing_soon' | 'completed';
  officialSourceUrl: string;
  mandatoryRequirements: string[];
}

export class ClaimTrackerService {
  private storageKey = 'labhsaathi_tracked_claims_v1';
  private claims: Map<string, TrackedClaim> = new Map();

  constructor() {
    this.loadFromStorage();
  }

  private loadFromStorage(): void {
    if (typeof window !== 'undefined' && window.localStorage) {
      try {
        const raw = window.localStorage.getItem(this.storageKey);
        if (raw) {
          const list: TrackedClaim[] = JSON.parse(raw);
          list.forEach((c) => this.claims.set(c.schemeId, c));
        }
      } catch {
        // Fallback to in-memory map
      }
    }
  }

  private saveToStorage(): void {
    if (typeof window !== 'undefined' && window.localStorage) {
      try {
        const list = Array.from(this.claims.values());
        window.localStorage.setItem(this.storageKey, JSON.stringify(list));
      } catch {
        // Safe ignore
      }
    }
  }

  getClaims(): TrackedClaim[] {
    return Array.from(this.claims.values());
  }

  getClaim(schemeId: string): TrackedClaim | undefined {
    return this.claims.get(schemeId);
  }

  isSaved(schemeId: string): boolean {
    return this.claims.has(schemeId);
  }

  saveScheme(scheme: SchemeRecord, academicYear = '2026-27'): TrackedClaim {
    const existing = this.claims.get(scheme.id);
    if (existing) return existing;

    const claim: TrackedClaim = {
      id: `claim_${scheme.id}_${Date.now()}`,
      schemeId: scheme.id,
      schemeName: scheme.name,
      officialPortalUrl: scheme.sources[0]?.portalUrl || '',
      savedAt: new Date().toISOString(),
      stage: 'preparing',
      completedDocumentIds: [],
      renewalWindow: scheme.renewalWindow,
      academicYear,
    };

    this.claims.set(scheme.id, claim);
    this.saveToStorage();
    return claim;
  }

  updateStage(schemeId: string, stage: ClaimStage, applicationReferenceNumber?: string): TrackedClaim | undefined {
    const claim = this.claims.get(schemeId);
    if (!claim) return undefined;

    claim.stage = stage;
    if (applicationReferenceNumber) {
      claim.applicationReferenceNumber = applicationReferenceNumber;
    }
    this.saveToStorage();
    return claim;
  }

  toggleDocumentCompletion(schemeId: string, docId: string): TrackedClaim | undefined {
    const claim = this.claims.get(schemeId);
    if (!claim) return undefined;

    const index = claim.completedDocumentIds.indexOf(docId);
    if (index >= 0) {
      claim.completedDocumentIds.splice(index, 1);
    } else {
      claim.completedDocumentIds.push(docId);
    }

    this.saveToStorage();
    return claim;
  }

  removeClaim(schemeId: string): boolean {
    const deleted = this.claims.delete(schemeId);
    if (deleted) {
      this.saveToStorage();
    }
    return deleted;
  }

  getRenewalCalendarEvents(schemes: SchemeRecord[]): RenewalCalendarEvent[] {
    const events: RenewalCalendarEvent[] = [];

    for (const scheme of schemes) {
      if (scheme.renewalSupported && scheme.renewalWindow) {
        events.push({
          schemeId: scheme.id,
          schemeName: scheme.name,
          academicYear: '2026-27',
          windowDescription: scheme.renewalWindow,
          status: 'open_now',
          officialSourceUrl: scheme.sources[0]?.portalUrl || '',
          mandatoryRequirements: scheme.documents
            .filter((d) => d.requirementType === 'mandatory')
            .map((d) => d.name),
        });
      }
    }

    return events;
  }

  generateWhatsAppShareUrl(scheme: SchemeRecord, customNote?: string): {
    url: string;
    text: string;
  } {
    const sanitizedText = sanitizeSharePayload({
      schemeName: scheme.name,
      officialPortalUrl: scheme.sources[0]?.portalUrl || '',
      checklistItems: scheme.documents.map((d) => `${d.name} (${d.requirementType})`),
      notes: customNote,
    });

    const encoded = encodeURIComponent(sanitizedText);
    const url = `https://wa.me/?text=${encoded}`;

    return {
      url,
      text: sanitizedText,
    };
  }
}

export const defaultClaimTrackerService = new ClaimTrackerService();
