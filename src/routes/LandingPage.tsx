import { ArrowRight, ShieldCheck, CheckCircle2, Lock, FileText, Sparkles, Building2 } from "lucide-react";
import { ButtonLink } from "../components/ui/Button";
import { Card } from "../components/ui/Card";

const steps = [
  {
    step: "01",
    title: "Describe your situation in plain words",
    text: "Type in English or Telugu (or choose a synthetic demo profile). No long confusing forms; answer only what is needed.",
    icon: Sparkles,
  },
  {
    step: "02",
    title: "Three-valued deterministic matching",
    text: "Our engine evaluates published eligibility rules as true, false, or unknown. We report 'Likely eligible' or 'Need to confirm'—never fake guarantees.",
    icon: ShieldCheck,
  },
  {
    step: "03",
    title: "Document checklist & direct official links",
    text: "Get your personalized MeeSeva document list, step-by-step application instructions, fee transparency, and renewal calendar.",
    icon: FileText,
  },
];

const highlights = [
  { value: "100% Free", label: "Zero application fees on official portals", icon: CheckCircle2 },
  { value: "7+ Verified", label: "Central & Telangana student schemes", icon: Building2 },
  { value: "Privacy First", label: "Sensitive-ID Shield blocks raw Aadhaar/PAN", icon: Lock },
  { value: "No Middlemen", label: "Direct portal links & transparent fee states", icon: ShieldCheck },
];

export function LandingPage() {
  return (
    <div className="landing flex flex-col gap-8 sm:gap-12 max-w-5xl mx-auto py-2 px-2 sm:px-4">
      {/* Hero Section — Asymmetric Split Layout with Ultra-Fast CSS Dots Background */}
      <section
        className="landing-hero relative overflow-hidden rounded-3xl bg-gradient-to-b from-white via-zinc-50 to-indigo-50/20 border border-zinc-200/90 p-5 sm:p-8 lg:p-10 shadow-xs"
        aria-labelledby="landing-title"
      >
        {/* Lightweight Pure CSS Dots Pattern (0ms load time, 0 JS) */}
        <div className="absolute inset-0 -z-0 bg-dots-pattern opacity-40 pointer-events-none" />

        <div className="landing-hero__inner relative z-10 grid grid-cols-1 lg:grid-cols-12 gap-6 lg:gap-8 items-center">
          {/* Left Column: Typography & Action */}
          <div className="lg:col-span-7 flex flex-col gap-3.5 sm:gap-4 items-start">
            <div className="inline-flex items-center gap-2 px-3 py-1 rounded-full bg-white/95 backdrop-blur-md border border-zinc-200/90 shadow-2xs">
              <span className="w-2 h-2 rounded-full bg-emerald-500 animate-pulse" />
              <span className="text-xs font-bold text-zinc-800 tracking-tight text-shimmer">
                Independent Public Service Navigation
              </span>
            </div>

            <p className="landing-eyebrow text-xs font-bold uppercase tracking-widest text-zinc-500">
              ACE BUILDERS 2026 • Problem Statement 5
            </p>

            <h1
              id="landing-title"
              className="landing-title text-3xl sm:text-4xl md:text-5xl font-extrabold text-zinc-950 tracking-tight leading-[1.12]"
            >
              LabhSaathi
            </h1>

            <p className="text-base sm:text-lg md:text-xl font-medium text-zinc-700 leading-snug">
              Know your benefits. Understand your rights.{" "}
              <span className="text-indigo-600 font-bold">Claim what&apos;s yours.</span>
            </p>

            <p className="landing-lead text-xs sm:text-sm md:text-base text-zinc-600 leading-relaxed max-w-xl">
              An intelligent, source-grounded claim-readiness platform designed for low-income college students in Telangana and across India. Explain your circumstances, discover verified scholarships, understand missing conditions, and prepare documents without relying on middlemen.
            </p>

            <div className="landing-actions flex flex-col sm:flex-row items-stretch sm:items-center gap-3 pt-2 w-full sm:w-auto">
              <ButtonLink
                to="/intake"
                variant="primary"
                className="landing-cta inline-flex items-center justify-center gap-2 px-6 py-3.5 bg-zinc-950 hover:bg-zinc-800 text-white rounded-xl font-bold text-sm shadow-sm transition-all btn-tactile min-h-[48px]"
              >
                <span>Start with intake</span>
                <ArrowRight className="w-4 h-4" />
              </ButtonLink>

              <a
                href="#how-it-works"
                className="px-5 py-3.5 rounded-xl border border-zinc-300 text-zinc-800 text-sm font-semibold hover:bg-zinc-100/70 transition-colors text-center min-h-[48px] flex items-center justify-center btn-tactile"
              >
                How it works
              </a>
            </div>

            <p className="landing-note text-[11px] text-zinc-500 italic mt-0.5">
              Independent guidance. Not an application, an approval, or official government determination.
            </p>
          </div>

          {/* Right Column: Visual Hero Picture & Floating Badges */}
          <div className="lg:col-span-5 relative flex justify-center w-full">
            <div className="relative w-full max-w-md aspect-[4/3] rounded-2xl overflow-hidden shadow-lg border-2 border-white bg-zinc-100 group">
              <img
                src="https://images.unsplash.com/photo-1523240795612-9a054b0db644?auto=format&fit=crop&w=800&q=80"
                alt="Indian college students studying and collaborating on a university campus"
                width={800}
                height={600}
                decoding="async"
                className="w-full h-full object-cover transition-transform duration-500 group-hover:scale-105"
                loading="eager"
              />
              <div className="absolute inset-0 bg-gradient-to-t from-zinc-950/70 via-transparent to-transparent pointer-events-none" />

              {/* Floating Pill Badges */}
              <div className="absolute top-3 left-3 bg-white/95 backdrop-blur-md px-3 py-1.5 rounded-full shadow-md text-xs font-bold text-zinc-900 flex items-center gap-1.5 border border-zinc-100">
                <CheckCircle2 className="w-4 h-4 text-emerald-600" />
                <span>100% Free Official Guidance</span>
              </div>

              <div className="absolute bottom-3 left-3 right-3 bg-white/95 backdrop-blur-md p-2.5 rounded-xl shadow-md border border-zinc-100 flex items-center justify-between">
                <div>
                  <span className="text-[10px] uppercase font-bold text-indigo-700 tracking-wider block">Pilot Cohort</span>
                  <span className="text-xs font-bold text-zinc-900">College Students in Telangana</span>
                </div>
                <span className="text-[11px] font-bold text-emerald-800 bg-emerald-50 px-2.5 py-0.5 rounded-full border border-emerald-200">
                  ePASS &amp; NSP Verified
                </span>
              </div>
            </div>
          </div>
        </div>
      </section>

      {/* Trust & Impact Stats Strip with Lightweight Responsive Cards */}
      <section className="grid grid-cols-2 lg:grid-cols-4 gap-2.5 sm:gap-3" aria-label="Key Platform Highlights">
        {highlights.map((item) => {
          const Icon = item.icon;
          return (
            <Card
              key={item.value}
              className="p-4 rounded-2xl bg-white border border-zinc-200/90 shadow-2xs flex flex-col gap-1 card-interactive"
            >
              <div className="flex items-center gap-1.5 text-zinc-700 mb-1">
                <Icon className="w-4 h-4 text-indigo-600" />
                <span className="text-[11px] font-bold uppercase tracking-wider text-zinc-500">Feature</span>
              </div>
              <span className="text-lg sm:text-xl font-extrabold text-zinc-950">{item.value}</span>
              <p className="text-xs text-zinc-600 leading-snug">{item.label}</p>
            </Card>
          );
        })}
      </section>

      {/* 3-Step Journey Section with Lightweight CSS Cards */}
      <section id="how-it-works" className="landing-section flex flex-col gap-5 sm:gap-6" aria-labelledby="landing-how-heading">
        <div className="flex flex-col gap-1">
          <span className="text-xs font-bold uppercase tracking-widest text-indigo-600">Simple 3-Step Journey</span>
          <h2 id="landing-how-heading" className="landing-heading text-xl sm:text-2xl font-bold text-zinc-900">
            How it works
          </h2>
          <p className="text-xs text-zinc-500 max-w-xl">
            We replace scattered government circulars with a clear, deterministic readiness path.
          </p>
        </div>

        <ol className="landing-steps grid grid-cols-1 md:grid-cols-3 gap-3.5 sm:gap-4 list-none pl-0">
          {steps.map((step) => {
            const StepIcon = step.icon;
            return (
              <li key={step.title} className="list-none">
                <Card
                  className="landing-step h-full p-5 rounded-2xl bg-white border border-zinc-200/90 shadow-2xs flex flex-col justify-between card-interactive"
                >
                  <div>
                    <div className="flex items-center justify-between mb-3.5">
                      <span
                        className="landing-step__number w-8 h-8 rounded-lg bg-zinc-100 text-zinc-800 font-mono font-bold text-xs flex items-center justify-center border border-zinc-200"
                        aria-hidden="true"
                      >
                        {step.step}
                      </span>
                      <StepIcon className="w-5 h-5 text-indigo-600" />
                    </div>
                    <h3 className="landing-step__title font-bold text-zinc-900 text-sm mb-1.5 leading-snug">
                      {step.title}
                    </h3>
                    <p className="landing-step__text text-xs text-zinc-600 leading-relaxed">
                      {step.text}
                    </p>
                  </div>
                </Card>
              </li>
            );
          })}
        </ol>
      </section>

      {/* Middleman Shield & Transparency Callout Card */}
      <Card className="landing-card p-5 sm:p-6 bg-gradient-to-br from-indigo-50/40 via-white to-zinc-50/60 border border-indigo-200/80 shadow-2xs" aria-labelledby="landing-not-heading">
        <div className="flex flex-col md:flex-row items-start md:items-center justify-between gap-5 sm:gap-6">
          <div className="flex flex-col gap-2 max-w-2xl">
            <div className="flex items-center gap-2 text-indigo-700 font-bold text-xs uppercase tracking-wider">
              <ShieldCheck className="w-5 h-5 text-indigo-600" />
              <span>Middleman Shield • Protect Your Rights</span>
            </div>
            <h2 id="landing-not-heading" className="landing-heading text-lg font-bold text-zinc-900">
              What this is not
            </h2>
            <ul className="landing-list text-xs text-zinc-700 space-y-1.5 list-disc pl-4 leading-relaxed">
              <li><strong>Not an application or official portal:</strong> Official submissions occur directly on official sites like Telangana ePASS or NSP.</li>
              <li><strong>Not an approval:</strong> Outcome labels like &quot;Likely eligible&quot; are guidance estimates based on published rules, never official guarantees.</li>
              <li><strong>Zero fees or middlemen:</strong> Applying for government scholarships is 100% free. Never pay agents who demand commission or promise guaranteed approval.</li>
              <li><strong>Sample profiles &amp; verified data:</strong> Tested with 6 synthetic student personas; state coverage is disclosed honestly.</li>
            </ul>
          </div>

          <div className="flex-shrink-0 w-full sm:w-auto">
            <ButtonLink
              to="/intake"
              variant="primary"
              className="w-full sm:w-auto px-5 py-3.5 bg-zinc-950 hover:bg-zinc-800 text-white rounded-xl font-bold text-xs shadow-sm flex items-center justify-center gap-1.5 btn-tactile min-h-[48px]"
            >
              <span>Explore Your Benefits</span>
              <ArrowRight className="w-4 h-4" />
            </ButtonLink>
          </div>
        </div>
      </Card>

      {/* Footer Disclaimer */}
      <footer className="landing-footer text-center pt-2 pb-6 border-t border-zinc-200">
        <p className="landing-footnote text-xs text-zinc-600 font-medium">
          Sample data only. Not verified for every state. Created for ACE BUILDERS 2026 Problem Statement 5.
        </p>
      </footer>
    </div>
  );
}
