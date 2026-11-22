import React, { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import { FileText, Sparkles, UserCheck, HelpCircle, ArrowRight } from 'lucide-react';
import { useCitizenProfile } from '../core/profile/ProfileContext';
import {
  ADAPTIVE_QUESTIONS,
  GOLDEN_PERSONAS,
  extractProfileFromText,
  CitizenProfile,
} from '../core/profile/citizen-profile';
import { inspectSensitiveIds } from '../core/privacy/sensitive-id-shield';
import { SensitiveIdShieldNotice } from '../components/privacy/SensitiveIdShieldNotice';
import { Card } from '../components/ui/Card';
import { Button } from '../components/ui/Button';

export function IntakePage() {
  const navigate = useNavigate();
  const { profile, updateProfile, loadGoldenPersona, activePersonaName } = useCitizenProfile();

  const [descriptionInput, setDescriptionInput] = useState('');
  const [shieldViolation, setShieldViolation] = useState<string | null>(null);
  const [extractedNotice, setExtractedNotice] = useState<string | null>(null);

  const handleDescriptionChange = (e: React.ChangeEvent<HTMLTextAreaElement>) => {
    const val = e.target.value;
    setDescriptionInput(val);

    const inspection = inspectSensitiveIds(val);
    if (!inspection.isClean) {
      setShieldViolation(inspection.userExplanation || 'Sensitive pattern detected.');
    } else {
      setShieldViolation(null);
    }
  };

  const handleParseDescription = () => {
    if (!descriptionInput.trim()) return;

    const inspection = inspectSensitiveIds(descriptionInput);
    if (!inspection.isClean) {
      setShieldViolation(inspection.userExplanation || 'Sensitive pattern detected.');
      return;
    }

    const { profile: extracted, extractedAttributes } = extractProfileFromText(descriptionInput);
    updateProfile(extracted);
    setExtractedNotice(
      `Extracted ${extractedAttributes.length} attributes: ${extractedAttributes.join(', ')}`
    );
  };

  return (
    <div className="stack intake-page max-w-4xl mx-auto py-4 px-2">
      <div className="border-b pb-3 mb-2">
        <h1 className="text-2xl font-bold text-slate-900 flex items-center gap-2">
          <FileText className="w-6 h-6 text-indigo-600" aria-hidden="true" />
          Intake
        </h1>
        <p className="text-sm text-slate-600 mt-1">
          Describe your situation in natural language (English or Telugu) or load a sample student profile.
        </p>
      </div>

      {/* Sensitive-ID Shield Notice if user types Aadhaar or PAN */}
      {shieldViolation && (
        <SensitiveIdShieldNotice
          message={shieldViolation}
          onClear={() => {
            setDescriptionInput('');
            setShieldViolation(null);
          }}
        />
      )}

      {/* Synthetic Demo Personas Bar */}
      <Card className="p-3 bg-indigo-50/50 border-indigo-200">
        <div className="flex flex-col gap-2">
          <div className="flex items-center gap-1.5 text-xs font-bold text-indigo-950 uppercase tracking-wider">
            <UserCheck className="w-4 h-4 text-indigo-600" />
            <span>1-Click Synthetic Demo Personas (Low-Income College Cohort)</span>
          </div>
          <div className="flex flex-wrap gap-2">
            {GOLDEN_PERSONAS.map((p, idx) => (
              <button
                key={p.name}
                type="button"
                onClick={() => {
                  loadGoldenPersona(idx);
                  setDescriptionInput('');
                  setShieldViolation(null);
                  setExtractedNotice(`Loaded profile for ${p.name}`);
                }}
                className={`text-xs px-2.5 py-1.5 rounded-full border transition-all ${
                  activePersonaName === p.name
                    ? 'bg-indigo-600 text-white font-semibold border-indigo-700 shadow-sm'
                    : 'bg-white text-slate-700 border-slate-300 hover:bg-indigo-50'
                }`}
              >
                {p.name.split(' (')[0]}
              </button>
            ))}
          </div>
          {activePersonaName && (
            <p className="text-xs text-indigo-900 italic mt-0.5">
              Current: {GOLDEN_PERSONAS.find((p) => p.name === activePersonaName)?.description}
            </p>
          )}
        </div>
      </Card>

      {/* Natural Language Input Section */}
      <Card className="p-4 bg-white border-slate-200">
        <div className="flex flex-col gap-3">
          <label htmlFor="intake-description" className="font-semibold text-slate-900 text-sm flex items-center justify-between">
            <span>Plain-language description:</span>
            <span className="text-xs text-slate-400 font-normal">No identity numbers collected</span>
          </label>
          <textarea
            id="intake-description"
            rows={3}
            value={descriptionInput}
            onChange={handleDescriptionChange}
            placeholder="e.g. I am a 2nd year B.Tech student in Hyderabad, Telangana. My category is BC-B, college attendance is 80%, and family income is around 1.5 Lakhs."
            className="w-full text-sm p-3 border rounded-md border-slate-300 focus:ring-2 focus:ring-indigo-500 focus:outline-none"
          />

          <div className="flex items-center justify-between">
            <span className="text-xs text-slate-500 italic">
              Supports Telugu transliteration & Telugu text (e.g. ఇంజనీరింగ్, బీసీ, ఆదాయం).
            </span>
            <Button
              variant="secondary"
              onClick={handleParseDescription}
              disabled={!descriptionInput.trim() || !!shieldViolation}
              className="flex items-center gap-1.5"
            >
              <Sparkles className="w-4 h-4 text-indigo-600" /> Extract Attributes
            </Button>
          </div>

          {extractedNotice && (
            <div className="text-xs p-2 bg-emerald-50 text-emerald-800 border border-emerald-200 rounded">
              ✓ {extractedNotice}
            </div>
          )}
        </div>
      </Card>

      {/* Adaptive Questions for Unset / Unknown Attributes */}
      <div className="flex flex-col gap-3">
        <h2 className="text-base font-bold text-slate-900">
          Adaptive Questionnaire & Profile Review
        </h2>
        <p className="text-xs text-slate-500">
          Answer only what is relevant. If you do not know a detail, select &quot;I don&apos;t know&quot; — LabhSaathi will note it as needing confirmation.
        </p>

        <div className="grid grid-cols-1 md:grid-cols-2 gap-3">
          {ADAPTIVE_QUESTIONS.map((q) => {
            const currentVal = profile[q.id];
            return (
              <Card key={q.id} className="p-3 bg-white border-slate-200 flex flex-col justify-between">
                <div>
                  <div className="flex items-start justify-between gap-2">
                    <span className="font-semibold text-xs text-slate-900">{q.questionText}</span>
                  </div>
                  <p className="text-[11px] text-slate-400 italic mt-0.5">{q.teluguQuestionText}</p>

                  <div className="mt-2">
                    {q.options ? (
                      <select
                        value={currentVal === null ? 'UNKNOWN' : String(currentVal)}
                        onChange={(e) => {
                          const val = e.target.value;
                          if (val === 'UNKNOWN') {
                            updateProfile({ [q.id]: null } as Partial<CitizenProfile>);
                          } else if (q.type === 'number') {
                            updateProfile({ [q.id]: Number(val) } as Partial<CitizenProfile>);
                          } else if (q.type === 'boolean') {
                            updateProfile({ [q.id]: val === 'true' } as Partial<CitizenProfile>);
                          } else {
                            updateProfile({ [q.id]: val } as Partial<CitizenProfile>);
                          }
                        }}
                        className="w-full text-xs p-2 border border-slate-300 rounded bg-slate-50 focus:bg-white"
                      >
                        <option value="UNKNOWN">I don&apos;t know / Not sure</option>
                        {q.options.map((opt) => (
                          <option key={String(opt.value)} value={String(opt.value)}>
                            {opt.label}
                          </option>
                        ))}
                      </select>
                    ) : (
                      <input
                        type={q.type}
                        value={currentVal === null ? '' : String(currentVal)}
                        onChange={(e) => {
                          const val = e.target.value;
                          updateProfile({
                            [q.id]: val === '' ? null : Number(val),
                          } as Partial<CitizenProfile>);
                        }}
                        placeholder="I don't know"
                        className="w-full text-xs p-2 border border-slate-300 rounded"
                      />
                    )}
                  </div>
                </div>

                <div className="mt-2 pt-2 border-t border-slate-100 flex items-start gap-1 text-[11px] text-slate-500">
                  <HelpCircle className="w-3.5 h-3.5 text-slate-400 flex-shrink-0 mt-0.5" />
                  <span>
                    <strong>Why we ask:</strong> {q.whyWeAskThis}
                  </span>
                </div>
              </Card>
            );
          })}
        </div>
      </div>

      {/* Confirmation & Match Discovery Action */}
      <div className="pt-4 border-t flex items-center justify-between">
        <div className="text-xs text-slate-600">
          <span>Active State: <strong>{profile.domicileState || 'Telangana'}</strong></span>
          <span className="mx-2">•</span>
          <span>Income: <strong>{profile.familyIncome ? `₹${profile.familyIncome.toLocaleString('en-IN')}` : 'Unknown'}</strong></span>
        </div>

        <Button
          variant="primary"
          onClick={() => navigate('/matches')}
          className="flex items-center gap-2"
        >
          <span>Find Likely Schemes</span>
          <ArrowRight className="w-4 h-4" />
        </Button>
      </div>
    </div>
  );
}
