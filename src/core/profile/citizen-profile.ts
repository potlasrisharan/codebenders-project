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

export const OccupationSchema = z.enum([
  'student',
  'farmer',
  'artisan_craftsperson',
  'street_vendor',
  'unorganized_worker',
  'homemaker',
  'senior_citizen',
  'unemployed',
  'salaried',
]);
export type Occupation = z.infer<typeof OccupationSchema>;

export const AreaTypeSchema = z.enum(['rural', 'urban']);
export type AreaType = z.infer<typeof AreaTypeSchema>;

export const RationCardTypeSchema = z.enum(['white_bpl', 'antyodaya_aay', 'pink_apl', 'none']);
export type RationCardType = z.infer<typeof RationCardTypeSchema>;

export interface CitizenProfile {
  id?: string;
  domicileState: string | null;
  occupation?: Occupation | null;
  age?: number | null;
  areaType?: AreaType | null;
  rationCardType?: RationCardType | null;
  educationLevel: EducationLevel | null;
  courseStream: string | null;
  socialCategory: SocialCategory | null;
  familyIncome: number | null;
  attendancePercentage: number | null;
  gender: Gender | null;
  hasDisability: boolean | null;
  twelfthPercentile: number | null;
  isAgriculturalLandholder: boolean | null;
  landholdingHectares?: number | null;
  isPregnantOrLactating?: boolean | null;
}

export const EMPTY_CITIZEN_PROFILE: CitizenProfile = {
  domicileState: null,
  occupation: null,
  age: null,
  areaType: null,
  rationCardType: null,
  educationLevel: null,
  courseStream: null,
  socialCategory: null,
  familyIncome: null,
  attendancePercentage: null,
  gender: null,
  hasDisability: null,
  twelfthPercentile: null,
  isAgriculturalLandholder: null,
  landholdingHectares: null,
  isPregnantOrLactating: null,
};

export type QuestionOption = {
  label: string;
  teluguLabel?: string;
  hindiLabel?: string;
  value: string | number | boolean;
};

export interface AdaptiveQuestion {
  id: keyof CitizenProfile;
  questionText: string | ((profile: CitizenProfile) => string);
  teluguQuestionText?: string | ((profile: CitizenProfile) => string);
  hindiQuestionText?: string | ((profile: CitizenProfile) => string);
  whyWeAskThis: string;
  type: 'select' | 'number' | 'boolean';
  category?: string;
  condition?: (profile: CitizenProfile) => boolean;
  placeholder?: string;
  min?: number;
  max?: number;
  step?: number | string;
  options?: QuestionOption[] | ((profile: CitizenProfile) => QuestionOption[]);
}

export function getQuestionText(q: AdaptiveQuestion, profile: CitizenProfile, lang: string = 'en'): string {
  if (lang === 'te' && q.teluguQuestionText) {
    const text = typeof q.teluguQuestionText === 'function' ? q.teluguQuestionText(profile) : q.teluguQuestionText;
    if (text) return text;
  }
  if (lang === 'hi' && q.hindiQuestionText) {
    const text = typeof q.hindiQuestionText === 'function' ? q.hindiQuestionText(profile) : q.hindiQuestionText;
    if (text) return text;
  }
  return typeof q.questionText === 'function' ? q.questionText(profile) : q.questionText;
}

export function getQuestionOptions(q: AdaptiveQuestion, profile: CitizenProfile): QuestionOption[] {
  if (!q.options) return [];
  if (typeof q.options === 'function') {
    return q.options(profile);
  }
  return q.options;
}

export const ADAPTIVE_QUESTIONS: AdaptiveQuestion[] = [
  // 1. Domicile & Region (Where are you from?)
  {
    id: 'domicileState',
    category: 'Location',
    questionText: 'Which state or union territory are you a permanent resident/native of?',
    teluguQuestionText: 'మీరు ఏ రాష్ట్రం లేదా కేంద్రపాలిత ప్రాంత శాశ్వత నివాసి?',
    hindiQuestionText: 'आप किस राज्य या केंद्र शासित प्रदेश के स्थायी निवासी हैं?',
    whyWeAskThis: 'State government welfare schemes require resident domicile, while Central Government schemes (PM-KISAN, NSP, AICTE, PMAY, PM Vishwakarma) apply across all of India.',
    type: 'select',
    options: [
      { label: 'All India (Any State / Central Schemes)', teluguLabel: 'అఖిల భారతదేశం (కేంద్ర పథకాలు)', hindiLabel: 'अखिल भारतीय (केंद्रीय योजनाएं)', value: 'All India' },
      { label: 'Telangana', teluguLabel: 'తెలంగాణ', hindiLabel: 'तेलंगाना', value: 'Telangana' },
      { label: 'Andhra Pradesh', teluguLabel: 'ఆంధ్రప్రదేశ్', hindiLabel: 'आंध्र प्रदेश', value: 'Andhra Pradesh' },
      { label: 'Karnataka', teluguLabel: 'కర్ణాటక', hindiLabel: 'कर्नाटक', value: 'Karnataka' },
      { label: 'Maharashtra', teluguLabel: 'మహారాష్ట్ర', hindiLabel: 'महाराष्ट्र', value: 'Maharashtra' },
      { label: 'Tamil Nadu', teluguLabel: 'తమిళనాడు', hindiLabel: 'तमिलनाडु', value: 'Tamil Nadu' },
      { label: 'Delhi (NCT)', teluguLabel: 'ఢిల్లీ (NCT)', hindiLabel: 'दिल्ली (NCT)', value: 'Delhi' },
      { label: 'Uttar Pradesh', teluguLabel: 'ఉత్తరప్రదేశ్', hindiLabel: 'उत्तर प्रदेश', value: 'Uttar Pradesh' },
      { label: 'Bihar', teluguLabel: 'బీహార్', hindiLabel: 'बिहार', value: 'Bihar' },
      { label: 'Rajasthan', teluguLabel: 'రాజస్థాన్', hindiLabel: 'राजस्थान', value: 'Rajasthan' },
      { label: 'Madhya Pradesh', teluguLabel: 'మధ్యప్రదేశ్', hindiLabel: 'मध्य प्रदेश', value: 'Madhya Pradesh' },
      { label: 'West Bengal', teluguLabel: 'పశ్చిమ బెంగాల్', hindiLabel: 'पश्चिम बंगाल', value: 'West Bengal' },
      { label: 'Gujarat', teluguLabel: 'గుజరాత్', hindiLabel: 'गुजरात', value: 'Gujarat' },
      { label: 'Kerala', teluguLabel: 'కేరళ', hindiLabel: 'केरल', value: 'Kerala' },
      { label: 'Odisha', teluguLabel: 'ఒడిశా', hindiLabel: 'ओडिशा', value: 'Odisha' },
      { label: 'Punjab', teluguLabel: 'పంజాబ్', hindiLabel: 'पंजाब', value: 'Punjab' },
      { label: 'Haryana', teluguLabel: 'హర్యానా', hindiLabel: 'हरियाणा', value: 'Haryana' },
      { label: 'Assam', teluguLabel: 'అసోం', hindiLabel: 'असम', value: 'Assam' },
      { label: 'Chhattisgarh', teluguLabel: 'ఛత్తీస్‌గఢ్', hindiLabel: 'छत्तीसगढ़', value: 'Chhattisgarh' },
      { label: 'Jharkhand', teluguLabel: 'జార్ఖండ్', hindiLabel: 'झारखंड', value: 'Jharkhand' },
      { label: 'Uttarakhand', teluguLabel: 'ఉత్తరాఖండ్', hindiLabel: 'उत्तराखंड', value: 'Uttarakhand' },
      { label: 'Himachal Pradesh', teluguLabel: 'హిమాచల్ ప్రదేశ్', hindiLabel: 'हिमाचल प्रदेश', value: 'Himachal Pradesh' },
      { label: 'Jammu and Kashmir', teluguLabel: 'జమ్ము & కాశ్మీర్', hindiLabel: 'जम्मू और कश्मीर', value: 'Jammu and Kashmir' },
      { label: 'Goa', teluguLabel: 'గోవా', hindiLabel: 'गोवा', value: 'Goa' },
      { label: 'Tripura', teluguLabel: 'త్రిపుర', hindiLabel: 'त्रिपुरा', value: 'Tripura' },
      { label: 'Puducherry', teluguLabel: 'పుదుచ్చేరి', hindiLabel: 'पुडुचेरी', value: 'Puducherry' },
      { label: 'Manipur', teluguLabel: 'మణిపూర్', hindiLabel: 'मणिपुर', value: 'Manipur' },
      { label: 'Meghalaya', teluguLabel: 'మేఘాలయ', hindiLabel: 'मेघालय', value: 'Meghalaya' },
      { label: 'Nagaland', teluguLabel: 'నాగాలాండ్', hindiLabel: 'नागालैंड', value: 'Nagaland' },
      { label: 'Mizoram', teluguLabel: 'మిజోరం', hindiLabel: 'मिजोरम', value: 'Mizoram' },
      { label: 'Sikkim', teluguLabel: 'సిక్కిం', hindiLabel: 'सिक्किम', value: 'Sikkim' },
      { label: 'Arunachal Pradesh', teluguLabel: 'అరుణాచల్ ప్రదేశ్', hindiLabel: 'अरुणाचल प्रदेश', value: 'Arunachal Pradesh' },
      { label: 'Ladakh', teluguLabel: 'లడఖ్', hindiLabel: 'लद्दाख', value: 'Ladakh' },
      { label: 'Other State / Union Territory', teluguLabel: 'ఇతర రాష్ట్రం / కేంద్రపాలిత ప్రాంతం', hindiLabel: 'अन्य राज्य / केंद्र शासित प्रदेश', value: 'Other' },
    ],
  },
  // 2. Occupation & Role (Foundational branching trigger)
  {
    id: 'occupation',
    category: 'Role & Vocation',
    questionText: 'What is your primary occupation or current status?',
    teluguQuestionText: 'మీ ప్రధాన వృత్తి లేదా ప్రస్తుత స్థితి ఏమిటి?',
    hindiQuestionText: 'आपका मुख्य व्यवसाय या वर्तमान स्थिति क्या है?',
    whyWeAskThis: 'Government schemes target specific beneficiary roles: Farmers (PM-KISAN), Artisans (PM Vishwakarma), Street Vendors (PM SVANidhi), Students (Scholarships), and Senior Citizens.',
    type: 'select',
    options: [
      { label: 'Student (College / Polytechnic / School)', teluguLabel: 'విద్యార్థి (కళాశాల / పాలిటెక్నిక్ / పాఠశాల)', hindiLabel: 'छात्र (कॉलेज / पॉलिटेक्निक / स्कूल)', value: 'student' },
      { label: 'Farmer / Agricultural Cultivator', teluguLabel: 'రైతు / వ్యవసాయదారుడు', hindiLabel: 'किसान / कृषि कृषक', value: 'farmer' },
      { label: 'Artisan / Traditional Craftsperson (18 Trades)', teluguLabel: 'చేతివృత్తుల కళాకారుడు (విశ్వకర్మ)', hindiLabel: 'कारीगर / पारंपरिक शिल्पकार (18 व्यवसाय)', value: 'artisan_craftsperson' },
      { label: 'Street Vendor / Micro-Business Operator', teluguLabel: 'వీధి వ్యాపారి / చిన్న దుకాణదారుడు', hindiLabel: 'स्ट्रीट वेंडर / छोटा व्यापारी', value: 'street_vendor' },
      { label: 'Unorganized / Daily Wage / Construction Worker', teluguLabel: 'అసంఘటిత / రోజువారీ వేతన కార్మికుడు', hindiLabel: 'असंगठित / दैनिक वेतन श्रमिक', value: 'unorganized_worker' },
      { label: 'Homemaker / Mother', teluguLabel: 'గృహిణి / తల్లి', hindiLabel: 'गृहिणी / माता', value: 'homemaker' },
      { label: 'Senior Citizen / Pensioner (60+ years)', teluguLabel: 'సీనియర్ సిటిజన్ / పెన్షనర్ (60+ సంవత్సరాలు)', hindiLabel: 'वरिष्ठ नागरिक / पेंशनभोगी (60+ वर्ष)', value: 'senior_citizen' },
      { label: 'Salaried Employee / Job Seeker', teluguLabel: 'వేతన ఉద్యోగి / ఉద్యోగార్ధి', hindiLabel: 'वेतनभोगी कर्मचारी / नौकरी चाहने वाले', value: 'salaried' },
    ],
  },
  // 3. Age
  {
    id: 'age',
    category: 'Basic Details',
    questionText: 'What is your current age in years?',
    teluguQuestionText: 'మీ ప్రస్తుత వయస్సు ఎంత?',
    hindiQuestionText: 'आपकी वर्तमान आयु कितने वर्ष है?',
    whyWeAskThis: 'Key national schemes have statutory age windows (e.g. Atal Pension Yojana 18-40, PM Shram Yogi Maandhan 18-40, Old Age Pension 60+, Sukanya Samriddhi girl child <10).',
    type: 'number',
    placeholder: 'e.g. 21',
    min: 0,
    max: 120,
    step: 1,
    options: [
      { label: '18 - 25 years (Youth / College Student)', teluguLabel: '18 - 25 సంవత్సరాలు (యువత / విద్యార్థి)', hindiLabel: '18 - 25 वर्ष (युवा / कॉलेज छात्र)', value: 20 },
      { label: '26 - 40 years (Working Age / Social Security)', teluguLabel: '26 - 40 సంవత్సరాలు (పనిచేసే వయస్సు)', hindiLabel: '26 - 40 वर्ष (कार्यशील आयु)', value: 32 },
      { label: '41 - 59 years (Middle Age / Livelihood)', teluguLabel: '41 - 59 సంవత్సరాలు (మధ్య వయస్సు)', hindiLabel: '41 - 59 वर्ष (मध्यम आयु)', value: 48 },
      { label: '60+ years (Senior Citizen / Pension)', teluguLabel: '60+ సంవత్సరాలు (వృద్ధాప్యం / పెన్షన్)', hindiLabel: '60+ वर्ष (वरिष्ठ नागरिक / पेंशन)', value: 65 },
    ],
  },
  // 4. Locality
  {
    id: 'areaType',
    category: 'Location',
    questionText: 'Do you reside in a rural village or urban city/town?',
    teluguQuestionText: 'మీరు గ్రామీణ పంచాయతీలో నివసిస్తున్నారా లేదా పట్టణంలోనా?',
    hindiQuestionText: 'क्या आप ग्रामीण गांव में रहते हैं या शहरी शहर/कस्बे में?',
    whyWeAskThis: 'Schemes like PMAY-Gramin and MGNREGA operate exclusively in rural panchayats, while PM SVANidhi focuses on urban town vending.',
    type: 'select',
    options: [
      { label: 'Rural (Gram Panchayat / Village)', teluguLabel: 'గ్రామీణ (గ్రామ పంచాయతీ / పల్లె)', hindiLabel: 'ग्रामीण (ग्राम पंचायत / गांव)', value: 'rural' },
      { label: 'Urban (Municipality / Municipal Corporation / City)', teluguLabel: 'పట్టణ (మున్సిపాలిటీ / కార్పొరేషన్ / నగరం)', hindiLabel: 'शहरी (नगर पालिका / नगर निगम / शहर)', value: 'urban' },
    ],
  },
  // 5. Ration Card / Economic Tier
  {
    id: 'rationCardType',
    category: 'Economic Tier',
    questionText: 'Which ration card / economic classification does your family hold?',
    teluguQuestionText: 'మీ కుటుంబానికి ఏ రకమైన రేషన్ కార్డు ఉంది?',
    hindiQuestionText: 'आपके परिवार के पास किस प्रकार का राशन कार्ड है?',
    whyWeAskThis: 'White Ration Card (BPL) or Antyodaya (AAY) confers instant statutory eligibility across state food security, healthcare, and housing schemes.',
    type: 'select',
    options: [
      { label: 'White Ration Card / Food Security Card (BPL)', teluguLabel: 'తెల్ల రేషన్ కార్డు / BPL ఆహార భద్రత కార్డు', hindiLabel: 'सफेद राशन कार्ड / खाद्य सुरक्षा कार्ड (BPL)', value: 'white_bpl' },
      { label: 'Antyodaya Anna Yojana (AAY / Poorest of Poor)', teluguLabel: 'అంత్యోదయ అన్న యోజన (AAY)', hindiLabel: 'अंत्योदय अन्न योजना (AAY / अति निर्धन)', value: 'antyodaya_aay' },
      { label: 'Pink Ration Card / Non-Priority (APL)', teluguLabel: 'పింక్ రేషన్ కార్డు (APL)', hindiLabel: 'गुलाबी राशन कार्ड (APL)', value: 'pink_apl' },
      { label: 'No Ration Card currently', teluguLabel: 'ప్రస్తుతం రేషన్ కార్డు లేదు', hindiLabel: 'वर्तमान में कोई राशन कार्ड नहीं', value: 'none' },
    ],
  },

  // --- BRANCH: Student Specific Questions ---
  {
    id: 'educationLevel',
    category: 'Education',
    questionText: 'What is your current level of education?',
    teluguQuestionText: 'మీ ప్రస్తుత విద్యా స్థాయి ఏమిటి?',
    hindiQuestionText: 'आपका वर्तमान शिक्षा स्तर क्या है?',
    whyWeAskThis: 'Most scholarships are specific to school, post-matric, degree (B.Tech/B.Sc), diploma, or intermediate education.',
    type: 'select',
    condition: (p) => p.occupation === 'student',
    options: [
      { label: 'School (Class 1 to 10 / Pre-Matric)', teluguLabel: 'పాఠశాల (1 నుండి 10వ తరగతి / ప్రీ-మెట్రిక్)', hindiLabel: 'स्कूल (कक्षा 1 से 10 / प्री-मैट्रिक)', value: 'school' },
      { label: 'Intermediate / Class 11-12 (+2)', teluguLabel: 'ఇంటర్మీడియట్ / 11-12వ తరగతి (+2)', hindiLabel: 'इंटरमीडिएट / कक्षा 11-12 (+2)', value: 'intermediate' },
      { label: 'Diploma / Polytechnic', teluguLabel: 'డిప్లొమా / పాలిటెక్నిక్', hindiLabel: 'डिप्लोमा / पॉलिटेक्निक', value: 'diploma' },
      { label: 'Undergraduate / College (B.Tech, B.Sc, B.Com, MBBS, etc.)', teluguLabel: 'డిగ్రీ / కళాశాల (B.Tech, B.Sc, B.Com మొదలైనవి)', hindiLabel: 'स्नातक / कॉलेज (बी.टेक, बी.एससी, बी.कॉम आदि)', value: 'undergraduate' },
      { label: 'Postgraduate (M.Tech, M.Sc, MBA, etc.)', teluguLabel: 'పోస్ట్ గ్రాడ్యుయేట్ (M.Tech, M.Sc, MBA)', hindiLabel: 'स्नातकोत्तर (एम.टेक, एम.एससी, एमबीए आदि)', value: 'postgraduate' },
    ],
  },
  {
    id: 'courseStream',
    category: 'Education',
    condition: (p) => p.occupation === 'student' && p.educationLevel !== 'school',
    questionText: (p) => {
      if (p.educationLevel === 'intermediate') return 'What stream or group are you studying in Intermediate / +2?';
      if (p.educationLevel === 'diploma') return 'What branch is your diploma / polytechnic program?';
      if (p.educationLevel === 'postgraduate') return 'What specialization or degree is your postgraduate course?';
      return 'What stream is your undergraduate / college course?';
    },
    teluguQuestionText: (p) => {
      if (p.educationLevel === 'intermediate') return 'ఇంటర్మీడియట్ / +2 లో మీ గ్రూప్ లేదా స్ట్రీమ్ ఏమిటి?';
      if (p.educationLevel === 'diploma') return 'మీ పాలిటెక్నిక్ డిప్లొమా బ్రాంచ్ ఏమిటి?';
      if (p.educationLevel === 'postgraduate') return 'మీ పోస్ట్ గ్రాడ్యుయేట్ కోర్సు విభాగం ఏమిటి?';
      return 'మీ డిగ్రీ / కళాశాల కోర్సు ఏ విభాగానికి చెందినది?';
    },
    hindiQuestionText: (p) => {
      if (p.educationLevel === 'intermediate') return 'इंटरमीडिएट / 11वीं-12वीं में आपका स्ट्रीम या ग्रुप क्या है?';
      if (p.educationLevel === 'diploma') return 'आपका पॉलिटेक्निक डिप्लोमा किस ब्रांच का है?';
      if (p.educationLevel === 'postgraduate') return 'आपका स्नातकोत्तर (पीजी) पाठ्यक्रम किस संकाय का है?';
      return 'आपका कॉलेज / स्नातक पाठ्यक्रम किस स्ट्रीम का है?';
    },
    whyWeAskThis: 'Scholarships like AICTE Pragati, Saksham, and departmental post-matric awards are specific to stream or branch.',
    type: 'select',
    options: (p) => {
      if (p.educationLevel === 'intermediate') {
        return [
          { label: 'MPC (Mathematics, Physics, Chemistry)', teluguLabel: 'MPC (గణితం, భౌతిక, రసాయన శాస్త్రాలు)', hindiLabel: 'MPC (गणित, भौतिकी, रसायन विज्ञान)', value: 'intermediate_mpc' },
          { label: 'BiPC (Biology, Physics, Chemistry)', teluguLabel: 'BiPC (బయాలజీ, భౌతిక, రసాయన శాస్త్రాలు)', hindiLabel: 'BiPC (जीव विज्ञान, भौतिकी, रसायन विज्ञान)', value: 'intermediate_bipc' },
          { label: 'MEC / CEC (Commerce, Economics, Civics)', teluguLabel: 'MEC / CEC (కామర్స్, ఎకనామిక్స్)', hindiLabel: 'MEC / CEC (वाणिज्य, अर्थशास्त्र)', value: 'intermediate_commerce' },
          { label: 'HEC / Arts / Humanities', teluguLabel: 'HEC / ఆర్ట్స్ / హ్యుమానిటీస్', hindiLabel: 'HEC / कला / मानविकी', value: 'intermediate_arts' },
          { label: 'Vocational / Technical Stream', teluguLabel: 'వొకేషనల్ / సాంకేతిక విభాగం', hindiLabel: 'व्यावसायिक / तकनीकी स्ट्रीम', value: 'intermediate_vocational' },
        ];
      }
      if (p.educationLevel === 'diploma') {
        return [
          { label: 'Engineering / Technical Polytechnic Diploma', teluguLabel: 'ఇంజనీరింగ్ / సాంకేతిక పాలిటెక్నిక్ డిప్లొమా', hindiLabel: 'इंजीनियरिंग / तकनीकी पॉलिटेक्निक डिप्लोमा', value: 'technical_diploma' },
          { label: 'Pharmacy Diploma (D.Pharm)', teluguLabel: 'ఫార్మసీ డిప్లొమా (D.Pharm)', hindiLabel: 'फार्मेसी डिप्लोमा (डी.फार्मा)', value: 'pharmacy' },
          { label: 'ITI / Trade Certificate', teluguLabel: 'ITI / ట్రేడ్ సర్టిఫికేట్', hindiLabel: 'आईटीआई / ट्रेड सर्टिफिकेट', value: 'iti_trade' },
          { label: 'Other Diploma', teluguLabel: 'ఇతర డిప్లొమా', hindiLabel: 'अन्य डिप्लोमा', value: 'general' },
        ];
      }
      if (p.educationLevel === 'postgraduate') {
        return [
          { label: 'M.Tech / M.E / MS (Technology)', teluguLabel: 'M.Tech / M.E / MS (సాంకేతిక)', hindiLabel: 'एम.टेक / एम.ई (प्रौद्योगिकी)', value: 'engineering' },
          { label: 'MBA / Management / PGDM', teluguLabel: 'MBA / మేనేజ్మెంట్', hindiLabel: 'एमबीए / प्रबंधन', value: 'management' },
          { label: 'MCA / Computer Applications', teluguLabel: 'MCA / కంప్యూటర్ అప్లికేషన్స్', hindiLabel: 'एमसीए / कंप्यूटर अनुप्रयोग', value: 'engineering' },
          { label: 'M.Sc (Sciences)', teluguLabel: 'M.Sc (సైన్స్)', hindiLabel: 'एम.एससी (विज्ञान)', value: 'degree_arts_science' },
          { label: 'M.Pharm (Pharmacy)', teluguLabel: 'M.Pharm (ఫార్మసీ)', hindiLabel: 'एम.फार्मा (फार्मेसी)', value: 'pharmacy' },
          { label: 'M.A / M.Com / Arts', teluguLabel: 'M.A / M.Com (కళలు / వాణిజ్యం)', hindiLabel: 'एम.ए / एम.कॉम', value: 'degree_arts_science' },
          { label: 'Ph.D / Doctoral Research', teluguLabel: 'Ph.D / పరిశోధన', hindiLabel: 'पीएच.डी / शोध', value: 'doctorate' },
        ];
      }
      // Undergraduate (default)
      return [
        { label: 'Engineering / Technology (B.Tech / B.E)', teluguLabel: 'ఇంజనీరింగ్ / టెక్నాలజీ (B.Tech / B.E)', hindiLabel: 'इंजीनियरिंग / प्रौद्योगिकी (बी.टेक / बी.ई)', value: 'engineering' },
        { label: 'Degree (B.Sc, B.Com, B.A)', teluguLabel: 'డిగ్రీ (B.Sc, B.Com, B.A)', hindiLabel: 'डिग्री (बी.एससी, बी.कॉम, बी.ए)', value: 'degree_arts_science' },
        { label: 'Pharmacy (B.Pharm)', teluguLabel: 'ఫార్మసీ (B.Pharm)', hindiLabel: 'फार्मेसी (बी.फार्मा)', value: 'pharmacy' },
        { label: 'Medical / Dental / Nursing / Allied Health', teluguLabel: 'మెడికల్ / డెంటల్ / నర్సింగ్', hindiLabel: 'चिकित्सा / नर्सिंग / स्वास्थ्य', value: 'medical' },
        { label: 'Law / Agriculture / Architecture', teluguLabel: 'లా / అగ్రికల్చర్ / ఆర్కిటెక్చర్', hindiLabel: 'विधि / कृषि / वास्तुकला', value: 'professional_other' },
        { label: 'General / Other Undergraduate', teluguLabel: 'సాధారణ / ఇతర గ్రాడ్యుయేట్', hindiLabel: 'सामान्य / अन्य स्नातक', value: 'general' },
      ];
    },
  },
  {
    id: 'attendancePercentage',
    category: 'Academic Details',
    condition: (p) => p.occupation === 'student' && p.educationLevel !== 'school',
    questionText: (p) => p.educationLevel === 'intermediate'
      ? 'What is your certified Junior College attendance percentage?'
      : 'What is your certified college attendance percentage?',
    teluguQuestionText: (p) => p.educationLevel === 'intermediate'
      ? 'మీ జూనియర్ కళాశాల హాజరు శాతం ఎంత?'
      : 'మీ కళాశాల హాజరు శాతం ఎంత?',
    hindiQuestionText: (p) => p.educationLevel === 'intermediate'
      ? 'आपकी जूनियर कॉलेज प्रमाणित उपस्थिति कितने प्रतिशत है?'
      : 'आपकी प्रमाणित कॉलेज उपस्थिति कितने प्रतिशत है?',
    whyWeAskThis: 'Scholarships like ePASS and merit schemes mandate minimum attendance certified by the Principal to release tuition and fee waivers.',
    type: 'number',
    placeholder: 'e.g. 80',
    min: 0,
    max: 100,
    step: 1,
    options: [
      { label: '75% or higher (Meets requirement)', teluguLabel: '75% లేదా అంతకంటే ఎక్కువ (అర్హత ఉంది)', hindiLabel: '75% या अधिक (आवश्यकता पूरी)', value: 80 },
      { label: 'Below 75%', teluguLabel: '75% కంటే తక్కువ', hindiLabel: '75% से कम', value: 65 },
    ],
  },
  {
    id: 'twelfthPercentile',
    category: 'Academic Details',
    condition: (p) => p.occupation === 'student' && p.educationLevel === 'undergraduate',
    questionText: 'Did you score in the top 20th percentile (80th percentile+) in Class 12 / Intermediate?',
    teluguQuestionText: 'ఇంటర్మీడియట్ బోర్డులో టాప్ 20 పర్సంటైల్ సాధించారా?',
    hindiQuestionText: 'क्या आपने 12वीं कक्षा में शीर्ष 20 पर्सेंटाइल प्राप्त किए?',
    whyWeAskThis: 'The Central Sector Scheme (CSSS) requires scoring above the 80th percentile cutoff of the relevant State/Central Board.',
    type: 'number',
    placeholder: 'e.g. 85',
    min: 0,
    max: 100,
    step: 1,
    options: [
      { label: 'Yes, top percentile (> 80 percentile / 90%+ marks)', teluguLabel: 'అవును, టాప్ పర్సంటైల్ (> 80 పర్సంటైల్)', hindiLabel: 'हाँ, शीर्ष पर्सेंटाइल (> 80 पर्सेंटाइल)', value: 85 },
      { label: 'No / Average score', teluguLabel: 'లేదు / సాధారణ మార్కులు', hindiLabel: 'नहीं / औसत अंक', value: 65 },
    ],
  },

  // --- BRANCH: Farmer Specific Questions ---
  {
    id: 'isAgriculturalLandholder',
    category: 'Agriculture & Land',
    questionText: 'Do you or your family own cultivable agricultural land?',
    teluguQuestionText: 'మీకు లేదా మీ కుటుంబానికి సాగు భూమి ఉందా?',
    hindiQuestionText: 'क्या आपके या आपके परिवार के पास कृषि योग्य भूमि है?',
    whyWeAskThis: 'PM-KISAN and state farmer investment support schemes require cultivable land ownership recorded in revenue records (Pattadar Passbook).',
    type: 'boolean',
    condition: (p) => p.occupation === 'farmer',
    options: [
      { label: 'Yes, we own cultivable land (Pattadar)', teluguLabel: 'అవును, మాకు సాగు భూమి ఉంది (పట్టాదారు)', hindiLabel: 'हाँ, हमारे पास कृषि भूमि है (पट्टेदार)', value: true },
      { label: 'No / Landless tenant or farm worker', teluguLabel: 'లేదు / భూమిలేని కౌలురైతు లేదా కూలీ', hindiLabel: 'नहीं / भूमिहीन किसान या खेतिहर मजदूर', value: false },
    ],
  },
  {
    id: 'landholdingHectares',
    category: 'Agriculture & Land',
    questionText: 'What is the approximate size of your cultivable landholding?',
    teluguQuestionText: 'మీ సాగు భూమి విస్తీర్ణం ఎంత?',
    hindiQuestionText: 'आपकी कृषि भूमि का क्षेत्रफल कितना है?',
    whyWeAskThis: 'Small and marginal farmers (holding under 2 hectares / ~5 acres) receive preferential financial assistance and full subsidies under central and state farmer schemes.',
    type: 'number',
    placeholder: 'e.g. 1.5 (hectares)',
    min: 0,
    max: 500,
    step: '0.1',
    condition: (p) => p.occupation === 'farmer' && p.isAgriculturalLandholder === true,
    options: [
      { label: 'Under 1 Hectare (< 2.5 Acres, Marginal)', teluguLabel: '1 హెక్టార్ లోపు (< 2.5 ఎకరాలు, సన్నకారు)', hindiLabel: '1 हेक्टेयर से कम (< 2.5 एकड़, सीमांत)', value: 0.8 },
      { label: '1 - 2 Hectares (2.5 - 5 Acres, Small)', teluguLabel: '1 - 2 హెక్టార్లు (2.5 - 5 ఎకరాలు, చిన్న రైతు)', hindiLabel: '1 - 2 हेक्टेयर (2.5 - 5 एकड़, लघु)', value: 1.8 },
      { label: 'Above 2 Hectares (> 5 Acres, Medium/Large)', teluguLabel: '2 హెక్టార్ల కంటే ఎక్కువ (> 5 ఎకరాలు, పెద్ద రైతు)', hindiLabel: '2 हेक्टेयर से अधिक (> 5 एकड़, मध्यम/बड़ा)', value: 3.5 },
    ],
  },

  // --- UNIVERSAL: Economic & Reservation Qualifiers ---
  {
    id: 'familyIncome',
    category: 'Financial',
    questionText: 'What is your total annual family income (from all sources)?',
    teluguQuestionText: 'మీ మొత్తం వార్షిక కుటుంబ ఆదాయం ఎంత?',
    hindiQuestionText: 'सभी स्रोतों से आपके परिवार की कुल वार्षिक आय कितनी है?',
    whyWeAskThis: 'Scholarships and welfare schemes have official income caps certified by revenue authorities (e.g. ₹2 Lakhs for post-matric, ₹4.5 Lakhs for CSSS, ₹8 Lakhs for AICTE).',
    type: 'number',
    placeholder: 'e.g. 150000 (₹ / year)',
    min: 0,
    step: 5000,
    options: [
      { label: 'Below ₹1,50,000 / year (Rural BC/EBC limit)', teluguLabel: '₹1,50,000 లోపు / సంవత్సరం (గ్రామీణ పరిమితి)', hindiLabel: '₹1,50,000 से कम / वर्ष (ग्रामीण सीमा)', value: 140000 },
      { label: 'Below ₹2,00,000 / year (SC/ST & Urban limit)', teluguLabel: '₹2,00,000 లోపు / సంవత్సరం (SC/ST & పట్టణ పరిమితి)', hindiLabel: '₹2,00,000 से कम / वर्ष (SC/ST व शहरी सीमा)', value: 190000 },
      { label: 'Below ₹4,50,000 / year (Central Sector CSSS limit)', teluguLabel: '₹4,50,000 లోపు / సంవత్సరం (కేంద్ర స్కాలర్‌షిప్ పరిమితి)', hindiLabel: '₹4,50,000 से कम / वर्ष (केंद्रीय छात्रवृत्ति सीमा)', value: 350000 },
      { label: 'Below ₹8,00,000 / year (AICTE Pragati limit)', teluguLabel: '₹8,00,000 లోపు / సంవత్సరం (AICTE ప్రగతి పరిమితి)', hindiLabel: '₹8,00,000 से कम / वर्ष (एआईसीटीई प्रगति सीमा)', value: 600000 },
      { label: 'Above ₹8,00,000 / year', teluguLabel: '₹8,00,000 కంటే ఎక్కువ / సంవత్సరం', hindiLabel: '₹8,00,000 से अधिक / वर्ष', value: 1000000 },
    ],
  },
  {
    id: 'socialCategory',
    category: 'Reservation & Category',
    questionText: 'What is your social / reservation category?',
    teluguQuestionText: 'మీ సామాజిక / రిజర్వేషన్ వర్గం ఏమిటి?',
    hindiQuestionText: 'आपकी सामाजिक / आरक्षण श्रेणी क्या है?',
    whyWeAskThis: 'Government welfare departments (SC, ST, BC, Minority) have dedicated reimbursement and grant funds with different statutory quotas.',
    type: 'select',
    options: [
      { label: 'SC (Scheduled Caste)', teluguLabel: 'ఎస్సీ (షెడ్యూల్డ్ కులం)', hindiLabel: 'अनुसूचित जाति (SC)', value: 'SC' },
      { label: 'ST (Scheduled Tribe)', teluguLabel: 'ఎస్టీ (షెడ్యూల్డ్ తెగ)', hindiLabel: 'अनुसूचित जनजाति (ST)', value: 'ST' },
      { label: 'BC-A', teluguLabel: 'బీసీ-ఎ (BC-A)', hindiLabel: 'ओबीसी-ए (BC-A)', value: 'BC-A' },
      { label: 'BC-B', teluguLabel: 'బీసీ-బి (BC-B)', hindiLabel: 'ओबीसी-बी (BC-B)', value: 'BC-B' },
      { label: 'BC-C', teluguLabel: 'బీసీ-సి (BC-C)', hindiLabel: 'ओबीसी-सी (BC-C)', value: 'BC-C' },
      { label: 'BC-D', teluguLabel: 'బీసీ-డి (BC-D)', hindiLabel: 'ओबीसी-డి (BC-D)', value: 'BC-D' },
      { label: 'BC-E', teluguLabel: 'బీసీ-ఇ (BC-E)', hindiLabel: 'ओबीसी-ई (BC-E)', value: 'BC-E' },
      { label: 'EBC (Economically Backward Class)', teluguLabel: 'ఈబీసీ (ఆర్థికంగా వెనుకబడిన వర్గం)', hindiLabel: 'ईबीसी (आर्थिक रूप से पिछड़ा वर्ग)', value: 'EBC' },
      { label: 'Minority (Muslim, Christian, Sikh, Jain, Buddhist)', teluguLabel: 'మైనారిటీ (ముస్లిం, క్రిస్టియన్, సిక్కు, జైన, బౌద్ధ)', hindiLabel: 'अल्पसंख्यक (मुस्लिम, ईसाई, सिख, जैन, बौद्ध)', value: 'Minority' },
      { label: 'General / OC', teluguLabel: 'జనరల్ / ఒసి', hindiLabel: 'सामान्य (General / OC)', value: 'General' },
    ],
  },
  {
    id: 'gender',
    category: 'Demographics',
    questionText: 'What is your gender?',
    teluguQuestionText: 'మీ లింగం ఏమిటి?',
    hindiQuestionText: 'आपका लिंग क्या है?',
    whyWeAskThis: 'Special affirmative schemes (like AICTE Pragati, Sukanya Samriddhi) provide dedicated funding exclusively for female beneficiaries.',
    type: 'select',
    options: [
      { label: 'Female', teluguLabel: 'మహిళ / స్త్రీ', hindiLabel: 'महिला', value: 'female' },
      { label: 'Male', teluguLabel: 'పురుషుడు', hindiLabel: 'पुरुष', value: 'male' },
      { label: 'Other', teluguLabel: 'ఇతర', hindiLabel: 'अन्य', value: 'other' },
    ],
  },
  {
    id: 'hasDisability',
    category: 'Inclusion & Disability',
    questionText: 'Do you have a certified physical disability (UDID 40%+)?',
    teluguQuestionText: 'మీకు దివ్యాంగ ధృవీకరణ పత్రం (40%+) ఉందా?',
    hindiQuestionText: 'क्या आपके पास प्रमाणित दिव्यांगता प्रमाण पत्र (40%+) है?',
    whyWeAskThis: 'AICTE Saksham, Divyangjan pensions, and Disabled Welfare schemes offer dedicated grants for citizens with benchmark disability.',
    type: 'boolean',
    options: [
      { label: 'Yes, 40% or more (UDID certified)', teluguLabel: 'అవును, 40% లేదా అంతకంటే ఎక్కువ (UDID ధృవీకరణ)', hindiLabel: 'हाँ, 40% या अधिक (UDID प्रमाणित)', value: true },
      { label: 'No', teluguLabel: 'లేదు', hindiLabel: 'नहीं', value: false },
    ],
  },
];

/**
 * Returns the active list of questions based on conditional profile branching rules.
 */
export function getActiveQuestions(profile: CitizenProfile): AdaptiveQuestion[] {
  return ADAPTIVE_QUESTIONS.filter((q) => {
    if (!q.condition) return true;
    return q.condition(profile);
  });
}

/**
 * 6 Synthetic Golden Demo Personas (FR-SEC-09, P5)
 * Test fixtures representing diverse citizen cohorts and benchmark cases across India.
 */
export const GOLDEN_PERSONAS: { name: string; description: string; profile: CitizenProfile }[] = [
  {
    name: 'Priya (B.Tech College Student)',
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
  {
    name: 'Ramesh (Small Farmer - PM-KISAN / Rythu Bharosa)',
    description: 'Small farmer in Nalgonda, Telangana with 2 acres cultivable land, income ₹1.1L, White Ration Card.',
    profile: {
      domicileState: 'Telangana',
      occupation: 'farmer',
      age: 44,
      areaType: 'rural',
      rationCardType: 'white_bpl',
      educationLevel: 'school',
      courseStream: null,
      socialCategory: 'BC-D',
      familyIncome: 110000,
      attendancePercentage: null,
      gender: 'male',
      hasDisability: false,
      twelfthPercentile: null,
      isAgriculturalLandholder: true,
      landholdingHectares: 0.81,
      isPregnantOrLactating: false,
    },
  },
  {
    name: 'Lakshmi (Street Vendor / Micro-Entrepreneur)',
    description: 'Urban street vendor in Warangal, BC-A category, family income ₹90k, eligible for PM SVANidhi microcredit.',
    profile: {
      domicileState: 'Telangana',
      occupation: 'street_vendor',
      age: 36,
      areaType: 'urban',
      rationCardType: 'white_bpl',
      educationLevel: 'school',
      courseStream: null,
      socialCategory: 'BC-A',
      familyIncome: 90000,
      attendancePercentage: null,
      gender: 'female',
      hasDisability: false,
      twelfthPercentile: null,
      isAgriculturalLandholder: false,
      landholdingHectares: 0,
      isPregnantOrLactating: false,
    },
  },
  {
    name: 'Koteshwar (Senior Citizen Pensioner)',
    description: '65-year-old rural resident seeking National Social Assistance / Aasara old age pension.',
    profile: {
      domicileState: 'Telangana',
      occupation: 'senior_citizen',
      age: 65,
      areaType: 'rural',
      rationCardType: 'white_bpl',
      educationLevel: null,
      courseStream: null,
      socialCategory: 'SC',
      familyIncome: 60000,
      attendancePercentage: null,
      gender: 'male',
      hasDisability: false,
      twelfthPercentile: null,
      isAgriculturalLandholder: false,
      landholdingHectares: 0,
      isPregnantOrLactating: false,
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
    safeText.includes('nalgonda') ||
    safeText.includes('khammam') ||
    safeText.includes('nizamabad') ||
    safeText.includes('karimnagar') ||
    safeText.includes('తెలంగాణ') ||
    safeText.includes('హైదరాబాద్') ||
    safeText.includes('వరంగల్') ||
    safeText.includes('నల్లగొండ') ||
    safeText.includes('ఖమ్మం') ||
    safeText.includes('నిజామాబాద్') ||
    safeText.includes('కరీంనగర్')
  ) {
    profile.domicileState = 'Telangana';
    extracted.push('domicileState');
  } else if (safeText.includes('andhra') || safeText.includes('ఆంధ్ర') || safeText.includes('విజయవాడ') || safeText.includes('విశాఖ')) {
    profile.domicileState = 'Andhra Pradesh';
    extracted.push('domicileState');
  } else if (safeText.includes('karnataka') || safeText.includes('bengaluru') || safeText.includes('కర్ణాటక')) {
    profile.domicileState = 'Karnataka';
    extracted.push('domicileState');
  } else if (safeText.includes('maharashtra') || safeText.includes('mumbai') || safeText.includes('pune') || safeText.includes('महाराष्ट्र')) {
    profile.domicileState = 'Maharashtra';
    extracted.push('domicileState');
  } else if (safeText.includes('uttar pradesh') || safeText.includes('lucknow') || safeText.includes('kanpur') || safeText.includes('उत्तर प्रदेश')) {
    profile.domicileState = 'Uttar Pradesh';
    extracted.push('domicileState');
  } else if (safeText.includes('tamil nadu') || safeText.includes('chennai') || safeText.includes('தமிழ்நாடு')) {
    profile.domicileState = 'Tamil Nadu';
    extracted.push('domicileState');
  } else if (safeText.includes('west bengal') || safeText.includes('kolkata') || safeText.includes('পশ্চিমবঙ্গ')) {
    profile.domicileState = 'West Bengal';
    extracted.push('domicileState');
  } else if (safeText.includes('bihar') || safeText.includes('patna') || safeText.includes('बिहार')) {
    profile.domicileState = 'Bihar';
    extracted.push('domicileState');
  } else if (safeText.includes('rajasthan') || safeText.includes('jaipur') || safeText.includes('राजस्थान')) {
    profile.domicileState = 'Rajasthan';
    extracted.push('domicileState');
  } else if (safeText.includes('madhya pradesh') || safeText.includes('bhopal') || safeText.includes('indore') || safeText.includes('मध्य प्रदेश')) {
    profile.domicileState = 'Madhya Pradesh';
    extracted.push('domicileState');
  } else if (safeText.includes('gujarat') || safeText.includes('ahmedabad') || safeText.includes('ગુજરાત')) {
    profile.domicileState = 'Gujarat';
    extracted.push('domicileState');
  } else if (safeText.includes('kerala') || safeText.includes('kochi') || safeText.includes('കേരളം')) {
    profile.domicileState = 'Kerala';
    extracted.push('domicileState');
  } else if (safeText.includes('delhi') || safeText.includes('दिल्ली')) {
    profile.domicileState = 'Delhi';
    extracted.push('domicileState');
  } else if (safeText.includes('punjab') || safeText.includes('ਪੰਜਾਬ')) {
    profile.domicileState = 'Punjab';
    extracted.push('domicileState');
  } else if (safeText.includes('odisha') || safeText.includes('ଓଡ଼ିଶా')) {
    profile.domicileState = 'Odisha';
    extracted.push('domicileState');
  }

  // 2. Education Level & Course Stream
  if (safeText.includes('btech') || safeText.includes('b.tech') || safeText.includes('engineering') || safeText.includes('ఇంజనీరింగ్')) {
    profile.educationLevel = 'undergraduate';
    profile.courseStream = 'engineering';
    extracted.push('educationLevel', 'courseStream');
  } else if (safeText.includes('degree') || safeText.includes('bsc') || safeText.includes('b.sc') || safeText.includes('bcom') || safeText.includes('college') || safeText.includes('డిగ్రీ') || safeText.includes('కళాశాల')) {
    profile.educationLevel = 'undergraduate';
    profile.courseStream = 'degree_arts_science';
    extracted.push('educationLevel', 'courseStream');
  } else if (safeText.includes('intermediate') || safeText.includes('inter') || safeText.includes('12th') || safeText.includes('ఇంటర్')) {
    profile.educationLevel = 'intermediate';
    extracted.push('educationLevel');
    if (safeText.includes('mpc')) {
      profile.courseStream = 'intermediate_mpc';
      extracted.push('courseStream');
    } else if (safeText.includes('bipc')) {
      profile.courseStream = 'intermediate_bipc';
      extracted.push('courseStream');
    } else if (safeText.includes('mec') || safeText.includes('cec')) {
      profile.courseStream = 'intermediate_commerce';
      extracted.push('courseStream');
    }
  } else if (safeText.includes('diploma') || safeText.includes('polytechnic') || safeText.includes('డిప్లొమా')) {
    profile.educationLevel = 'diploma';
    profile.courseStream = 'technical_diploma';
    extracted.push('educationLevel', 'courseStream');
  } else if (safeText.includes('school') || safeText.includes('class 10') || safeText.includes('10th') || safeText.includes('పాఠశాల') || safeText.includes('పదో తరగతి') || safeText.includes('स्कूल')) {
    profile.educationLevel = 'school';
    extracted.push('educationLevel');
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

  // 4. Income patterns (e.g. "1.5 lakh", "150000", "2 lakhs", "లక్ష", "ఒక లక్ష", "एक लाख")
  let lakhVal: number | null = null;
  const lakhMatch = safeText.match(/(\d+(?:\.\d+)?)\s*(?:lakh|lakhs|lac|లక్ష|लाख)/);
  if (lakhMatch) {
    lakhVal = parseFloat(lakhMatch[1]);
  } else if (/ఒక\s*లక్ష|एक\s*लाख|\bone\s*lakh\b/.test(safeText)) {
    lakhVal = 1;
  } else if (/రెండు\s*లక్ష|दो\s*लाख|\btwo\s*lakh\b/.test(safeText)) {
    lakhVal = 2;
  } else if (/మూడు\s*లక్ష|तीन\s*लाख|\bthree\s*lakh\b/.test(safeText)) {
    lakhVal = 3;
  }

  if (lakhVal !== null) {
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

  // 8. Occupation & Livelihood Role
  if (/\bfarmer\b|\bcultivator\b|\bagriculture\b|రైతు|వ్యవసాయం/.test(safeText)) {
    profile.occupation = 'farmer';
    profile.isAgriculturalLandholder = true;
    extracted.push('occupation', 'isAgriculturalLandholder');
  } else if (/\bvendor\b|\bstreet vendor\b|\bhawker\b|చిరువ్యాపారి|వ్యాపారి|బండి/.test(safeText)) {
    profile.occupation = 'street_vendor';
    extracted.push('occupation');
  } else if (/\bartisan\b|\bcraftsperson\b|\bweaver\b|\bcarpenter\b|చేతివృత్తులు|విశ్వకర్మ/.test(safeText)) {
    profile.occupation = 'artisan_craftsperson';
    extracted.push('occupation');
  } else if (/\bsenior citizen\b|\bpensioner\b|\bold age\b|వృద్ధాప్య|పెన్షన్/.test(safeText)) {
    profile.occupation = 'senior_citizen';
    extracted.push('occupation');
  } else if (profile.educationLevel !== null) {
    profile.occupation = 'student';
    extracted.push('occupation');
  }

  // 9. Age extraction
  const ageMatch = safeText.match(/\b([1-9]\d?)\s*(?:years?|yrs?|ఏళ్ల|సంవత్సరాల|age)\b/);
  if (ageMatch) {
    const ageVal = parseInt(ageMatch[1], 10);
    if (ageVal >= 5 && ageVal <= 110) {
      profile.age = ageVal;
      extracted.push('age');
    }
  }

  // 10. Area Type (Rural vs Urban)
  if (/\brural\b|\bvillage\b|\bpanchayat\b|గ్రామం|పల్లె|గ్రామీణ/.test(safeText)) {
    profile.areaType = 'rural';
    extracted.push('areaType');
  } else if (/\burban\b|\bcity\b|\btown\b|\bmunicipality\b|పట్టణం|నగరం/.test(safeText)) {
    profile.areaType = 'urban';
    extracted.push('areaType');
  }

  // 11. Ration Card / BPL Classification
  if (/\bwhite ration\b|\bbpl\b|\bfood security card\b|తెల్ల రేషన్|ఆహార భద్రత/.test(safeText)) {
    profile.rationCardType = 'white_bpl';
    extracted.push('rationCardType');
  } else if (/\bantyodaya\b|\baay\b|అంత్యోదయ/.test(safeText)) {
    profile.rationCardType = 'antyodaya_aay';
    extracted.push('rationCardType');
  }

  // 12. Landholding (Acres)
  const landMatch = safeText.match(/(\d+(?:\.\d+)?)\s*(?:acres?|acre|ఎకరాలు|ఎకరాల)/);
  if (landMatch) {
    const acres = parseFloat(landMatch[1]);
    profile.isAgriculturalLandholder = true;
    profile.landholdingHectares = Math.round(acres * 0.404686 * 100) / 100;
    extracted.push('isAgriculturalLandholder', 'landholdingHectares');
  }

  return {
    profile,
    extractedAttributes: Array.from(new Set(extracted)),
  };
}
