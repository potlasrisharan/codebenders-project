# P1 Plan — Application shell and design system

Status: PLANNED, awaiting owner approval to execute. P0 was approved with proposed defaults.

Goal (from PHASE_CONTROL.md): a cohesive, accessible shell without eligibility logic.

## Files (workspace root)
- Config (exists): package.json, tsconfig.json, vite.config.ts, eslint.config.js, index.html, .gitignore, tests/setup.ts.
- Tokens and styles (exist): src/styles/tokens.css, base.css, layout.css, components.css, index.css. Source of truth: docs/architecture/DESIGN_SYSTEM.md.
- UI primitives (exist): src/components/ui/Button.tsx, TextField.tsx, Card.tsx, Skeleton.tsx, Alert.tsx, EmptyState.tsx, StatusChip.tsx.
- App shell (to write): src/components/layout/AppLayout.tsx, src/routes/PlaceholderPage.tsx, src/routes/Routes.tsx, src/app/App.tsx, src/main.tsx.
- Tests (to write): tests/unit/status-chip.test.tsx (the four fixed labels render with text), tests/unit/routes.test.tsx (each placeholder route renders its heading without throwing).

## Tasks
1. Shell with primary navigation and footer independence notice.
2. Landing page explaining independent guidance and limitations (no claims of approval or guarantee).
3. Route placeholders: /intake, /matches, /checklist, /tracker, /admin/review, plus landing and not-found.
4. Reusable primitives only; no duplicated tokens.
5. Mobile-first layout; collapse below 768px; keyboard focus visible; skip link target #main.

## Out of scope
Real profile processing, scheme data, AI, eligibility, Cloudflare configuration, emojis, external fonts or images.

## Acceptance checks (each needs recorded output)
- npm install completes; npm run typecheck exits 0.
- npm run lint exits 0.
- npm test passes; route and label tests executed.
- npm run build exits 0.
- npm run preview serves the app; GET / returns HTML containing the root element.
- Grep shows no #000000, h-screen, or external font or image URLs in src/ or index.html.
- Visual check at 375px and 1280px widths is a manual item, marked NOT RUN unless a browser test is executed.

## Evidence
Command, exit code and last lines of output for each check, recorded in this plan or the P1 ledger.

## Rollback
Delete src/ app shell files and tests/unit; config and styles remain. No external resources touched.
