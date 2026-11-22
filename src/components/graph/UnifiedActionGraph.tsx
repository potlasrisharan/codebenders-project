import React, { useState } from 'react';
import {
  CheckCircle2,
  XCircle,
  HelpCircle,
  FileText,
  Send,
  Calendar,
  ExternalLink,
  ChevronRight,
  List,
  GitGraph,
} from 'lucide-react';
import { SchemeRecord } from '../../core/data/schema';
import { EligibilityResult, PredicateTrace } from '../../core/engine/eligibility-engine';
import { CitizenProfile } from '../../core/profile/citizen-profile';
import { Card } from '../ui/Card';

export interface UnifiedActionGraphProps {
  scheme: SchemeRecord;
  eligibility: EligibilityResult;
  profile: CitizenProfile;
  completedDocIds?: string[];
}

export type SelectedNodeInfo = {
  title: string;
  category: 'Profile' | 'Condition' | 'Document' | 'Application' | 'Follow-up';
  status: 'satisfied' | 'unmet' | 'unknown' | 'pending';
  source?: string;
  explanation: string;
  portalUrl?: string;
};

export const UnifiedActionGraph: React.FC<UnifiedActionGraphProps> = ({
  scheme,
  eligibility,
  completedDocIds = [],
}) => {
  const [selectedNode, setSelectedNode] = useState<SelectedNodeInfo | null>(null);
  const [viewMode, setViewMode] = useState<'visual' | 'linear'>('visual');

  const getPredicateStatus = (trace: PredicateTrace): 'satisfied' | 'unmet' | 'unknown' => {
    if (trace.result === 'true') return 'satisfied';
    if (trace.result === 'false') return 'unmet';
    return 'unknown';
  };

  return (
    <Card className="unified-action-graph p-4 bg-slate-50 border-slate-200">
      <div className="flex items-center justify-between border-b pb-3 mb-4">
        <div>
          <h3 className="font-bold text-slate-900 text-base flex items-center gap-2">
            <GitGraph className="w-5 h-5 text-indigo-600" aria-hidden="true" />
            Unified Eligibility Action Graph
          </h3>
          <p className="text-xs text-slate-500 mt-0.5">
            Interactive trace linking your eligibility rules directly to required documents and official actions.
          </p>
        </div>

        {/* View toggle for accessibility (Linear vs Visual) */}
        <div className="flex items-center bg-white border rounded p-0.5 text-xs">
          <button
            type="button"
            onClick={() => setViewMode('visual')}
            className={`px-2 py-1 rounded font-medium flex items-center gap-1 ${
              viewMode === 'visual' ? 'bg-indigo-50 text-indigo-700' : 'text-slate-600 hover:text-slate-900'
            }`}
          >
            <GitGraph className="w-3.5 h-3.5" /> Visual Graph
          </button>
          <button
            type="button"
            onClick={() => setViewMode('linear')}
            className={`px-2 py-1 rounded font-medium flex items-center gap-1 ${
              viewMode === 'linear' ? 'bg-indigo-50 text-indigo-700' : 'text-slate-600 hover:text-slate-900'
            }`}
          >
            <List className="w-3.5 h-3.5" /> Accessible List
          </button>
        </div>
      </div>

      {viewMode === 'visual' ? (
        /* Visual Graph Layout */
        <div className="overflow-x-auto pb-4">
          <div className="min-w-[700px] flex items-start justify-between gap-4 py-2">
            {/* Stage 1: Matched Conditions */}
            <div className="flex-1 flex flex-col gap-2">
              <span className="text-[11px] font-bold uppercase tracking-wider text-slate-500 flex items-center gap-1">
                1. Rule Conditions ({eligibility.predicateTraces.length})
              </span>
              <div className="flex flex-col gap-2">
                {eligibility.predicateTraces.map((trace) => {
                  const status = getPredicateStatus(trace);
                  return (
                    <button
                      key={trace.ruleId}
                      type="button"
                      onClick={() =>
                        setSelectedNode({
                          title: trace.conditionName,
                          category: 'Condition',
                          status,
                          source: trace.sourceClause,
                          explanation: trace.explanation,
                        })
                      }
                      className={`text-left p-2.5 rounded border text-xs transition-all shadow-sm flex items-center justify-between gap-2 ${
                        status === 'satisfied'
                          ? 'bg-emerald-50 border-emerald-200 text-emerald-950 hover:bg-emerald-100'
                          : status === 'unmet'
                          ? 'bg-rose-50 border-rose-200 text-rose-950 hover:bg-rose-100'
                          : 'bg-amber-50 border-amber-200 text-amber-950 hover:bg-amber-100'
                      }`}
                    >
                      <div className="flex items-center gap-2 truncate">
                        {status === 'satisfied' && <CheckCircle2 className="w-4 h-4 text-emerald-600 flex-shrink-0" />}
                        {status === 'unmet' && <XCircle className="w-4 h-4 text-rose-600 flex-shrink-0" />}
                        {status === 'unknown' && <HelpCircle className="w-4 h-4 text-amber-600 flex-shrink-0" />}
                        <span className="truncate font-medium">{trace.conditionName}</span>
                      </div>
                      <ChevronRight className="w-3 h-3 text-slate-400 flex-shrink-0" />
                    </button>
                  );
                })}
              </div>
            </div>

            {/* Connector */}
            <div className="pt-8 text-slate-300">
              <ChevronRight className="w-5 h-5" />
            </div>

            {/* Stage 2: Document Readiness */}
            <div className="flex-1 flex flex-col gap-2">
              <span className="text-[11px] font-bold uppercase tracking-wider text-slate-500 flex items-center gap-1">
                2. Documents ({scheme.documents.length})
              </span>
              <div className="flex flex-col gap-2">
                {scheme.documents.map((doc) => {
                  const isReady = completedDocIds.includes(doc.id);
                  return (
                    <button
                      key={doc.id}
                      type="button"
                      onClick={() =>
                        setSelectedNode({
                          title: doc.name,
                          category: 'Document',
                          status: isReady ? 'satisfied' : 'pending',
                          source: `${doc.issuingAuthority} • ${doc.sourceEvidence}`,
                          explanation: doc.description,
                        })
                      }
                      className={`text-left p-2.5 rounded border text-xs transition-all shadow-sm flex items-center justify-between gap-2 ${
                        isReady
                          ? 'bg-emerald-50 border-emerald-200 text-emerald-950 hover:bg-emerald-100'
                          : 'bg-white border-slate-200 text-slate-900 hover:bg-slate-100'
                      }`}
                    >
                      <div className="flex items-center gap-2 truncate">
                        <FileText className={`w-4 h-4 flex-shrink-0 ${isReady ? 'text-emerald-600' : 'text-slate-400'}`} />
                        <span className="truncate font-medium">{doc.name}</span>
                      </div>
                      <span className="text-[10px] px-1.5 py-0.5 rounded bg-slate-100 text-slate-600 uppercase font-semibold flex-shrink-0">
                        {doc.requirementType}
                      </span>
                    </button>
                  );
                })}
              </div>
            </div>

            {/* Connector */}
            <div className="pt-8 text-slate-300">
              <ChevronRight className="w-5 h-5" />
            </div>

            {/* Stage 3: Application Action */}
            <div className="flex-1 flex flex-col gap-2">
              <span className="text-[11px] font-bold uppercase tracking-wider text-slate-500 flex items-center gap-1">
                3. Official Action
              </span>
              <div className="flex flex-col gap-2">
                <button
                  type="button"
                  onClick={() =>
                    setSelectedNode({
                      title: 'Official Portal Registration',
                      category: 'Application',
                      status: 'pending',
                      source: scheme.sources[0]?.name,
                      portalUrl: scheme.sources[0]?.portalUrl,
                      explanation: `Apply directly on ${scheme.sources[0]?.portalUrl}. Step 1 is online submission followed by college biometric verification.`,
                    })
                  }
                  className="text-left p-2.5 rounded border border-blue-200 bg-blue-50 text-blue-950 hover:bg-blue-100 text-xs shadow-sm flex items-center justify-between gap-2"
                >
                  <div className="flex items-center gap-2">
                    <Send className="w-4 h-4 text-blue-600 flex-shrink-0" />
                    <span className="font-semibold">Submit Application</span>
                  </div>
                  <ExternalLink className="w-3.5 h-3.5 text-blue-500 flex-shrink-0" />
                </button>

                {scheme.renewalSupported && (
                  <button
                    type="button"
                    onClick={() =>
                      setSelectedNode({
                        title: 'Academic-Year Renewal Cycle',
                        category: 'Follow-up',
                        status: 'pending',
                        source: scheme.sources[0]?.name,
                        explanation: `Renew annually between ${scheme.renewalWindow || 'August and November'}. Ensure 75% quarterly attendance is maintained.`,
                      })
                    }
                    className="text-left p-2.5 rounded border border-purple-200 bg-purple-50 text-purple-950 hover:bg-purple-100 text-xs shadow-sm flex items-center justify-between gap-2"
                  >
                    <div className="flex items-center gap-2">
                      <Calendar className="w-4 h-4 text-purple-600 flex-shrink-0" />
                      <span className="font-semibold">Annual Renewal</span>
                    </div>
                    <span className="text-[10px] text-purple-600 font-bold">2026-27</span>
                  </button>
                )}
              </div>
            </div>
          </div>
        </div>
      ) : (
        /* Accessible Linear Fallback Layout */
        <div className="flex flex-col gap-4 py-2">
          <div>
            <h4 className="text-xs font-bold uppercase tracking-wider text-slate-600 mb-2">1. Rule Conditions</h4>
            <ul className="space-y-1.5 list-none pl-0">
              {eligibility.predicateTraces.map((trace) => {
                const status = getPredicateStatus(trace);
                return (
                  <li
                    key={trace.ruleId}
                    className="p-2 rounded border text-xs flex flex-col gap-1 bg-white"
                  >
                    <div className="flex items-center gap-2 font-semibold text-slate-900">
                      {status === 'satisfied' && <span className="text-emerald-700">✓ [Satisfied]</span>}
                      {status === 'unmet' && <span className="text-rose-700">✗ [Unmet]</span>}
                      {status === 'unknown' && <span className="text-amber-700">? [Need to Confirm]</span>}
                      {trace.conditionName}
                    </div>
                    <p className="text-slate-600 text-[11px]">{trace.explanation}</p>
                    <span className="text-[10px] text-slate-400">Source: {trace.sourceClause}</span>
                  </li>
                );
              })}
            </ul>
          </div>

          <div>
            <h4 className="text-xs font-bold uppercase tracking-wider text-slate-600 mb-2">2. Required Documents</h4>
            <ul className="space-y-1.5 list-none pl-0">
              {scheme.documents.map((doc) => (
                <li key={doc.id} className="p-2 rounded border text-xs bg-white flex flex-col gap-0.5">
                  <div className="font-semibold text-slate-900 flex items-center justify-between">
                    <span>{doc.name}</span>
                    <span className="text-[10px] px-1 bg-slate-100 rounded text-slate-600 uppercase">
                      {doc.requirementType}
                    </span>
                  </div>
                  <p className="text-slate-600 text-[11px]">{doc.description}</p>
                  <span className="text-[10px] text-slate-400">Issued by: {doc.issuingAuthority}</span>
                </li>
              ))}
            </ul>
          </div>
        </div>
      )}

      {/* Selected Node Drawer / Detail View */}
      {selectedNode && (
        <div className="mt-4 p-3 bg-white rounded border border-indigo-200 shadow-sm animate-fadeIn">
          <div className="flex items-start justify-between gap-2 border-b border-slate-100 pb-2">
            <div>
              <span className="text-[10px] uppercase font-bold tracking-wider text-indigo-600">
                {selectedNode.category} Detail
              </span>
              <h4 className="font-bold text-slate-900 text-sm">{selectedNode.title}</h4>
            </div>
            <button
              onClick={() => setSelectedNode(null)}
              className="text-slate-400 hover:text-slate-600 text-xs px-2 py-0.5 rounded border"
            >
              Dismiss
            </button>
          </div>

          <p className="text-xs text-slate-700 mt-2 leading-relaxed">{selectedNode.explanation}</p>

          {selectedNode.source && (
            <p className="text-[11px] text-slate-500 mt-2">
              <span className="font-semibold text-slate-700">Official Evidence: </span>
              {selectedNode.source}
            </p>
          )}

          {selectedNode.portalUrl && (
            <div className="mt-3">
              <a
                href={selectedNode.portalUrl}
                target="_blank"
                rel="noopener noreferrer"
                className="inline-flex items-center gap-1.5 px-3 py-1.5 bg-blue-600 hover:bg-blue-700 text-white rounded text-xs font-semibold"
              >
                Open Official Portal <ExternalLink className="w-3.5 h-3.5" />
              </a>
            </div>
          )}
        </div>
      )}
    </Card>
  );
};
