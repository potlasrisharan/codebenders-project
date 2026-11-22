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
  Building2,
  Layers,
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
    <div className="stack scheme-detail-page max-w-4xl mx-auto py-6 px-3 sm:px-4 space-y-6">
      {/* Top Breadcrumb & Heading */}
      <div className="border-b border-zinc-200 pb-4 space-y-3">
        <Link
          to="/matches"
          className="text-xs text-zinc-500 hover:text-zinc-900 inline-flex items-center gap-1 font-medium transition-colors"
        >
          <ChevronLeft className="w-3.5 h-3.5" /> Back to Matches
        </Link>

        <div className="flex flex-col sm:flex-row sm:items-start justify-between gap-4">
          <div className="space-y-1">
            <div className="flex flex-wrap items-center gap-2">
              <span className="text-[10px] font-bold uppercase tracking-wider px-2.5 py-0.5 rounded-full bg-zinc-100 text-zinc-700">
                {scheme.jurisdiction === 'central' ? 'Central Scheme' : `${scheme.state} State Benefit`}
              </span>
              <span className="text-[11px] text-zinc-500 flex items-center gap-1">
                <Building2 className="w-3.5 h-3.5 text-zinc-400" />
                {scheme.sources[0]?.department}
              </span>
              <span className="text-zinc-300">•</span>
              <span className="text-[11px] text-zinc-400 font-mono">
                Cataloged v{scheme.version} • Verified {scheme.lastVerifiedDate}
              </span>
            </div>

            <h1 className="text-3xl font-extrabold text-zinc-900 tracking-tight leading-tight">
              Scheme detail
            </h1>
            <h2 className="text-xl font-bold text-zinc-800 mt-1">
              {scheme.name}
            </h2>
            <p className="text-xs text-zinc-600 max-w-2xl leading-relaxed mt-1">
              {scheme.shortDescription}
            </p>
          </div>

          <div className="flex flex-wrap items-center gap-2 flex-shrink-0">
            <StatusChip status={eligibility.overallLabel} />

            <Button
              variant={isSaved ? 'secondary' : 'primary'}
              onClick={handleToggleSave}
              className={`text-xs px-3.5 py-2 flex items-center gap-1.5 btn-tactile ${
                isSaved ? 'border-emerald-300 text-emerald-800 bg-emerald-50' : 'bg-zinc-900 text-white'
              }`}
            >
              {isSaved ? <BookmarkCheck className="w-4 h-4 text-emerald-600" /> : <Bookmark className="w-4 h-4" />}
              {isSaved ? 'Saved in Tracker' : 'Save Scheme'}
            </Button>

            <button
              type="button"
              onClick={() => setIsShareModalOpen(true)}
              className="p-2 border border-zinc-300 rounded-lg hover:bg-zinc-50 text-zinc-700 transition-colors btn-tactile"
              title="Share checklist on WhatsApp"
              aria-label="Share checklist on WhatsApp"
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
      <Card className="p-5 bg-white border-zinc-200/90 shadow-xs space-y-4">
        <div className="flex flex-col sm:flex-row sm:items-center justify-between border-b border-zinc-100 pb-3 gap-2">
          <div className="flex items-center gap-2.5">
            <FileText className="w-5 h-5 text-zinc-800" />
            <div>
              <h3 className="font-bold text-zinc-900 text-sm">
                Personalised Document Readiness Checklist
              </h3>
              <p className="text-[11px] text-zinc-500">
                Track and check off certificates as you obtain them from government portals or college administration.
              </p>
            </div>
          </div>
          <span className="text-xs font-semibold px-2.5 py-1 rounded-full bg-zinc-100 text-zinc-800 w-fit">
            {completedDocIds.length} of {scheme.documents.length} ready
          </span>
        </div>

        <div className="space-y-2.5">
          {scheme.documents.map((doc) => {
            const isCompleted = completedDocIds.includes(doc.id);
            return (
              <div
                key={doc.id}
                className={`p-3.5 rounded-xl border text-xs flex items-start justify-between gap-3 transition-all duration-200 ${
                  isCompleted
                    ? 'bg-emerald-50/50 border-emerald-200 ring-1 ring-emerald-500/10'
                    : 'bg-zinc-50/60 border-zinc-200/80 hover:bg-white hover:shadow-xs'
                }`}
              >
                <div className="flex items-start gap-3">
                  <button
                    type="button"
                    onClick={() => handleToggleDocument(doc.id)}
                    className="mt-0.5 text-zinc-600 hover:text-zinc-900 transition-colors"
                    aria-label={`Mark ${doc.name} as ready`}
                  >
                    {isCompleted ? (
                      <CheckSquare className="w-4 h-4 text-emerald-600" />
                    ) : (
                      <Square className="w-4 h-4 text-zinc-400" />
                    )}
                  </button>

                  <div className="space-y-1">
                    <div className="flex flex-wrap items-center gap-2">
                      <span
                        className={`font-bold ${
                          isCompleted ? 'line-through text-zinc-500' : 'text-zinc-900'
                        }`}
                      >
                        {doc.name}
                      </span>
                      <span
                        className={`text-[10px] font-bold uppercase px-2 py-0.5 rounded-full ${
                          doc.requirementType === 'mandatory'
                            ? 'bg-rose-100 text-rose-800'
                            : 'bg-zinc-100 text-zinc-600'
                        }`}
                      >
                        {doc.requirementType}
                      </span>
                    </div>

                    <p className="text-zinc-600 leading-relaxed">{doc.description}</p>
                    <div className="flex flex-wrap items-center gap-2 text-[11px] text-zinc-500 pt-1">
                      <span>
                        Issuing Authority: <strong className="text-zinc-800">{doc.issuingAuthority}</strong>
                      </span>
                      <span className="text-zinc-300">•</span>
                      <span>Evidence Clause: {doc.sourceEvidence}</span>
                    </div>
                  </div>
                </div>
              </div>
            );
          })}
        </div>
      </Card>

      {/* Sourced Step-by-Step Official Application Instructions (P7) */}
      <Card className="p-5 bg-white border-zinc-200/90 shadow-xs space-y-4">
        <div className="flex items-center gap-2.5 border-b border-zinc-100 pb-3">
          <Layers className="w-5 h-5 text-zinc-800" />
          <div>
            <h3 className="font-bold text-zinc-900 text-sm">
              Step-by-Step Official Application Process
            </h3>
            <p className="text-[11px] text-zinc-500">
              Verified from official government departmental guidelines. Follow in order.
            </p>
          </div>
        </div>

        <ol className="space-y-3 list-none pl-0">
          {scheme.applicationSteps.map((step) => (
            <li
              key={step.stepNumber}
              className="flex items-start gap-3.5 text-xs p-3 rounded-xl bg-zinc-50/60 border border-zinc-100"
            >
              <span className="w-6 h-6 rounded-full bg-zinc-900 text-white font-bold flex items-center justify-center flex-shrink-0 text-xs mt-0.5 shadow-xs">
                {step.stepNumber}
              </span>
              <div className="flex-1 space-y-1">
                <span className="font-bold text-zinc-900 block text-xs">{step.title}</span>
                <p className="text-zinc-600 leading-relaxed">{step.description}</p>
                {step.portalUrl && (
                  <a
                    href={step.portalUrl}
                    target="_blank"
                    rel="noopener noreferrer"
                    className="inline-flex items-center gap-1 text-[11px] font-semibold text-zinc-900 hover:underline pt-1"
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
      <Card className="p-5 bg-zinc-50/60 border-zinc-200/90 shadow-xs space-y-3.5">
        <div className="flex items-center gap-2 border-b border-zinc-200/70 pb-3">
          <Sparkles className="w-5 h-5 text-zinc-800" />
          <div>
            <h3 className="font-bold text-zinc-900 text-sm">What-If Eligibility Simulation</h3>
            <p className="text-[11px] text-zinc-500">
              Hypothetically adjust your income or attendance without changing your saved profile.
            </p>
          </div>
        </div>

        <div className="grid grid-cols-1 sm:grid-cols-2 gap-3 text-xs">
          <div>
            <label className="font-bold text-zinc-800 block mb-1">
              Hypothetical Annual Family Income (₹):
            </label>
            <input
              type="number"
              value={whatIfIncome}
              onChange={(e) => setWhatIfIncome(Number(e.target.value))}
              className="w-full p-2.5 border border-zinc-300 rounded-lg bg-white focus:ring-1 focus:ring-zinc-900 focus:outline-none"
            />
          </div>

          <div>
            <label className="font-bold text-zinc-800 block mb-1">
              Hypothetical Attendance (%):
            </label>
            <input
              type="number"
              value={whatIfAttendance}
              onChange={(e) => setWhatIfAttendance(Number(e.target.value))}
              className="w-full p-2.5 border border-zinc-300 rounded-lg bg-white focus:ring-1 focus:ring-zinc-900 focus:outline-none"
            />
          </div>
        </div>

        <div className="pt-2 flex justify-end">
          <Button
            variant="secondary"
            onClick={handleRunWhatIf}
            className="text-xs px-4 py-2 btn-tactile bg-white border-zinc-300 hover:border-zinc-400 font-semibold text-zinc-800"
          >
            Run What-If Simulation
          </Button>
        </div>

        {simulationResult && (
          <div className="mt-2 p-4 bg-white rounded-xl border border-zinc-200 text-xs space-y-2 animate-slide-down-fade shadow-xs">
            <div className="flex items-center justify-between">
              <span className="font-bold text-zinc-900">Simulation Outcome:</span>
              <div className="flex items-center gap-2">
                <span className="text-zinc-400">{simulationResult.originalEligibility.overallLabel}</span>
                <span className="text-zinc-400">→</span>
                <StatusChip status={simulationResult.simulatedEligibility.overallLabel} />
              </div>
            </div>
            <p className="text-zinc-700 font-medium leading-relaxed">{simulationResult.deltaSummary}</p>
            <p className="text-[11px] text-zinc-400 italic">
              Notice: This is a hypothetical calculation. Your actual saved citizen profile remains untouched.
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
