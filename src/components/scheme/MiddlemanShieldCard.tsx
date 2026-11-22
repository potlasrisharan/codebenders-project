import React from 'react';
import { AlertTriangle, ShieldCheck, ExternalLink, HelpCircle } from 'lucide-react';
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
  return (
    <Card className="middleman-shield-card border-blue-200 bg-blue-50/40">
      <div className="flex flex-col gap-4">
        {/* Header */}
        <div className="flex items-center gap-2 border-b border-blue-200 pb-2">
          <ShieldCheck className="w-5 h-5 text-blue-700" aria-hidden="true" />
          <h3 className="font-semibold text-blue-950 text-base">Middleman Shield & Fee Transparency</h3>
        </div>

        {/* Fee state check */}
        <div className="flex items-start gap-3 p-3 bg-white rounded border border-blue-100">
          {feeStatus === 'free_verified' ? (
            <div className="w-2.5 h-2.5 rounded-full bg-emerald-600 mt-1.5 flex-shrink-0" />
          ) : feeStatus === 'fee_verified' ? (
            <div className="w-2.5 h-2.5 rounded-full bg-amber-500 mt-1.5 flex-shrink-0" />
          ) : (
            <HelpCircle className="w-4 h-4 text-slate-400 mt-0.5 flex-shrink-0" />
          )}

          <div>
            <span className="text-xs uppercase tracking-wider font-bold text-slate-500">Official Cost</span>
            <p className="text-sm font-semibold text-slate-900 mt-0.5">
              {feeStatus === 'free_verified' && 'Official application is 100% FREE'}
              {feeStatus === 'fee_verified' && 'Official fee required'}
              {feeStatus === 'unknown' && 'Fee information not verified with department'}
            </p>
            {feeDetails && <p className="text-xs text-slate-600 mt-1">{feeDetails}</p>}
          </div>
        </div>

        {/* Scam warning banner */}
        <div className="flex items-start gap-3 p-3 bg-amber-50 rounded border border-amber-200">
          <AlertTriangle className="w-5 h-5 text-amber-700 flex-shrink-0 mt-0.5" aria-hidden="true" />
          <div className="text-xs text-amber-950 leading-relaxed">
            <span className="font-bold text-amber-900 block mb-0.5">Scam Warning:</span>
            {scamWarning}
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
          Notice: LabhSaathi is an independent public service platform. We do not approve, process, or guarantee government benefits.
        </p>
      </div>
    </Card>
  );
};
