# P1 accessibility checklist (automated)

## Method

- Script: `scripts/check-p1-a11y.mjs`, run against `vite preview`.
- Viewports: 390x844 and 1440x900.
- Routes (7): `/`, `/intake`, `/matches`, `/scheme/test`, `/checklist`, `/tracker`, `/admin-review`.
- Evidence file: `docs/evidence/P1/a11y-report.json`.
- Result: 14 of 14 PASS (7 routes x 2 viewports).

## Results

| Check | Result | Note |
|---|---|---|
| htmlLang | PASS | `lang` set, value `en` |
| Single h1 per route | PASS | One h1 on each route |
| Skip link is first Tab stop and targets `#main-content` | PASS | Skip link is the first focusable element |
| Skip target is a `main` element | PASS | `#main-content` is a `main` element |
| Skip link moves focus into main | PASS | Focus lands inside `main` after activation |
| Visible focus outline on nav link | PASS | 2px solid outline |
| Unlabelled form controls | 0 | No unlabelled controls found |
| Unnamed links/buttons | 0 | No unnamed links or buttons found |
| Landmarks: header, nav, main, footer | PASS | All four landmarks present |

Note on tabOrder: the tab-order sample is recorded in `docs/evidence/P1/a11y-report.json`.

## Not covered by this automated check

The following are NOT TESTED by this check:

- **Manual screen-reader testing** — NOT TESTED.
- **Colour contrast ratios** — NOT TESTED.
- **Reflow at zoom** — NOT TESTED.
- **Full keyboard path through forms** — NOT TESTED. There are no forms in P1.
- **Reading order review by a human** — NOT TESTED.

## Report note

The a11y report JSON (`docs/evidence/P1/a11y-report.json`) was partly truncated in tool output during review. The PASS lines were confirmed by the script's own exit code 0 and output of 14 PASS lines.
