import { useState } from 'react';
import {
  ShieldCheck,
  CheckCircle2,
  AlertTriangle,
  History,
  Globe,
  ExternalLink,
  Lock,
} from 'lucide-react';
import { defaultSchemeRepository } from '../core/data/repository';
import { NATIONAL_STATE_COVERAGE } from '../core/data/coverage-registry';
import { Card } from '../components/ui/Card';

export function AdminReviewPage() {
  const [schemes] = useState(() => defaultSchemeRepository.getAllIncludingDrafts());
  const auditLogs = defaultSchemeRepository.getAuditLog();
  const [selectedSchemeId, setSelectedSchemeId] = useState<string>(schemes[0]?.id || '');

  const versionHistory = defaultSchemeRepository.getVersionHistory(selectedSchemeId);
  const selectedScheme = schemes.find((s) => s.id === selectedSchemeId) || schemes[0];

  return (
    <div className="stack admin-review-page max-w-5xl mx-auto py-6 px-3 sm:px-4 space-y-6">
      {/* Editorial Header */}
      <div className="border-b border-zinc-200 pb-4">
        <div className="flex items-center gap-2 mb-1.5">
          <span className="inline-flex items-center gap-1 px-2.5 py-0.5 rounded-full text-[11px] font-bold tracking-wider uppercase bg-zinc-100 text-zinc-700">
            <Lock className="w-3.5 h-3.5 text-zinc-700" />
            Governance &amp; Source Auditing
          </span>
          <span className="text-[11px] font-medium text-emerald-700 bg-emerald-50 px-2 py-0.5 rounded-full border border-emerald-200">
            Zero Unverified LLM Extraction
          </span>
        </div>
        <h1 className="text-3xl font-extrabold text-zinc-900 tracking-tight flex items-center gap-2.5">
          <ShieldCheck className="w-7 h-7 text-zinc-900" aria-hidden="true" />
          Admin review
        </h1>
        <p className="text-sm text-zinc-600 mt-1 max-w-2xl leading-relaxed">
          Source governance, authoritative provenance, rule version auditing, and national jurisdiction coverage registry.
        </p>
      </div>

      {/* Section 1: Scheme Provenance & Verification Audit */}
      <section aria-labelledby="provenance-heading" className="space-y-3">
        <div className="flex flex-col sm:flex-row sm:items-center justify-between gap-1">
          <h2 id="provenance-heading" className="text-sm font-bold text-zinc-900">
            1. Sourced Scheme Records ({schemes.length} Cataloged)
          </h2>
          <span className="text-[11px] text-zinc-500 font-mono">
            Click any row to inspect version diffs
          </span>
        </div>

        <div className="overflow-x-auto bg-white rounded-2xl border border-zinc-200/90 shadow-xs">
          <table className="w-full text-left text-xs border-collapse">
            <thead>
              <tr className="bg-zinc-50 border-b border-zinc-200 text-zinc-700">
                <th className="p-3 font-bold">Scheme &amp; Department</th>
                <th className="p-3 font-bold">Jurisdiction</th>
                <th className="p-3 font-bold">Version</th>
                <th className="p-3 font-bold">Status</th>
                <th className="p-3 font-bold">Official Fee State</th>
                <th className="p-3 font-bold">Last Verified</th>
                <th className="p-3 font-bold">Portal</th>
              </tr>
            </thead>
            <tbody className="divide-y divide-zinc-100">
              {schemes.map((s) => (
                <tr
                  key={s.id}
                  onClick={() => setSelectedSchemeId(s.id)}
                  className={`cursor-pointer transition-colors ${
                    selectedSchemeId === s.id ? 'bg-zinc-100/70 font-medium' : 'hover:bg-zinc-50/70'
                  }`}
                >
                  <td className="p-3">
                    <span className="font-bold text-zinc-900 block leading-tight">{s.name}</span>
                    <span className="text-[11px] text-zinc-500">{s.sources[0]?.department}</span>
                  </td>
                  <td className="p-3 uppercase font-semibold text-zinc-600 text-[11px]">
                    {s.jurisdiction === 'central' ? 'Central' : s.state}
                  </td>
                  <td className="p-3 font-mono text-[11px] text-zinc-700">v{s.version}</td>
                  <td className="p-3">
                    <span
                      className={`inline-flex items-center gap-1 px-2.5 py-0.5 rounded-full text-[11px] font-bold ${
                        s.verificationStatus === 'verified'
                          ? 'bg-emerald-100 text-emerald-800'
                          : 'bg-amber-100 text-amber-800'
                      }`}
                    >
                      {s.verificationStatus === 'verified' && <CheckCircle2 className="w-3 h-3" />}
                      {s.verificationStatus}
                    </span>
                  </td>
                  <td className="p-3">
                    <span className="text-[11px] font-semibold text-zinc-800">
                      {s.feeStatus === 'free_verified' ? '100% Free' : s.feeStatus}
                    </span>
                  </td>
                  <td className="p-3 text-zinc-600 font-mono text-[11px]">{s.lastVerifiedDate}</td>
                  <td className="p-3">
                    <a
                      href={s.sources[0]?.portalUrl}
                      target="_blank"
                      rel="noopener noreferrer"
                      className="text-zinc-800 hover:text-zinc-950 hover:underline inline-flex items-center gap-1 font-semibold"
                      onClick={(e) => e.stopPropagation()}
                    >
                      Portal <ExternalLink className="w-3 h-3" />
                    </a>
                  </td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>
      </section>

      {/* Section 2: National State Coverage Registry (FR-DATA-11) */}
      <section aria-labelledby="coverage-heading" className="space-y-3 pt-2">
        <div className="flex items-center gap-2">
          <Globe className="w-5 h-5 text-zinc-800" />
          <h2 id="coverage-heading" className="text-sm font-bold text-zinc-900">
            2. National State Coverage Registry (FR-DATA-11)
          </h2>
        </div>

        <p className="text-xs text-zinc-500">
          Transparent status of state-level data readiness. Non-verified jurisdictions trigger explicit data disclosures rather than silent failure.
        </p>

        <div className="grid grid-cols-1 md:grid-cols-2 gap-3 text-xs">
          {NATIONAL_STATE_COVERAGE.map((item) => (
            <Card key={item.stateCode} className="p-4 bg-white border-zinc-200/90 rounded-2xl shadow-xs space-y-2">
              <div className="flex items-start justify-between">
                <div>
                  <h3 className="font-bold text-zinc-900 text-sm">{item.stateName}</h3>
                  <span className="text-[11px] text-zinc-400 font-mono">
                    Code: {item.stateCode} • Last Audit: {item.lastAuditDate}
                  </span>
                </div>

                <span
                  className={`text-[10px] font-bold px-2 py-0.5 rounded-full uppercase ${
                    item.coverageStatus === 'covered'
                      ? 'bg-emerald-100 text-emerald-800'
                      : item.coverageStatus === 'partial'
                      ? 'bg-amber-100 text-amber-800'
                      : 'bg-zinc-100 text-zinc-600'
                  }`}
                >
                  {item.coverageStatus.replace(/_/g, ' ')}
                </span>
              </div>

              <p className="text-zinc-600 text-[11px] leading-relaxed">{item.notes}</p>
            </Card>
          ))}
        </div>
      </section>

      {/* Section 3: Audit Trail & Rule Version History */}
      <section aria-labelledby="audit-heading" className="space-y-3 pt-2">
        <div className="flex items-center gap-2">
          <History className="w-5 h-5 text-zinc-800" />
          <h2 id="audit-heading" className="text-sm font-bold text-zinc-900">
            3. Audit History &amp; Rule Version Diffs
          </h2>
        </div>

        <div className="grid grid-cols-1 md:grid-cols-2 gap-3">
          {/* Audit Logs */}
          <Card className="p-4 bg-white border-zinc-200/90 rounded-2xl shadow-xs space-y-2.5">
            <h3 className="font-bold text-xs text-zinc-900 border-b border-zinc-100 pb-2">
              Audit Trail Entries ({auditLogs.length})
            </h3>
            <div className="space-y-2 max-h-64 overflow-y-auto pr-1">
              {auditLogs.map((log, idx) => (
                <div key={idx} className="p-2.5 bg-zinc-50 rounded-xl text-xs border border-zinc-100 space-y-1">
                  <div className="flex items-center justify-between text-[11px] font-bold text-zinc-700">
                    <span>{log.action} • {log.schemeId}</span>
                    <span className="text-zinc-400 font-mono font-normal">
                      {new Date(log.timestamp).toLocaleDateString()}
                    </span>
                  </div>
                  <p className="text-zinc-600 text-[11px] leading-relaxed">{log.details}</p>
                  <span className="text-[10px] text-zinc-400 font-mono block">Auditor: {log.actor}</span>
                </div>
              ))}
            </div>
          </Card>

          {/* Version Diffs */}
          <Card className="p-4 bg-white border-zinc-200/90 rounded-2xl shadow-xs space-y-2.5">
            <h3 className="font-bold text-xs text-zinc-900 border-b border-zinc-100 pb-2">
              Version History: {selectedScheme.name} ({versionHistory.length} Record(s))
            </h3>
            {versionHistory.length === 0 ? (
              <p className="text-xs text-zinc-400 italic py-6 text-center">
                Initial verified baseline version. No prior deprecated versions.
              </p>
            ) : (
              <div className="space-y-2">
                {versionHistory.map((v, i) => (
                  <div key={i} className="p-2.5 bg-zinc-50 rounded-xl text-xs border border-zinc-100 space-y-1">
                    <div className="flex items-center justify-between font-bold text-zinc-900">
                      <span>Version: {v.version}</span>
                      <span className="text-zinc-500 font-mono text-[11px]">Effective: {v.effectiveDate}</span>
                    </div>
                    <p className="text-zinc-700 font-medium">{v.changesSummary}</p>
                    <p className="text-[11px] text-zinc-500 font-mono">Delta: {v.ruleDelta}</p>
                  </div>
                ))}
              </div>
            )}
          </Card>
        </div>
      </section>

      {/* Middleman Shield Policy Statement */}
      <Card className="p-4 bg-amber-50/70 border-amber-200 rounded-2xl text-xs text-amber-950 flex items-start gap-3 shadow-xs">
        <AlertTriangle className="w-5 h-5 text-amber-700 flex-shrink-0 mt-0.5" />
        <div className="space-y-1 leading-relaxed">
          <span className="font-bold block text-sm text-amber-900">Administrative Rule Compliance:</span>
          <p>
            Standalone terms like &quot;Eligible&quot;, &quot;Guaranteed&quot;, or &quot;Approved&quot; are strictly forbidden across all citizen-facing interfaces. All evaluations use the four canonical likelihood labels: <em>Likely eligible, Need to confirm, Unlikely, Can&apos;t tell yet</em>. Zero raw identity numbers (Aadhaar/PAN) are ever accepted or stored.
          </p>
        </div>
      </Card>
    </div>
  );
}
