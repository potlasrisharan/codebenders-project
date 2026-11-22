import {
  ArrowRight,
  ShieldCheck,
  GraduationCap,
  Wheat,
  HeartPulse,
  Home,
  Users,
  Hammer,
  Clock,
  Mic,
  Bot,
} from 'lucide-react';
import { ButtonLink } from '../components/ui/Button';
import { Card } from '../components/ui/Card';
import { T } from '../core/i18n/LanguageContext';

const SCHEME_SECTORS = [
  {
    icon: GraduationCap,
    title: 'Education & Scholarships',
    count: '60+ Schemes',
    description: 'Post-matric tuition reimbursements, girl child technical grants, and national merit fellowships.',
    criteriaMeasured: 'Attendance (75%+), Board Percentile, Income Ceiling (<₹2L–₹8L), Category (SC/ST/BC/EBC).',
    examples: 'NSP Central Sector (CSSS), AICTE Pragati, State Post-Matric Scholarships (UP, MH, KA, TS, KL), Saksham.',
  },
  {
    icon: Wheat,
    title: 'Agriculture & Farmers',
    count: '35+ Schemes',
    description: 'Direct income support, crop insurance coverage, input subsidies, and institutional credit.',
    criteriaMeasured: 'Landholding size (marginal <1 ha, small 1–2 ha), Domicile, Non-income tax status.',
    examples: 'PM-KISAN (₹6,000/yr), PM Fasal Bima Yojana, Rythu Bharosa, Kisan Credit Card.',
  },
  {
    icon: HeartPulse,
    title: 'Healthcare & Life Insurance',
    count: '25+ Schemes',
    description: 'Cashless hospitalisation coverage, accidental death protection, and maternal care assistance.',
    criteriaMeasured: 'BPL / White Ration Card, SECC criteria, Family income threshold.',
    examples: 'Ayushman Bharat (PM-JAY ₹5L cover), PM Jeevan Jyoti, PM Suraksha Bima, Aarogyasri.',
  },
  {
    icon: Home,
    title: 'Housing & Basic Amenities',
    count: '20+ Schemes',
    description: 'Pucca housing construction grants, piped tap water connections, and clean LPG connections.',
    criteriaMeasured: 'Kutcha house / landless status, Rural vs Urban panchayat, Annual family income.',
    examples: 'PMAY-Gramin, PMAY-Urban, Jal Jeevan Mission, PM Ujjwala Yojana.',
  },
  {
    icon: Users,
    title: 'Women & Child Development',
    count: '30+ Schemes',
    description: 'Long-term savings for daughters, conditional cash transfers for mothers, and free transport.',
    criteriaMeasured: 'Gender, Child age (<10 years), Pregnancy trimester, Marital status.',
    examples: 'Sukanya Samriddhi Yojana, Beti Bachao Beti Padhao, PM Matru Vandana, Mahalakshmi.',
  },
  {
    icon: Hammer,
    title: 'Artisans, Vendors & Workers',
    count: '25+ Schemes',
    description: 'Collateral-free micro-credit, toolkits, modern skill training, and guaranteed rural employment.',
    criteriaMeasured: '18 traditional artisan trades, Street vending certificate / LOR, e-Shram card.',
    examples: 'PM Vishwakarma (₹3L loan + ₹15k toolkit), PM SVANidhi, MGNREGA (100 days work).',
  },
  {
    icon: Clock,
    title: 'Social Security & Pensions',
    count: '24+ Schemes',
    description: 'Monthly old-age pensions, unorganized worker retirement pensions, and disability stipends.',
    criteriaMeasured: 'Age window (18–40 for contribution, 60+ for payout), BPL status, Benchmark disability (40%+).',
    examples: 'Atal Pension Yojana, PM Shram Yogi Maandhan, Indira Gandhi Old Age Pension, Aasara.',
  },
];



export function LandingPage() {
  const platformStats = [
    { value: '219', labelKey: 'landing.stats.schemes', subKey: 'landing.stats.schemes.sub' },
    { value: '100% Free', labelKey: 'landing.stats.free', subKey: 'landing.stats.free.sub' },
    { value: '0 PII', labelKey: 'landing.stats.privacy', subKey: 'landing.stats.privacy.sub' },
    { value: '3-Valued', labelKey: 'landing.stats.logic', subKey: 'landing.stats.logic.sub' },
  ];

  return (
    <div className="landing flex flex-col gap-10 max-w-5xl mx-auto pt-1 pb-6 px-3 sm:px-4">
      {/* Editorial Hero Section */}
      <section
        className="relative overflow-hidden rounded-3xl bg-gradient-to-b from-white via-zinc-50 to-indigo-50/25 border border-zinc-200/90 p-6 sm:p-10 shadow-xs"
        aria-labelledby="landing-title"
      >
        <div className="absolute inset-0 -z-0 bg-dots-pattern opacity-35 pointer-events-none" />

        <div className="relative z-10 flex flex-col items-start gap-4 max-w-3xl">
          <div className="inline-flex items-center gap-2 px-3 py-1 rounded-full bg-white/95 backdrop-blur-md border border-zinc-200/90 shadow-2xs">
            <img src="/logo.png" alt="LabhSaathi logo" className="w-4 h-4 object-contain" />
            <T id="landing.eyebrow" className="text-xs font-bold text-zinc-800 tracking-tight" />
          </div>

          <h1
            id="landing-title"
            className="text-3xl sm:text-4xl md:text-5xl font-extrabold text-zinc-950 tracking-tight leading-[1.12]"
          >
            <T id="landing.title" />
          </h1>

          <div className="text-base sm:text-xl font-semibold text-zinc-800 leading-snug">
            <T id="landing.subtitle" />{' '}
            <span className="text-indigo-600 font-bold"><T id="landing.highlight" inline /></span>
          </div>

          <p className="text-xs sm:text-sm md:text-base text-zinc-600 leading-relaxed">
            <T id="landing.lead" />
          </p>

          <div className="flex flex-wrap items-center gap-3 pt-2 w-full sm:w-auto">
            <ButtonLink
              to="/intake?fresh=1"
              variant="primary"
              className="inline-flex items-center justify-center gap-2 px-6 py-3.5 bg-zinc-950 hover:bg-zinc-800 text-white rounded-xl font-bold text-sm shadow-sm transition-all btn-tactile min-h-[48px]"
            >
              <T id="landing.cta.start" />
              <ArrowRight className="w-4 h-4" />
            </ButtonLink>

            <ButtonLink
              to="/matches"
              variant="secondary"
              className="inline-flex items-center justify-center gap-2 px-5 py-3.5 border border-zinc-300 text-zinc-800 rounded-xl font-semibold text-sm hover:bg-zinc-100/70 transition-colors btn-tactile min-h-[48px]"
            >
              <T id="landing.cta.browse" />
            </ButtonLink>
          </div>

          <p className="text-[11px] text-zinc-500 italic mt-1">
            <T id="landing.note" />
          </p>
        </div>
      </section>

      {/* Verified Catalog Stats Strip */}
      <section className="grid grid-cols-2 lg:grid-cols-4 gap-3" aria-label="Key Platform Facts">
        {platformStats.map((stat) => (
          <Card key={stat.value} className="p-4 rounded-2xl bg-white border border-zinc-200/90 shadow-2xs space-y-1">
            <span className="text-2xl font-extrabold text-zinc-950 tracking-tight block">{stat.value}</span>
            <T id={stat.labelKey} className="text-xs font-bold text-zinc-800 block" />
            <T id={stat.subKey} className="text-[11px] text-zinc-500 leading-tight block" />
          </Card>
        ))}
      </section>

      {/* AI & Multilingual Voice Roadmap Spotlight */}
      <section
        className="p-6 sm:p-8 rounded-3xl border border-zinc-800 shadow-xl !text-white text-white relative overflow-hidden"
        style={{
          background: 'linear-gradient(135deg, #09090b 0%, #18181b 50%, #1e1b4b 100%)',
          color: '#ffffff',
        }}
      >
        <div className="flex flex-col lg:flex-row lg:items-center justify-between gap-6">
          <div className="space-y-2 max-w-2xl">
            <div className="flex items-center gap-2">
              <span className="w-2 h-2 rounded-full bg-indigo-400 animate-pulse" />
              <T id="landing.ai.badge" className="text-xs font-bold uppercase tracking-wider text-indigo-300" primaryClassName="text-indigo-300" />
            </div>
            <h2 className="text-xl sm:text-2xl font-extrabold tracking-tight !text-white text-white">
              <T id="landing.ai.title" className="!text-white text-white" primaryClassName="!text-white text-white" secondaryClassName="text-zinc-300" />
            </h2>
            <p className="text-xs sm:text-sm text-zinc-200 leading-relaxed">
              <T id="landing.ai.desc" className="text-zinc-200" primaryClassName="text-zinc-200" secondaryClassName="text-zinc-400" />
            </p>
          </div>

          <div className="grid grid-cols-1 sm:grid-cols-2 gap-3 flex-shrink-0 lg:w-96">
            <div className="p-3.5 rounded-xl bg-white/10 backdrop-blur-md border border-white/20 space-y-1">
              <div className="flex items-center gap-1.5 text-emerald-300 text-xs font-bold">
                <Mic className="w-4 h-4 text-emerald-400" /> <T id="landing.ai.sarvam.title" className="text-emerald-300 font-bold" primaryClassName="text-emerald-300 font-bold" />
              </div>
              <p className="text-[11px] text-zinc-200">
                <T id="landing.ai.sarvam.desc" className="text-zinc-200" primaryClassName="text-zinc-200" secondaryClassName="text-zinc-400" />
              </p>
            </div>
            <div className="p-3.5 rounded-xl bg-white/10 backdrop-blur-md border border-white/20 space-y-1">
              <div className="flex items-center gap-1.5 text-indigo-200 text-xs font-bold">
                <Bot className="w-4 h-4 text-indigo-300" /> <T id="landing.ai.groq.title" className="text-indigo-200 font-bold" primaryClassName="text-indigo-200 font-bold" />
              </div>
              <p className="text-[11px] text-zinc-200">
                <T id="landing.ai.groq.desc" className="text-zinc-200" primaryClassName="text-zinc-200" secondaryClassName="text-zinc-400" />
              </p>
            </div>
          </div>
        </div>
      </section>

      {/* 7 Core Scheme Sectors Evaluated */}
      <section className="space-y-4" aria-labelledby="sectors-heading">
        <div className="flex flex-col sm:flex-row sm:items-end justify-between gap-1 border-b border-zinc-200 pb-3">
          <div>
            <T id="landing.sectors.eyebrow" className="text-xs font-bold uppercase tracking-widest text-indigo-600 block" />
            <h2 id="sectors-heading" className="text-xl font-extrabold text-zinc-900 tracking-tight">
              <T id="landing.sectors.title" />
            </h2>
          </div>
          <span className="text-xs text-zinc-500 font-medium">
            <T id="landing.sectors.jurisdiction" />
          </span>
        </div>

        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-3.5">
          {SCHEME_SECTORS.map((sector) => {
            const Icon = sector.icon;
            return (
              <Card
                key={sector.title}
                className="p-4 bg-white border border-zinc-200/90 rounded-2xl shadow-2xs flex flex-col justify-between space-y-3 hover:border-zinc-300 transition-colors"
              >
                <div className="space-y-2">
                  <div className="flex items-center justify-between">
                    <div className="w-8 h-8 rounded-lg bg-zinc-100 flex items-center justify-center text-zinc-800">
                      <Icon className="w-4 h-4" />
                    </div>
                    <span className="text-[11px] font-bold px-2 py-0.5 rounded-full bg-zinc-100 text-zinc-700">
                      {sector.count}
                    </span>
                  </div>
                  <h3 className="font-extrabold text-sm text-zinc-900">{sector.title}</h3>
                  <p className="text-xs text-zinc-600 leading-relaxed">{sector.description}</p>
                </div>

                <div className="pt-2 border-t border-zinc-100 space-y-1 text-[11px]">
                  <div>
                    <strong className="text-zinc-800">Rules Measured:</strong>{' '}
                    <span className="text-zinc-600">{sector.criteriaMeasured}</span>
                  </div>
                  <div>
                    <strong className="text-zinc-800">Key Schemes:</strong>{' '}
                    <span className="text-zinc-500 italic">{sector.examples}</span>
                  </div>
                </div>
              </Card>
            );
          })}
        </div>
      </section>

      {/* 5-Step Connected User Journey for Judges & Citizens */}
      <section className="space-y-4" aria-labelledby="journey-heading">
        <div className="border-b border-zinc-200 pb-3">
          <T id="landing.journey.eyebrow" className="text-xs font-bold uppercase tracking-widest text-indigo-600 block" />
          <h2 id="journey-heading" className="text-xl font-extrabold text-zinc-900 tracking-tight">
            <T id="landing.journey.title" />
          </h2>
          <p className="text-xs text-zinc-500 mt-0.5">
            <T id="landing.journey.desc" />
          </p>
        </div>

        <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-5 gap-3">
          <Card className="p-4 bg-white border border-zinc-200/90 rounded-2xl shadow-2xs space-y-2">
            <span className="w-6 h-6 rounded-full bg-zinc-900 text-white font-mono font-bold text-xs flex items-center justify-center">
              1
            </span>
            <h3 className="font-bold text-xs text-zinc-900"><T id="landing.step1.title" /></h3>
            <p className="text-[11px] text-zinc-600 leading-relaxed">
              <T id="landing.step1.desc" />
            </p>
          </Card>

          <Card className="p-4 bg-white border border-zinc-200/90 rounded-2xl shadow-2xs space-y-2">
            <span className="w-6 h-6 rounded-full bg-zinc-900 text-white font-mono font-bold text-xs flex items-center justify-center">
              2
            </span>
            <h3 className="font-bold text-xs text-zinc-900"><T id="landing.step2.title" /></h3>
            <p className="text-[11px] text-zinc-600 leading-relaxed">
              <T id="landing.step2.desc" />
            </p>
          </Card>

          <Card className="p-4 bg-white border border-zinc-200/90 rounded-2xl shadow-2xs space-y-2">
            <span className="w-6 h-6 rounded-full bg-zinc-900 text-white font-mono font-bold text-xs flex items-center justify-center">
              3
            </span>
            <h3 className="font-bold text-xs text-zinc-900"><T id="landing.step3.title" /></h3>
            <p className="text-[11px] text-zinc-600 leading-relaxed">
              <T id="landing.step3.desc" />
            </p>
          </Card>

          <Card className="p-4 bg-white border border-zinc-200/90 rounded-2xl shadow-2xs space-y-2">
            <span className="w-6 h-6 rounded-full bg-zinc-900 text-white font-mono font-bold text-xs flex items-center justify-center">
              4
            </span>
            <h3 className="font-bold text-xs text-zinc-900"><T id="landing.step4.title" /></h3>
            <p className="text-[11px] text-zinc-600 leading-relaxed">
              <T id="landing.step4.desc" />
            </p>
          </Card>

          <Card className="p-4 bg-white border border-zinc-200/90 rounded-2xl shadow-2xs space-y-2">
            <span className="w-6 h-6 rounded-full bg-zinc-900 text-white font-mono font-bold text-xs flex items-center justify-center">
              5
            </span>
            <h3 className="font-bold text-xs text-zinc-900"><T id="landing.step5.title" /></h3>
            <p className="text-[11px] text-zinc-600 leading-relaxed">
              <T id="landing.step5.desc" />
            </p>
          </Card>
        </div>
      </section>

      {/* Middleman Shield & Transparency Callout */}
      <Card className="p-6 bg-gradient-to-br from-indigo-50/40 via-white to-zinc-50/60 border border-indigo-200/80 shadow-2xs">
        <div className="flex flex-col md:flex-row items-start md:items-center justify-between gap-6">
          <div className="space-y-2 max-w-2xl">
            <div className="flex items-center gap-2 text-indigo-700 font-bold text-xs uppercase tracking-wider">
              <ShieldCheck className="w-5 h-5 text-indigo-600" />
              <T id="landing.shield.badge" />
            </div>
            <h2 className="text-lg font-extrabold text-zinc-900">
              <T id="landing.shield.title" />
            </h2>
            <ul className="text-xs text-zinc-700 space-y-1 list-disc pl-4 leading-relaxed">
              <li><T id="landing.shield.point1" /></li>
              <li><T id="landing.shield.point2" /></li>
              <li><T id="landing.shield.point3" /></li>
            </ul>
          </div>

          <div className="flex flex-col sm:flex-row items-center gap-2 flex-shrink-0 w-full sm:w-auto">
            <ButtonLink
              to="/intake?fresh=1"
              variant="primary"
              className="w-full sm:w-auto px-5 py-3.5 bg-zinc-950 hover:bg-zinc-800 text-white rounded-xl font-bold text-xs shadow-sm flex items-center justify-center gap-1.5 btn-tactile min-h-[48px]"
            >
              <T id="landing.shield.cta" />
              <ArrowRight className="w-4 h-4" />
            </ButtonLink>
          </div>
        </div>
      </Card>

      {/* Footer Disclaimer */}
      <footer className="text-center pt-2 pb-6 border-t border-zinc-200 space-y-1">
        <p className="text-xs text-zinc-700 font-semibold">
          LabhSaathi • ACE BUILDERS 2026 Problem Statement 5 (PS5) Reference Implementation
        </p>
        <p className="text-[11px] text-zinc-500">
          Independent civic guidance platform. All 219 schemes sourced from official state and central gazettes.
        </p>
      </footer>
    </div>
  );
}
