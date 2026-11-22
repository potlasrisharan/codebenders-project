import { useState } from "react";
import type { ReactNode } from "react";
import { NavLink } from "react-router-dom";
import {
  ShieldCheck,
  ExternalLink,
  Menu,
  X,
  FileText,
  Search,
  ListChecks,
  Activity,
  Shield,
  Home,
} from "lucide-react";

const NAV_ITEMS = [
  { to: "/intake", label: "Intake", icon: FileText },
  { to: "/matches", label: "Matches", icon: Search },
  { to: "/checklist", label: "Checklist", icon: ListChecks },
  { to: "/tracker", label: "Tracker", icon: Activity },
  { to: "/admin-review", label: "Admin review", icon: Shield },
] as const;

export function AppLayout({ children }: { children: ReactNode }) {
  const [mobileMenuOpen, setMobileMenuOpen] = useState(false);

  return (
    <div className="app-root min-h-[100dvh] flex flex-col bg-zinc-50/60 text-zinc-900 font-sans antialiased selection:bg-zinc-900 selection:text-white">
      <a href="#main-content" className="skip-link">
        Skip to main content
      </a>

      {/* Top Banner Notice */}
      <div className="bg-zinc-950 text-white text-[11px] py-1.5 px-3 sm:px-4 text-center tracking-wide font-medium flex items-center justify-center gap-2">
        <span className="w-2 h-2 rounded-full bg-emerald-400 animate-pulse" />
        <span>ACE BUILDERS 2026 PS5 Pilot: Verified Government Schemes for College Students in Telangana &amp; India</span>
        <span className="hidden md:inline text-zinc-400">• 100% Free Official Guidance</span>
      </div>

      {/* Main Glassmorphic Header */}
      <header className="app-header sticky top-0 z-40 bg-white/95 backdrop-blur-md border-b border-zinc-200/90 transition-all">
        <div className="container app-nav max-w-6xl mx-auto px-3 sm:px-4 py-2.5 sm:py-3 flex items-center justify-between">
          <NavLink
            to="/"
            className="brand flex items-center gap-2.5 group"
            onClick={() => setMobileMenuOpen(false)}
          >
            <div className="w-8 h-8 rounded-lg bg-zinc-900 flex items-center justify-center text-white shadow-xs group-hover:scale-105 transition-transform">
              <ShieldCheck className="w-5 h-5 text-emerald-400" />
            </div>
            <div className="flex flex-col">
              <span className="font-extrabold text-lg tracking-tight text-zinc-950 leading-none flex items-center gap-1">
                LabhSaathi
                <span className="w-1.5 h-1.5 rounded-full bg-emerald-500" />
              </span>
              <span className="text-[10px] text-zinc-500 tracking-wider uppercase font-bold mt-0.5">
                Claim What&apos;s Yours
              </span>
            </div>
          </NavLink>

          {/* Desktop Navigation Links */}
          <nav aria-label="Primary" className="hidden md:block">
            <ul className="app-nav__links flex items-center gap-1.5 list-none m-0 p-0">
              {NAV_ITEMS.map((item) => (
                <li key={item.to}>
                  <NavLink
                    to={item.to}
                    className={({ isActive }) =>
                      `px-3 py-1.5 rounded-full text-xs font-bold transition-all ${
                        isActive
                          ? "bg-zinc-900 text-white shadow-xs"
                          : "text-zinc-600 hover:text-zinc-950 hover:bg-zinc-100"
                      }`
                    }
                  >
                    {item.label}
                  </NavLink>
                </li>
              ))}
            </ul>
          </nav>

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
          <div className="md:hidden border-t border-zinc-200 bg-white px-4 py-3 shadow-lg animate-slide-down-fade">
            <nav aria-label="Mobile Navigation">
              <ul className="flex flex-col gap-1 list-none p-0 m-0">
                <li>
                  <NavLink
                    to="/"
                    onClick={() => setMobileMenuOpen(false)}
                    className={({ isActive }) =>
                      `flex items-center gap-3 px-3 py-2.5 rounded-lg text-sm font-bold transition-colors ${
                        isActive ? "bg-zinc-900 text-white" : "text-zinc-700 hover:bg-zinc-100"
                      }`
                    }
                  >
                    <Home className="w-4 h-4" />
                    <span>Home</span>
                  </NavLink>
                </li>
                {NAV_ITEMS.map((item) => {
                  const Icon = item.icon;
                  return (
                    <li key={item.to}>
                      <NavLink
                        to={item.to}
                        onClick={() => setMobileMenuOpen(false)}
                        className={({ isActive }) =>
                          `flex items-center gap-3 px-3 py-2.5 rounded-lg text-sm font-bold transition-colors ${
                            isActive ? "bg-zinc-900 text-white" : "text-zinc-700 hover:bg-zinc-100"
                          }`
                        }
                      >
                        <Icon className="w-4 h-4" />
                        <span>{item.label}</span>
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
        <div className="container section max-w-6xl mx-auto px-3 sm:px-4 py-4 sm:py-6">{children}</div>
      </main>

      {/* High-Craft Minimal Footer */}
      <footer className="app-footer bg-white border-t border-zinc-200 text-xs text-zinc-500 mt-auto">
        <div className="max-w-6xl mx-auto px-4 py-8 flex flex-col md:flex-row items-start md:items-center justify-between gap-6">
          <div className="flex flex-col gap-1.5 max-w-md">
            <div className="flex items-center gap-2">
              <span className="font-bold text-zinc-900 text-sm">LabhSaathi</span>
              <span className="text-[10px] px-2 py-0.5 rounded-full bg-zinc-100 text-zinc-600 font-mono">
                v1.0.0 (PS5 Pilot)
              </span>
            </div>
            <p className="text-[11px] text-zinc-600 leading-relaxed">
              Independent civic-tech platform empowering college students in Telangana and India to discover public schemes, understand rules, and prepare documents.
            </p>
          </div>

          <div className="flex flex-wrap items-center gap-4 text-xs font-medium text-zinc-600">
            <a
              href="https://telanganaepass.cgg.gov.in"
              target="_blank"
              rel="noopener noreferrer"
              className="hover:text-zinc-950 inline-flex items-center gap-1 transition-colors"
            >
              Telangana ePASS <ExternalLink className="w-3 h-3 text-zinc-500" />
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
              href="https://ts.meeseva.telangana.gov.in"
              target="_blank"
              rel="noopener noreferrer"
              className="hover:text-zinc-950 inline-flex items-center gap-1 transition-colors"
            >
              MeeSeva Portal <ExternalLink className="w-3 h-3 text-zinc-500" />
            </a>
          </div>
        </div>

        <div className="border-t border-zinc-100 bg-zinc-50 py-3 text-center text-xs text-zinc-600 px-4 font-medium">
          Independent guidance. LabhSaathi does not approve applications or guarantee benefits. Never pay middlemen for official scholarships.
        </div>
      </footer>
    </div>
  );
}
