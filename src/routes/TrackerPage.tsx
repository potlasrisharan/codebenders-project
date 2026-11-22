import { useState } from 'react';
import { Link } from 'react-router-dom';
import {
  Activity,
  Calendar,
  AlertCircle,
  ExternalLink,
  Plus,
} from 'lucide-react';
import { defaultClaimTrackerService, ClaimStage } from '../core/tracker/claim-tracker';
import { defaultSchemeRepository } from '../core/data/repository';
import { defaultWhatIfService } from '../core/simulator/what-if-service';
import { Card } from '../components/ui/Card';
import { Button } from '../components/ui/Button';

export function TrackerPage() {
  const [claims, setClaims] = useState(() => {
    const list = defaultClaimTrackerService.getClaims();
    if (list.length === 0) {
      // Auto-save pilot scheme if empty so user experiences active tracker immediately
      const defaultScheme = defaultSchemeRepository.getById('ts-epass-rtf-2026');
      if (defaultScheme) {
        defaultClaimTrackerService.saveScheme(defaultScheme);
        return defaultClaimTrackerService.getClaims();
      }
    }
    return list;
  });

  const allSchemes = defaultSchemeRepository.getAll();
  const renewalEvents = defaultClaimTrackerService.getRenewalCalendarEvents(allSchemes);
  const radarAlerts = defaultWhatIfService.getReassessmentAlerts(claims.map((c) => c.schemeId));

  const handleStageChange = (schemeId: string, newStage: ClaimStage) => {
    defaultClaimTrackerService.updateStage(schemeId, newStage);
    setClaims([...defaultClaimTrackerService.getClaims()]);
  };

  const handleRefNumberChange = (schemeId: string, ref: string) => {
    defaultClaimTrackerService.updateStage(schemeId, claims.find((c) => c.schemeId === schemeId)?.stage || 'applied', ref);
    setClaims([...defaultClaimTrackerService.getClaims()]);
  };

  return (
    <div className="stack tracker-page max-w-4xl mx-auto py-4 px-2">
      <div className="flex flex-col sm:flex-row sm:items-center justify-between border-b pb-3 gap-2">
        <div>
          <h1 className="text-2xl font-bold text-slate-900 flex items-center gap-2">
            <Activity className="w-6 h-6 text-indigo-600" aria-hidden="true" />
            Tracker
          </h1>
          <p className="text-sm text-slate-600 mt-1">
            Track application progress, prevent lapsed deadlines, and monitor academic-year renewals.
          </p>
        </div>

        <Link
          to="/matches"
          className="text-xs px-3 py-2 bg-indigo-600 text-white font-semibold rounded hover:bg-indigo-700 inline-flex items-center gap-1.5"
        >
          <Plus className="w-3.5 h-3.5" /> Track Another Scheme
        </Link>
      </div>

      {/* Scheme Change Radar Alert Banner if government orders changed (P10) */}
      {radarAlerts.length > 0 && (
        <Card className="p-3.5 bg-amber-50/70 border-amber-300">
          <div className="flex items-start gap-2.5">
            <AlertCircle className="w-5 h-5 text-amber-700 flex-shrink-0 mt-0.5" />
            <div className="text-xs text-amber-950">
              <span className="font-bold text-amber-900 block mb-0.5">
                Scheme Change Radar — Official Policy Update Detected
              </span>
              <p>{radarAlerts[0].changeSummary}</p>
              <p className="text-slate-600 mt-1">
                <strong>Applicant Impact:</strong> {radarAlerts[0].impactOnApplicants}
              </p>
            </div>
          </div>
        </Card>
      )}

      {/* Active Tracked Claims Section */}
      <div className="flex flex-col gap-3">
        <h2 className="text-sm font-bold text-slate-900">Your Saved Benefit Applications ({claims.length})</h2>

        <div className="flex flex-col gap-4">
          {claims.map((claim) => {
            const scheme = defaultSchemeRepository.getById(claim.schemeId);
            return (
              <Card key={claim.id} className="p-4 bg-white border-slate-200 shadow-sm">
                <div className="flex flex-col gap-3">
                  <div className="flex flex-col sm:flex-row sm:items-center justify-between gap-2 border-b pb-2">
                    <div>
                      <h3 className="font-bold text-slate-900 text-base">
                        <Link to={`/scheme/${claim.schemeId}`} className="hover:text-indigo-600">
                          {claim.schemeName}
                        </Link>
                      </h3>
                      <span className="text-[11px] text-slate-400">
                        Saved on {new Date(claim.savedAt).toLocaleDateString()} • Academic Year {claim.academicYear || '2026-27'}
                      </span>
                    </div>

                    <a
                      href={claim.officialPortalUrl}
                      target="_blank"
                      rel="noopener noreferrer"
                      className="text-xs text-blue-700 font-semibold hover:underline inline-flex items-center gap-1"
                    >
                      Official Portal <ExternalLink className="w-3.5 h-3.5" />
                    </a>
                  </div>

                  {/* Stage Progress Bar Selector */}
                  <div className="flex flex-col gap-1.5">
                    <span className="text-xs font-semibold text-slate-700">Application Lifecycle Stage:</span>
                    <div className="grid grid-cols-2 sm:grid-cols-5 gap-1.5 text-xs">
                      {(
                        [
                          { key: 'preparing', label: '1. Preparing' },
                          { key: 'ready_to_apply', label: '2. Ready' },
                          { key: 'applied', label: '3. Applied' },
                          { key: 'under_verification', label: '4. Verifying' },
                          { key: 'disbursed', label: '5. Disbursed' },
                        ] as const
                      ).map(({ key, label }) => {
                        const isActive = claim.stage === key;
                        return (
                          <button
                            key={key}
                            type="button"
                            onClick={() => handleStageChange(claim.schemeId, key)}
                            className={`p-2 rounded border font-medium text-center transition-all ${
                              isActive
                                ? 'bg-indigo-600 text-white border-indigo-700 font-bold shadow-sm'
                                : 'bg-slate-50 text-slate-600 border-slate-200 hover:bg-slate-100'
                            }`}
                          >
                            {label}
                          </button>
                        );
                      })}
                    </div>
                  </div>

                  {/* Reference Number Field */}
                  <div className="flex flex-col sm:flex-row sm:items-center gap-3 pt-2 text-xs">
                    <div className="flex-1">
                      <label className="font-semibold text-slate-700 block mb-1">
                        Application / Acknowledgment Number:
                      </label>
                      <input
                        type="text"
                        value={claim.applicationReferenceNumber || ''}
                        onChange={(e) => handleRefNumberChange(claim.schemeId, e.target.value)}
                        placeholder="e.g. EPASS-2026-449102"
                        className="w-full p-2 border border-slate-300 rounded text-xs bg-slate-50 focus:bg-white"
                      />
                    </div>

                    <div className="flex items-center gap-2 mt-auto">
                      <Link
                        to="/checklist"
                        className="p-2 bg-indigo-50 text-indigo-700 font-semibold rounded hover:bg-indigo-100 text-xs inline-flex items-center gap-1"
                      >
                        Checklist ({claim.completedDocumentIds.length} ready)
                      </Link>

                      <Button
                        variant="secondary"
                        onClick={() => {
                          defaultClaimTrackerService.removeClaim(claim.schemeId);
                          setClaims([...defaultClaimTrackerService.getClaims()]);
                        }}
                        className="text-xs text-rose-700 hover:bg-rose-50"
                      >
                        Remove
                      </Button>
                    </div>
                  </div>

                  {scheme?.scamWarning && (
                    <p className="text-[11px] text-amber-800 bg-amber-50/60 p-2 rounded border border-amber-100 italic">
                      Reminder: Do not give money or OTP to anyone for government scholarship updates.
                    </p>
                  )}
                </div>
              </Card>
            );
          })}
        </div>
      </div>

      {/* Academic-Year Renewal Calendar Section (P8) */}
      <div className="flex flex-col gap-3 pt-3">
        <div className="flex items-center gap-2">
          <Calendar className="w-5 h-5 text-indigo-600" />
          <h2 className="text-sm font-bold text-slate-900">Academic-Year Renewal Calendar</h2>
        </div>

        <p className="text-xs text-slate-500">
          Schemes with verified recurring renewal cycles. No generic or unverified deadlines are invented.
        </p>

        <div className="grid grid-cols-1 md:grid-cols-2 gap-3">
          {renewalEvents.map((evt) => (
            <Card key={evt.schemeId} className="p-3.5 bg-white border-slate-200 flex flex-col justify-between">
              <div>
                <div className="flex items-start justify-between gap-2">
                  <h3 className="font-bold text-slate-900 text-xs">{evt.schemeName}</h3>
                  <span className="text-[10px] font-bold px-1.5 py-0.5 rounded bg-emerald-100 text-emerald-800">
                    Cycle Open
                  </span>
                </div>

                <div className="mt-2 text-xs text-slate-600 flex flex-col gap-1">
                  <div>
                    <span className="text-slate-400">Academic Year: </span>
                    <strong className="text-slate-800">{evt.academicYear}</strong>
                  </div>
                  <div>
                    <span className="text-slate-400">Renewal Window: </span>
                    <strong className="text-indigo-900">{evt.windowDescription}</strong>
                  </div>
                  <div className="mt-1">
                    <span className="text-slate-400 block mb-0.5">Key Renewal Requirements:</span>
                    <ul className="list-disc pl-4 text-[11px] text-slate-600 space-y-0.5">
                      {evt.mandatoryRequirements.map((req, i) => (
                        <li key={i}>{req}</li>
                      ))}
                    </ul>
                  </div>
                </div>
              </div>

              <div className="mt-3 pt-2 border-t border-slate-100 flex items-center justify-between text-xs">
                <a
                  href={evt.officialSourceUrl}
                  target="_blank"
                  rel="noopener noreferrer"
                  className="text-blue-700 font-semibold hover:underline inline-flex items-center gap-1"
                >
                  Official Renewal Portal <ExternalLink className="w-3 h-3" />
                </a>
              </div>
            </Card>
          ))}
        </div>
      </div>
    </div>
  );
}
