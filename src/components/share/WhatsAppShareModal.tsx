import React from 'react';
import { MessageSquare, ExternalLink, ShieldCheck, X } from 'lucide-react';
import { Button } from '../ui/Button';

export interface WhatsAppShareModalProps {
  isOpen: boolean;
  onClose: () => void;
  shareUrl: string;
  previewText: string;
  schemeName: string;
}

export const WhatsAppShareModal: React.FC<WhatsAppShareModalProps> = ({
  isOpen,
  onClose,
  shareUrl,
  previewText,
  schemeName,
}) => {
  if (!isOpen) return null;

  return (
    <div
      className="fixed inset-0 z-50 flex items-center justify-center bg-black/50 p-4"
      role="dialog"
      aria-modal="true"
      aria-labelledby="share-modal-title"
    >
      <div className="bg-white rounded-lg shadow-xl max-w-lg w-full p-6 flex flex-col gap-4 max-h-[90vh] overflow-y-auto">
        <div className="flex items-center justify-between border-b pb-3">
          <div className="flex items-center gap-2 text-emerald-700">
            <MessageSquare className="w-5 h-5" aria-hidden="true" />
            <h2 id="share-modal-title" className="text-lg font-bold text-slate-900">
              Share Checklist via WhatsApp
            </h2>
          </div>
          <button
            onClick={onClose}
            className="text-slate-400 hover:text-slate-600 p-1 rounded"
            aria-label="Close dialog"
          >
            <X className="w-5 h-5" />
          </button>
        </div>

        <div className="flex items-start gap-2 p-3 bg-emerald-50 rounded border border-emerald-200 text-xs text-emerald-950">
          <ShieldCheck className="w-4 h-4 text-emerald-600 flex-shrink-0 mt-0.5" />
          <p>
            <strong>Privacy Guard:</strong> This share link contains ONLY public guidance and required documents for <em>{schemeName}</em>. It contains zero personal details, income values, or identity numbers.
          </p>
        </div>

        <div>
          <label className="text-xs font-semibold text-slate-700 block mb-1">
            Preview of message to send:
          </label>
          <pre className="text-xs bg-slate-50 border border-slate-200 p-3 rounded text-slate-800 whitespace-pre-wrap font-mono max-h-48 overflow-y-auto">
            {previewText}
          </pre>
        </div>

        <div className="flex flex-col sm:flex-row gap-3 justify-end pt-3 border-t">
          <Button variant="secondary" onClick={onClose}>
            Cancel
          </Button>
          <a
            href={shareUrl}
            target="_blank"
            rel="noopener noreferrer"
            onClick={onClose}
            className="inline-flex items-center justify-center gap-2 px-4 py-2 bg-emerald-600 hover:bg-emerald-700 text-white font-medium rounded text-sm transition-colors"
          >
            Open in WhatsApp <ExternalLink className="w-4 h-4" />
          </a>
        </div>
      </div>
    </div>
  );
};
