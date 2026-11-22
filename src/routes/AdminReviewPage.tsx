import { useState } from 'react';
import {
  ShieldCheck,
  CheckCircle2,
  AlertTriangle,
  History,
  Globe,
  ExternalLink,
} from 'lucide-react';
import { defaultSchemeRepository } from '../core/data/repository';
import { NATIONAL_STATE_COVERAGE } from '../core/data/coverage-registry';
import { Card } from '../components/ui/Card';

export function AdminReviewPage() {
  const [schemes] = useState(() => defaultSchemeRepository.getAllIncludingDrafts());
  const auditLogs = defaultSchemeRepository.getAuditLog();
  const [selectedSchemeId, setSelectedSchemeId] = useState<string>(schemes[0]?.id || '');

  const versionHistory = defaultSchemeRepository.getVersionHistory(selectedSchemeId);

  return (
    <div className="stack admin-review-page max-w-5xl mx-auto py-4 px-2">
      <div className="border-b pb-3 mb-2">
        <h1 className="text-2xl font-bold text-slate-900 flex items-center gap-2">
          <ShieldCheck className="w-6 h-6 text-indigo-600" aria-hidden="true" />
          Admin review
        </h1>
        <p className="text-sm text-slate-600 mt-1">
          Source governance, authoritative provenance, rule version auditing, and national jurisdiction coverage.
        </p>
      </div>

      {/* Section 1: Scheme Provenance & Verification Audit */}
      <div className="flex flex-col gap-3">
        <div className="flex items-center justify-between">
          <h2 className="text-sm font-bold text-slate-900">
            1. Sourced Scheme Records ({schemes.length} Cataloged)
          </h2>
          <span className="text-xs text-slate-500">
            Zero unreviewed AI extraction permitted in production
          </span>
        </div>

        <div className="overflow-x-auto bg-white rounded border border-slate-200 shadow-sm">
          <table className="w-full text-left text-xs border-collapse">
            <thead>
              <tr className="bg-slate-50 border-b border-slate-200 text-slate-700">
                <th className="p-2.5 font-semibold">Scheme & Department</th>
                <th className="p-2.5 font-semibold">Jurisdiction</th>
                <th className="p-2.5 font-semibold">Version</th>
                <th className="p-2.5 font-semibold">Status</th>
                <th className="p-2.5 font-semibold">Fee State</th>
                <th className="p-2.5 font-semibold">Last Verified</th>
                <th className="p-2.5 font-semibold">Official Link</th>
              </tr>
            </thead>
            <tbody className="divide-y divide-slate-100">
              {schemes.map((s) => (
                <tr
                  key={s.id}
                  onClick={() => setSelectedSchemeId(s.id)}
                  className={`cursor-pointer transition-colors ${
                    selectedSchemeId === s.id ? 'bg-indigo-50/60' : 'hover:bg-slate-50'
                  }`}
                >
                  <td className="p-2.5">
                    <span className="font-bold text-slate-900 block">{s.name}</span>
                    <span className="text-[11px] text-slate-500">{s.sources[0]?.department}</span>
                  </td>
                  <td className="p-2.5 uppercase font-medium text-slate-600">
                    {s.jurisdiction === 'central' ? 'Central' : s.state}
                  </td>
                  <td className="p-2.5 font-mono text-[11px] text-slate-700">{s.version}</td>
                  <td className="p-2.5">
                    <span
                      className={`inline-flex items-center gap-1 px-2 py-0.5 rounded text-[11px] font-bold ${
                        s.verificationStatus === 'verified'
                          ? 'bg-emerald-100 text-emerald-800'
                          : 'bg-amber-100 text-amber-800'
                      }`}
                    >
                      {s.verificationStatus === 'verified' && <CheckCircle2 className="w-3 h-3" />}
                      {s.verificationStatus}
                    </span>
                  </td>
                  <td className="p-2.5">
                    <span className="text-[11px] font-semibold text-slate-700">
                      {s.feeStatus === 'free_verified' ? '100% Free' : s.feeStatus}
                    </span>
                  </td>
                  <td className="p-2.5 text-slate-600">{s.lastVerifiedDate}</td>
                  <td className="p-2.5">
                    <a
                      href={s.sources[0]?.portalUrl}
                      target="_blank"
                      rel="noopener noreferrer"
                      className="text-blue-700 hover:underline inline-flex items-center gap-1 font-semibold"
                    >
                      Portal <ExternalLink className="w-3 h-3" />
                    </a>
                  </td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>
      </div>

      {/* Section 2: National State Coverage Registry (FR-DATA-11) */}
      <div className="flex flex-col gap-3 pt-3">
        <div className="flex items-center gap-2">
          <Globe className="w-5 h-5 text-indigo-600" />
          <h2 className="text-sm font-bold text-slate-900">
            2. National State Coverage Registry (FR-DATA-11)
          </h2>
        </div>

        <p className="text-xs text-slate-500">
          Transparent accounting of state-level data readiness. Empty search results in unverified states explicitly cite this registry.
        </p>

        <div className="grid grid-cols-1 md:grid-cols-2 gap-3 text-xs">
          {NATIONAL_STATE_COVERAGE.map((item) => (
            <Card key={item.stateCode} className="p-3 bg-white border-slate-200">
              <div className="flex items-start justify-between">
                <div>
                  <h3 className="font-bold text-slate-900 text-sm">{item.stateName}</h3>
                  <span className="text-[11px] text-slate-400">
                    State Code: {item.stateCode} • Last Audit: {item.lastAuditDate}
                  </span>
                </div>

                <span
                  className={`text-[10px] font-bold px-2 py-0.5 rounded uppercase ${
                    item.coverageStatus === 'covered'
                      ? 'bg-emerald-100 text-emerald-800'
                      : item.coverageStatus === 'partial'
                      ? 'bg-amber-100 text-amber-800'
                      : 'bg-slate-100 text-slate-600'
                  }`}
                >
                  {item.coverageStatus.replace(/_/g, ' ')}
                </span>
              </div>

              <p className="text-slate-600 mt-2 text-[11px] leading-relaxed">{item.notes}</p>
            </Card>
          ))}
        </div>
      </div>

      {/* Section 3: Audit Trail & Rule Version History */}
      <div className="flex flex-col gap-3 pt-3">
        <div className="flex items-center gap-2">
          <History className="w-5 h-5 text-indigo-600" />
          <h2 className="text-sm font-bold text-slate-900">
            3. Audit History & Rule Version Diffs
          </h2>
        </div>

        <div className="grid grid-cols-1 md:grid-cols-2 gap-3">
          {/* Audit Logs */}
          <Card className="p-3 bg-white border-slate-200">
            <h3 className="font-bold text-xs text-slate-900 mb-2 border-b pb-1">
              Audit Trail Entries ({auditLogs.length})
            </h3>
            <div className="flex flex-col gap-2 max-h-56 overflow-y-auto">
              {auditLogs.map((log, idx) => (
                <div key={idx} className="p-2 bg-slate-50 rounded text-xs border border-slate-100">
                  <div className="flex items-center justify-between text-[11px] font-bold text-slate-700">
                    <span>{log.action} • {log.schemeId}</span>
                    <span className="text-slate-400 font-normal">{new Date(log.timestamp).toLocaleDateString()}</span>
                  </div>
                  <p className="text-slate-600 mt-1 text-[11px]">{log.details}</p>
                  <span className="text-[10px] text-slate-400">Auditor: {log.actor}</span>
                </div>
              ))}
            </div>
          </Card>

          {/* Version Diffs */}
          <Card className="p-3 bg-white border-slate-200">
            <h3 className="font-bold text-xs text-slate-900 mb-2 border-b pb-1">
              Version History for Selected Scheme ({versionHistory.length} Record(s))
            </h3>
            {versionHistory.length === 0 ? (
              <p className="text-xs text-slate-400 italic py-4 text-center">
                Initial verified baseline version. No prior deprecated versions.
              </p>
            ) : (
              <div className="flex flex-col gap-2">
                {versionHistory.map((v, i) => (
                  <div key={i} className="p-2 bg-slate-50 rounded text-xs border border-slate-100">
                    <div className="flex items-center justify-between font-bold text-slate-900">
                      <span>Version: {v.version}</span>
                      <span className="text-slate-500 font-normal text-[11px]">Effective: {v.effectiveDate}</span>
                    </div>
                    <p className="text-slate-700 mt-1 font-medium">{v.changesSummary}</p>
                    <p className="text-[11px] text-slate-500 mt-0.5">Delta: {v.ruleDelta}</p>
                  </div>
                ))}
              </div>
            )}
          </Card>
        </div>
      </div>

      {/* Middleman Shield Policy Statement */}
      <Card className="p-3 bg-amber-50/50 border-amber-200 text-xs text-amber-950 flex items-start gap-2">
        <AlertTriangle className="w-4 h-4 text-amber-700 flex-shrink-0 mt-0.5" />
        <div>
          <span className="font-bold">Administrative Rule Compliance:</span> Standalone terms like &quot;Eligible&quot; or &quot;Guaranteed&quot; are forbidden across all screens. All outcomes must use the four standard likelihood labels. Scheme fee state must be verified before claiming free service.
        </div>
      </Card>
    </div>
  );
}
