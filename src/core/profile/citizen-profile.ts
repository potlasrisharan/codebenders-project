/**
 * Citizen Profile Definition & Synthetic Golden Personas (P4)
 * Supports FR-INT-01 through FR-INT-08, FR-SEC-09.
 */

import { z } from 'zod';
import { inspectSensitiveIds } from '../privacy/sensitive-id-shield';

export const EducationLevelSchema = z.enum([
  'intermediate',
  'undergraduate',
  'postgraduate',
  'diploma',
  'school',
]);
export type EducationLevel = z.infer<typeof EducationLevelSchema>;

export const SocialCategorySchema = z.enum([
  'SC',
  'ST',
  'BC-A',
  'BC-B',
  'BC-C',
  'BC-D',
  'BC-E',
  'EBC',
  'Minority',
  'General',
]);
export type SocialCategory = z.infer<typeof SocialCategorySchema>;

export const GenderSchema = z.enum(['female', 'male', 'other']);
export type Gender = z.infer<typeof GenderSchema>;

export interface CitizenProfile {
  id?: string;
  domicileState: string | null;
  educationLevel: EducationLevel | null;
  courseStream: string | null;
  socialCategory: SocialCategory | null;
  familyIncome: number | null;
  attendancePercentage: number | null;
  gender: Gender | null;
  hasDisability: boolean | null;
  twelfthPercentile: number | null;
  isAgriculturalLandholder: boolean | null;
}

export const EMPTY_CITIZEN_PROFILE: CitizenProfile = {
  domicileState: null,
  educationLevel: null,
  courseStream: null,
  socialCategory: null,
  familyIncome: null,
  attendancePercentage: null,
  gender: null,
  hasDisability: null,
  twelfthPercentile: null,
  isAgriculturalLandholder: null,
};

export interface AdaptiveQuestion {
  id: keyof CitizenProfile;
  questionText: string;
  teluguQuestionText: string;
  whyWeAskThis: string;
  type: 'select' | 'number' | 'boolean';
  options?: { label: string; value: string | number | boolean }[];
}

export const ADAPTIVE_QUESTIONS: AdaptiveQuestion[] = [
  {
    id: 'domicileState',
    questionText: 'Which state are you a permanent resident/native of?',
    teluguQuestionText: 'మీరు ఏ రాష్ట్ర శాశ్వత నివాసి?',
    whyWeAskThis: 'State government scholarships (like Telangana ePASS) require state domicile, while Central schemes apply across India.',
    type: 'select',
    options: [
      { label: 'Telangana', value: 'Telangana' },
      { label: 'Andhra Pradesh', value: 'Andhra Pradesh' },
      { label: 'Karnataka', value: 'Karnataka' },
      { label: 'Maharashtra', value: 'Maharashtra' },
      { label: 'Tamil Nadu', value: 'Tamil Nadu' },
      { label: 'Other State', value: 'Other' },
    ],
  },
  {
    id: 'educationLevel',
    questionText: 'What is your current level of education?',
    teluguQuestionText: 'మీ ప్రస్తుత విద్యా స్థాయి ఏమిటి?',
    whyWeAskThis: 'Most scholarships are specific to post-matric, degree (B.Tech/B.Sc), diploma, or intermediate education.',
    type: 'select',
    options: [
      { label: 'Undergraduate / College (B.Tech, B.Sc, B.Com, MBBS, etc.)', value: 'undergraduate' },
      { label: 'Intermediate / Class 11-12 (+2)', value: 'intermediate' },
      { label: 'Diploma / Polytechnic', value: 'diploma' },
      { label: 'Postgraduate (M.Tech, M.Sc, MBA, etc.)', value: 'postgraduate' },
    ],
  },
  {
    id: 'courseStream',
    questionText: 'What stream is your course?',
    teluguQuestionText: 'మీ కోర్సు ఏ విభాగానికి చెందినది?',
    whyWeAskThis: 'Schemes like AICTE Pragati and Saksham specifically fund technical engineering and pharmacy courses.',
    type: 'select',
    options: [
      { label: 'Engineering / Technology (B.Tech / B.E)', value: 'engineering' },
      { label: 'Degree (B.Sc, B.Com, B.A)', value: 'degree_arts_science' },
      { label: 'Pharmacy (B.Pharm)', value: 'pharmacy' },
      { label: 'Polytechnic Diploma', value: 'technical_diploma' },
      { label: 'General / Other', value: 'general' },
    ],
  },
  {
    id: 'socialCategory',
    questionText: 'What is your social / reservation category?',
    teluguQuestionText: 'మీ సామాజిక / రిజర్వేషన్ వర్గం ఏమిటి?',
    whyWeAskThis: 'Government welfare departments (SC, ST, BC, Minority) have dedicated fee reimbursement funds with different income thresholds.',
    type: 'select',
    options: [
      { label: 'SC (Scheduled Caste)', value: 'SC' },
      { label: 'ST (Scheduled Tribe)', value: 'ST' },
      { label: 'BC-A', value: 'BC-A' },
      { label: 'BC-B', value: 'BC-B' },
      { label: 'BC-C', value: 'BC-C' },
      { label: 'BC-D', value: 'BC-D' },
      { label: 'BC-E', value: 'BC-E' },
      { label: 'EBC (Economically Backward Class)', value: 'EBC' },
      { label: 'Minority (Muslim, Christian, Sikh, Jain, Buddhist)', value: 'Minority' },
      { label: 'General / OC', value: 'General' },
    ],
  },
  {
    id: 'familyIncome',
    questionText: 'What is your total annual family income (from all sources)?',
    teluguQuestionText: 'మీ మొత్తం వార్షిక కుటుంబ ఆదాయం ఎంత?',
    whyWeAskThis: 'Scholarships have official income caps certified by MeeSeva Tahsildar (e.g. ₹2 Lakhs for ePASS, ₹4.5 Lakhs for CSSS, ₹8 Lakhs for AICTE).',
    type: 'number',
    options: [
      { label: 'Below ₹1,50,000 / year (Rural BC/EBC limit)', value: 140000 },
      { label: 'Below ₹2,00,000 / year (SC/ST & Urban ePASS limit)', value: 190000 },
      { label: 'Below ₹4,50,000 / year (Central Sector CSSS limit)', value: 350000 },
      { label: 'Below ₹8,00,000 / year (AICTE Pragati limit)', value: 600000 },
      { label: 'Above ₹8,00,000 / year', value: 1000000 },
    ],
  },
  {
    id: 'attendancePercentage',
    questionText: 'What is your certified college attendance percentage?',
    teluguQuestionText: 'మీ కళాశాల హాజరు శాతం ఎంత?',
    whyWeAskThis: 'Telangana ePASS mandates at least 75% quarterly attendance certified by your Principal to release tuition and mess fee.',
    type: 'number',
    options: [
      { label: '75% or higher (Meets requirement)', value: 80 },
      { label: 'Below 75%', value: 65 },
    ],
  },
  {
    id: 'gender',
    questionText: 'What is your gender?',
    teluguQuestionText: 'మీ లింగం ఏమిటి?',
    whyWeAskThis: 'Special affirmative schemes (like AICTE Pragati) provide dedicated funding exclusively for female students.',
    type: 'select',
    options: [
      { label: 'Female', value: 'female' },
      { label: 'Male', value: 'male' },
      { label: 'Other', value: 'other' },
    ],
  },
  {
    id: 'hasDisability',
    questionText: 'Do you have a certified physical disability (UDID 40%+)?',
    teluguQuestionText: 'మీకు దివ్యాంగ ధృవీకరణ పత్రం (40%+) ఉందా?',
    whyWeAskThis: 'AICTE Saksham and Disabled Welfare schemes offer dedicated grants for students with benchmark disability.',
    type: 'boolean',
    options: [
      { label: 'Yes, 40% or more (UDID certified)', value: true },
      { label: 'No', value: false },
    ],
  },
  {
    id: 'twelfthPercentile',
    questionText: 'Did you score in the top 20th percentile (80th percentile+) in Class 12 / Intermediate?',
    teluguQuestionText: 'ఇంటర్మీడియట్ బోర్డులో టాప్ 20 పర్సంటైల్ సాధించారా?',
    whyWeAskThis: 'The Central Sector Scheme (CSSS) requires scoring above the 80th percentile cutoff of the State Board (TSBIE).',
    type: 'number',
    options: [
      { label: 'Yes, top percentile (> 80 percentile / 90%+ marks)', value: 85 },
      { label: 'No / Average score', value: 65 },
    ],
  },
];

/**
 * 6 Synthetic Golden Demo Personas (FR-SEC-09, P5)
 * Test fixtures representing low-income college student cohort in Telangana & benchmark cases.
 */
export const GOLDEN_PERSONAS: { name: string; description: string; profile: CitizenProfile }[] = [
  {
    name: 'Priya (Telangana B.Tech Student)',
    description: '2nd year B.Tech student in Hyderabad, BC-B category, family income ₹1.2 Lakhs, 80% attendance.',
    profile: {
      domicileState: 'Telangana',
      educationLevel: 'undergraduate',
      courseStream: 'engineering',
      socialCategory: 'BC-B',
      familyIncome: 120000,
      attendancePercentage: 80,
      gender: 'female',
      hasDisability: false,
      twelfthPercentile: 72,
      isAgriculturalLandholder: false,
    },
  },
  {
    name: 'Rajesh (SC Degree Student - Merit Achiever)',
    description: '1st year B.Sc student in Warangal, SC category, income ₹1.8 Lakhs, 78% attendance, 85th percentile in 12th.',
    profile: {
      domicileState: 'Telangana',
      educationLevel: 'undergraduate',
      courseStream: 'degree_arts_science',
      socialCategory: 'SC',
      familyIncome: 180000,
      attendancePercentage: 78,
      gender: 'male',
      hasDisability: false,
      twelfthPercentile: 85,
      isAgriculturalLandholder: false,
    },
  },
  {
    name: 'Ananya (AICTE Engineering Girl Student)',
    description: '1st year B.Tech girl student in approved technical college, General category, family income ₹3.5 Lakhs.',
    profile: {
      domicileState: 'Telangana',
      educationLevel: 'undergraduate',
      courseStream: 'engineering',
      socialCategory: 'General',
      familyIncome: 350000,
      attendancePercentage: 85,
      gender: 'female',
      hasDisability: false,
      twelfthPercentile: 75,
      isAgriculturalLandholder: false,
    },
  },
  {
    name: 'Suresh (Incomplete Information - Missing Income)',
    description: 'Degree student in Nizamabad, BC-A, attendance 82%, but family income is unknown ("I don\'t know").',
    profile: {
      domicileState: 'Telangana',
      educationLevel: 'undergraduate',
      courseStream: 'degree_arts_science',
      socialCategory: 'BC-A',
      familyIncome: null, // Unknown!
      attendancePercentage: 82,
      gender: 'male',
      hasDisability: false,
      twelfthPercentile: null,
      isAgriculturalLandholder: false,
    },
  },
  {
    name: 'Vikram (High Income - Ineligible for Needs-based)',
    description: 'College student from affluent family with income ₹12 Lakhs/year, General category.',
    profile: {
      domicileState: 'Telangana',
      educationLevel: 'undergraduate',
      courseStream: 'engineering',
      socialCategory: 'General',
      familyIncome: 1200000, // Exceeds all welfare ceilings
      attendancePercentage: 88,
      gender: 'male',
      hasDisability: false,
      twelfthPercentile: 70,
      isAgriculturalLandholder: false,
    },
  },
  {
    name: 'Sneha (Out of State Domicile - Karnataka)',
    description: 'Karnataka domicile studying in college, family income ₹2 Lakhs.',
    profile: {
      domicileState: 'Karnataka',
      educationLevel: 'undergraduate',
      courseStream: 'degree_arts_science',
      socialCategory: 'BC-A',
      familyIncome: 200000,
      attendancePercentage: 80,
      gender: 'female',
      hasDisability: false,
      twelfthPercentile: 82,
      isAgriculturalLandholder: false,
    },
  },
];

/**
 * Natural Language Parser for plain text (English & Telugu keywords)
 * Extracts non-sensitive candidate attributes without retaining raw text.
 */
export function extractProfileFromText(rawText: string): {
  profile: CitizenProfile;
  extractedAttributes: string[];
} {
  // First pass: Privacy Shield
  const safeText = inspectSensitiveIds(rawText).safeText.toLowerCase();

  const profile: CitizenProfile = { ...EMPTY_CITIZEN_PROFILE };
  const extracted: string[] = [];

  // 1. Domicile State
  if (
    safeText.includes('telangana') ||
    safeText.includes('hyderabad') ||
    safeText.includes('warangal') ||
    safeText.includes('తెలంగాణ') ||
    safeText.includes('హైదరాబాద్') ||
    safeText.includes('వరంగల్')
  ) {
    profile.domicileState = 'Telangana';
    extracted.push('domicileState');
  } else if (safeText.includes('andhra') || safeText.includes('ఆంధ్ర')) {
    profile.domicileState = 'Andhra Pradesh';
    extracted.push('domicileState');
  } else if (safeText.includes('karnataka') || safeText.includes('bengaluru') || safeText.includes('కర్ణాటక')) {
    profile.domicileState = 'Karnataka';
    extracted.push('domicileState');
  }

  // 2. Education Level & Course Stream
  if (safeText.includes('btech') || safeText.includes('b.tech') || safeText.includes('engineering') || safeText.includes('ఇంజనీరింగ్')) {
    profile.educationLevel = 'undergraduate';
    profile.courseStream = 'engineering';
    extracted.push('educationLevel', 'courseStream');
  } else if (safeText.includes('degree') || safeText.includes('bsc') || safeText.includes('b.sc') || safeText.includes('bcom') || safeText.includes('డిగ్రీ')) {
    profile.educationLevel = 'undergraduate';
    profile.courseStream = 'degree_arts_science';
    extracted.push('educationLevel', 'courseStream');
  } else if (safeText.includes('intermediate') || safeText.includes('inter') || safeText.includes('12th') || safeText.includes('ఇంటర్')) {
    profile.educationLevel = 'intermediate';
    extracted.push('educationLevel');
  } else if (safeText.includes('diploma') || safeText.includes('polytechnic') || safeText.includes('డిప్లొమా')) {
    profile.educationLevel = 'diploma';
    profile.courseStream = 'technical_diploma';
    extracted.push('educationLevel', 'courseStream');
  }

  // 3. Social Category
  if (/\bsc\b|scheduled caste|ఎస్సీ/.test(safeText)) {
    profile.socialCategory = 'SC';
    extracted.push('socialCategory');
  } else if (/\bst\b|scheduled tribe|ఎస్టీ/.test(safeText)) {
    profile.socialCategory = 'ST';
    extracted.push('socialCategory');
  } else if (/\bbc[- ]?b\b/.test(safeText)) {
    profile.socialCategory = 'BC-B';
    extracted.push('socialCategory');
  } else if (/\bbc[- ]?a\b/.test(safeText)) {
    profile.socialCategory = 'BC-A';
    extracted.push('socialCategory');
  } else if (/\bbc\b|backward class|బీసీ/.test(safeText)) {
    profile.socialCategory = 'BC-B';
    extracted.push('socialCategory');
  } else if (/\bminority\b|muslim|christian|మైనారిటీ/.test(safeText)) {
    profile.socialCategory = 'Minority';
    extracted.push('socialCategory');
  } else if (/\bebc\b/.test(safeText)) {
    profile.socialCategory = 'EBC';
    extracted.push('socialCategory');
  }

  // 4. Income patterns (e.g. "1.5 lakh", "150000", "2 lakhs", "లక్ష")
  const lakhMatch = safeText.match(/(\d+(?:\.\d+)?)\s*(?:lakh|lakhs|lac|లక్ష)/);
  if (lakhMatch) {
    const lakhVal = parseFloat(lakhMatch[1]);
    profile.familyIncome = Math.round(lakhVal * 100000);
    extracted.push('familyIncome');
  } else {
    const rawNumberMatch = safeText.match(/\b([1-9]\d{4,6})\b/);
    if (rawNumberMatch) {
      profile.familyIncome = parseInt(rawNumberMatch[1], 10);
      extracted.push('familyIncome');
    }
  }

  // 5. Attendance (e.g. "80% attendance", "75 percent")
  const attMatch = safeText.match(/(\d{2})\s*(?:%|percent|శాతం)/);
  if (attMatch) {
    profile.attendancePercentage = parseInt(attMatch[1], 10);
    extracted.push('attendancePercentage');
  }

  // 6. Gender
  if (/\bgirl\b|\bfemale\b|\bwoman\b|అమ్మాయి|మహిళ/.test(safeText)) {
    profile.gender = 'female';
    extracted.push('gender');
  } else if (/\bboy\b|\bmale\b|\bman\b|అబ్బాయి/.test(safeText)) {
    profile.gender = 'male';
    extracted.push('gender');
  }

  // 7. Disability
  if (/\bdisabled\b|\bdisability\b|\bhandicapped\b|\budid\b|దివ్యాంగుల/.test(safeText)) {
    profile.hasDisability = true;
    extracted.push('hasDisability');
  }

  return {
    profile,
    extractedAttributes: Array.from(new Set(extracted)),
  };
}
