export type SupportedLanguage = 'en' | 'te' | 'hi';

export interface LanguageOption {
  code: SupportedLanguage;
  label: string;
  nativeName: string;
  flag: string;
}

export const SUPPORTED_LANGUAGES: LanguageOption[] = [
  { code: 'en', label: 'English', nativeName: 'English', flag: '🇮🇳' },
  { code: 'te', label: 'Telugu', nativeName: 'తెలుగు', flag: '🇮🇳' },
  { code: 'hi', label: 'Hindi', nativeName: 'हिन्दी', flag: '🇮🇳' },
];

export const TRANSLATIONS: Record<SupportedLanguage, Record<string, string>> = {
  en: {
    // Brand & Navigation
    'brand.name': 'LabhSaathi',
    'brand.tagline': "Claim What's Yours",
    'nav.intake': 'Intake',
    'nav.matches': 'Matches',
    'nav.checklist': 'Checklist',
    'nav.tracker': 'Tracker',
    'nav.admin': 'Admin review',
    'banner.top': 'ACE BUILDERS 2026 PS5: 219 Verified Government Schemes for Citizens across India',
    'banner.free': '100% Free Official Guidance',

    // Landing Page
    'landing.eyebrow': 'ACE BUILDERS 2026 • Problem Statement 5 (Citizens & Public Services)',
    'landing.title': 'LabhSaathi',
    'landing.subtitle': 'Know your benefits. Understand your rights.',
    'landing.highlight': "Claim what's yours.",
    'landing.lead':
      'An intelligent, source-grounded claim-readiness platform for citizens across India. Explain your circumstances in plain language or regional voice, discover published government schemes, understand missing conditions through deterministic 3-valued logic, and prepare documents without paying middlemen.',
    'landing.cta.start': 'Start Citizen Intake',
    'landing.cta.browse': 'Browse 219 Schemes Catalog',
    'landing.note':
      'Independent civic-tech guidance. Zero government determination or application fees. No Aadhaar numbers stored.',
    'landing.stats.schemes': 'Verified Public Schemes',
    'landing.stats.schemes.sub': '109 Central + 110 State across 32 States & UTs',
    'landing.stats.free': 'Zero Middlemen or Fees',
    'landing.stats.free.sub': 'Direct official government portal links only',
    'landing.stats.privacy': 'Sensitive-ID Shield',
    'landing.stats.privacy.sub': 'Never collects Aadhaar, PAN, or bank credentials',
    'landing.stats.logic': 'Deterministic Logic',
    'landing.stats.logic.sub': 'True, False, or Unknown — Zero AI hallucination',

    // AI & Voice Spotlight
    'landing.ai.badge': 'AI & Multilingual Voice Architecture',
    'landing.ai.title': 'Voice-First Civic Access Powered by Sarvam & Groq',
    'landing.ai.desc':
      'Designed specifically for rural and regional citizens. Eliminates long, confusing forms by pairing regional voice transcription with ultra-fast, source-grounded gazette reasoning.',
    'landing.ai.sarvam.title': 'Sarvam AI Voice Intake',
    'landing.ai.sarvam.desc':
      'Speak in Telugu, Hindi, Tamil, Kannada, Marathi, or English. Transcribes speech and auto-fills profile attributes in seconds.',
    'landing.ai.groq.title': 'Groq Scheme Q&A',
    'landing.ai.groq.desc':
      'Sub-second Llama 3.3 70B inference strictly grounded in official scheme gazettes. Zero hallucinations, zero middleman fees.',

    // Sectors
    'landing.sectors.eyebrow': 'Measured Criteria & Scope',
    'landing.sectors.title': '7 Public Benefit Sectors Evaluated',
    'landing.sectors.jurisdiction': 'All India & 32 State/UT Jurisdictions',

    // Journey
    'landing.journey.eyebrow': 'The Connected User Journey',
    'landing.journey.title': 'How a Citizen Navigates LabhSaathi',
    'landing.journey.desc': 'Step-by-step transparency from natural-language intake to application tracking.',
    'landing.step1.title': 'Natural Intake',
    'landing.step1.desc': 'Citizen types in Telugu/English or speaks via Sarvam Voice. Sensitive-ID Shield redacts raw Aadhaar/PAN.',
    'landing.step2.title': 'Adaptive Questions',
    'landing.step2.desc': 'Answer only what you know. Missing fields gracefully map to "Need to confirm" without failing evaluation.',
    'landing.step3.title': '3-Valued Matches',
    'landing.step3.desc': 'Rules engine labels schemes as Likely eligible, Need to confirm, or Unlikely. Near-matches show delta advice.',
    'landing.step4.title': 'Document Checklist',
    'landing.step4.desc': 'Personalised list of MeeSeva and revenue documents with issuing authorities and official portal links.',
    'landing.step5.title': 'What-If & Tracker',
    'landing.step5.desc': 'Interactive simulator lets citizens test hypothetical changes, with renewal calendar and safe share.',

    // Middleman Shield
    'landing.shield.badge': 'Middleman Shield • Protect Your Rights',
    'landing.shield.title': 'Zero Application Fees. Zero Agent Commission.',
    'landing.shield.point1': 'Official applications are 100% free: Applying on official portals incurs zero submission charges.',
    'landing.shield.point2': 'Never pay agents: Beware of touts or private cafes demanding cuts or promising guaranteed approvals.',
    'landing.shield.point3': 'Guidance, not determination: Final benefit determination rests solely with the competent government authority.',
    'landing.shield.cta': 'Test with Demo Personas',

    // Intake Page
    'intake.badge': 'Rule-Based Eligibility Intake',
    'intake.shield': 'Sensitive-ID Shield Active',
    'intake.title': 'Intake',
    'intake.lead':
      'Describe your situation in plain English or Telugu, use regional voice intake, or select a pre-verified citizen persona below. Zero Aadhaar or identity numbers collected.',
    'intake.personas.heading': '1-Click Verified Citizen Cohorts',
    'intake.personas.sub': 'Click to instantly populate realistic eligibility test cases',
    'intake.input.label': 'Tell us about your background and circumstances in your own words:',
    'intake.input.sub': 'Supports English & తెలుగు (Telugu script & transliteration)',
    'intake.input.placeholder':
      'e.g. I am a small farmer in Nalgonda with 2 acres of cultivable land and White Ration Card. Family income is around 1.1 Lakhs.',
    'intake.sample.label': 'Click a sample prompt to try:',
    'intake.btn.voice': 'Voice Intake (Sarvam AI)',
    'intake.btn.extract': 'Extract Attributes',
    'intake.shield.warning': 'Never type your Aadhaar number, PAN, or bank passwords.',
    'intake.q.heading': 'Adaptive Questionnaire & Profile Review',
    'intake.q.sub': 'Answer only what you know. Unknown values will gracefully map to "Need to confirm" without failing your evaluation.',
    'intake.reset': 'Reset to Telangana',
    'intake.why': 'Why we ask this',
    'intake.btn.find': 'Find Likely Schemes',

    // Matches Page
    'matches.badge': 'Verified Schemes Catalog',
    'matches.logic': 'Deterministic 3-Valued Logic',
    'matches.title': 'Matches',
    'matches.lead': 'Evaluating public schemes against your active profile. Zero AI hallucinations — only published official criteria.',
    'matches.btn.edit': 'Edit Profile',
    'matches.stat.total': 'Total Evaluated',
    'matches.stat.likely': 'Likely Eligible',
    'matches.stat.need': 'Need to Confirm',
    'matches.stat.saved': 'Saved in Tracker',
    'matches.filter.all_states': 'All India & States',
    'matches.filter.all_cats': 'All Categories',
    'matches.filter.search_ph': 'Search schemes by keyword, benefit, or criteria...',
    'matches.filter.include_unlikely': 'Include unlikely schemes',
    'matches.card.save': 'Save to Tracker',
    'matches.card.saved': 'Saved in Tracker',
    'matches.card.near_match': 'Near-Match Insight',
    'matches.card.view': 'View Scheme Details & Documents',

    // Scheme Detail Page
    'detail.back': 'Back to Matches',
    'detail.central': 'Central Scheme',
    'detail.state': 'State Benefit',
    'detail.verified': '100% Free Verified',
    'detail.save': 'Save to Tracker',
    'detail.saved': 'Saved in Tracker',
    'detail.share': 'Share on WhatsApp',
    'detail.action_graph': 'Unified Eligibility Action Graph',
    'detail.checklist.title': 'Personalised Document Readiness Checklist',
    'detail.checklist.sub': 'Mark acquired documents. Missing documents will not prevent you from viewing requirements.',
    'detail.steps.title': 'Step-by-Step Official Application Process',
    'detail.steps.sub': 'Verified from official government departmental guidelines. Follow in order.',
    'detail.whatif.title': 'What-If Simulation Radar',
    'detail.whatif.sub': 'Test hypothetical changes to your circumstances without altering your saved profile.',
    'detail.whatif.btn': 'Simulate Outcome',

    // Tracker & Checklist
    'tracker.title': 'Application & Claim Tracker',
    'tracker.sub': 'Manage your active benefits, track document completion, and monitor renewal deadlines.',
    'checklist.title': 'Consolidated Document Checklist',
    'checklist.sub': 'All verified documents required across your saved schemes, categorized by issuing authority.',
  },

  te: {
    // Brand & Navigation
    'brand.name': 'లాభసాథి',
    'brand.tagline': 'మీ హక్కులను పొందండి',
    'nav.intake': 'ఇన్టేక్',
    'nav.matches': 'పథకాలు',
    'nav.checklist': 'పత్రాల జాబితా',
    'nav.tracker': 'ట్రాకర్',
    'nav.admin': 'అడ్మిన్ సమీక్ష',
    'banner.top': 'ఏస్ బిల్డర్స్ 2026 PS5: భారతదేశ వ్యాప్తంగా పౌరుల కోసం 219 ధృవీకరించిన ప్రభుత్వ పథకాలు',
    'banner.free': '100% ఉచిత అధికారిక మార్గదర్శకత్వం',

    // Landing Page
    'landing.eyebrow': 'ఏస్ బిల్డర్స్ 2026 • సమస్య ప్రకటన 5 (పౌరులు మరియు ప్రజా సేవలు)',
    'landing.title': 'లాభసాథి',
    'landing.subtitle': 'మీ ప్రయోజనాలను తెలుసుకోండి. మీ హక్కులను అర్థం చేసుకోండి.',
    'landing.highlight': 'మీకు రావలసిన లబ్ధిని పొందండి.',
    'landing.lead':
      'భారతదేశ వ్యాప్తంగా పౌరుల కోసం మూలాల ఆధారిత ప్రభుత్వ పథకాల సంసిద్ధత వేదిక. మీ పరిస్థితిని సాధారణ భాషలో లేదా ప్రాంతీయ వాయిస్ ద్వారా వివరించండి, ప్రచురించిన ప్రభుత్వ పథకాలను కనుగొనండి, 3-విలువల లాజిక్ ద్వారా నిబంధనలను అర్థం చేసుకోండి మరియు దళారులు లేకుండా దరఖాస్తు చేసుకోండి.',
    'landing.cta.start': 'ఇన్టేక్ ప్రారంభించండి',
    'landing.cta.browse': '219 పథకాల జాబితాను చూడండి',
    'landing.note':
      'స్వతంత్ర పౌర సాంకేతిక మార్గదర్శకత్వం. ఎటువంటి ప్రభుత్వ రుసుములు లేదా అధికారిక నిర్ణయం కాదు. ఆధార్ నంబర్లు సేకరించబడవు.',
    'landing.stats.schemes': 'ధృవీకరించిన ప్రభుత్వ పథకాలు',
    'landing.stats.schemes.sub': '32 రాష్ట్రాలు మరియు కేంద్రపాలిత ప్రాంతాలలో 109 కేంద్ర + 110 రాష్ట్ర పథకాలు',
    'landing.stats.free': 'దళారులు మరియు ఫీజులు సున్నా',
    'landing.stats.free.sub': 'కేవలం అధికారిక ప్రభుత్వ పోర్టల్ లింకులు మాత్రమే',
    'landing.stats.privacy': 'సున్నిత-ఐడి రక్షణ కవచం',
    'landing.stats.privacy.sub': 'ఆధార్, పాన్ లేదా బ్యాంక్ వివరాలు ఎప్పటికీ సేకరించవు',
    'landing.stats.logic': 'నియమబద్ధమైన లాజిక్',
    'landing.stats.logic.sub': 'నిజం, అబద్ధం, లేదా తెలియదు — AI ఊహాజనిత భ్రమలు సున్నా',

    // AI & Voice Spotlight
    'landing.ai.badge': 'AI మరియు బహుభాషా వాయిస్ ఆర్కిటెక్చర్',
    'landing.ai.title': 'సర్వం మరియు గ్రోక్ ఆధారిత వాయిస్ పౌర సేవలు',
    'landing.ai.desc':
      'గ్రామీణ మరియు ప్రాంతీయ పౌరుల కోసం ప్రత్యేకంగా రూపొందించబడింది. పెద్ద పెద్ద ఫారాల అవసరం లేకుండా ప్రాంతీయ వాయిస్ ట్రాన్స్‌క్రిప్షన్ మరియు అధికారిక గెజిట్ సమాధానాలను అందిస్తుంది.',
    'landing.ai.sarvam.title': 'సర్వం AI వాయిస్ ఇన్టేక్',
    'landing.ai.sarvam.desc':
      'తెలుగు, హిందీ, తమిళం, కన్నడ, మరాఠీ లేదా ఇంగ్లీషులో మాట్లాడండి. సెకన్లలో మాటలను గుర్తించి ప్రొఫైల్ నింపుతుంది.',
    'landing.ai.groq.title': 'గ్రోక్ పథకం ప్రశ్నోత్తరాలు',
    'landing.ai.groq.desc':
      'అధికారిక గెజిట్ల ఆధారంగా లామా 3.3 70B ద్వారా సెకను లోపే వేగవంతమైన సమాధానాలు. దళారీల ఫీజుల రహితం.',

    // Sectors
    'landing.sectors.eyebrow': 'పరిశీలించే నిబంధనలు & పరిధి',
    'landing.sectors.title': '7 ప్రధాన ప్రజా ప్రయోజన రంగాలు',
    'landing.sectors.jurisdiction': 'భారతదేశం & 32 రాష్ట్రాల పరిధి',

    // Journey
    'landing.journey.eyebrow': 'అనుసంధాన పౌర ప్రయాణం',
    'landing.journey.title': 'లాభసాథిని పౌరులు ఎలా ఉపయోగించాలి',
    'landing.journey.desc': 'సహజ భాషా ఇన్టేక్ నుండి దరఖాస్తు ట్రాకింగ్ వరకు దశలవారీ పారదర్శకత.',
    'landing.step1.title': 'సహజ ఇన్టేక్',
    'landing.step1.desc': 'తెలుగు లేదా ఇంగ్లీషులో టైప్ చేయండి లేదా సర్వం వాయిస్ ద్వారా మాట్లాడండి. ఆధార్ నంబర్లను రక్షణ కవచం అడ్డుకుంటుంది.',
    'landing.step2.title': 'అనుకూల ప్రశ్నలు',
    'landing.step2.desc': 'మీకు తెలిసిన వివరాలు మాత్రమే చెప్పండి. తెలియని వివరాలు "ధృవీకరించాలి" అనే వర్గంలోకి మారతాయి.',
    'landing.step3.title': '3-విలువల ఫలితాలు',
    'landing.step3.desc': 'నిబంధనల ఇంజిన్ పథకాలను అర్హత ఉంది, ధృవీకరించాలి, లేదా అర్హత లేదు అని స్పష్టంగా వర్గీకరిస్తుంది.',
    'landing.step4.title': 'పత్రాల జాబితా',
    'landing.step4.desc': 'మీసేవ మరియు రెవెన్యూ పత్రాలు, జారీ చేసే అధికారులు మరియు అధికారిక పోర్టల్ లింకుల జాబితా.',
    'landing.step5.title': 'వాట్-ఇఫ్ & ట్రాకర్',
    'landing.step5.desc': 'ఆదాయం లేదా హాజరు మారితే అర్హత ఎలా మారుతుందో పరిశీలించండి మరియు రెన్యువల్ అలర్ట్‌లను పొందండి.',

    // Middleman Shield
    'landing.shield.badge': 'దళారుల రక్షణ కవచం • మీ హక్కులను కాపాడుకోండి',
    'landing.shield.title': 'దరఖాస్తు ఫీజు సున్నా. ఏజెంట్ కమిషన్ సున్నా.',
    'landing.shield.point1': 'అధికారిక దరఖాస్తులు 100% ఉచితం: ePASS, NSP, PM-KISAN పోర్టల్స్‌లో ఫీజు ఉండదు.',
    'landing.shield.point2': 'ఏజెంట్లకు డబ్బులు ఇవ్వవద్దు: గ్యారెంటీ ఇస్తామని డబ్బులు అడిగే దళారులను నమ్మవద్దు.',
    'landing.shield.point3': 'సలహా మాత్రమే, అధికారిక తీర్పు కాదు: లాభసాథి మార్గదర్శకత్వం మాత్రమే ఇస్తుంది; తుది నిర్ణయం ప్రభుత్వానిదే.',
    'landing.shield.cta': 'డెమో ప్రొఫైల్స్‌తో పరీక్షించండి',

    // Intake Page
    'intake.badge': 'నిబంధనల ఆధారిత అర్హత ఇన్టేక్',
    'intake.shield': 'సున్నిత-ఐడి రక్షణ కవచం సక్రియం',
    'intake.title': 'ఇన్టేక్',
    'intake.lead':
      'మీ పరిస్థితిని సాధారణ తెలుగు లేదా ఇంగ్లీషులో వివరించండి, వాయిస్ ద్వారా మాట్లాడండి లేదా కింద ఉన్న ధృవీకరించిన పౌర ప్రొఫైల్ ఎంచుకోండి. ఆధార్ నంబర్లు సేకరించబడవు.',
    'intake.personas.heading': '1-క్లిక్ ధృవీకరించిన పౌర సమూహాలు',
    'intake.personas.sub': 'తక్షణమే వాస్తవ అర్హత పరీక్షించడానికి క్లిక్ చేయండి',
    'intake.input.label': 'మీ పరిస్థితులను మీ స్వంత మాటల్లో చెప్పండి:',
    'intake.input.sub': 'ఇంగ్లీష్ & తెలుగు (తెలుగు లిపి మరియు ట్రాన్స్‌లిటరేషన్ మద్దతు ఉంది)',
    'intake.input.placeholder':
      'ఉదాహరణకు: నేను నల్లగొండ జిల్లాలో 2 ఎకరాల భూమి ఉన్న చిన్న రైతుని, తెల్ల రేషన్ కార్డు ఉంది, కుటుంబ ఆదాయం 1.1 లక్ష.',
    'intake.sample.label': 'నమూనా వాక్యాన్ని ఎంచుకోండి:',
    'intake.btn.voice': 'వాయిస్ ఇన్టేక్ (సర్వం AI)',
    'intake.btn.extract': 'వివరాలను గుర్తించండి',
    'intake.shield.warning': 'ఆధార్ నంబర్, పాన్ కార్డు లేదా బ్యాంక్ పాస్‌వర్డ్‌లను ఎప్పుడూ నమోదు చేయవద్దు.',
    'intake.q.heading': 'అనుకూల ప్రశ్నావళి & ప్రొఫైల్ సమీక్ష',
    'intake.q.sub': 'మీకు తెలిసిన వాటికి మాత్రమే సమాధానం ఇవ్వండి. తెలియనివి "ధృవీకరించాలి" అనే స్థితికి మారతాయి.',
    'intake.reset': 'తెలంగాణకు రీసెట్ చేయండి',
    'intake.why': 'మేము దీన్ని ఎందుకు అడుగుతున్నాం',
    'intake.btn.find': 'అర్హత ఉన్న పథకాలను కనుగొనండి',

    // Matches Page
    'matches.badge': 'ధృవీకరించిన పథకాల కేటలాగ్',
    'matches.logic': 'నియమబద్ధమైన 3-విలువల లాజిక్',
    'matches.title': 'పథకాలు',
    'matches.lead': 'మీ ప్రొఫైల్‌కు సరిపోయే ప్రభుత్వ పథకాల మూల్యాంకనం. తప్పుడు సమాచారం ఉండదు — కేవలం ప్రచురిత నిబంధనలు మాత్రమే.',
    'matches.btn.edit': 'ప్రొఫైల్ సవరించండి',
    'matches.stat.total': 'మొత్తం పరిశీలించినవి',
    'matches.stat.likely': 'అర్హత ఉండే అవకాశం ఉంది',
    'matches.stat.need': 'ధృవీకరించాల్సినవి',
    'matches.stat.saved': 'ట్రాకర్‌లో సేవ్ చేసినవి',
    'matches.filter.all_states': 'అన్ని రాష్ట్రాలు & కేంద్రం',
    'matches.filter.all_cats': 'అన్ని వర్గాలు',
    'matches.filter.search_ph': 'పథకం పేరు, లబ్ధి లేదా నిబంధనల ద్వారా శోధించండి...',
    'matches.filter.include_unlikely': 'అర్హత లేని పథకాలను కూడా చూపించు',
    'matches.card.save': 'ట్రాకర్‌లో సేవ్ చేయండి',
    'matches.card.saved': 'సేవ్ చేయబడింది',
    'matches.card.near_match': 'దగ్గరి అర్హత పరిశీలన',
    'matches.card.view': 'పథకం వివరాలు & పత్రాలు చూడండి',

    // Scheme Detail Page
    'detail.back': 'తిరిగి పథకాలకు వెళ్లండి',
    'detail.central': 'కేంద్ర ప్రభుత్వ పథకం',
    'detail.state': 'రాష్ట్ర ప్రభుత్వ లబ్ధి',
    'detail.verified': '100% ఉచిత ధృవీకరణ',
    'detail.save': 'ట్రాకర్‌లో సేవ్ చేయండి',
    'detail.saved': 'సేవ్ చేయబడింది',
    'detail.share': 'వాట్సాప్‌లో పంపండి',
    'detail.action_graph': 'అర్హత యాక్షన్ గ్రాఫ్',
    'detail.checklist.title': 'వ్యక్తిగత పత్రాల సంసిద్ధత జాబితా',
    'detail.checklist.sub': 'మీ వద్ద ఉన్న పత్రాలను గుర్తించండి. పత్రాలు లేకపోయినా నిబంధనలను పరిశీలించవచ్చు.',
    'detail.steps.title': 'దశలవారీ అధికారిక దరఖాస్తు విధానం',
    'detail.steps.sub': 'అధికారిక ప్రభుత్వ మార్గదర్శకాల ఆధారంగా రూపొందించబడింది. క్రమంలో అనుసరించండి.',
    'detail.whatif.title': 'వాట్-ఇఫ్ సిమ్యులేషన్ రాడార్',
    'detail.whatif.sub': 'మీ ఆదాయం లేదా వివరాలు మారితే అర్హత ఎలా మారుతుందో ఇక్కడ పరీక్షించండి.',
    'detail.whatif.btn': 'ఫలితాన్ని అంచనా వేయండి',

    // Tracker & Checklist
    'tracker.title': 'దరఖాస్తు & క్లెయిమ్ ట్రాకర్',
    'tracker.sub': 'మీ పథకాలను నిర్వహించండి, పత్రాల సేకరణను మరియు రెన్యువల్ గడువులను పర్యవేక్షించండి.',
    'checklist.title': 'సమగ్ర పత్రాల చెక్‌లిస్ట్',
    'checklist.sub': 'మీరు సేవ్ చేసిన అన్ని పథకాలకు అవసరమైన పత్రాలు, జారీ చేసే అధికారుల వివరాలతో.',
  },

  hi: {
    // Brand & Navigation
    'brand.name': 'लाभसाथी',
    'brand.tagline': 'अपने अधिकारों को प्राप्त करें',
    'nav.intake': 'इनटेक',
    'nav.matches': 'योजनाएं',
    'nav.checklist': 'दस्तावेज़ सूची',
    'nav.tracker': 'ट्रैकर',
    'nav.admin': 'प्रशासन समीक्षा',
    'banner.top': 'ऐस बिल्डर्स 2026 PS5: भारत भर के नागरिकों के लिए 219 सत्यापित सरकारी योजनाएं',
    'banner.free': '100% नि:शुल्क आधिकारिक मार्गदर्शन',

    // Landing Page
    'landing.eyebrow': 'ऐस बिल्डर्स 2026 • समस्या विवरण 5 (नागरिक और सार्वजनिक सेवाएं)',
    'landing.title': 'लाभसाथी',
    'landing.subtitle': 'अपने लाभ जानें। अपने अधिकार समझें।',
    'landing.highlight': 'जो आपका हक है, उसे पाएं।',
    'landing.lead':
      'भारत भर के नागरिकों के लिए आधिकारिक सरकारी योजनाओं की तैयारी का स्मार्ट मंच। अपनी स्थिति को सामान्य भाषा या क्षेत्रीय आवाज में बताएं, सरकारी योजनाओं को खोजें, 3-मान्य तर्क से पात्रता को समझें और बिना बिचौलियों के आवेदन करें।',
    'landing.cta.start': 'इनटेक शुरू करें',
    'landing.cta.browse': '219 योजनाओं की सूची देखें',
    'landing.note':
      'स्वतंत्र नागरिक मार्गदर्शन। यह कोई सरकारी निर्धारण या आवेदन शुल्क नहीं है। कोई आधार संख्या संग्रहीत नहीं की जाती।',
    'landing.stats.schemes': 'सत्यापित सरकारी योजनाएं',
    'landing.stats.schemes.sub': '32 राज्यों और केंद्र शासित प्रदेशों में 109 केंद्रीय + 110 राज्य योजनाएं',
    'landing.stats.free': 'शून्य बिचौलिया या फीस',
    'landing.stats.free.sub': 'केवल आधिकारिक सरकारी पोर्टल लिंक',
    'landing.stats.privacy': 'संवेदनशील-आईडी सुरक्षा कवच',
    'landing.stats.privacy.sub': 'आधार, पैन या बैंक विवरण कभी एकत्र नहीं करता',
    'landing.stats.logic': 'नियम-आधारित तर्क',
    'landing.stats.logic.sub': 'सत्य, असत्य, या अज्ञात — AI का शून्य मतिभ्रम',

    // AI & Voice Spotlight
    'landing.ai.badge': 'AI और बहुभाषी आवाज तकनीक',
    'landing.ai.title': 'सर्वम और ग्रोक द्वारा संचालित वॉइस एक्सेस',
    'landing.ai.desc':
      'ग्रामीण और क्षेत्रीय नागरिकों के लिए विशेष रूप से डिज़ाइन किया गया। लंबे और जटिल फॉर्म के बिना क्षेत्रीय आवाज पहचान और आधिकारिक नियमों के आधार पर त्वरित उत्तर प्रदान करता है।',
    'landing.ai.sarvam.title': 'सर्वम AI वॉइस इनटेक',
    'landing.ai.sarvam.desc':
      'तेलुगु, हिंदी, तमिल, कन्नड़, मराठी या अंग्रेजी में बोलें। सेकंड में आवाज को पहचानकर प्रोफाइल तैयार करता है।',
    'landing.ai.groq.title': 'ग्रोक योजना सवाल-जवाब',
    'landing.ai.groq.desc':
      'आधिकारिक राजपत्रों के आधार पर लामा 3.3 70B द्वारा सब-सेकंड में सटीक उत्तर। बिचौलियों के बिना पूरी जानकारी।',

    // Sectors
    'landing.sectors.eyebrow': 'मापे जाने वाले नियम व दायरा',
    'landing.sectors.title': '7 मुख्य सार्वजनिक लाभ क्षेत्र',
    'landing.sectors.jurisdiction': 'अखिल भारतीय और 32 राज्य क्षेत्राधिकार',

    // Journey
    'landing.journey.eyebrow': 'नागरिक सहायता यात्रा',
    'landing.journey.title': 'लाभसाथी का उपयोग कैसे करें',
    'landing.journey.desc': 'सरल भाषा से लेकर आवेदन ट्रैकिंग तक चरण-दर-चरण पारदर्शिता।',
    'landing.step1.title': 'सहज इनटेक',
    'landing.step1.desc': 'हिंदी/अंग्रेजी में टाइप करें या सर्वम वॉइस से बोलें। आधार नंबर को शील्ड तुरंत हटा देती है।',
    'landing.step2.title': 'अनुकूलित प्रश्न',
    'landing.step2.desc': 'केवल वही बताएं जो आप जानते हैं। अज्ञात जानकारी "पुष्टि की आवश्यकता" में बदल जाती है।',
    'landing.step3.title': '3-मान्य परिणाम',
    'landing.step3.desc': 'नियम इंजन योजनाओं को पात्र, पुष्टि आवश्यक, या अपात्र के रूप में पारदर्शी ढंग से दिखाता है।',
    'landing.step4.title': 'दस्तावेज़ चेकलिस्ट',
    'landing.step4.desc': 'आवश्यक राजस्व प्रमाणपत्र, जारीकर्ता अधिकारी और आधिकारिक पोर्टल के सीधे लिंक।',
    'landing.step5.title': 'व्हाट-इफ और ट्रैकर',
    'landing.step5.desc': 'आय या उपस्थिति बदलने पर पात्रता कैसे बदलती है, यह जांचें और नवीनीकरण अलर्ट प्राप्त करें।',

    // Middleman Shield
    'landing.shield.badge': 'बिचौलिया सुरक्षा कवच • अपने अधिकारों की रक्षा करें',
    'landing.shield.title': 'शून्य आवेदन शुल्क। शून्य एजेंट कमीशन।',
    'landing.shield.point1': 'आधिकारिक आवेदन 100% मुफ़्त हैं: ePASS, NSP, PM-KISAN पोर्टल पर कोई शुल्क नहीं लगता।',
    'landing.shield.point2': 'एजेंटों को पैसे न दें: गारंटी का वादा करने वाले बिचौलियों या निजी दलालों से सावधान रहें।',
    'landing.shield.point3': 'मार्गदर्शन, आधिकारिक निर्णय नहीं: लाभसाथी केवल नियम समझाता है; अंतिम निर्णय सरकार का होता है।',
    'landing.shield.cta': 'डेमो प्रोफाइल से जांचें',

    // Intake Page
    'intake.badge': 'नियम-आधारित पात्रता इनटेक',
    'intake.shield': 'संवेदनशील-आईडी शील्ड सक्रिय',
    'intake.title': 'इनटेक',
    'intake.lead':
      'अपनी स्थिति को सरल हिंदी या अंग्रेजी में बताएं, आवाज का उपयोग करें, या नीचे दिए गए सत्यापित नागरिक प्रोफाइल में से चुनें। कोई आधार संख्या नहीं ली जाती।',
    'intake.personas.heading': '1-क्लिक सत्यापित नागरिक प्रोफाइल',
    'intake.personas.sub': 'वास्तविक पात्रता परीक्षण के लिए तुरंत क्लिक करें',
    'intake.input.label': 'अपनी स्थिति अपने शब्दों में बताएं:',
    'intake.input.sub': 'हिंदी और अंग्रेजी भाषा समर्थित',
    'intake.input.placeholder':
      'उदा. मैं नलगोंडा में 2 एकड़ जमीन वाला एक छोटा किसान हूं, सफेद राशन कार्ड है और परिवार की आय 1.1 लाख है।',
    'intake.sample.label': 'उदाहरण वाक्य चुनें:',
    'intake.btn.voice': 'वॉइस इनटेक (सर्वम AI)',
    'intake.btn.extract': 'विशेषताएं पहचानें',
    'intake.shield.warning': 'कभी भी अपना आधार नंबर, पैन या बैंक पासवर्ड दर्ज न करें।',
    'intake.q.heading': 'अनुकूलित प्रश्नावली और प्रोफाइल समीक्षा',
    'intake.q.sub': 'केवल वही उत्तर दें जो आप जानते हैं। अज्ञात मान "पुष्टि की आवश्यकता" में बदल जाएंगे।',
    'intake.reset': 'रीसेट करें',
    'intake.why': 'हम यह क्यों पूछते हैं',
    'intake.btn.find': 'पात्र योजनाएं खोजें',

    // Matches Page
    'matches.badge': 'सत्यापित योजना कैटलॉग',
    'matches.logic': '3-मान्य तर्क इंजन',
    'matches.title': 'योजनाएं',
    'matches.lead': 'आपकी प्रोफाइल के अनुसार योजनाओं का मूल्यांकन। शून्य AI मतिभ्रम — केवल प्रकाशित सरकारी नियम।',
    'matches.btn.edit': 'प्रोफाइल बदलें',
    'matches.stat.total': 'कुल मूल्यांकित',
    'matches.stat.likely': 'संभावित पात्र',
    'matches.stat.need': 'पुष्टि आवश्यक',
    'matches.stat.saved': 'ट्रैकर में सहेजे गए',
    'matches.filter.all_states': 'अखिल भारतीय और राज्य',
    'matches.filter.all_cats': 'सभी श्रेणियां',
    'matches.filter.search_ph': 'योजना का नाम, लाभ या नियमों द्वारा खोजें...',
    'matches.filter.include_unlikely': 'अपात्र योजनाएं भी शामिल करें',
    'matches.card.save': 'ट्रैकर में सहेजें',
    'matches.card.saved': 'सहेजा गया',
    'matches.card.near_match': 'निकट-पात्रता अंतर्दृष्टि',
    'matches.card.view': 'योजना विवरण और दस्तावेज़ देखें',

    // Scheme Detail Page
    'detail.back': 'वापस योजनाओं पर जाएं',
    'detail.central': 'केंद्रीय योजना',
    'detail.state': 'राज्य लाभ',
    'detail.verified': '100% मुफ़्त सत्यापित',
    'detail.save': 'ट्रैकर में सहेजें',
    'detail.saved': 'सहेजा गया',
    'detail.share': 'व्हाट्सएप पर साझा करें',
    'detail.action_graph': 'पात्रता एक्शन ग्राफ',
    'detail.checklist.title': 'व्यक्तिगत दस्तावेज़ तैयारी चेकलिस्ट',
    'detail.checklist.sub': 'उपलब्ध दस्तावेज़ों को चिह्नित करें। यदि कोई दस्तावेज़ नहीं है, तो भी आप नियम देख सकते हैं।',
    'detail.steps.title': 'चरण-दर-चरण आधिकारिक आवेदन प्रक्रिया',
    'detail.steps.sub': 'आधिकारिक सरकारी दिशानिर्देशों के आधार पर तैयार किया गया। क्रम से पालन करें।',
    'detail.whatif.title': 'व्हाट-इफ सिमुलेशन रडार',
    'detail.whatif.sub': 'आय या उपस्थिति बदलने पर परिणाम की जांच करें।',
    'detail.whatif.btn': 'परिणाम का अनुकरण करें',

    // Tracker & Checklist
    'tracker.title': 'आवेदन और दावा ट्रैकर',
    'tracker.sub': 'अपने सक्रिय लाभों को प्रबंधित करें और नवीनीकरण की समय सीमा पर नज़र रखें।',
    'checklist.title': 'समेकित दस्तावेज़ चेकलिस्ट',
    'checklist.sub': 'सहेजी गई सभी योजनाओं के लिए आवश्यक दस्तावेज़, संबंधित जारीकर्ता अधिकारियों के साथ।',
  },
};
