import type { ReactNode } from "react";
import { NavLink } from "react-router-dom";

const NAV_ITEMS = [
  { to: "/intake", label: "Intake" },
  { to: "/matches", label: "Matches" },
  { to: "/checklist", label: "Checklist" },
  { to: "/tracker", label: "Tracker" },
  { to: "/admin-review", label: "Admin review" },
] as const;

export function AppLayout({ children }: { children: ReactNode }) {
  return (
    <div className="app-root">
      <a href="#main-content" className="skip-link">
        Skip to main content
      </a>
      <header className="app-header">
        <div className="container app-nav">
          <NavLink to="/" className="brand">
            LabhSaathi
          </NavLink>
          <nav aria-label="Primary">
            <ul className="app-nav__links">
              {NAV_ITEMS.map((item) => (
                <li key={item.to}>
                  <NavLink to={item.to}>{item.label}</NavLink>
                </li>
              ))}
            </ul>
          </nav>
        </div>
      </header>
      <main id="main-content" tabIndex={-1} className="page-fade">
        <div className="container section">{children}</div>
      </main>
      <footer className="app-footer">
        <div className="container app-nav">
          <p className="label">
            Independent guidance. LabhSaathi does not approve applications or guarantee benefits. Sample data only.
          </p>
        </div>
      </footer>
    </div>
  );
}
