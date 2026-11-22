import { useState } from "react";
import type { ReactNode } from "react";
import { NavLink } from "react-router-dom";
import {
  ExternalLink,
  Menu,
  X,
  FileText,
  Search,
  ListChecks,
  Activity,
  Shield,
  Home,
  Languages,
} from "lucide-react";
import { useLanguage } from "../../core/i18n/LanguageContext";
import { TRANSLATIONS } from "../../core/i18n/translations";
import { useCitizenProfile } from "../../core/profile/ProfileContext";

export function AppLayout({ children }: { children: ReactNode }) {
  const [mobileMenuOpen, setMobileMenuOpen] = useState(false);
  const { language, setLanguage, languages, t } = useLanguage();
  const { hasCompletedIntake, activePersonaName, profile } = useCitizenProfile();

  const navItems = [
    { to: "/intake", key: "nav.intake", icon: FileText },
    { to: "/matches", key: "nav.matches", icon: Search },
    { to: "/checklist", key: "nav.checklist", icon: ListChecks },
    { to: "/tracker", key: "nav.tracker", icon: Activity },
  ] as const;

  return (
    <div className="app-root min-h-[100dvh] flex flex-col bg-zinc-50/60 text-zinc-900 font-sans antialiased selection:bg-zinc-900 selection:text-white">
      <a href="#main-content" className="skip-link">
        Skip to main content
      </a>

      {/* Top Banner Notice */}
      <div className="bg-zinc-950 text-white text-[11px] py-1.5 px-3 sm:px-4 text-center tracking-wide font-medium flex flex-col sm:flex-row items-center justify-center gap-1 sm:gap-2">
        <div className="flex items-center gap-1.5">
          <span className="w-2 h-2 rounded-full bg-emerald-400 animate-pulse" />
          <span>{t("banner.top")}</span>
          <span className="hidden md:inline text-zinc-400">• {t("banner.free")}</span>
        </div>
        {language !== 'en' && (
          <div className="text-[10px] text-zinc-400 font-normal sm:border-l sm:border-zinc-800 sm:pl-2">
            {TRANSLATIONS.en["banner.top"]}
          </div>
        )}
      </div>

      {/* Main Glassmorphic Header */}
      <header className="app-header sticky top-0 z-40 bg-white/95 backdrop-blur-md border-b border-zinc-200/90 transition-all">
        <div className="container app-nav max-w-6xl mx-auto px-3 sm:px-4 py-2.5 sm:py-3 flex items-center justify-between">
          <NavLink
            to="/"
            className="brand flex items-center gap-2.5 group"
            onClick={() => setMobileMenuOpen(false)}
          >
            <div className="w-8 h-8 rounded-lg flex items-center justify-center group-hover:scale-105 transition-transform">
              <img src="/logo.png" alt="LabhSaathi logo" className="w-8 h-8 object-contain" />
            </div>
            <div className="flex flex-col">
              <span className="font-extrabold text-lg tracking-tight text-zinc-950 leading-none flex items-center gap-1">
                {t("brand.name")}
                <span className="w-1.5 h-1.5 rounded-full bg-emerald-500" />
              </span>
              {language !== 'en' && (
                <span className="text-[10px] text-zinc-500 font-medium leading-tight">LabhSaathi</span>
              )}
              <span className="text-[10px] text-zinc-500 tracking-wider uppercase font-bold mt-0.5">
                {t("brand.tagline")}
              </span>
              {language !== 'en' && (
                <span className="text-[9px] text-zinc-400 font-normal leading-tight">Claim What's Yours</span>
              )}
            </div>
          </NavLink>

          {/* Desktop Navigation Links & Language Switcher */}
          <div className="hidden md:flex items-center gap-4">
            <nav aria-label="Primary">
              <ul className="app-nav__links flex items-center gap-1.5 list-none m-0 p-0">
                {navItems.map((item) => (
                  <li key={item.to}>
                    <NavLink
                      to={item.to}
                      className={({ isActive }) =>
                        `px-3 py-1.5 rounded-xl text-xs font-bold transition-all flex flex-col items-center justify-center ${
                          isActive
                            ? "bg-zinc-900 !text-white text-white shadow-xs"
                            : "text-zinc-600 hover:text-zinc-950 hover:bg-zinc-100"
                        }`
                      }
                    >
                      <span className="leading-tight">{t(item.key)}</span>
                      {language !== 'en' && (
                        <span className="text-[9px] font-normal opacity-75 mt-0.5 leading-tight">
                          {TRANSLATIONS.en[item.key]}
                        </span>
                      )}
                    </NavLink>
                  </li>
                ))}
              </ul>
            </nav>

            {/* Active Citizen Session Pill if intake taken or persona selected */}
            {hasCompletedIntake && (
              <div className="hidden lg:flex items-center gap-1.5 px-2.5 py-1 rounded-full bg-emerald-50 border border-emerald-200 text-xs text-emerald-800">
                <span className="w-1.5 h-1.5 rounded-full bg-emerald-600 animate-pulse" />
                <span className="font-semibold capitalize truncate max-w-[140px]">
                  {activePersonaName ? activePersonaName.split(' (')[0] : profile.occupation?.replace('_', ' ') || 'Active Session'}
                </span>
              </div>
            )}

            {/* Language Switcher Pill */}
            <div className="flex items-center gap-1 bg-zinc-100 p-1 rounded-full border border-zinc-200">
              <Languages className="w-3.5 h-3.5 text-zinc-500 ml-1.5 mr-0.5" />
              {languages.map((l) => (
                <button
                  key={l.code}
                  type="button"
                  onClick={() => setLanguage(l.code)}
                  className={`px-2.5 py-1 rounded-full text-[11px] font-bold transition-all ${
                    language === l.code
                      ? "bg-zinc-950 text-white shadow-xs"
                      : "text-zinc-600 hover:text-zinc-950 hover:bg-zinc-200/60"
                  }`}
                  aria-label={`Switch language to ${l.label}`}
                >
                  {l.nativeName}
                </button>
              ))}
            </div>
          </div>

          {/* Mobile Menu Hamburger Button */}
          <div className="flex items-center gap-2 md:hidden">
            <button
              type="button"
              onClick={() => setMobileMenuOpen(!mobileMenuOpen)}
              className="p-2 rounded-lg text-zinc-700 hover:text-zinc-950 hover:bg-zinc-100 focus:outline-none focus:ring-2 focus:ring-zinc-900 min-h-[44px] min-w-[44px] flex items-center justify-center"
              aria-label={mobileMenuOpen ? "Close navigation menu" : "Open navigation menu"}
              aria-expanded={mobileMenuOpen}
            >
              {mobileMenuOpen ? <X className="w-6 h-6" /> : <Menu className="w-6 h-6" />}
            </button>
          </div>
        </div>

        {/* Mobile Dropdown Menu Drawer */}
        {mobileMenuOpen && (
          <div className="md:hidden border-t border-zinc-200 bg-white px-4 py-3 shadow-lg animate-slide-down-fade space-y-3">
            {/* Mobile Language Switcher */}
            <div className="flex items-center gap-1.5 p-2 bg-zinc-50 rounded-xl border border-zinc-200/80">
              <Languages className="w-4 h-4 text-zinc-500" />
              <span className="text-xs font-bold text-zinc-700 mr-auto">Language:</span>
              {languages.map((l) => (
                <button
                  key={l.code}
                  type="button"
                  onClick={() => {
                    setLanguage(l.code);
                    setMobileMenuOpen(false);
                  }}
                  className={`px-2.5 py-1 rounded-lg text-xs font-bold transition-all ${
                    language === l.code
                      ? "bg-zinc-950 text-white shadow-xs"
                      : "bg-white text-zinc-700 border border-zinc-200"
                  }`}
                >
                  {l.nativeName}
                </button>
              ))}
            </div>

            <nav aria-label="Mobile Navigation">
              <ul className="flex flex-col gap-1 list-none p-0 m-0">
                <li>
                  <NavLink
                    to="/"
                    onClick={() => setMobileMenuOpen(false)}
                    className={({ isActive }) =>
                      `flex items-center gap-3 px-3 py-2.5 rounded-lg text-sm font-bold transition-colors ${
                        isActive ? "bg-zinc-900 !text-white text-white" : "text-zinc-700 hover:bg-zinc-100"
                      }`
                    }
                  >
                    <Home className="w-4 h-4" />
                    <span>Home</span>
                  </NavLink>
                </li>
                {navItems.map((item) => {
                  const Icon = item.icon;
                  return (
                    <li key={item.to}>
                      <NavLink
                        to={item.to}
                        onClick={() => setMobileMenuOpen(false)}
                        className={({ isActive }) =>
                          `flex items-center gap-3 px-3 py-2.5 rounded-lg text-sm font-bold transition-colors ${
                            isActive ? "bg-zinc-900 !text-white text-white" : "text-zinc-700 hover:bg-zinc-100"
                          }`
                        }
                      >
                        <Icon className="w-4 h-4 flex-shrink-0" />
                        <div className="flex flex-col">
                          <span>{t(item.key)}</span>
                          {language !== 'en' && (
                            <span className="text-[10px] font-normal text-zinc-400">
                              {TRANSLATIONS.en[item.key]}
                            </span>
                          )}
                        </div>
                      </NavLink>
                    </li>
                  );
                })}
              </ul>
            </nav>
          </div>
        )}
      </header>

      {/* Main Content Area with Smooth Page Transition */}
      <main id="main-content" tabIndex={-1} className="page-fade flex-1 focus:outline-none">
        <div className="container max-w-6xl mx-auto px-3 sm:px-4 pt-2 sm:pt-4 pb-8 sm:pb-12">{children}</div>
      </main>

      {/* High-Craft Minimal Footer */}
      <footer className="app-footer bg-white border-t border-zinc-200 text-xs text-zinc-500 mt-auto">
        <div className="max-w-6xl mx-auto px-4 py-8 flex flex-col md:flex-row items-start md:items-center justify-between gap-6">
          <div className="flex flex-col gap-1.5 max-w-md">
            <div className="flex items-center gap-2">
              <img src="/logo.png" alt="LabhSaathi logo" className="w-5 h-5 object-contain" />
              <span className="font-bold text-zinc-900 text-sm">LabhSaathi</span>
              <span className="text-[10px] px-2 py-0.5 rounded-full bg-zinc-100 text-zinc-600 font-mono">
                v1.0.0 (PS5 Pilot)
              </span>
            </div>
            <p className="text-[11px] text-zinc-600 leading-relaxed">
              Independent civic-tech platform empowering citizens across all 28 States &amp; 8 Union Territories of India to discover public schemes, understand rules, and prepare documents.
            </p>
          </div>

          <div className="flex flex-wrap items-center gap-4 text-xs font-medium text-zinc-600">
            <a
              href="https://www.myscheme.gov.in"
              target="_blank"
              rel="noopener noreferrer"
              className="hover:text-zinc-950 inline-flex items-center gap-1 transition-colors"
            >
              MyScheme Portal <ExternalLink className="w-3 h-3 text-zinc-500" />
            </a>
            <a
              href="https://scholarships.gov.in"
              target="_blank"
              rel="noopener noreferrer"
              className="hover:text-zinc-950 inline-flex items-center gap-1 transition-colors"
            >
              National Scholarship Portal <ExternalLink className="w-3 h-3 text-zinc-500" />
            </a>
            <a
              href="https://www.india.gov.in"
              target="_blank"
              rel="noopener noreferrer"
              className="hover:text-zinc-950 inline-flex items-center gap-1 transition-colors"
            >
              National Portal of India <ExternalLink className="w-3 h-3 text-zinc-500" />
            </a>
            <a
              href="https://digitalseva.csc.gov.in"
              target="_blank"
              rel="noopener noreferrer"
              className="hover:text-zinc-950 inline-flex items-center gap-1 transition-colors"
            >
              CSC Common Service Centres <ExternalLink className="w-3 h-3 text-zinc-500" />
            </a>
            <span className="text-zinc-300">•</span>
            <NavLink
              to="/admin-review"
              className="hover:text-zinc-950 inline-flex items-center gap-1 transition-colors text-zinc-500"
            >
              <Shield className="w-3.5 h-3.5 text-zinc-400" />
              <span>Admin Gazette Review</span>
            </NavLink>
          </div>
        </div>

        <div className="border-t border-zinc-100 bg-zinc-50 py-3 text-center text-xs text-zinc-600 px-4 font-medium">
          Independent guidance. LabhSaathi does not approve applications or guarantee benefits. Never pay middlemen for official scholarships.
        </div>
      </footer>
    </div>
  );
}
