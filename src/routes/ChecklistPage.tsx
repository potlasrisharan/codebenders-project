import { useState } from 'react';
import { Link } from 'react-router-dom';
import {
  ListChecks,
  CheckSquare,
  Square,
  MessageSquare,
  Info,
  Building2,
  FileCheck2,
  ArrowRight,
} from 'lucide-react';
import { defaultClaimTrackerService } from '../core/tracker/claim-tracker';
import { defaultSchemeRepository } from '../core/data/repository';
import { Card } from '../components/ui/Card';
import { Button } from '../components/ui/Button';
import { WhatsAppShareModal } from '../components/share/WhatsAppShareModal';

export function ChecklistPage() {
  const [claims] = useState(() => defaultClaimTrackerService.getClaims());
  const allSchemes = defaultSchemeRepository.getAll();

  // If user hasn't saved a scheme yet, default to showing the pilot ePASS scheme checklist for demo readiness
  const activeScheme =
    claims.length > 0
      ? allSchemes.find((s) => s.id === claims[0].schemeId) || allSchemes[0]
      : allSchemes[0];

  const [completedDocIds, setCompletedDocIds] = useState<string[]>(() => {
    return defaultClaimTrackerService.getClaim(activeScheme.id)?.completedDocumentIds || [];
  });

  const [isShareModalOpen, setIsShareModalOpen] = useState(false);
  const sharePayload = defaultClaimTrackerService.generateWhatsAppShareUrl(activeScheme);

  const handleToggleDoc = (docId: string) => {
    defaultClaimTrackerService.toggleDocumentCompletion(activeScheme.id, docId);
    setCompletedDocIds((prev) =>
      prev.includes(docId) ? prev.filter((id) => id !== docId) : [...prev, docId]
    );
  };

  const totalDocs = activeScheme.documents.length;
  const readyDocs = completedDocIds.length;
  const progressPercent = Math.round((readyDocs / totalDocs) * 100);

  return (
    <div className="stack checklist-page max-w-4xl mx-auto py-6 px-3 sm:px-4 space-y-6">
      {/* Editorial Header */}
      <div className="flex flex-col sm:flex-row sm:items-center justify-between border-b border-zinc-200 pb-4 gap-3">
        <div>
          <div className="flex items-center gap-2 mb-1.5">
            <span className="inline-flex items-center gap-1 px-2.5 py-0.5 rounded-full text-[11px] font-bold tracking-wider uppercase bg-zinc-100 text-zinc-700">
              <FileCheck2 className="w-3.5 h-3.5 text-zinc-700" />
              Document Readiness Cockpit
            </span>
            <span className="text-[11px] font-medium text-emerald-700 bg-emerald-50 px-2 py-0.5 rounded-full border border-emerald-200">
              Official Issuing Authorities
            </span>
          </div>
          <h1 className="text-3xl font-extrabold text-zinc-900 tracking-tight flex items-center gap-2.5">
            <ListChecks className="w-7 h-7 text-zinc-900" aria-hidden="true" />
            Checklist
          </h1>
          <p className="text-sm text-zinc-600 mt-1 max-w-xl">
            Personalised document readiness for <strong className="text-zinc-900 font-semibold">{activeScheme.name}</strong>. Check off documents as you gather them from MeeSeva, college, or bank.
          </p>
        </div>

        <div className="flex flex-wrap items-center gap-2">
          <Button
            variant="secondary"
            onClick={() => setIsShareModalOpen(true)}
            className="text-xs px-3.5 py-2 flex items-center gap-1.5 btn-tactile border-zinc-300 hover:border-zinc-400"
          >
            <MessageSquare className="w-3.5 h-3.5 text-emerald-600" /> Share via WhatsApp
          </Button>

          <Link
            to={`/scheme/${activeScheme.id}`}
            className="text-xs px-3.5 py-2 bg-zinc-900 hover:bg-zinc-800 text-white font-semibold rounded-lg shadow-xs inline-flex items-center gap-1.5 btn-tactile transition-colors"
          >
            <span>View Scheme Details</span>
            <ArrowRight className="w-3.5 h-3.5" />
          </Link>
        </div>
      </div>

      {/* Readiness Progress Bar Card */}
      <Card className="p-5 bg-white border-zinc-200/90 shadow-xs space-y-3">
        <div className="flex flex-col sm:flex-row sm:items-center justify-between gap-2">
          <div>
            <span className="text-xs font-bold uppercase tracking-wider text-zinc-500 block">
              Application Readiness Meter
            </span>
            <h3 className="text-base font-extrabold text-zinc-900 mt-0.5">
              {readyDocs} of {totalDocs} documents ready ({progressPercent}%)
            </h3>
          </div>
          <span className="text-xs font-mono font-bold text-zinc-600 px-3 py-1 bg-zinc-100 rounded-full w-fit">
            {progressPercent === 100 ? '100% Ready to Apply' : `${totalDocs - readyDocs} Pending`}
          </span>
        </div>

        <div className="w-full bg-zinc-100 rounded-full h-3 overflow-hidden p-0.5">
          <div
            className="bg-emerald-600 h-2 rounded-full transition-all duration-500 ease-out"
            style={{ width: `${progressPercent}%` }}
          />
        </div>

        {progressPercent === 100 ? (
          <div className="p-3 bg-emerald-50 text-emerald-900 rounded-xl border border-emerald-200 text-xs flex items-center gap-2 animate-slide-down-fade font-medium">
            <span className="text-lg">🎉</span>
            <span>
              All mandatory documents are ready! You can now proceed to apply directly on the official portal without middlemen.
            </span>
          </div>
        ) : (
          <p className="text-xs text-zinc-500 leading-relaxed">
            Acquire mandatory certificates before the deadline. Digital copies downloaded from official MeeSeva or Digilocker portals are fully accepted.
          </p>
        )}
      </Card>

      {/* Sourced Document Checklist */}
      <div className="space-y-3">
        <div className="flex items-center justify-between">
          <h2 className="text-sm font-bold text-zinc-900">
            Required Documents &amp; Issuing Authorities
          </h2>
          <span className="text-[11px] text-zinc-500">Click the box to toggle readiness</span>
        </div>

        <div className="space-y-2.5">
          {activeScheme.documents.map((doc) => {
            const isCompleted = completedDocIds.includes(doc.id);
            return (
              <Card
                key={doc.id}
                className={`p-4 border transition-all duration-200 ${
                  isCompleted
                    ? 'bg-emerald-50/40 border-emerald-300 ring-1 ring-emerald-500/10'
                    : 'bg-white border-zinc-200 hover:border-zinc-300 hover:shadow-xs'
                }`}
              >
                <div className="flex items-start justify-between gap-3">
                  <div className="flex items-start gap-3.5">
                    <button
                      type="button"
                      onClick={() => handleToggleDoc(doc.id)}
                      className="mt-0.5 text-zinc-500 hover:text-zinc-900 transition-colors"
                      aria-label={`Toggle completion of ${doc.name}`}
                    >
                      {isCompleted ? (
                        <CheckSquare className="w-5 h-5 text-emerald-600" />
                      ) : (
                        <Square className="w-5 h-5 text-zinc-400" />
                      )}
                    </button>

                    <div className="space-y-1">
                      <div className="flex flex-wrap items-center gap-2">
                        <span
                          className={`font-bold text-sm ${
                            isCompleted ? 'line-through text-zinc-500' : 'text-zinc-900'
                          }`}
                        >
                          {doc.name}
                        </span>
                        <span
                          className={`text-[10px] uppercase font-bold px-2 py-0.5 rounded-full ${
                            doc.requirementType === 'mandatory'
                              ? 'bg-rose-100 text-rose-800'
                              : 'bg-zinc-100 text-zinc-700'
                          }`}
                        >
                          {doc.requirementType}
                        </span>
                      </div>

                      <p className="text-xs text-zinc-600 leading-relaxed">{doc.description}</p>

                      <div className="flex flex-wrap items-center gap-2 text-[11px] text-zinc-500 pt-2 border-t border-zinc-100">
                        <span className="inline-flex items-center gap-1">
                          <Building2 className="w-3 h-3 text-zinc-400" />
                          Issuing Authority: <strong className="text-zinc-800">{doc.issuingAuthority}</strong>
                        </span>
                        <span className="text-zinc-300">•</span>
                        <span>Evidence: {doc.sourceEvidence}</span>
                      </div>
                    </div>
                  </div>
                </div>
              </Card>
            );
          })}
        </div>
      </div>

      {/* Helpful Document Acquisition Advice */}
      <Card className="p-4 bg-zinc-50 border-zinc-200 text-xs space-y-2">
        <div className="flex items-center gap-2 text-zinc-900 font-bold">
          <Info className="w-4 h-4 text-zinc-700" />
          <span>Official Certificate Guidelines (No Agent Required):</span>
        </div>
        <ul className="list-disc pl-5 space-y-1 text-zinc-600 leading-relaxed">
          <li>
            <strong>Income &amp; Caste Certificates:</strong> Can be applied online via <a href="https://ts.meeseva.telangana.gov.in" target="_blank" rel="noopener noreferrer" className="underline text-zinc-900 font-medium">MeeSeva Telangana</a> or at any certified MeeSeva kiosk. Government fee is ₹45. Do not pay any agent hundreds of rupees.
          </li>
          <li>
            <strong>Bank Account:</strong> Ensure your bank account is seeded with Aadhaar and NPCI mapping is active to receive Direct Benefit Transfer (DBT).
          </li>
          <li>
            <strong>College Bonafide &amp; Fee Structure:</strong> Obtained directly from your college administrative office at zero cost.
          </li>
        </ul>
      </Card>

      {/* WhatsApp Share Modal */}
      <WhatsAppShareModal
        isOpen={isShareModalOpen}
        onClose={() => setIsShareModalOpen(false)}
        shareUrl={sharePayload.url}
        previewText={sharePayload.text}
        schemeName={activeScheme.name}
      />
    </div>
  );
}
