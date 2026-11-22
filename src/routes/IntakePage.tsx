import React, { useState, useEffect } from 'react';
import { useNavigate, useSearchParams } from 'react-router-dom';
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
  ChevronLeft,
  ChevronRight,
  ListFilter,
  Edit2,
  Check,
} from 'lucide-react';
import { useCitizenProfile } from '../core/profile/ProfileContext';
import {
  GOLDEN_PERSONAS,
  extractProfileFromText,
  getActiveQuestions,
  getQuestionText,
  getQuestionOptions,
  AdaptiveQuestion,
  CitizenProfile,
} from '../core/profile/citizen-profile';
import { inspectSensitiveIds } from '../core/privacy/sensitive-id-shield';
import { SensitiveIdShieldNotice } from '../components/privacy/SensitiveIdShieldNotice';
import { VoiceIntakeModal } from '../components/voice/VoiceIntakeModal';
import { Card } from '../components/ui/Card';
import { Button } from '../components/ui/Button';
import { useLanguage, T } from '../core/i18n/LanguageContext';
import { TRANSLATIONS } from '../core/i18n/translations';

// Authentic citizen & student persona avatar assets from diverse states across India
const PERSONA_AVATARS: Record<string, { image: string; tag: string; college: string }> = {
  Priya: {
    image: 'https://images.unsplash.com/photo-1573496359142-b8d87734a5a2?auto=format&fit=crop&w=200&h=200&q=80',
    tag: 'B.Tech 2nd Year (BC-B)',
    college: 'Hyderabad, Telangana',
  },
  Rajesh: {
    image: 'https://images.unsplash.com/photo-1534528741775-53994a69daeb?auto=format&fit=crop&w=200&h=200&q=80',
    tag: 'B.Sc 1st Year Merit (SC)',
    college: 'Pune, Maharashtra',
  },
  Ramesh: {
    image: 'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?auto=format&fit=crop&w=200&h=200&q=80',
    tag: 'Small Farmer (2 Acres)',
    college: 'Nalgonda, Telangana',
  },
  Lakshmi: {
    image: 'https://images.unsplash.com/photo-1567532939604-b6b5b0db2604?auto=format&fit=crop&w=200&h=200&q=80',
    tag: 'Artisan / Weaver',
    college: 'Salem, Tamil Nadu',
  },
  Koteshwar: {
    image: 'https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?auto=format&fit=crop&w=200&h=200&q=80',
    tag: 'Senior Citizen (65 yrs)',
    college: 'Bhopal, Madhya Pradesh',
  },
  Ananya: {
    image: 'https://images.unsplash.com/photo-1544005313-94ddf0286df2?auto=format&fit=crop&w=200&h=200&q=80',
    tag: 'AICTE Pragati Scholar',
    college: 'Bengaluru, Karnataka',
  },
  Suresh: {
    image: 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?auto=format&fit=crop&w=200&h=200&q=80',
    tag: 'Pending Income Proof',
    college: 'Patna, Bihar',
  },
  Vikram: {
    image: 'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?auto=format&fit=crop&w=200&h=200&q=80',
    tag: 'General Category (>₹3L)',
    college: 'Jaipur, Rajasthan',
  },
  Sneha: {
    image: 'https://images.unsplash.com/photo-1580489944761-15a19d654956?auto=format&fit=crop&w=200&h=200&q=80',
    tag: 'AICTE Saksham (PwD)',
    college: 'Kolkata, West Bengal',
  },
};

const SAMPLE_PROMPTS_BY_LANG: Record<'en' | 'te' | 'hi', Array<{ text: string; subText?: string }>> = {
  en: [
    {
      text: 'Small farmer in Nalgonda with 2 acres of cultivable land and White Ration Card. Family income is around 1.1 Lakhs.',
    },
    {
      text: 'Street vendor in Warangal running a fruit cart. Family income ₹90,000 with White Ration Card. Need micro-credit support.',
    },
    {
      text: 'BC engineering student in Hyderabad with 80% college attendance and annual family income ₹1.5 Lakhs.',
    },
    {
      text: '65-year-old rural resident from Khammam, SC category, income ₹60,000 looking for old age social assistance pension.',
    },
  ],
  te: [
    {
      text: 'నేను నల్లగొండలో చిన్న రైతుని, నాకు 2 ఎకరాల పొలం ఉంది, తెల్ల రేషన్ కార్డు ఉంది. కుటుంబ ఆదాయం 1.1 లక్ష.',
      subText: 'Small farmer in Nalgonda with 2 acres land, BPL card, income 1.1L',
    },
    {
      text: 'వరంగల్‌లో పండ్ల బండి నడుపుతున్న చిరువ్యాపారిని. వార్షిక ఆదాయం ₹90,000, తెల్ల రేషన్ కార్డు ఉంది.',
      subText: 'Street vendor in Warangal with fruit cart, income ₹90,000',
    },
    {
      text: 'నేను బీసీ విద్యార్థిని హైదరాబాద్ లో ఇంజనీరింగ్ చదువుతున్నాను. హాజరు 80 శాతం, కుటుంబ ఆదాయం 1.5 లక్ష.',
      subText: 'BC engineering student in Hyderabad, 80% attendance, income 1.5L',
    },
    {
      text: 'ఖమ్మంకు చెందిన 65 ఏళ్ల గ్రామీణ వృద్ధుడిని, ఎస్సీ వర్గం, ఆదాయం ₹60,000, వృద్ధాప్య పెన్షన్ కోసం చూస్తున్నాను.',
      subText: '65-year-old rural resident, SC, income ₹60,000, old age pension',
    },
  ],
  hi: [
    {
      text: 'मैं नलगोंडा में 2 एकड़ कृषि भूमि और सफेद राशन कार्ड वाला छोटा किसान हूँ। पारिवारिक आय ₹1.1 लाख है।',
      subText: 'Small farmer in Nalgonda with 2 acres land, BPL card, income 1.1L',
    },
    {
      text: 'वारंगल में फल का ठेला लगाने वाला स्ट्रीट वेंडर हूँ। पारिवारिक आय ₹90,000 और राशन कार्ड है।',
      subText: 'Street vendor in Warangal with fruit cart, income ₹90,000',
    },
    {
      text: 'मैं हैदराबाद में बीसी वर्ग का इंजीनियरिंग छात्र हूँ। 80% उपस्थिति और वार्षिक पारिवारिक आय ₹1.5 लाख है।',
      subText: 'BC engineering student in Hyderabad, 80% attendance, income 1.5L',
    },
    {
      text: 'खम्मम का 65 वर्षीय ग्रामीण निवासी, एससी वर्ग, आय ₹60,000, वृद्धावस्था पेंशन की तलाश में हूँ।',
      subText: '65-year-old rural resident, SC, income ₹60,000, old age pension',
    },
  ],
};

const POPULAR_STATES = [
  'All India',
  'Delhi',
  'Maharashtra',
  'Karnataka',
  'Tamil Nadu',
  'Uttar Pradesh',
  'Telangana',
  'Andhra Pradesh',
  'Bihar',
  'Rajasthan',
];

function formatAnswer(q: AdaptiveQuestion, val: unknown, profile: CitizenProfile, lang: string = 'en'): string {
  if (val === null || val === undefined || val === '') return 'Not specified / Skipped';
  const options = getQuestionOptions(q, profile);
  if (options && options.length > 0) {
    const opt = options.find((o) => String(o.value) === String(val));
    if (opt) {
      if (lang === 'te' && opt.teluguLabel) return `${opt.teluguLabel} (${opt.label})`;
      if (lang === 'hi' && opt.hindiLabel) return `${opt.hindiLabel} (${opt.label})`;
      return opt.label;
    }
  }
  if (q.id === 'familyIncome') return `₹${Number(val).toLocaleString('en-IN')} / year`;
  if (q.id === 'attendancePercentage') return `${val}% attendance`;
  if (q.id === 'landholdingHectares') return `${val} hectares`;
  if (typeof val === 'boolean') {
    if (lang === 'te') return val ? 'అవును (Yes)' : 'లేదు (No)';
    if (lang === 'hi') return val ? 'हाँ (Yes)' : 'नहीं (No)';
    return val ? 'Yes' : 'No';
  }
  return String(val);
}

export function IntakePage() {
  const navigate = useNavigate();
  const [searchParams] = useSearchParams();
  const { profile, updateProfile, loadGoldenPersona, resetProfile, activePersonaName } = useCitizenProfile();
  const { language, t } = useLanguage();

  const [descriptionInput, setDescriptionInput] = useState('');
  const [shieldViolation, setShieldViolation] = useState<string | null>(null);
  const [extractedNotice, setExtractedNotice] = useState<string | null>(null);
  const [expandedWhyId, setExpandedWhyId] = useState<string | null>(null);
  const [isVoiceModalOpen, setIsVoiceModalOpen] = useState(false);
  const [showQuickAssist, setShowQuickAssist] = useState(false);

  // App-style Onboarding Wizard State
  const [currentStepIndex, setCurrentStepIndex] = useState(0);
  const [viewMode, setViewMode] = useState<'step' | 'review'>('step');

  // If arriving with ?fresh=1 (e.g. from Landing page "Start Citizen Intake"),
  // reset to a clean blank profile so no old answers or personas are pre-selected
  useEffect(() => {
    if (searchParams.get('fresh') === '1') {
      resetProfile();
      setCurrentStepIndex(0);
      setViewMode('step');
    }
  }, [searchParams]);

  const activeQuestions = getActiveQuestions(profile);
  const safeStepIndex = Math.min(currentStepIndex, Math.max(0, activeQuestions.length - 1));
  const currentQ = activeQuestions[safeStepIndex];
  const currentOptions = currentQ ? getQuestionOptions(currentQ, profile) : [];
  const progressPercent = activeQuestions.length > 0
    ? Math.round(((safeStepIndex + 1) / activeQuestions.length) * 100)
    : 0;

  const answeredCount = activeQuestions.filter((q) => {
    const v = profile[q.id];
    return v !== null && v !== undefined && v !== '';
  }).length;

  const handleVoiceSuccess = (transcript: string, extracted: Partial<CitizenProfile>, attrs: string[]) => {
    setDescriptionInput(transcript);
    setShieldViolation(null);
    updateProfile(extracted);
    setExtractedNotice(`Transcribed via Sarvam Voice: extracted ${attrs.length} attributes (${attrs.join(', ')}).`);
    setViewMode('review');
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
    setViewMode('review');
  };

  const handleApplySamplePrompt = (text: string) => {
    setDescriptionInput(text);
    setShieldViolation(null);
    const { profile: extracted, extractedAttributes } = extractProfileFromText(text);
    updateProfile(extracted);
    setExtractedNotice(`Extracted ${extractedAttributes.length} attributes from sample prompt.`);
    setViewMode('review');
  };

  const handleSelectOption = (qId: keyof CitizenProfile, val: unknown) => {
    const updates: Partial<CitizenProfile> = { [qId]: val } as Partial<CitizenProfile>;

    // Cascading invalidations to prevent stale or incoherent pre-selections across steps:
    if (qId === 'occupation') {
      if (val !== 'student') {
        updates.educationLevel = null;
        updates.courseStream = null;
        updates.attendancePercentage = null;
        updates.twelfthPercentile = null;
      }
      if (val !== 'farmer') {
        updates.isAgriculturalLandholder = null;
        updates.landholdingHectares = null;
      }
    } else if (qId === 'educationLevel') {
      // If user changes education level (e.g. from degree to intermediate or school),
      // downstream course stream and 12th percentile MUST reset so downstream question is never pre-selected!
      updates.courseStream = null;
      updates.twelfthPercentile = null;
      if (val === 'school') {
        updates.attendancePercentage = null;
      }
    } else if (qId === 'isAgriculturalLandholder') {
      if (val === false) {
        updates.landholdingHectares = null;
      }
    }

    updateProfile(updates);
    if (safeStepIndex < activeQuestions.length - 1) {
      setCurrentStepIndex(safeStepIndex + 1);
    } else {
      setViewMode('review');
    }
  };

  return (
    <div className="stack intake-page max-w-4xl mx-auto py-6 px-3 sm:px-4 space-y-6 min-w-0 max-w-full">
      {/* Editorial Header */}
      <div className="border-b border-zinc-200 pb-4">
        <div className="flex flex-wrap items-center gap-2 mb-1.5">
          <span className="inline-flex items-center gap-1 px-2.5 py-0.5 rounded-full text-[11px] font-bold tracking-wider uppercase bg-zinc-100 text-zinc-700">
            <GraduationCap className="w-3.5 h-3.5 text-zinc-700" />
            <span>{t('intake.badge')}</span>
            {language !== 'en' && (
              <span className="text-[9px] font-normal text-zinc-500 ml-1">({TRANSLATIONS.en['intake.badge']})</span>
            )}
          </span>
          <span className="text-[11px] font-bold text-emerald-800 bg-emerald-50 px-2.5 py-0.5 rounded-full border border-emerald-200 flex items-center gap-1.5 shadow-2xs">
            <span className="w-1.5 h-1.5 rounded-full bg-emerald-600 animate-pulse" />
            <span>{t('intake.shield')}</span>
            {language !== 'en' && (
              <span className="text-[9px] font-normal text-emerald-700 ml-1">({TRANSLATIONS.en['intake.shield']})</span>
            )}
          </span>
        </div>
        <h1 className="text-2xl sm:text-3xl font-extrabold text-zinc-900 tracking-tight flex items-center gap-2.5">
          <FileText className="w-7 h-7 text-zinc-900 flex-shrink-0" aria-hidden="true" />
          <div className="min-w-0">
            <span className="break-words">{t('intake.title')}</span>
            {language !== 'en' && (
              <span className="block text-sm font-normal text-zinc-500 tracking-normal mt-0.5 break-words">
                {TRANSLATIONS.en['intake.title']}
              </span>
            )}
          </div>
        </h1>
        <div className="mt-1.5 max-w-2xl leading-relaxed">
          <p className="text-sm text-zinc-600">{t('intake.lead')}</p>
          {language !== 'en' && (
            <p className="text-xs text-zinc-400 mt-1">{TRANSLATIONS.en['intake.lead']}</p>
          )}
        </div>
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

      {/* 1-Click Synthetic Demo Personas */}
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
              tag: 'Citizen Cohort',
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
                  setViewMode('review');
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
          <Card className="p-3 bg-zinc-50 rounded-xl border border-zinc-200/80 text-xs text-zinc-700 flex flex-wrap items-center justify-between gap-2 shadow-2xs animate-scale-in card-interactive">
            <span className="truncate">
              <strong>Active Persona:</strong>{' '}
              {GOLDEN_PERSONAS.find((p) => p.name === activePersonaName)?.description}
            </span>
            <div className="flex items-center gap-2">
              <button
                type="button"
                onClick={() => {
                  setCurrentStepIndex(0);
                  setViewMode('step');
                }}
                className="text-[11px] font-bold text-zinc-900 hover:underline inline-flex items-center gap-1"
              >
                Step through from Q1 <ArrowRight className="w-3 h-3" />
              </button>
              <button
                type="button"
                onClick={() => {
                  resetProfile();
                  setCurrentStepIndex(0);
                  setViewMode('step');
                }}
                className="text-[11px] font-bold text-red-600 hover:text-red-700 hover:underline inline-flex items-center gap-1 ml-2"
              >
                <RefreshCw className="w-3 h-3" /> Clear &amp; Start Blank
              </button>
            </div>
          </Card>
        )}
      </section>

      {/* Voice & Natural Language Quick Assist Drawer */}
      <section className="space-y-2">
        <div className="flex items-center justify-between">
          <button
            type="button"
            onClick={() => setShowQuickAssist(!showQuickAssist)}
            className="text-xs font-semibold text-zinc-700 hover:text-zinc-900 inline-flex items-center gap-1.5 py-1 px-2 rounded-md hover:bg-zinc-100 transition-colors"
          >
            <Languages className="w-3.5 h-3.5 text-zinc-600" />
            <span>Have a voice memo or text description? {showQuickAssist ? 'Hide Quick Assist' : 'Open AI Quick Assist'}</span>
          </button>
          <Button
            variant="secondary"
            onClick={() => setIsVoiceModalOpen(true)}
            className="flex items-center gap-1.5 text-xs py-1 px-2.5 bg-indigo-50 hover:bg-indigo-100 text-indigo-800 border-indigo-200 btn-tactile"
          >
            <Mic className="w-3.5 h-3.5 text-indigo-600" /> {t('intake.btn.voice')}
          </Button>
        </div>

        {showQuickAssist && (
          <Card className="p-4 bg-white border-zinc-200/90 shadow-xs space-y-3 animate-slide-down-fade">
            <div className="flex flex-col sm:flex-row sm:items-center justify-between gap-1">
              <label htmlFor="intake-description" className="font-bold text-zinc-900 text-sm flex items-center gap-2">
                <T id="intake.input.label" />
              </label>
              <T id="intake.input.sub" className="text-[11px] text-zinc-500" />
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
              <div className="text-[11px] font-semibold text-zinc-500 uppercase tracking-wider block">
                <T id="intake.sample.label" />
              </div>
              <div className="flex flex-wrap gap-1.5">
                {(SAMPLE_PROMPTS_BY_LANG[language] || SAMPLE_PROMPTS_BY_LANG.en).map((prompt, i) => (
                  <button
                    key={i}
                    type="button"
                    onClick={() => handleApplySamplePrompt(prompt.text)}
                    className="text-left text-[11px] px-2.5 py-1.5 rounded-md bg-zinc-100 hover:bg-zinc-200 text-zinc-700 border border-zinc-200/70 transition-colors max-w-xs"
                  >
                    <div className="font-semibold text-zinc-900 truncate">{prompt.text}</div>
                    {language !== 'en' && prompt.subText && (
                      <div className="text-[10px] text-zinc-500 truncate mt-0.5">{prompt.subText}</div>
                    )}
                  </button>
                ))}
              </div>
            </div>

            <div className="pt-2 flex flex-wrap items-center justify-between gap-2 border-t border-zinc-100">
              <span className="text-[11px] text-zinc-500 italic flex items-center gap-1">
                <ShieldAlert className="w-3.5 h-3.5 text-zinc-400" />
                {t('intake.shield.warning')}
              </span>
              <Button
                variant="secondary"
                onClick={handleParseDescription}
                disabled={!descriptionInput.trim() || !!shieldViolation}
                className="flex items-center gap-1.5 text-xs py-1.5 btn-tactile"
              >
                <Sparkles className="w-3.5 h-3.5 text-zinc-800" /> {t('intake.btn.extract')}
              </Button>
            </div>
          </Card>
        )}

        {extractedNotice && (
          <div className="text-xs p-2.5 bg-emerald-50 text-emerald-900 border border-emerald-200 rounded-lg flex items-center gap-2 animate-slide-down-fade font-medium">
            <CheckCircle className="w-4 h-4 text-emerald-600 flex-shrink-0" />
            <span>{extractedNotice}</span>
          </div>
        )}
      </section>

      {/* Adaptive App-Style Onboarding Wizard */}
      <section aria-labelledby="questionnaire-heading" className="space-y-4">
        {/* Progress & Stepper Controls Header */}
        <div className="space-y-2.5">
          <div className="flex flex-wrap items-center justify-between gap-2">
            <div className="flex items-center gap-2">
              <span className="text-[11px] font-bold uppercase tracking-wider bg-zinc-100 text-zinc-800 px-2.5 py-1 rounded-full border border-zinc-200">
                {viewMode === 'step' && currentQ
                  ? `${currentQ.category || 'Step'} • Question ${safeStepIndex + 1} of ${activeQuestions.length}`
                  : `Review • ${answeredCount} of ${activeQuestions.length} answered`}
              </span>
              {profile.occupation && (
                <span className="text-[11px] font-semibold text-indigo-700 bg-indigo-50 border border-indigo-200 px-2.5 py-0.5 rounded-full capitalize">
                  {profile.occupation.replace('_', ' ')} Path
                </span>
              )}
            </div>

            <div className="flex items-center gap-2">
              <button
                type="button"
                onClick={() => setViewMode(viewMode === 'step' ? 'review' : 'step')}
                className="text-xs font-semibold text-zinc-700 hover:text-zinc-900 border border-zinc-200 px-2.5 py-1 rounded-lg bg-zinc-50 hover:bg-zinc-100 transition-colors inline-flex items-center gap-1.5"
              >
                <ListFilter className="w-3.5 h-3.5 text-zinc-500" />
                <span>{viewMode === 'step' ? 'Review All Answers' : 'Back to Step-by-Step Flow'}</span>
              </button>
              <button
                type="button"
                onClick={() => {
                  resetProfile();
                  setCurrentStepIndex(0);
                  setViewMode('step');
                }}
                className="text-[11px] text-zinc-500 hover:text-zinc-900 inline-flex items-center gap-1 px-2 py-1"
              >
                <RefreshCw className="w-3 h-3" /> {t('intake.reset')}
              </button>
            </div>
          </div>

          {/* Stepper Progress Bar */}
          <div className="w-full bg-zinc-100 h-2 rounded-full overflow-hidden border border-zinc-200/70">
            <div
              className="bg-zinc-900 h-full rounded-full transition-all duration-300 ease-out"
              style={{ width: `${viewMode === 'review' ? 100 : progressPercent}%` }}
            />
          </div>
        </div>

        {/* MODE 1: One-by-One Question Card Flow */}
        {viewMode === 'step' && currentQ && (
          <Card className="p-5 sm:p-7 bg-white border-zinc-200/90 shadow-sm rounded-2xl space-y-6 animate-scale-in">
            {/* Question Header */}
            <div>
              <div className="flex items-center gap-2 text-xs font-bold text-zinc-400 uppercase tracking-wider mb-1">
                <span>Step {safeStepIndex + 1}</span>
                <span>•</span>
                <span>{currentQ.category}</span>
              </div>
              <h2 className="text-xl sm:text-2xl font-extrabold text-zinc-900 tracking-tight leading-snug">
                {getQuestionText(currentQ, profile, language)}
              </h2>
              {language !== 'en' && (
                <p className="text-sm sm:text-base text-zinc-500 font-normal mt-1.5">
                  {getQuestionText(currentQ, profile, 'en')}
                </p>
              )}
            </div>

            {/* Why We Ask This Accordion */}
            <div className="pt-0.5">
              <button
                type="button"
                onClick={() => setExpandedWhyId(expandedWhyId === currentQ.id ? null : currentQ.id)}
                className="inline-flex items-center gap-1.5 text-xs text-zinc-500 hover:text-zinc-800 font-medium transition-colors"
              >
                <HelpCircle className="w-3.5 h-3.5 text-zinc-400" />
                <span>{t('intake.why') || 'Why we ask this'}</span>
                <span className="text-[10px] text-zinc-400">({expandedWhyId === currentQ.id ? 'Hide' : 'Show'})</span>
              </button>
              {expandedWhyId === currentQ.id && (
                <div className="mt-2 text-xs text-zinc-700 bg-zinc-50 p-3 rounded-xl border border-zinc-200/80 leading-relaxed animate-slide-down-fade">
                  {currentQ.whyWeAskThis}
                </div>
              )}
            </div>

            {/* Interactive Answer Selection */}
            <div className="pt-2">
              {/* Special UI for Domicile State: Popular Quick Pills + Complete National Select */}
              {currentQ.id === 'domicileState' ? (
                <div className="space-y-4">
                  <div className="space-y-2">
                    <span className="text-[11px] font-semibold text-zinc-500 uppercase tracking-wider block">
                      Popular States:
                    </span>
                    <div className="flex flex-wrap gap-2">
                      {POPULAR_STATES.map((state) => {
                        const isSelected = profile.domicileState === state;
                        const stateOpt = currentOptions.find((o) => o.value === state);
                        return (
                          <button
                            key={state}
                            type="button"
                            onClick={() => handleSelectOption('domicileState', state)}
                            className={`text-xs px-3.5 py-2 rounded-xl border transition-all btn-tactile cursor-pointer flex items-center gap-1.5 ${
                              isSelected
                                ? 'bg-zinc-900 text-white !text-white border-zinc-900 font-bold shadow-xs'
                                : 'bg-white text-zinc-800 border-zinc-200 hover:bg-zinc-50 hover:border-zinc-300'
                            }`}
                          >
                            {isSelected && <Check className="w-3.5 h-3.5 text-emerald-400" />}
                            <span className={isSelected ? 'text-white !text-white font-bold' : ''}>
                              {language === 'te' && stateOpt?.teluguLabel
                                ? `${stateOpt.teluguLabel} (${state})`
                                : language === 'hi' && stateOpt?.hindiLabel
                                ? `${stateOpt.hindiLabel} (${state})`
                                : state}
                            </span>
                          </button>
                        );
                      })}
                    </div>
                  </div>

                  <div className="pt-2 border-t border-zinc-100">
                    <label htmlFor="state-select" className="text-xs text-zinc-500 block mb-1.5 font-medium">
                      Or select from all 34 States / Union Territories:
                    </label>
                    <select
                      id="state-select"
                      value={profile.domicileState || 'UNKNOWN'}
                      onChange={(e) => {
                        const val = e.target.value === 'UNKNOWN' ? null : e.target.value;
                        handleSelectOption('domicileState', val);
                      }}
                      className="w-full text-xs p-3 border border-zinc-300 rounded-xl bg-zinc-50 focus:bg-white focus:ring-2 focus:ring-zinc-900 focus:outline-none transition-colors cursor-pointer"
                    >
                      <option value="UNKNOWN">Select your State / UT...</option>
                      {currentOptions.map((opt) => (
                        <option key={String(opt.value)} value={String(opt.value)}>
                          {language === 'te' && opt.teluguLabel
                            ? `${opt.teluguLabel} (${opt.label})`
                            : language === 'hi' && opt.hindiLabel
                            ? `${opt.hindiLabel} (${opt.label})`
                            : opt.label}
                        </option>
                      ))}
                    </select>
                  </div>
                </div>
              ) : currentQ.type === 'number' ? (
                /* Numeric Questions: Number Input + Quick Preset Benchmarks */
                <div className="space-y-4">
                  <div className="space-y-1.5">
                    <label htmlFor={`num-input-${currentQ.id}`} className="text-xs font-semibold text-zinc-700 block">
                      Enter Value:
                    </label>
                    <input
                      id={`num-input-${currentQ.id}`}
                      type="number"
                      min={currentQ.min ?? 0}
                      max={currentQ.max}
                      step={currentQ.step ?? 1}
                      value={profile[currentQ.id] === null || profile[currentQ.id] === undefined ? '' : String(profile[currentQ.id])}
                      onChange={(e) => {
                        const val = e.target.value;
                        updateProfile({
                          [currentQ.id]: val === '' ? null : Number(val),
                        } as Partial<CitizenProfile>);
                      }}
                      placeholder={
                        currentQ.placeholder ||
                        (currentQ.id === 'age'
                          ? 'e.g. 21'
                          : currentQ.id === 'attendancePercentage'
                          ? 'e.g. 80'
                          : currentQ.id === 'twelfthPercentile'
                          ? 'e.g. 85'
                          : currentQ.id === 'landholdingHectares'
                          ? 'e.g. 1.5'
                          : currentQ.id === 'familyIncome'
                          ? 'e.g. 150000'
                          : 'Enter number...')
                      }
                      className="w-full text-base p-3.5 border border-zinc-300 rounded-xl bg-zinc-50 focus:bg-white focus:ring-2 focus:ring-zinc-900 focus:outline-none transition-all font-mono"
                    />
                  </div>

                  {currentOptions.length > 0 && (
                    <div className="space-y-2">
                      <span className="text-[11px] font-semibold text-zinc-500 uppercase tracking-wider block">
                        Quick Preset Benchmarks:
                      </span>
                      <div className="flex flex-wrap gap-2">
                        {currentOptions.map((opt) => {
                          const isSelected =
                            profile[currentQ.id] !== null &&
                            profile[currentQ.id] !== undefined &&
                            profile[currentQ.id] !== '' &&
                            Number(profile[currentQ.id]) === Number(opt.value);
                          return (
                            <button
                              key={String(opt.value)}
                              type="button"
                              onClick={() => handleSelectOption(currentQ.id, Number(opt.value))}
                              className={`text-xs px-3.5 py-2 rounded-xl border transition-all cursor-pointer btn-tactile flex items-center gap-1.5 ${
                                isSelected
                                  ? 'bg-zinc-900 text-white !text-white border-zinc-900 font-bold shadow-xs'
                                  : 'bg-zinc-50 text-zinc-800 border-zinc-200 hover:bg-zinc-100 hover:border-zinc-300'
                              }`}
                            >
                              {isSelected && <Check className="w-3.5 h-3.5 text-emerald-400" />}
                              <span className={isSelected ? 'text-white !text-white font-bold' : ''}>
                                {language === 'te' && opt.teluguLabel
                                  ? `${opt.teluguLabel} (${opt.label})`
                                  : language === 'hi' && opt.hindiLabel
                                  ? `${opt.hindiLabel} (${opt.label})`
                                  : opt.label}
                              </span>
                            </button>
                          );
                        })}
                      </div>
                    </div>
                  )}
                </div>
              ) : (
                /* Choice Questions (Select / Boolean): Interactive Cards with Checkmarks */
                <div className="grid grid-cols-1 sm:grid-cols-2 gap-2.5">
                  {currentOptions.map((opt) => {
                    const currentVal = profile[currentQ.id];
                    const isSelected =
                      currentVal !== null &&
                      currentVal !== undefined &&
                      currentVal !== '' &&
                      (currentQ.type === 'boolean'
                        ? currentVal === opt.value
                        : String(currentVal) === String(opt.value));

                    return (
                      <button
                        key={String(opt.value)}
                        type="button"
                        onClick={() => {
                          const val =
                            currentQ.type === 'boolean'
                              ? opt.value === true || opt.value === 'true'
                              : opt.value;
                          handleSelectOption(currentQ.id, val);
                        }}
                        className={`p-4 rounded-xl border text-left flex items-center justify-between gap-3 transition-all duration-150 btn-tactile cursor-pointer ${
                          isSelected
                            ? 'bg-zinc-900 text-white !text-white border-zinc-900 shadow-md ring-2 ring-zinc-900/10'
                            : 'bg-white hover:bg-zinc-50 border-zinc-200 text-zinc-800 hover:border-zinc-300'
                        }`}
                      >
                        <span className={`text-xs sm:text-sm font-semibold leading-snug ${isSelected ? 'text-white !text-white' : 'text-zinc-900'}`}>
                          {language === 'te' && opt.teluguLabel ? (
                            <>
                              <span className="block">{opt.teluguLabel}</span>
                              <span className={`block text-[11px] font-normal mt-0.5 ${isSelected ? 'text-zinc-300' : 'text-zinc-500'}`}>
                                {opt.label}
                              </span>
                            </>
                          ) : language === 'hi' && opt.hindiLabel ? (
                            <>
                              <span className="block">{opt.hindiLabel}</span>
                              <span className={`block text-[11px] font-normal mt-0.5 ${isSelected ? 'text-zinc-300' : 'text-zinc-500'}`}>
                                {opt.label}
                              </span>
                            </>
                          ) : (
                            opt.label
                          )}
                        </span>
                        {isSelected ? (
                          <CheckCircle className="w-5 h-5 text-emerald-400 flex-shrink-0" />
                        ) : (
                          <span className="w-4 h-4 rounded-full border border-zinc-300 flex-shrink-0" />
                        )}
                      </button>
                    );
                  })}
                </div>
              )}
            </div>

            {/* Step Controls: Back, Skip, Next */}
            <div className="pt-4 border-t border-zinc-100 flex items-center justify-between gap-3">
              <Button
                variant="secondary"
                type="button"
                onClick={() => {
                  if (safeStepIndex > 0) setCurrentStepIndex(safeStepIndex - 1);
                }}
                disabled={safeStepIndex === 0}
                className="flex items-center gap-1.5 text-xs py-2 px-3.5 btn-tactile"
              >
                <ChevronLeft className="w-4 h-4" />
                <span>Previous</span>
              </Button>

              <div className="flex items-center gap-2">
                <button
                  type="button"
                  onClick={() => {
                    if (safeStepIndex < activeQuestions.length - 1) {
                      setCurrentStepIndex(safeStepIndex + 1);
                    } else {
                      setViewMode('review');
                    }
                  }}
                  className="text-xs text-zinc-500 hover:text-zinc-800 px-3 py-2 font-medium"
                >
                  Skip / Not Sure
                </button>

                <Button
                  variant="primary"
                  type="button"
                  onClick={() => {
                    if (safeStepIndex < activeQuestions.length - 1) {
                      setCurrentStepIndex(safeStepIndex + 1);
                    } else {
                      setViewMode('review');
                    }
                  }}
                  className="flex items-center gap-2 text-xs py-2 px-4 bg-zinc-900 hover:bg-zinc-800 text-white !text-white font-semibold rounded-lg shadow-xs btn-tactile"
                  style={{ color: '#ffffff' }}
                >
                  <span className="text-white !text-white font-semibold" style={{ color: '#ffffff' }}>
                    {safeStepIndex === activeQuestions.length - 1 ? 'Review Profile' : 'Continue'}
                  </span>
                  <ChevronRight className="w-4 h-4 text-white" style={{ color: '#ffffff' }} />
                </Button>
              </div>
            </div>
          </Card>
        )}

        {/* MODE 2: Full Profile Review & Confirmation Screen */}
        {viewMode === 'review' && (
          <Card className="p-5 sm:p-7 bg-white border-zinc-200/90 shadow-sm rounded-2xl space-y-6 animate-scale-in">
            <div className="border-b border-zinc-200 pb-4 flex flex-wrap items-center justify-between gap-3">
              <div>
                <div className="flex items-center gap-2 text-xs font-bold text-emerald-700 uppercase tracking-wider mb-1">
                  <CheckCircle className="w-4 h-4 text-emerald-600" />
                  <span>Onboarding Profile Summary</span>
                </div>
                <h2 className="text-xl sm:text-2xl font-extrabold text-zinc-900 tracking-tight">
                  Review Your Active Circumstances
                </h2>
                <p className="text-xs sm:text-sm text-zinc-600 mt-1">
                  {answeredCount} of {activeQuestions.length} attributes active. Click &quot;Edit&quot; next to any item to change your answer.
                </p>
              </div>

              <Button
                variant="primary"
                onClick={() => navigate('/matches')}
                className="flex items-center gap-2 px-5 py-2.5 text-xs font-bold bg-zinc-900 hover:bg-zinc-800 text-white !text-white rounded-xl shadow-sm btn-tactile"
                style={{ color: '#ffffff' }}
              >
                <span className="text-white !text-white font-bold" style={{ color: '#ffffff' }}>{t('intake.btn.find')}</span>
                <ArrowRight className="w-4 h-4 text-white" style={{ color: '#ffffff' }} />
              </Button>
            </div>

            {/* Checklist of all Active Branch Questions */}
            <div className="grid grid-cols-1 md:grid-cols-2 gap-3">
              {activeQuestions.map((q, idx) => {
                const val = profile[q.id];
                const isSet = val !== null && val !== undefined && val !== '';

                return (
                  <div
                    key={q.id}
                    className="p-3.5 rounded-xl border border-zinc-200 bg-zinc-50/60 hover:bg-zinc-50 flex items-start justify-between gap-3 transition-colors"
                  >
                    <div className="space-y-1">
                      <div className="flex items-center gap-2">
                        <span className="text-[10px] font-bold uppercase tracking-wider text-zinc-400">
                          Step {idx + 1} • {q.category}
                        </span>
                        {isSet ? (
                          <span className="w-1.5 h-1.5 rounded-full bg-emerald-500" />
                        ) : (
                          <span className="text-[10px] text-amber-600 bg-amber-50 px-1.5 py-0.2 rounded border border-amber-200">
                            Unspecified
                          </span>
                        )}
                      </div>
                      <div className="text-xs font-bold text-zinc-900 line-clamp-1">
                        {getQuestionText(q, profile, language)}
                      </div>
                      {language !== 'en' && (
                        <div className="text-[11px] text-zinc-500 font-normal line-clamp-1">
                          {getQuestionText(q, profile, 'en')}
                        </div>
                      )}
                      <div className="text-xs font-medium text-zinc-700">
                        {formatAnswer(q, val, profile, language)}
                      </div>
                    </div>

                    <button
                      type="button"
                      onClick={() => {
                        setCurrentStepIndex(idx);
                        setViewMode('step');
                      }}
                      className="text-xs font-semibold text-zinc-600 hover:text-zinc-900 bg-white border border-zinc-200 px-2.5 py-1 rounded-md shadow-2xs hover:bg-zinc-100 transition-colors inline-flex items-center gap-1 flex-shrink-0"
                    >
                      <Edit2 className="w-3 h-3 text-zinc-400" />
                      <span>Edit</span>
                    </button>
                  </div>
                );
              })}
            </div>

            <div className="pt-4 border-t border-zinc-100 flex flex-wrap items-center justify-between gap-3">
              <Button
                variant="secondary"
                onClick={() => {
                  setCurrentStepIndex(0);
                  setViewMode('step');
                }}
                className="text-xs py-2 px-4 btn-tactile"
              >
                <span>Step Through Questions Again</span>
              </Button>

              <Button
                variant="primary"
                onClick={() => navigate('/matches')}
                className="flex items-center gap-2 px-6 py-2.5 text-xs font-bold bg-zinc-900 hover:bg-zinc-800 text-white !text-white rounded-xl shadow-sm btn-tactile"
                style={{ color: '#ffffff' }}
              >
                <span className="text-white !text-white font-bold" style={{ color: '#ffffff' }}>{t('intake.btn.find')}</span>
                <ArrowRight className="w-4 h-4 text-white" style={{ color: '#ffffff' }} />
              </Button>
            </div>
          </Card>
        )}
      </section>

      {/* Sticky Bottom Confirmation & Match Discovery Action */}
      <div className="pt-4 border-t border-zinc-200 flex flex-col sm:flex-row sm:items-center justify-between gap-3 bg-white/80 backdrop-blur-sm p-3 rounded-xl border">
        <div className="text-xs text-zinc-700 flex flex-wrap items-center gap-2">
          <span>
            Domicile: <strong className="text-zinc-900 font-semibold">{profile.domicileState || 'All India (Any State)'}</strong>
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
          className="flex items-center justify-center gap-2 px-5 py-2.5 text-xs font-bold shadow-sm btn-tactile bg-zinc-900 hover:bg-zinc-800 text-white !text-white rounded-lg"
          style={{ color: '#ffffff' }}
        >
          <span className="text-white !text-white font-bold" style={{ color: '#ffffff' }}>{t('intake.btn.find')}</span>
          <ArrowRight className="w-4 h-4 text-white" style={{ color: '#ffffff' }} />
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
