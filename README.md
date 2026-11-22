# LabhSaathi — Beneficiary Navigation & Claim Readiness Platform

> **Tagline:** Know your benefits. Understand your rights. Take action.  
> **Problem Statement 5:** Citizens and Public Services — *Claim What's Yours* (ACE BUILDERS 2026).  
> **Architecture:** Local-first React 19 + TypeScript frontend with a portable Hono `/api/v1` backend, three-valued deterministic eligibility, and Middleman Shield.

---

## 1. Quick Start

```bash
# 1. Install dependencies
npm install

# 2. Run local development (serves React frontend and Hono /api/v1 backend)
npm run dev

# 3. Production build
npm run build

# 4. Preview built app locally (http://localhost:4173)
npm run preview -- --port 4173 --strictPort
```

---

## 2. Automated Quality Gates & Verification

```bash
# Typecheck (0 errors)
npm run typecheck

# Linter (0 errors)
npm run lint

# Unit, Golden & Integration Test Suite (80 tests in 12 files)
npm test

# Full End-to-End Headless Browser Journey (Playwright Chromium)
npm run test:e2e
```

---

## 3. End-to-End Architecture & Core Features

```
├── src/
│   ├── components/
│   │   ├── graph/         # Unified Eligibility Action Graph (Signature P9 component)
│   │   ├── layout/        # Responsive AppLayout with mobile navigation
│   │   ├── privacy/       # Sensitive-ID Shield live warning banners
│   │   ├── scheme/        # Middleman Shield card with fee transparency
│   │   ├── share/         # WhatsApp preview-first sharing modal
│   │   └── ui/            # StatusChip, Alert, Button, Card, TextField, EmptyState
│   ├── core/
│   │   ├── data/          # Verified Government datasets (ePASS, NSP, AICTE), Zod schemas, repository
│   │   ├── discovery/     # Multi-criteria discovery & Near-Match diagnosis
│   │   ├── engine/        # Kleene 3-valued deterministic eligibility evaluator (4 fixed labels)
│   │   ├── privacy/       # Sensitive-ID Shield (Aadhaar & PAN regex masking)
│   │   ├── profile/       # Citizen Profile, Telugu & English NLP parser, 6 Golden demo personas
│   │   ├── simulator/     # What-If scenario simulation & Scheme Change Radar version diffs
│   │   └── tracker/       # Claim lifecycle stages & Academic-Year Renewal Calendar
│   └── routes/            # Intake, Matches, SchemeDetail, Checklist, Tracker, AdminReview, Landing
└── worker/                # Hono API Backend (/api/v1)
    ├── index.ts           # Hono root app with CORS & Sensitive-ID Shield middleware
    ├── middleware/        # Boundary protection preventing sensitive ID ingest
    └── routes/            # /schemes, /intake, /eligibility, /simulator
```

The catalog contains 213 verified schemes (103 central, 110 state); the D1 seed holds 220 unique schemes including 8 core records.

---

## 4. PS5 Capabilities & Guardrails Compliance

1. **Plain-Language Input:** Typed or regional input (English & Telugu keywords/script) extracted into non-sensitive profile attributes without long static forms (`/intake`).
2. **Three-Valued Eligibility Matching:** Purely deterministic rule engine (`true`, `false`, `unknown`) with four fixed public labels (`Likely eligible`, `Need to confirm`, `Unlikely`, `Can't tell yet`). Zero hallucinated outcomes.
3. **Personalised Document Checklist & Steps:** Sourced issuing authorities (MeeSeva, Principal, Bank) and sequential application steps (`/checklist`, `/scheme/:id`).
4. **Middleman Shield & Fee Transparency:** Explicit fee states (`free_verified` / `fee_verified` / `unknown`) with prominent warnings against unapproved agents and fraudulent fees.
5. **Application Tracking & Renewal Calendar:** Application stages (`Preparing` → `Ready` → `Applied` → `Verifying` → `Disbursed`) and verified academic-year renewal windows (`/tracker`).
6. **Authoritative Sources:** Every scheme links to its official department portal (`telanganaepass.cgg.gov.in`, `scholarships.gov.in`, `aicte-india.org`) and displays its last-verified date.
7. **Sensitive-ID Shield:** Client and backend boundary active inspection immediately flags and redacts 12-digit Aadhaar patterns and PAN cards. No sensitive numbers are ever stored, logged, or shared.
8. **Synthetic Golden Personas:** Tested with 6 synthetic student personas covering the target low-income college student cohort in Telangana.

---

## 5. Independent Disclaimer

LabhSaathi is an independent public service guidance and navigation platform. It does not approve, process, or guarantee government benefits. All government scholarship applications must be submitted directly through official government portals.
