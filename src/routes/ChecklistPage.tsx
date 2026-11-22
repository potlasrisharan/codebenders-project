import { useState } from 'react';
import { Link } from 'react-router-dom';
import {
  ListChecks,
  CheckSquare,
  Square,
  MessageSquare,
  ExternalLink,
  Info,
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
    <div className="stack checklist-page max-w-4xl mx-auto py-4 px-2">
      <div className="flex flex-col sm:flex-row sm:items-center justify-between border-b pb-3 gap-2">
        <div>
          <h1 className="text-2xl font-bold text-slate-900 flex items-center gap-2">
            <ListChecks className="w-6 h-6 text-indigo-600" aria-hidden="true" />
            Checklist
          </h1>
          <p className="text-sm text-slate-600 mt-1">
            Personalised document readiness for {activeScheme.name}.
          </p>
        </div>

        <div className="flex items-center gap-2">
          <Button
            variant="secondary"
            onClick={() => setIsShareModalOpen(true)}
            className="text-xs flex items-center gap-1.5"
          >
            <MessageSquare className="w-3.5 h-3.5 text-emerald-600" /> Share via WhatsApp
          </Button>

          <Link
            to={`/scheme/${activeScheme.id}`}
            className="text-xs px-3 py-2 bg-indigo-50 text-indigo-700 font-semibold rounded hover:bg-indigo-100"
          >
            View Scheme Details
          </Link>
        </div>
      </div>

      {/* Readiness Progress Bar */}
      <Card className="p-4 bg-white border-slate-200">
        <div className="flex flex-col gap-2">
          <div className="flex items-center justify-between text-xs font-semibold text-slate-700">
            <span>Document Readiness Progress:</span>
            <span>
              {readyDocs} of {totalDocs} documents prepared ({progressPercent}%)
            </span>
          </div>

          <div className="w-full bg-slate-100 rounded-full h-2.5 overflow-hidden">
            <div
              className="bg-emerald-600 h-2.5 rounded-full transition-all duration-300"
              style={{ width: `${progressPercent}%` }}
            />
          </div>

          {progressPercent === 100 ? (
            <p className="text-xs text-emerald-700 font-semibold mt-1">
              🎉 All required documents are ready! You can now proceed to apply on the official government portal.
            </p>
          ) : (
            <p className="text-xs text-slate-500 mt-1">
              Mark off documents as you acquire them from MeeSeva, college, or bank.
            </p>
          )}
        </div>
      </Card>

      {/* Sourced Document Checklist */}
      <div className="flex flex-col gap-3">
        <h2 className="text-sm font-bold text-slate-900">Required Documents & Issuing Authorities</h2>

        <div className="flex flex-col gap-2.5">
          {activeScheme.documents.map((doc) => {
            const isCompleted = completedDocIds.includes(doc.id);
            return (
              <Card
                key={doc.id}
                className={`p-3.5 border text-xs transition-colors ${
                  isCompleted ? 'bg-emerald-50/40 border-emerald-300' : 'bg-white border-slate-200'
                }`}
              >
                <div className="flex items-start justify-between gap-3">
                  <div className="flex items-start gap-3">
                    <button
                      type="button"
                      onClick={() => handleToggleDoc(doc.id)}
                      className="mt-0.5 text-slate-600 hover:text-indigo-600"
                      aria-label={`Toggle completion of ${doc.name}`}
                    >
                      {isCompleted ? (
                        <CheckSquare className="w-5 h-5 text-emerald-600" />
                      ) : (
                        <Square className="w-5 h-5 text-slate-400" />
                      )}
                    </button>

                    <div>
                      <div className="flex items-center gap-2">
                        <span
                          className={`font-bold text-sm ${
                            isCompleted ? 'line-through text-slate-500' : 'text-slate-900'
                          }`}
                        >
                          {doc.name}
                        </span>
                        <span
                          className={`text-[10px] uppercase font-bold px-1.5 py-0.5 rounded ${
                            doc.requirementType === 'mandatory'
                              ? 'bg-rose-100 text-rose-800'
                              : 'bg-slate-100 text-slate-700'
                          }`}
                        >
                          {doc.requirementType}
                        </span>
                      </div>

                      <p className="text-xs text-slate-600 mt-1 leading-relaxed">{doc.description}</p>

                      <div className="flex flex-col sm:flex-row sm:items-center gap-2 text-[11px] text-slate-500 mt-2 pt-2 border-t border-slate-100">
                        <span>
                          Issuing Authority: <strong className="text-slate-700">{doc.issuingAuthority}</strong>
                        </span>
                        <span className="hidden sm:inline">•</span>
                        <span>Evidence: <em>{doc.sourceEvidence}</em></span>
                      </div>
                    </div>
                  </div>
                </div>
              </Card>
            );
          })}
        </div>
      </div>

      {/* Official Channel Guidance Notice */}
      <Card className="p-3 bg-blue-50/50 border-blue-200 text-xs text-blue-950 flex items-start gap-2.5">
        <Info className="w-4 h-4 text-blue-700 flex-shrink-0 mt-0.5" />
        <div>
          <span className="font-bold">MeeSeva & Bank Linking Notice:</span> Caste and Income certificates must be digitally signed through MeeSeva portal. Ensure your student bank savings account is seeded with NPCI Aadhaar bridge for direct benefit transfer (DBT).
          <div className="mt-1">
            <a
              href="https://ts.meeseva.telangana.gov.in"
              target="_blank"
              rel="noopener noreferrer"
              className="text-blue-700 font-semibold hover:underline inline-flex items-center gap-1"
            >
              Check MeeSeva Certificate Portal <ExternalLink className="w-3 h-3" />
            </a>
          </div>
        </div>
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
