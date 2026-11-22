import React from 'react';
import { ShieldAlert } from 'lucide-react';
import { Alert } from '../ui/Alert';

export interface SensitiveIdShieldNoticeProps {
  message?: string;
  onClear?: () => void;
}

export const SensitiveIdShieldNotice: React.FC<SensitiveIdShieldNoticeProps> = ({
  message = 'For your safety and privacy, LabhSaathi never collects Aadhaar numbers, PAN cards, or official identity numbers. Please describe your situation using eligibility details only (such as education level, family income range, and district).',
  onClear,
}) => {
  return (
    <div className="sensitive-id-shield-notice mb-4" role="alert">
      <Alert>
        <strong>Privacy Shield Active</strong>
        <div className="flex flex-col gap-2">
          <div className="flex items-start gap-2">
            <ShieldAlert className="w-5 h-5 text-amber-600 flex-shrink-0 mt-0.5" aria-hidden="true" />
            <p className="text-sm text-amber-900 leading-relaxed">{message}</p>
          </div>
          {onClear && (
            <div className="mt-2">
              <button
                type="button"
                onClick={onClear}
                className="text-xs font-semibold underline text-amber-800 hover:text-amber-950 focus:outline-none"
              >
                Clear and rewrite without identity numbers
              </button>
            </div>
          )}
        </div>
      </Alert>
    </div>
  );
};
