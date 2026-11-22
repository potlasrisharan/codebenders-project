import { useState } from 'react';
import { useParams, Link } from 'react-router-dom';
import {
  FileText,
  Bookmark,
  BookmarkCheck,
  MessageSquare,
  Sparkles,
  CheckSquare,
  Square,
  ExternalLink,
  ChevronLeft,
} from 'lucide-react';
import { useCitizenProfile } from '../core/profile/ProfileContext';
import { defaultSchemeRepository } from '../core/data/repository';
import { evaluateSchemeEligibility } from '../core/engine/eligibility-engine';
import { defaultClaimTrackerService } from '../core/tracker/claim-tracker';
import { defaultWhatIfService, WhatIfSimulationResult } from '../core/simulator/what-if-service';
import { StatusChip } from '../components/ui/StatusChip';
import { Card } from '../components/ui/Card';
import { Button } from '../components/ui/Button';
import { MiddlemanShieldCard } from '../components/scheme/MiddlemanShieldCard';
import { UnifiedActionGraph } from '../components/graph/UnifiedActionGraph';
import { WhatsAppShareModal } from '../components/share/WhatsAppShareModal';

export function SchemeDetailPage() {
  const { schemeId } = useParams<{ schemeId: string }>();
  const { profile } = useCitizenProfile();

  // Find scheme from repository or fallback to first scheme for demo
  const scheme =
    defaultSchemeRepository.getById(schemeId || '') ||
    defaultSchemeRepository.getBySlug(schemeId || '') ||
    defaultSchemeRepository.getAll()[0];

  const eligibility = evaluateSchemeEligibility(scheme, profile);

  // Tracker state
  const isInitiallySaved = defaultClaimTrackerService.isSaved(scheme.id);
  const [isSaved, setIsSaved] = useState<boolean>(isInitiallySaved);
  const [completedDocIds, setCompletedDocIds] = useState<string[]>(() => {
    return defaultClaimTrackerService.getClaim(scheme.id)?.completedDocumentIds || [];
  });

  // WhatsApp share modal state
  const [isShareModalOpen, setIsShareModalOpen] = useState(false);
  const sharePayload = defaultClaimTrackerService.generateWhatsAppShareUrl(scheme);

  // What-If Simulator state
  const [whatIfIncome, setWhatIfIncome] = useState<number>(profile.familyIncome || 150000);
  const [whatIfAttendance, setWhatIfAttendance] = useState<number>(profile.attendancePercentage || 75);
  const [simulationResult, setSimulationResult] = useState<WhatIfSimulationResult | null>(null);

  const handleToggleSave = () => {
    if (isSaved) {
      defaultClaimTrackerService.removeClaim(scheme.id);
      setIsSaved(false);
    } else {
      defaultClaimTrackerService.saveScheme(scheme);
      setIsSaved(true);
    }
  };

  const handleToggleDocument = (docId: string) => {
    if (!isSaved) {
      defaultClaimTrackerService.saveScheme(scheme);
      setIsSaved(true);
    }
    defaultClaimTrackerService.toggleDocumentCompletion(scheme.id, docId);
    setCompletedDocIds((prev) =>
      prev.includes(docId) ? prev.filter((id) => id !== docId) : [...prev, docId]
    );
  };

  const handleRunWhatIf = () => {
    const sim = defaultWhatIfService.simulate(scheme, profile, {
      familyIncome: whatIfIncome,
      attendancePercentage: whatIfAttendance,
    });
    setSimulationResult(sim);
  };

  return (
    <div className="stack scheme-detail-page max-w-4xl mx-auto py-4 px-2">
      {/* Top Breadcrumb & Heading */}
      <div className="flex flex-col gap-2 border-b pb-3">
        <Link
          to="/matches"
          className="text-xs text-slate-500 hover:text-slate-800 inline-flex items-center gap-1 w-fit"
        >
          <ChevronLeft className="w-3.5 h-3.5" /> Back to Matches
        </Link>

        <div className="flex flex-col sm:flex-row sm:items-center justify-between gap-3">
          <div>
            <h1 className="text-2xl font-bold text-slate-900 leading-tight">
              Scheme detail
            </h1>
            <h2 className="text-lg font-semibold text-indigo-900 mt-1">
              {scheme.name}
            </h2>
            <p className="text-xs text-slate-500 mt-0.5">
              {scheme.sources[0]?.department} • Last verified: {scheme.lastVerifiedDate} (Version {scheme.version})
            </p>
          </div>

          <div className="flex items-center gap-2">
            <StatusChip status={eligibility.overallLabel} />

            <Button
              variant={isSaved ? 'secondary' : 'primary'}
              onClick={handleToggleSave}
              className="text-xs flex items-center gap-1.5"
            >
              {isSaved ? <BookmarkCheck className="w-4 h-4 text-emerald-600" /> : <Bookmark className="w-4 h-4" />}
              {isSaved ? 'Saved in Tracker' : 'Save Scheme'}
            </Button>

            <button
              type="button"
              onClick={() => setIsShareModalOpen(true)}
              className="p-2 border border-slate-300 rounded hover:bg-slate-50 text-slate-700"
              title="Share checklist on WhatsApp"
            >
              <MessageSquare className="w-4 h-4 text-emerald-600" />
            </button>
          </div>
        </div>
      </div>

      {/* Middleman Shield & Fee Transparency Card (P7) */}
      <MiddlemanShieldCard
        feeStatus={scheme.feeStatus}
        feeDetails={scheme.feeDetails}
        scamWarning={scheme.scamWarning}
        officialPortalUrl={scheme.sources[0]?.portalUrl || ''}
        departmentName={scheme.sources[0]?.department || ''}
        lastVerifiedDate={scheme.lastVerifiedDate}
      />

      {/* Unified Eligibility Action Graph (P9) */}
      <UnifiedActionGraph
        scheme={scheme}
        eligibility={eligibility}
        profile={profile}
        completedDocIds={completedDocIds}
      />

      {/* Personalised Sourced Document Checklist (P7) */}
      <Card className="p-4 bg-white border-slate-200">
        <div className="flex items-center justify-between border-b pb-2 mb-3">
          <div className="flex items-center gap-2">
            <FileText className="w-5 h-5 text-indigo-600" />
            <h3 className="font-bold text-slate-900 text-sm">Personalised Document Readiness Checklist</h3>
          </div>
          <span className="text-xs text-slate-500">
            {completedDocIds.length} of {scheme.documents.length} ready
          </span>
        </div>

        <div className="flex flex-col gap-2.5">
          {scheme.documents.map((doc) => {
            const isCompleted = completedDocIds.includes(doc.id);
            return (
              <div
                key={doc.id}
                className={`p-3 rounded border text-xs flex items-start justify-between gap-3 transition-colors ${
                  isCompleted ? 'bg-emerald-50/50 border-emerald-200' : 'bg-slate-50 border-slate-200'
                }`}
              >
                <div className="flex items-start gap-2.5">
                  <button
                    type="button"
                    onClick={() => handleToggleDocument(doc.id)}
                    className="mt-0.5 text-slate-600 hover:text-indigo-600"
                    aria-label={`Mark ${doc.name} as ready`}
                  >
                    {isCompleted ? (
                      <CheckSquare className="w-4 h-4 text-emerald-600" />
                    ) : (
                      <Square className="w-4 h-4 text-slate-400" />
                    )}
                  </button>

                  <div>
                    <div className="flex items-center gap-2">
                      <span className={`font-semibold ${isCompleted ? 'line-through text-slate-500' : 'text-slate-900'}`}>
                        {doc.name}
                      </span>
                      <span className="text-[10px] font-bold uppercase px-1.5 py-0.2 rounded bg-slate-200/70 text-slate-700">
                        {doc.requirementType}
                      </span>
                    </div>

                    <p className="text-slate-600 mt-0.5">{doc.description}</p>
                    <div className="flex flex-wrap gap-2 text-[10px] text-slate-400 mt-1">
                      <span>Issuing Authority: <strong>{doc.issuingAuthority}</strong></span>
                      <span>• Evidence: {doc.sourceEvidence}</span>
                    </div>
                  </div>
                </div>
              </div>
            );
          })}
        </div>
      </Card>

      {/* Sourced Step-by-Step Official Application Instructions (P7) */}
      <Card className="p-4 bg-white border-slate-200">
        <h3 className="font-bold text-slate-900 text-sm mb-3">
          Step-by-Step Official Application Process
        </h3>
        <ol className="flex flex-col gap-3 list-none pl-0">
          {scheme.applicationSteps.map((step) => (
            <li key={step.stepNumber} className="flex items-start gap-3 text-xs">
              <span className="w-5 h-5 rounded-full bg-indigo-600 text-white font-bold flex items-center justify-center flex-shrink-0 text-[11px] mt-0.5">
                {step.stepNumber}
              </span>
              <div className="flex-1">
                <span className="font-bold text-slate-900 block">{step.title}</span>
                <p className="text-slate-600 mt-0.5 leading-relaxed">{step.description}</p>
                {step.portalUrl && (
                  <a
                    href={step.portalUrl}
                    target="_blank"
                    rel="noopener noreferrer"
                    className="inline-flex items-center gap-1 text-[11px] font-semibold text-blue-700 hover:underline mt-1"
                  >
                    Open Step Portal <ExternalLink className="w-3 h-3" />
                  </a>
                )}
              </div>
            </li>
          ))}
        </ol>
      </Card>

      {/* What-If Simulation Drawer (P10) */}
      <Card className="p-4 bg-indigo-50/40 border-indigo-200">
        <div className="flex items-center gap-2 border-b border-indigo-100 pb-2 mb-3">
          <Sparkles className="w-5 h-5 text-indigo-600" />
          <h3 className="font-bold text-slate-900 text-sm">What-If Eligibility Simulation</h3>
        </div>

        <p className="text-xs text-slate-600 mb-3">
          Tweak your details hypothetically to see how changes affect your eligibility outcome. Your saved profile is not altered.
        </p>

        <div className="grid grid-cols-1 sm:grid-cols-2 gap-3 text-xs">
          <div>
            <label className="font-semibold text-slate-700 block mb-1">
              Hypothetical Annual Family Income:
            </label>
            <input
              type="number"
              value={whatIfIncome}
              onChange={(e) => setWhatIfIncome(Number(e.target.value))}
              className="w-full p-2 border border-slate-300 rounded bg-white"
            />
          </div>

          <div>
            <label className="font-semibold text-slate-700 block mb-1">
              Hypothetical Attendance (%):
            </label>
            <input
              type="number"
              value={whatIfAttendance}
              onChange={(e) => setWhatIfAttendance(Number(e.target.value))}
              className="w-full p-2 border border-slate-300 rounded bg-white"
            />
          </div>
        </div>

        <div className="mt-3 flex justify-end">
          <Button variant="secondary" onClick={handleRunWhatIf} className="text-xs">
            Run What-If Simulation
          </Button>
        </div>

        {simulationResult && (
          <div className="mt-3 p-3 bg-white rounded border border-indigo-200 text-xs flex flex-col gap-1.5 animate-fadeIn">
            <div className="flex items-center justify-between">
              <span className="font-bold text-slate-900">Simulation Outcome:</span>
              <div className="flex items-center gap-2">
                <span className="text-slate-400">{simulationResult.originalEligibility.overallLabel}</span>
                <span>→</span>
                <StatusChip status={simulationResult.simulatedEligibility.overallLabel} />
              </div>
            </div>
            <p className="text-slate-700 font-medium">{simulationResult.deltaSummary}</p>
            <p className="text-[11px] text-slate-500 italic">
              Notice: This is a hypothetical calculation. Your actual saved profile remains unchanged.
            </p>
          </div>
        )}
      </Card>

      {/* WhatsApp Share Preview Modal */}
      <WhatsAppShareModal
        isOpen={isShareModalOpen}
        onClose={() => setIsShareModalOpen(false)}
        shareUrl={sharePayload.url}
        previewText={sharePayload.text}
        schemeName={scheme.name}
      />
    </div>
  );
}
