import React, { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import {
  FileText,
  Sparkles,
  UserCheck,
  HelpCircle,
  ArrowRight,
  ShieldAlert,
  GraduationCap,
  CheckCircle,
  RefreshCw,
  Languages,
  Mic,
} from 'lucide-react';
import { useCitizenProfile } from '../core/profile/ProfileContext';
import {
  ADAPTIVE_QUESTIONS,
  GOLDEN_PERSONAS,
  extractProfileFromText,
  CitizenProfile,
} from '../core/profile/citizen-profile';
import { inspectSensitiveIds } from '../core/privacy/sensitive-id-shield';
import { SensitiveIdShieldNotice } from '../components/privacy/SensitiveIdShieldNotice';
import { VoiceIntakeModal } from '../components/voice/VoiceIntakeModal';
import { Card } from '../components/ui/Card';
import { Button } from '../components/ui/Button';
import { useLanguage } from '../core/i18n/LanguageContext';

// Authentic citizen & student persona avatar assets
const PERSONA_AVATARS: Record<string, { image: string; tag: string; college: string }> = {
  Priya: {
    image: 'https://images.unsplash.com/photo-1573496359142-b8d87734a5a2?auto=format&fit=crop&w=200&h=200&q=80',
    tag: 'B.Tech 2nd Year (BC-B)',
    college: 'Engineering College, Hyderabad',
  },
  Rajesh: {
    image: 'https://images.unsplash.com/photo-1534528741775-53994a69daeb?auto=format&fit=crop&w=200&h=200&q=80',
    tag: 'B.Sc 1st Year Merit (SC)',
    college: 'Kakatiya University, Warangal',
  },
  Ramesh: {
    image: 'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?auto=format&fit=crop&w=200&h=200&q=80',
    tag: 'Small Farmer (2 Acres)',
    college: 'Nalgonda, Telangana',
  },
  Lakshmi: {
    image: 'https://images.unsplash.com/photo-1567532939604-b6b5b0db2604?auto=format&fit=crop&w=200&h=200&q=80',
    tag: 'Street Vendor (PM SVANidhi)',
    college: 'Warangal Urban',
  },
  Koteshwar: {
    image: 'https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?auto=format&fit=crop&w=200&h=200&q=80',
    tag: 'Senior Citizen (65 yrs)',
    college: 'Khammam Rural',
  },
  Ananya: {
    image: 'https://images.unsplash.com/photo-1544005313-94ddf0286df2?auto=format&fit=crop&w=200&h=200&q=80',
    tag: 'AICTE Pragati Scholar',
    college: 'Technical Institute, Telangana',
  },
  Suresh: {
    image: 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?auto=format&fit=crop&w=200&h=200&q=80',
    tag: 'Pending MeeSeva Income',
    college: 'Government Degree College, Khammam',
  },
  Vikram: {
    image: 'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?auto=format&fit=crop&w=200&h=200&q=80',
    tag: 'General Category (>₹3L)',
    college: 'Osmania University, Hyderabad',
  },
  Sneha: {
    image: 'https://images.unsplash.com/photo-1580489944761-15a19d654956?auto=format&fit=crop&w=200&h=200&q=80',
    tag: 'AICTE Saksham (PwD)',
    college: 'Engineering College, Nizamabad',
  },
};

const SAMPLE_PROMPTS = [
  {
    lang: 'TE',
    text: 'నేను నల్లగొండలో చిన్న రైతుని, నాకు 2 ఎకరాల పొలం ఉంది, తెల్ల రేషన్ కార్డు ఉంది. కుటుంబ ఆదాయం 1.1 లక్ష.',
  },
  {
    lang: 'EN',
    text: 'Street vendor in Warangal running a fruit cart. Family income ₹90,000 with White Ration Card. Need micro-credit support.',
  },
  {
    lang: 'TE',
    text: 'నేను బీసీ విద్యార్థిని హైదరాబాద్ లో ఇంజనీరింగ్ చదువుతున్నాను. హాజరు 80 శాతం, కుటుంబ ఆదాయం 1.5 లక్ష.',
  },
  {
    lang: 'EN',
    text: '65-year-old rural resident from Khammam, SC category, income ₹60,000 looking for old age social assistance pension.',
  },
];

export function IntakePage() {
  const navigate = useNavigate();
  const { profile, updateProfile, loadGoldenPersona, activePersonaName } = useCitizenProfile();
  const { t } = useLanguage();

  const [descriptionInput, setDescriptionInput] = useState('');
  const [shieldViolation, setShieldViolation] = useState<string | null>(null);
  const [extractedNotice, setExtractedNotice] = useState<string | null>(null);
  const [expandedWhyId, setExpandedWhyId] = useState<string | null>(null);
  const [isVoiceModalOpen, setIsVoiceModalOpen] = useState(false);

  const handleVoiceSuccess = (transcript: string, extracted: Partial<CitizenProfile>, attrs: string[]) => {
    setDescriptionInput(transcript);
    setShieldViolation(null);
    updateProfile(extracted);
    setExtractedNotice(`Transcribed via Sarvam Voice: extracted ${attrs.length} attributes (${attrs.join(', ')}).`);
  };

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
      `Extracted ${extractedAttributes.length} attributes (${extractedAttributes.join(', ')}). Review questionnaire below.`
    );
  };

  const handleApplySamplePrompt = (text: string) => {
    setDescriptionInput(text);
    setShieldViolation(null);
    const { profile: extracted, extractedAttributes } = extractProfileFromText(text);
    updateProfile(extracted);
    setExtractedNotice(`Extracted ${extractedAttributes.length} attributes from sample prompt.`);
  };

  return (
    <div className="stack intake-page max-w-4xl mx-auto py-6 px-3 sm:px-4 space-y-6">
      {/* Editorial Header */}
      <div className="border-b border-zinc-200 pb-4">
        <div className="flex items-center gap-2 mb-1.5">
          <span className="inline-flex items-center gap-1 px-2.5 py-0.5 rounded-full text-[11px] font-bold tracking-wider uppercase bg-zinc-100 text-zinc-700">
            <GraduationCap className="w-3.5 h-3.5 text-zinc-700" />
            {t('intake.badge')}
          </span>
          <span className="text-[11px] font-bold text-emerald-800 bg-emerald-50 px-2.5 py-0.5 rounded-full border border-emerald-200 flex items-center gap-1.5 shadow-2xs">
            <span className="w-1.5 h-1.5 rounded-full bg-emerald-600 animate-pulse" />
            {t('intake.shield')}
          </span>
        </div>
        <h1 className="text-3xl font-extrabold text-zinc-900 tracking-tight flex items-center gap-2.5">
          <FileText className="w-7 h-7 text-zinc-900" aria-hidden="true" />
          {t('intake.title')}
        </h1>
        <p className="text-sm text-zinc-600 mt-1.5 max-w-2xl leading-relaxed">
          {t('intake.lead')}
        </p>
      </div>

      {/* Sensitive-ID Shield Notice if user types Aadhaar or PAN */}
      {shieldViolation && (
        <div className="animate-slide-down-fade">
          <SensitiveIdShieldNotice
            message={shieldViolation}
            onClear={() => {
              setDescriptionInput('');
              setShieldViolation(null);
            }}
          />
        </div>
      )}

      {/* 1-Click Synthetic Demo Student Personas */}
      <section aria-labelledby="personas-heading" className="space-y-3">
        <div className="flex items-center justify-between">
          <div className="flex items-center gap-2">
            <UserCheck className="w-4 h-4 text-zinc-700" />
            <h2 id="personas-heading" className="text-xs font-bold uppercase tracking-wider text-zinc-800">
              {t('intake.personas.heading')}
            </h2>
          </div>
          <span className="text-[11px] text-zinc-500">{t('intake.personas.sub')}</span>
        </div>

        <div className="grid grid-cols-2 sm:grid-cols-3 lg:grid-cols-6 gap-2.5">
          {GOLDEN_PERSONAS.map((p, idx) => {
            const firstName = p.name.split(' (')[0];
            const meta = PERSONA_AVATARS[firstName] || {
              image: 'https://images.unsplash.com/photo-1534528741775-53994a69daeb?auto=format&fit=crop&w=200&h=200&q=80',
              tag: 'College Student',
              college: 'Telangana',
            };
            const isSelected = activePersonaName === p.name;

            return (
              <button
                key={p.name}
                type="button"
                onClick={() => {
                  loadGoldenPersona(idx);
                  setDescriptionInput('');
                  setShieldViolation(null);
                  setExtractedNotice(`Loaded profile for ${firstName} (${meta.tag})`);
                }}
                className={`group relative text-left p-2.5 rounded-xl border transition-all duration-200 flex flex-col justify-between btn-tactile ${
                  isSelected
                    ? 'bg-zinc-900 text-white border-zinc-900 shadow-md ring-2 ring-zinc-900/10'
                    : 'bg-white text-zinc-800 border-zinc-200/90 hover:border-zinc-300 hover:shadow-xs'
                }`}
              >
                <div>
                  <div className="relative mb-2">
                    <img
                      src={meta.image}
                      alt={firstName}
                      width={40}
                      height={40}
                      loading="lazy"
                      decoding="async"
                      className="w-10 h-10 rounded-full object-cover border-2 border-white shadow-xs group-hover:scale-105 transition-transform"
                    />
                    {isSelected && (
                      <span className="absolute -top-1 -right-1 bg-emerald-500 text-white p-0.5 rounded-full shadow-xs">
                        <CheckCircle className="w-3.5 h-3.5" />
                      </span>
                    )}
                  </div>
                  <div className={`font-bold text-xs truncate ${isSelected ? 'text-white' : 'text-zinc-900'}`}>
                    {firstName}
                  </div>
                  <div className={`text-[10px] truncate mt-0.5 ${isSelected ? 'text-zinc-300' : 'text-zinc-500'}`}>
                    {meta.tag}
                  </div>
                </div>
              </button>
            );
          })}
        </div>

        {activePersonaName && (
          <Card className="p-3 bg-zinc-50 rounded-xl border border-zinc-200/80 text-xs text-zinc-700 flex items-center justify-between shadow-2xs animate-scale-in card-interactive">
            <span className="truncate">
              <strong>Active Persona:</strong>{' '}
              {GOLDEN_PERSONAS.find((p) => p.name === activePersonaName)?.description}
            </span>
            <span className="text-[11px] text-zinc-500 flex-shrink-0 ml-2 font-mono">
              Ready for discovery
            </span>
          </Card>
        )}
      </section>

      {/* Natural Language Input Section */}
      <Card className="p-4 bg-white border-zinc-200/90 shadow-xs space-y-3">
        <div className="flex items-center justify-between">
          <label htmlFor="intake-description" className="font-bold text-zinc-900 text-sm flex items-center gap-2">
            <Languages className="w-4 h-4 text-zinc-600" />
            <span>{t('intake.input.label')}</span>
          </label>
          <span className="text-[11px] text-zinc-500">{t('intake.input.sub')}</span>
        </div>

        <textarea
          id="intake-description"
          rows={3}
          value={descriptionInput}
          onChange={handleDescriptionChange}
          placeholder={t('intake.input.placeholder')}
          className="w-full text-sm p-3.5 border rounded-lg border-zinc-300 bg-zinc-50/50 focus:bg-white focus:ring-2 focus:ring-zinc-900 focus:border-zinc-900 focus:outline-none transition-all leading-relaxed"
        />

        {/* Quick prompt helpers */}
        <div className="space-y-1.5">
          <span className="text-[11px] font-semibold text-zinc-500 uppercase tracking-wider block">
            {t('intake.sample.label')}
          </span>
          <div className="flex flex-wrap gap-1.5">
            {SAMPLE_PROMPTS.map((prompt, i) => (
              <button
                key={i}
                type="button"
                onClick={() => handleApplySamplePrompt(prompt.text)}
                className="text-left text-[11px] px-2.5 py-1 rounded-md bg-zinc-100 hover:bg-zinc-200 text-zinc-700 border border-zinc-200/70 transition-colors truncate max-w-xs"
              >
                <span className="font-bold mr-1 text-zinc-900">[{prompt.lang}]</span>
                {prompt.text}
              </button>
            ))}
          </div>
        </div>

        <div className="pt-2 flex flex-wrap items-center justify-between gap-2 border-t border-zinc-100">
          <span className="text-[11px] text-zinc-500 italic flex items-center gap-1">
            <ShieldAlert className="w-3.5 h-3.5 text-zinc-400" />
            {t('intake.shield.warning')}
          </span>
          <div className="flex items-center gap-2">
            <Button
              variant="secondary"
              onClick={() => setIsVoiceModalOpen(true)}
              className="flex items-center gap-1.5 text-xs py-1.5 px-3 bg-indigo-50 hover:bg-indigo-100 text-indigo-800 border-indigo-200 btn-tactile"
            >
              <Mic className="w-3.5 h-3.5 text-indigo-600" /> {t('intake.btn.voice')}
            </Button>
            <Button
              variant="secondary"
              onClick={handleParseDescription}
              disabled={!descriptionInput.trim() || !!shieldViolation}
              className="flex items-center gap-1.5 text-xs py-1.5 btn-tactile"
            >
              <Sparkles className="w-3.5 h-3.5 text-zinc-800" /> {t('intake.btn.extract')}
            </Button>
          </div>
        </div>

        {extractedNotice && (
          <div className="text-xs p-2.5 bg-emerald-50 text-emerald-900 border border-emerald-200 rounded-lg flex items-center gap-2 animate-slide-down-fade font-medium">
            <CheckCircle className="w-4 h-4 text-emerald-600 flex-shrink-0" />
            <span>{extractedNotice}</span>
          </div>
        )}
      </Card>

      {/* Adaptive Questions for Unset / Unknown Attributes */}
      <section aria-labelledby="questionnaire-heading" className="space-y-3">
        <div className="flex items-center justify-between">
          <div>
            <h2 id="questionnaire-heading" className="text-sm font-bold text-zinc-900">
              {t('intake.q.heading')}
            </h2>
            <p className="text-xs text-zinc-500 mt-0.5">
              {t('intake.q.sub')}
            </p>
          </div>
          <button
            type="button"
            onClick={() => updateProfile({ ...profile, domicileState: 'Telangana' })}
            className="text-[11px] text-zinc-600 hover:text-zinc-900 inline-flex items-center gap-1"
          >
            <RefreshCw className="w-3 h-3" /> {t('intake.reset')}
          </button>
        </div>

        <div className="grid grid-cols-1 md:grid-cols-2 gap-3">
          {ADAPTIVE_QUESTIONS.map((q) => {
            const currentVal = profile[q.id];
            const isExpanded = expandedWhyId === q.id;

            return (
              <Card
                key={q.id}
                className="p-3.5 bg-white border-zinc-200/90 shadow-xs flex flex-col justify-between hover:border-zinc-300 transition-colors"
              >
                <div>
                  <div className="flex items-start justify-between gap-2">
                    <span className="font-bold text-xs text-zinc-900">{q.questionText}</span>
                  </div>
                  <p className="text-[11px] text-zinc-500 italic mt-0.5 font-sans">
                    {q.teluguQuestionText}
                  </p>

                  <div className="mt-2.5">
                    {q.type === 'number' ? (
                      <div className="space-y-2">
                        <input
                          type="number"
                          value={currentVal === null || currentVal === undefined ? '' : String(currentVal)}
                          onChange={(e) => {
                            const val = e.target.value;
                            updateProfile({
                              [q.id]: val === '' ? null : Number(val),
                            } as Partial<CitizenProfile>);
                          }}
                          placeholder="Enter value (e.g. 150000)"
                          className="w-full text-xs p-2.5 border border-zinc-300 rounded-md bg-zinc-50/70 focus:bg-white focus:ring-1 focus:ring-zinc-900 focus:outline-none transition-colors"
                        />
                        {q.options && (
                          <div className="flex flex-wrap gap-1">
                            {q.options.map((opt) => (
                              <button
                                key={String(opt.value)}
                                type="button"
                                onClick={() => updateProfile({ [q.id]: Number(opt.value) } as Partial<CitizenProfile>)}
                                className={`text-[10px] px-2 py-0.5 rounded border transition-colors cursor-pointer ${
                                  Number(currentVal) === Number(opt.value)
                                    ? 'bg-zinc-900 text-white border-zinc-900 font-semibold'
                                    : 'bg-zinc-100 text-zinc-700 border-zinc-200 hover:bg-zinc-200'
                                }`}
                              >
                                {opt.label}
                              </button>
                            ))}
                          </div>
                        )}
                      </div>
                    ) : q.options ? (
                      <select
                        value={currentVal === null ? 'UNKNOWN' : String(currentVal)}
                        onChange={(e) => {
                          const val = e.target.value;
                          if (val === 'UNKNOWN') {
                            updateProfile({ [q.id]: null } as Partial<CitizenProfile>);
                          } else if (q.type === 'boolean') {
                            updateProfile({ [q.id]: val === 'true' } as Partial<CitizenProfile>);
                          } else {
                            updateProfile({ [q.id]: val } as Partial<CitizenProfile>);
                          }
                        }}
                        className="w-full text-xs p-2.5 border border-zinc-300 rounded-md bg-zinc-50/70 focus:bg-white focus:ring-1 focus:ring-zinc-900 focus:outline-none transition-colors cursor-pointer"
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
                            [q.id]: val === '' ? null : val,
                          } as Partial<CitizenProfile>);
                        }}
                        placeholder="I don't know / Enter value"
                        className="w-full text-xs p-2.5 border border-zinc-300 rounded-md bg-zinc-50/70 focus:bg-white focus:ring-1 focus:ring-zinc-900 focus:outline-none transition-colors"
                      />
                    )}
                  </div>
                </div>

                <div className="mt-3 pt-2 border-t border-zinc-100">
                  <button
                    type="button"
                    onClick={() => setExpandedWhyId(isExpanded ? null : q.id)}
                    className="flex items-center gap-1 text-[11px] text-zinc-500 hover:text-zinc-800 transition-colors w-full text-left"
                  >
                    <HelpCircle className="w-3.5 h-3.5 text-zinc-400 flex-shrink-0" />
                    <span className="font-medium">Why we ask this</span>
                    <span className="ml-auto text-[10px] text-zinc-400">{isExpanded ? 'Hide' : 'Show'}</span>
                  </button>
                  {isExpanded && (
                    <p className="text-[11px] text-zinc-600 mt-1 pl-4.5 bg-zinc-50 p-2 rounded border border-zinc-100 animate-slide-down-fade">
                      {q.whyWeAskThis}
                    </p>
                  )}
                </div>
              </Card>
            );
          })}
        </div>
      </section>

      {/* Sticky Bottom Confirmation & Match Discovery Action */}
      <div className="pt-4 border-t border-zinc-200 flex flex-col sm:flex-row sm:items-center justify-between gap-3 bg-white/80 backdrop-blur-sm p-3 rounded-xl border">
        <div className="text-xs text-zinc-700 flex flex-wrap items-center gap-2">
          <span>
            Domicile: <strong className="text-zinc-900 font-semibold">{profile.domicileState || 'Telangana'}</strong>
          </span>
          <span className="text-zinc-300">•</span>
          <span>
            Role:{' '}
            <strong className="text-zinc-900 font-semibold capitalize">
              {profile.occupation ? profile.occupation.replace('_', ' ') : 'General Citizen'}
            </strong>
          </span>
          <span className="text-zinc-300">•</span>
          <span>
            Income:{' '}
            <strong className="text-zinc-900 font-semibold">
              {profile.familyIncome ? `₹${profile.familyIncome.toLocaleString('en-IN')}` : 'Not set'}
            </strong>
          </span>
          {profile.attendancePercentage !== null && profile.attendancePercentage !== undefined && (
            <>
              <span className="text-zinc-300">•</span>
              <span>
                Attendance:{' '}
                <strong className="text-zinc-900 font-semibold">
                  {profile.attendancePercentage}%
                </strong>
              </span>
            </>
          )}
        </div>

        <Button
          variant="primary"
          onClick={() => navigate('/matches')}
          className="flex items-center justify-center gap-2 px-5 py-2.5 text-xs font-bold shadow-sm btn-tactile bg-zinc-900 hover:bg-zinc-800 text-white rounded-lg"
        >
          <span>{t('intake.btn.find')}</span>
          <ArrowRight className="w-4 h-4" />
        </Button>
      </div>

      {/* Sarvam AI Multilingual Voice Intake Modal */}
      <VoiceIntakeModal
        isOpen={isVoiceModalOpen}
        onClose={() => setIsVoiceModalOpen(false)}
        onTranscriptSuccess={handleVoiceSuccess}
      />
    </div>
  );
}
