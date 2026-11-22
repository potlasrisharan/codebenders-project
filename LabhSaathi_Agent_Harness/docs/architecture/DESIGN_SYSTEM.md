# LabhSaathi Design System - "Exaggerated Minimalism"

**Status:** Approved visual direction (product owner). Tokens are implemented as CSS custom properties in `src/styles` during P1, not in P0.
**Scope:** Visual identity, colour, status chips, typography, layout, components, motion, accessibility and acceptance checks.

---

## 1. Personality

- Ultra-clean, spacious, confident, bold and editorial.
- Black-and-white dominant, with oversized type and generous negative space.
- Restrained layouts, high contrast, minimal decoration.
- Premium SaaS with the trustworthy character of a public service.
- NOT a generic government portal and NOT a generic AI dashboard.

---

## 2. Colour

### 2.1 Core palette

| Token | Hex | Use |
|---|---|---|
| `--color-text` | `#1A1A1A` | Charcoal. Primary text and primary button fill. |
| `--color-surface` | `#FFFFFF` | Page and card surface. |
| `--color-surface-muted` | `#F5F5F5` | Muted surface: section bands, neutral chips, skeletons. |
| `--color-border` | `#D4D4D4` | Decorative card and divider borders. |
| `--color-text-secondary` | `#5C5C5C` | Secondary text, helper text, input borders. |
| `--color-accent` | `#2F4A6D` | Single brand accent (see 2.3). |

**Rule:** never `#000000` for any rendered surface or text. Pure black is forbidden, including shadows used as text colour.

### 2.2 WCAG contrast (computed from sRGB relative luminance)

Method: relative luminance per WCAG 2.x; ratio = (L_lighter + 0.05) / (L_darker + 0.05).

| Foreground | Background | Ratio | Result |
|---|---|---|---|
| `#1A1A1A` charcoal | `#FFFFFF` | **17.42:1** | Passes AA and AAA for body text. |
| `#5C5C5C` secondary | `#FFFFFF` | **6.69:1** | Passes AA for body text (4.5:1 required). |
| `#2F4A6D` accent (links) | `#FFFFFF` | **9.05:1** | Passes AA for body-size links. |
| `#1A1A1A` charcoal | `#F5F5F5` muted | **15.98:1** | Passes. |
| `#5C5C5C` secondary | `#F5F5F5` muted | **6.13:1** | Passes. |
| `#FFFFFF` on `#1A1A1A` (primary button) | - | **17.42:1** | Passes. |
| `#D4D4D4` border | `#FFFFFF` | **1.48:1** | NOT a text colour. Fails the 3:1 non-text contrast if used as the only input boundary. |

**Body text requirement (4.5:1) is met** by charcoal and by secondary text on white and on the muted surface.

**Input boundary rule (consequence of the table):** `#D4D4D4` is acceptable only for decorative card and divider borders. Form input borders use `#5C5C5C` (6.69:1 on white), which meets the 3:1 non-text contrast for component boundaries (WCAG 1.4.11).

### 2.3 Accent `#2F4A6D`

- Saturation: HSL saturation about 40% (below the 80% ceiling). Lightness about 31%.
- Contrast on white: 9.05:1.
- **Permitted uses (only these):**
  1. Keyboard focus ring (2px solid, offset 2px).
  2. Text links and inline link underlines.
  3. One emphasis mark per screen, such as the single primary heading underline or a single highlighted word in a hero statement.
- **Forbidden uses:**
  - Filled buttons (primary buttons stay charcoal).
  - Status chips, status icons or result colouring (statuses use charcoal, grey and icons only).
  - Backgrounds, gradients, section bands or large fills.
  - Decorative icons, dividers or illustrations.
  - Any second accent colour.

### 2.4 Forbidden colour choices

- No green-and-gold palette.
- No decorative gradients of any kind.
- No `#000000`.
- No additional brand colours beyond the single accent.

---

## 3. Status presentation

### 3.1 The four fixed result labels

These are the only citizen-facing eligibility statuses (ADR-003; AGENTS.md). Each label is shown with an icon AND text. Colour is never the only signal.

| Label (exact text) | Icon (Lucide) | Meaning in product copy |
|---|---|---|
| `Likely eligible` | `circle-check` | Required conditions are met on trusted current rules. Not a guarantee. |
| `Need to confirm` | `circle-help` (current Lucide name `circle-question-mark`) | Some citizen information is unknown and the rule is sound. |
| `Unlikely` | `circle-x` | A mandatory condition is not met. Explanation shown. |
| `Can't tell yet` | `clock` | Source or rule uncertainty. Not a judgement about the citizen. |

Never show a bare `eligible`, `guaranteed` or `approved` as a result. Label strings are centralised (P5).

### 3.2 Restrained chip colours and contrast

| Chip | Background | Text / icon | Border | Contrast (text on background) |
|---|---|---|---|---|
| Likely eligible | `#1A1A1A` | `#FFFFFF` | none | 17.42:1 |
| Need to confirm | `#F5F5F5` | `#1A1A1A` | `#D4D4D4` | 15.98:1 |
| Unlikely | `#FFFFFF` | `#5C5C5C` | `#5C5C5C` 1px | 6.69:1 |
| Can't tell yet | `#F5F5F5` | `#5C5C5C` | `#D4D4D4` | 6.13:1 |

Chips use only neutrals. Differentiation comes from the icon and the text label, not hue.

### 3.3 Tracker stages

- Tracker stages (preparing, ready to apply, applied, follow-up, completed/closed) use neutral text-labelled chips.
- Chip style: background `#F5F5F5`, text `#1A1A1A` (15.98:1), border `#D4D4D4`, optional text-only icon.
- Stages carry no colour semantics. The label text is the signal.

---

## 4. Typography

- **UI font stack:** `-apple-system, BlinkMacSystemFont, "Segoe UI", sans-serif`.
- **Identifiers and technical metadata** (scheme IDs, rule IDs, version strings, dates in source records): JetBrains Mono, self-hosted under the project's own assets. No external CDN, no third-party font request.
- **Hero display:** `clamp(2.5rem, 5vw, 4rem)`, tight display tracking.
- **Selective editorial statements:** up to `clamp(3rem, 10vw, 12rem)`. Use sparingly, one per landing page, never inside dense screens.
- **H1:** 2.25rem, weight 700.
- **H2:** 1.5rem.
- **Body:** 1rem, line-height 1.6.
- **Small:** 0.875rem.
- **Labels and eyebrows:** 0.75rem, weight 500, uppercase or compact, with slight letter-spacing.
- **Line length:** controlled, about 60-75 characters for body copy (`max-width: 65ch`).

---

## 5. Layout

- **Grid:** CSS Grid is the primary layout system. Flexbox is for small inline alignment only.
- **Max width:** 1280px, centred.
- **Side padding:** 1.5rem, responsive (reduces on small screens).
- **Spacing base:** 8px scale (8, 16, 24, 32, 48, 64...).
- **Section gaps:** `clamp(4rem, 8vw, 8rem)`.
- **Landing hero:** split layout, copy on the left, product preview on the right.
- **Feature sections:** alternating zig-zag (image or preview left, then right). No row of three equal feature columns.
- **Breakpoint:** collapse to a single column below 768px.
- **No horizontal overflow** at any supported width.
- **Viewport height:** `min-height: 100dvh`. Never `h-screen` (`100vh`), which breaks on mobile browsers.
- **Whitespace over cards:** prefer spacing and typographic hierarchy to boxed containers.

---

## 6. Components

### 6.1 Buttons
- Shape: 8px radius.
- Primary: charcoal `#1A1A1A` fill, white `#FFFFFF` text, weight 600.
- Secondary: outlined, 1.5px border in `#5C5C5C`, charcoal text, transparent or white fill.
- Focus: visible 2px accent ring (see section 8).
- Minimum touch target: 44px height.

### 6.2 Inputs
- Label always visible above the field. No placeholder-only labels.
- Border: 1px `#5C5C5C` (see 2.2 input boundary rule).
- Visible focus ring (2px accent).
- Error message below the field, in text, with an icon. Never colour alone.
- Helper text in `#5C5C5C`.
- Each intake question shows a "Why we ask this" line and an explicit "I don't know" option (P4).

### 6.3 Cards
- Radius: 8px.
- Border: subtle, 1px `#D4D4D4`.
- Shadow: no larger than `0 2px 8px rgba(0,0,0,0.08)`.
- Background: white.

### 6.4 Loading and skeletons
- Skeletons match the final dimensions of the content they replace.
- No circular spinners.

### 6.5 Empty states
- One Lucide or Heroicons icon, a short explanation, and one helpful next action.

### 6.6 Icons and content
- Icons: Lucide or Heroicons only.
- No emojis in product UI.
- No lorem ipsum. No invented claims, fees, deadlines or benefit amounts.
- Synthetic sample data is labelled as sample wherever it appears.
- Inline SVG or local assets only. No external image or icon CDN.

---

## 7. Motion

- **Entry:** opacity 0 to 1 plus translateY 16px to 0, about 420ms, ease-out.
- **List stagger:** about 80ms between items.
- **Hover:** about 200ms.
- **Page fade:** about 200ms.
- **Animate only `transform` and `opacity`.** No layout-animating properties (width, height, top, left, margin).
- **No parallax.**
- **`prefers-reduced-motion: reduce`:** disables entry, stagger and page fade, and keeps only instant state changes or a short opacity-only transition under 100ms.

---

## 8. Accessibility

- Visible keyboard focus on every interactive element: 2px accent (`#2F4A6D`) ring, offset 2px, never removed.
- Labels on every form control, programmatically associated.
- No colour-only meaning anywhere. Each status has icon plus text.
- Comfortable touch targets, minimum 44px.
- Text contrast meets 4.5:1 for body text (section 2.2).
- Non-text component boundaries meet 3:1 (section 2.2, input boundary rule).
- Motion respects reduced-motion preference (section 7).
- Graph and dense views have a list or linear fallback (P9).

---

## 9. Visual acceptance checklist

- [ ] Homepage reads as premium editorial SaaS: oversized hero type, generous negative space, charcoal and white dominant.
- [ ] Internal screens keep the same identity, while dense eligibility and document information stays scannable (clear headings, short line length, dividers over boxes).
- [ ] Whitespace is preferred over cards; cards are used only where grouping is needed.
- [ ] No `#000000` anywhere on rendered surfaces or text.
- [ ] Accent used only in the permitted places (section 2.3).
- [ ] Four result labels show icon plus text; no colour-only signal.
- [ ] No gradients, no green-and-gold, no emojis.
- [ ] No horizontal overflow at mobile width; layout collapses below 768px.
- [ ] Reduced-motion preference respected.
- [ ] Owner visual review recorded at the P1 gate.

---

## 10. Implementation note

Tokens (colour, type scale, spacing, radius, shadow, motion durations) are defined as CSS custom properties in `src/styles` during P1. Components consume tokens; no component hard-codes a hex value that is not a token. This document is the source for those values until P1 is approved.
