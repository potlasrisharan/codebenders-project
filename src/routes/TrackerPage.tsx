import { useState } from 'react';
import { Link } from 'react-router-dom';
import {
  Activity,
  Calendar,
  AlertCircle,
  ExternalLink,
  Plus,
  Copy,
  Trash2,
  FileCheck,
  Download,
} from 'lucide-react';
import { defaultClaimTrackerService, ClaimStage } from '../core/tracker/claim-tracker';
import { defaultSchemeRepository } from '../core/data/repository';
import { defaultWhatIfService } from '../core/simulator/what-if-service';
import { Card } from '../components/ui/Card';
import { Button } from '../components/ui/Button';
import { T } from '../core/i18n/LanguageContext';

export function TrackerPage() {
  const [claims, setClaims] = useState(() => defaultClaimTrackerService.getClaims());

  const allSchemes = defaultSchemeRepository.getAll();
  const renewalEvents = defaultClaimTrackerService.getRenewalCalendarEvents(allSchemes);
  const radarAlerts = defaultWhatIfService.getReassessmentAlerts(claims.map((c) => c.schemeId));
  const [copiedRefId, setCopiedRefId] = useState<string | null>(null);

  const handleStageChange = (schemeId: string, newStage: ClaimStage) => {
    defaultClaimTrackerService.updateStage(schemeId, newStage);
    setClaims([...defaultClaimTrackerService.getClaims()]);
  };

  const handleRefNumberChange = (schemeId: string, ref: string) => {
    defaultClaimTrackerService.updateStage(
      schemeId,
      claims.find((c) => c.schemeId === schemeId)?.stage || 'applied',
      ref
    );
    setClaims([...defaultClaimTrackerService.getClaims()]);
  };

  const handleCopyRef = (ref: string, schemeId: string) => {
    if (!ref) return;
    navigator.clipboard?.writeText(ref);
    setCopiedRefId(schemeId);
    setTimeout(() => setCopiedRefId(null), 2000);
  };

  const STAGES = [
    { key: 'preparing', label: '1. Preparing' },
    { key: 'ready_to_apply', label: '2. Ready' },
    { key: 'applied', label: '3. Applied' },
    { key: 'under_verification', label: '4. Verifying' },
    { key: 'disbursed', label: '5. Disbursed' },
  ] as const;

  return (
    <div className="stack tracker-page max-w-4xl mx-auto py-6 px-3 sm:px-4 space-y-6">
      {/* Editorial Header */}
      <div className="flex flex-col sm:flex-row sm:items-center justify-between border-b border-zinc-200 pb-4 gap-3">
        <div>
          <div className="flex items-center gap-2 mb-1.5">
            <span className="inline-flex items-center gap-1 px-2.5 py-0.5 rounded-full text-[11px] font-bold tracking-wider uppercase bg-zinc-100 text-zinc-700">
              <Activity className="w-3.5 h-3.5 text-zinc-700" />
              Benefit Lifecycle Management
            </span>
            <span className="text-[11px] font-medium text-emerald-700 bg-emerald-50 px-2 py-0.5 rounded-full border border-emerald-200">
              Academic Year 2026-27
            </span>
          </div>
          <h1 className="text-3xl font-extrabold text-zinc-900 tracking-tight flex items-center gap-2.5">
            <Activity className="w-7 h-7 text-zinc-900" aria-hidden="true" />
            <T id="tracker.title" />
          </h1>
          <div className="text-sm text-zinc-600 mt-1 max-w-xl">
            <T id="tracker.sub" />
          </div>
        </div>

        <Link
          to="/matches"
          className="btn btn--primary text-xs px-3.5 py-2 bg-zinc-900 hover:bg-zinc-800 text-white !text-white font-semibold rounded-lg shadow-xs inline-flex items-center gap-1.5 btn-tactile transition-colors"
          style={{ color: '#ffffff' }}
        >
          <Plus className="w-3.5 h-3.5 text-white" style={{ color: '#ffffff' }} /> <span className="!text-white text-white font-semibold" style={{ color: '#ffffff' }}>Track Another Scheme</span>
        </Link>
      </div>

      {/* Scheme Change Radar Alert Banner if government orders changed (P10) */}
      {radarAlerts.length > 0 && (
        <Card className="p-4 bg-amber-50/80 border-amber-300 rounded-xl shadow-xs animate-slide-down-fade">
          <div className="flex items-start gap-3">
            <AlertCircle className="w-5 h-5 text-amber-700 flex-shrink-0 mt-0.5" />
            <div className="text-xs text-amber-950 space-y-1">
              <span className="font-extrabold text-amber-900 block text-sm">
                Scheme Change Radar — Official Policy Update Detected
              </span>
              <p className="leading-relaxed">{radarAlerts[0].changeSummary}</p>
              <p className="text-zinc-700 pt-1 border-t border-amber-200/60">
                <strong>Applicant Impact:</strong> {radarAlerts[0].impactOnApplicants}
              </p>
            </div>
          </div>
        </Card>
      )}

      {/* Active Tracked Claims Section */}
      <div className="space-y-4">
        <div className="flex items-center justify-between">
          <h2 className="text-sm font-bold text-zinc-900">
            Your Saved Benefit Applications ({claims.length})
          </h2>
          <span className="text-[11px] text-zinc-500">Persistent across browser sessions</span>
        </div>

        {claims.length === 0 ? (
          <Card className="p-8 text-center bg-zinc-50 border-dashed border-zinc-300 space-y-3">
            <Activity className="w-8 h-8 text-zinc-400 mx-auto" />
            <h3 className="text-base font-bold text-zinc-800">No active claims tracked yet</h3>
            <p className="text-xs text-zinc-500 max-w-sm mx-auto">
              Save any eligible scholarship or benefit from the Matches catalog to monitor application deadlines, status milestones, and renewal alerts.
            </p>
            <div className="flex flex-wrap items-center justify-center gap-2 pt-2">
              <Link
                to="/intake"
                className="btn btn--primary px-4 py-2 bg-zinc-900 hover:bg-zinc-800 text-white !text-white font-semibold rounded-lg text-xs inline-flex items-center gap-1.5 btn-tactile shadow-xs"
                style={{ color: '#ffffff' }}
              >
                <span className="!text-white text-white font-semibold" style={{ color: '#ffffff' }}>Start Citizen Intake</span> <ExternalLink className="w-3.5 h-3.5 text-white" style={{ color: '#ffffff' }} />
              </Link>
              <Link
                to="/matches"
                className="px-4 py-2 border border-zinc-300 bg-white hover:bg-zinc-50 text-zinc-800 font-semibold rounded-lg text-xs inline-flex items-center gap-1.5 btn-tactile shadow-xs"
              >
                Browse Schemes Catalog
              </Link>
            </div>
          </Card>
        ) : (
          <div className="space-y-4">
            {claims.map((claim) => {
              const scheme = defaultSchemeRepository.getById(claim.schemeId);
              return (
              <Card
                key={claim.id}
                className="p-5 bg-white border-zinc-200/90 rounded-2xl shadow-xs hover:border-zinc-300 transition-all duration-200 space-y-4"
              >
                {/* Claim Top Bar */}
                <div className="flex flex-col sm:flex-row sm:items-start justify-between gap-3 border-b border-zinc-100 pb-3">
                  <div>
                    <span className="text-[10px] font-bold uppercase tracking-wider px-2 py-0.5 rounded-full bg-zinc-100 text-zinc-600 block w-fit mb-1">
                      Academic Year {claim.academicYear || '2026-27'}
                    </span>
                    <h3 className="font-bold text-zinc-900 text-base leading-snug">
                      <Link to={`/scheme/${claim.schemeId}`} className="hover:text-zinc-600 transition-colors">
                        {claim.schemeName}
                      </Link>
                    </h3>
                    <span className="text-[11px] text-zinc-400">
                      Saved on {new Date(claim.savedAt).toLocaleDateString('en-IN', { month: 'short', day: 'numeric', year: 'numeric' })}
                    </span>
                  </div>

                  <a
                    href={claim.officialPortalUrl}
                    target="_blank"
                    rel="noopener noreferrer"
                    className="text-xs text-zinc-800 font-semibold hover:underline inline-flex items-center gap-1.5 px-3 py-1.5 bg-zinc-50 border rounded-lg hover:bg-zinc-100 transition-colors flex-shrink-0"
                  >
                    Official Portal <ExternalLink className="w-3.5 h-3.5" />
                  </a>
                </div>

                {/* Stage Stepper Progress Selector */}
                <div className="space-y-2">
                  <span className="text-xs font-bold text-zinc-700 block">
                    Application Lifecycle Stage:
                  </span>
                  <div className="grid grid-cols-2 sm:grid-cols-5 gap-2 text-xs">
                    {STAGES.map(({ key, label }) => {
                      const isActive = claim.stage === key;
                      return (
                        <button
                          key={key}
                          type="button"
                          onClick={() => handleStageChange(claim.schemeId, key)}
                          className={`p-2.5 rounded-xl border text-center transition-all duration-200 btn-tactile flex flex-col items-center justify-center gap-1 ${
                            isActive
                              ? 'bg-zinc-900 text-white border-zinc-900 font-bold shadow-xs'
                              : 'bg-zinc-50/70 text-zinc-700 border-zinc-200 hover:bg-zinc-100'
                          }`}
                        >
                          <span className="text-[10px] opacity-80 uppercase tracking-wider">
                            {key === 'disbursed' ? 'Goal' : 'Stage'}
                          </span>
                          <span className="text-xs">{label}</span>
                        </button>
                      );
                    })}
                  </div>
                </div>

                {/* Application Reference Number Field */}
                <div className="flex flex-col sm:flex-row sm:items-end gap-3 pt-2 text-xs">
                  <div className="flex-1">
                    <label className="font-bold text-zinc-700 block mb-1">
                      Official Acknowledgment / Application Number:
                    </label>
                    <div className="relative">
                      <input
                        type="text"
                        value={claim.applicationReferenceNumber || ''}
                        onChange={(e) => handleRefNumberChange(claim.schemeId, e.target.value)}
                        placeholder="e.g. EPASS-2026-449102"
                        className="w-full p-2.5 border border-zinc-300 rounded-lg text-xs bg-zinc-50/70 focus:bg-white focus:ring-1 focus:ring-zinc-900 focus:outline-none font-mono"
                      />
                      {claim.applicationReferenceNumber && (
                        <button
                          type="button"
                          onClick={() => handleCopyRef(claim.applicationReferenceNumber!, claim.schemeId)}
                          className="absolute right-2 top-2 text-zinc-400 hover:text-zinc-700 p-1 rounded"
                          title="Copy reference number"
                        >
                          {copiedRefId === claim.schemeId ? (
                            <span className="text-[10px] text-emerald-600 font-bold">Copied!</span>
                          ) : (
                            <Copy className="w-3.5 h-3.5" />
                          )}
                        </button>
                      )}
                    </div>
                  </div>

                  <div className="flex items-center gap-2">
                    <Link
                      to="/checklist"
                      className="px-3 py-2 bg-zinc-100 hover:bg-zinc-200 text-zinc-800 font-semibold rounded-lg text-xs inline-flex items-center gap-1.5 transition-colors btn-tactile"
                    >
                      <FileCheck className="w-3.5 h-3.5 text-zinc-600" />
                      Checklist ({claim.completedDocumentIds.length} ready)
                    </Link>

                    <Button
                      variant="secondary"
                      onClick={() => {
                        defaultClaimTrackerService.removeClaim(claim.schemeId);
                        if (typeof window !== 'undefined') {
                          localStorage.setItem('labhsaathi_tracker_initialized', 'true');
                        }
                        setClaims([...defaultClaimTrackerService.getClaims()]);
                      }}
                      className="text-xs px-3 py-2 text-rose-700 hover:bg-rose-50 border-rose-200 btn-tactile"
                    >
                      <Trash2 className="w-3.5 h-3.5" />
                      Remove
                    </Button>
                  </div>
                </div>

                {scheme?.scamWarning && (
                  <p className="text-[11px] text-amber-900 bg-amber-50/70 p-2.5 rounded-xl border border-amber-200/80 leading-relaxed">
                    <strong>Notice:</strong> Do not pay money, give OTPs, or share passwords with agents or middlemen for government scholarship updates. Official updates are free on the department portal.
                  </p>
                )}
              </Card>
            );
          })}
          </div>
        )}
      </div>

      {/* Academic-Year Renewal Calendar Section (P8) */}
      <div className="space-y-3 pt-3">
        <div className="flex flex-col sm:flex-row sm:items-center justify-between gap-2">
          <div className="flex items-center gap-2">
            <Calendar className="w-5 h-5 text-zinc-800" />
            <h2 className="text-sm font-bold text-zinc-900">
              Academic-Year Renewal Calendar
            </h2>
          </div>
          <button
            type="button"
            onClick={() => {
              const icsContent = [
                'BEGIN:VCALENDAR',
                'VERSION:2.0',
                'PRODID:-//LabhSaathi//Scholarship Renewal Calendar//EN',
                'CALSCALE:GREGORIAN',
                ...renewalEvents.flatMap((evt, idx) => [
                  'BEGIN:VEVENT',
                  `UID:labhsaathi-renewal-${evt.schemeId}-${idx}@labhsaathi.in`,
                  `DTSTAMP:${new Date().toISOString().replace(/[-:]/g, '').split('.')[0]}Z`,
                  'DTSTART:20260801T090000Z',
                  'DTEND:20261130T180000Z',
                  `SUMMARY:${evt.schemeName} — Renewal Window`,
                  `DESCRIPTION:${evt.windowDescription}. Apply at ${evt.officialSourceUrl}`,
                  `URL:${evt.officialSourceUrl}`,
                  'STATUS:CONFIRMED',
                  'END:VEVENT',
                ]),
                'END:VCALENDAR',
              ].join('\r\n');

              const blob = new Blob([icsContent], { type: 'text/calendar;charset=utf-8' });
              const url = URL.createObjectURL(blob);
              const a = document.createElement('a');
              a.href = url;
              a.download = 'labhsaathi-scholarship-renewals.ics';
              document.body.appendChild(a);
              a.click();
              document.body.removeChild(a);
              URL.revokeObjectURL(url);
            }}
            className="inline-flex items-center gap-1.5 px-3 py-1.5 bg-zinc-100 hover:bg-zinc-200 text-zinc-800 rounded-lg text-xs font-semibold transition-colors btn-tactile w-fit cursor-pointer"
          >
            <Download className="w-3.5 h-3.5 text-zinc-600" />
            Export to Calendar (.ics)
          </button>
        </div>

        <p className="text-xs text-zinc-500">
          Recurring renewal windows verified against government annual schedules. Prevent lapses in subsequent college years.
        </p>

        <div className="grid grid-cols-1 md:grid-cols-2 gap-3">
          {renewalEvents.map((evt) => (
            <Card
              key={evt.schemeId}
              className="p-4 bg-white border-zinc-200/90 rounded-2xl shadow-xs flex flex-col justify-between hover:border-zinc-300 transition-colors space-y-3"
            >
              <div>
                <div className="flex items-start justify-between gap-2">
                  <h3 className="font-bold text-zinc-900 text-xs leading-snug">{evt.schemeName}</h3>
                  <span className="text-[10px] font-bold px-2 py-0.5 rounded-full bg-emerald-100 text-emerald-800 flex-shrink-0">
                    Cycle Open
                  </span>
                </div>

                <div className="mt-2.5 text-xs text-zinc-600 space-y-1.5">
                  <div className="flex items-center gap-1.5">
                    <span className="text-zinc-400">Academic Year:</span>
                    <strong className="text-zinc-800">{evt.academicYear}</strong>
                  </div>
                  <div className="flex items-center gap-1.5">
                    <span className="text-zinc-400">Renewal Window:</span>
                    <strong className="text-zinc-900">{evt.windowDescription}</strong>
                  </div>
                  <div className="pt-2 border-t border-zinc-100">
                    <span className="text-zinc-500 font-semibold block mb-1">Mandatory Prerequisites:</span>
                    <ul className="list-disc pl-4 text-[11px] text-zinc-600 space-y-0.5">
                      {evt.mandatoryRequirements.map((req, i) => (
                        <li key={i}>{req}</li>
                      ))}
                    </ul>
                  </div>
                </div>
              </div>

              <div className="pt-2.5 border-t border-zinc-100 flex items-center justify-between text-xs">
                <a
                  href={evt.officialSourceUrl}
                  target="_blank"
                  rel="noopener noreferrer"
                  className="text-zinc-800 font-semibold hover:underline inline-flex items-center gap-1 text-[11px]"
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
