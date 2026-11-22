import React from 'react';
import { AlertTriangle, ShieldCheck, ExternalLink, HelpCircle, PhoneCall, CheckCircle } from 'lucide-react';
import { FeeStatus } from '../../core/data/schema';
import { Card } from '../ui/Card';

export interface MiddlemanShieldCardProps {
  feeStatus: FeeStatus;
  feeDetails?: string;
  scamWarning: string;
  officialPortalUrl: string;
  departmentName: string;
  lastVerifiedDate: string;
}

export const MiddlemanShieldCard: React.FC<MiddlemanShieldCardProps> = ({
  feeStatus,
  feeDetails,
  scamWarning,
  officialPortalUrl,
  departmentName,
  lastVerifiedDate,
}) => {
  const isTelangana = officialPortalUrl.includes('telangana') || officialPortalUrl.includes('cgg.gov.in');

  return (
    <Card className="middleman-shield-card border-blue-200 bg-blue-50/40">
      <div className="flex flex-col gap-4">
        {/* Header */}
        <div className="flex items-center justify-between border-b border-blue-200 pb-2">
          <div className="flex items-center gap-2">
            <ShieldCheck className="w-5 h-5 text-blue-700" aria-hidden="true" />
            <h3 className="font-semibold text-blue-950 text-base">Middleman Shield & Fee Transparency</h3>
          </div>
          <span className="text-[10px] uppercase font-bold tracking-wider px-2 py-0.5 rounded-full bg-emerald-100 text-emerald-800 border border-emerald-200">
            Citizen Rights Protected
          </span>
        </div>

        {/* Fee state check */}
        <div className="flex items-start gap-3 p-3 bg-white rounded-xl border border-blue-100 shadow-2xs">
          {feeStatus === 'free_verified' ? (
            <div className="w-2.5 h-2.5 rounded-full bg-emerald-600 mt-1.5 flex-shrink-0" />
          ) : feeStatus === 'fee_verified' ? (
            <div className="w-2.5 h-2.5 rounded-full bg-amber-500 mt-1.5 flex-shrink-0" />
          ) : (
            <HelpCircle className="w-4 h-4 text-slate-400 mt-0.5 flex-shrink-0" />
          )}

          <div className="flex-1">
            <span className="text-xs uppercase tracking-wider font-bold text-slate-500">Official Cost</span>
            <p className="text-sm font-semibold text-slate-900 mt-0.5 flex items-center gap-1.5">
              {feeStatus === 'free_verified' && 'Official application is 100% FREE'}
              {feeStatus === 'fee_verified' && 'Official fee required'}
              {feeStatus === 'unknown' && 'Fee information not verified with department'}
              {feeStatus === 'free_verified' && <CheckCircle className="w-4 h-4 text-emerald-600 inline" />}
            </p>
            {feeDetails && <p className="text-xs text-slate-600 mt-1">{feeDetails}</p>}
          </div>
        </div>

        {/* Scam warning banner */}
        <div className="flex items-start gap-3 p-3 bg-amber-50 rounded-xl border border-amber-200">
          <AlertTriangle className="w-5 h-5 text-amber-700 flex-shrink-0 mt-0.5" aria-hidden="true" />
          <div className="text-xs text-amber-950 leading-relaxed">
            <span className="font-bold text-amber-900 block mb-0.5">Scam Warning:</span>
            {scamWarning}
          </div>
        </div>

        {/* Direct Official Deep-Links */}
        {isTelangana && (
          <div className="p-3 bg-white/90 rounded-xl border border-blue-100 space-y-2">
            <span className="text-xs font-bold text-zinc-900 block">Direct Official Sub-Portal Links:</span>
            <div className="flex flex-wrap gap-2 text-xs">
              <a
                href="https://telanganaepass.cgg.gov.in/PostmatricFresh.do"
                target="_blank"
                rel="noopener noreferrer"
                className="inline-flex items-center gap-1 px-2.5 py-1 rounded bg-zinc-100 hover:bg-zinc-200 text-zinc-800 font-medium transition-colors"
              >
                ePASS Fresh Application <ExternalLink className="w-3 h-3 text-zinc-500" />
              </a>
              <a
                href="https://telanganaepass.cgg.gov.in/PostmatricRenewals.do"
                target="_blank"
                rel="noopener noreferrer"
                className="inline-flex items-center gap-1 px-2.5 py-1 rounded bg-zinc-100 hover:bg-zinc-200 text-zinc-800 font-medium transition-colors"
              >
                ePASS Renewal <ExternalLink className="w-3 h-3 text-zinc-500" />
              </a>
              <a
                href="https://ts.meeseva.telangana.gov.in/CertificateVerification"
                target="_blank"
                rel="noopener noreferrer"
                className="inline-flex items-center gap-1 px-2.5 py-1 rounded bg-zinc-100 hover:bg-zinc-200 text-zinc-800 font-medium transition-colors"
              >
                MeeSeva Certificate Check <ExternalLink className="w-3 h-3 text-zinc-500" />
              </a>
            </div>
          </div>
        )}

        {/* Emergency Helplines Directory */}
        <div className="grid grid-cols-2 sm:grid-cols-4 gap-2 text-[11px] p-2.5 bg-blue-100/50 rounded-xl border border-blue-200/80">
          <div className="flex items-center gap-1.5 text-zinc-800">
            <PhoneCall className="w-3.5 h-3.5 text-blue-700 flex-shrink-0" />
            <span>Anti-Corruption: <strong>1064</strong></span>
          </div>
          <div className="flex items-center gap-1.5 text-zinc-800">
            <PhoneCall className="w-3.5 h-3.5 text-blue-700 flex-shrink-0" />
            <span>ePASS CGG: <strong>040-23390228</strong></span>
          </div>
          <div className="flex items-center gap-1.5 text-zinc-800">
            <PhoneCall className="w-3.5 h-3.5 text-blue-700 flex-shrink-0" />
            <span>MeeSeva: <strong>1100</strong></span>
          </div>
          <div className="flex items-center gap-1.5 text-zinc-800">
            <PhoneCall className="w-3.5 h-3.5 text-blue-700 flex-shrink-0" />
            <span>Cyber Crime: <strong>1930</strong></span>
          </div>
        </div>

        {/* Official Source Link & Independence Notice */}
        <div className="flex flex-col sm:flex-row sm:items-center justify-between text-xs text-slate-600 gap-2 pt-2 border-t border-blue-100">
          <div>
            <span>Verified from: </span>
            <span className="font-medium text-slate-800">{departmentName}</span>
            <span className="text-slate-400"> (Verified on {lastVerifiedDate})</span>
          </div>

          <a
            href={officialPortalUrl}
            target="_blank"
            rel="noopener noreferrer"
            className="inline-flex items-center gap-1 font-semibold text-blue-700 hover:text-blue-900 underline"
          >
            Open Official Portal <ExternalLink className="w-3.5 h-3.5" aria-hidden="true" />
          </a>
        </div>

        <p className="text-[11px] text-slate-500 italic mt-1">
          Notice: LabhSaathi is an independent public service platform. We do not approve, process, or guarantee government benefits. Never pay agents.
        </p>
      </div>
    </Card>
  );
};
