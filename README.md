# LabhSaathi (P1 app shell)

## Start locally
1. `npm install`
2. Start the dev server: `npm run dev`
3. Build: `npm run build`
4. Preview the built app: `npm run preview -- --port 4173 --strictPort` (serves at http://localhost:4173)

## Checks
- `npm test`
- `npx tsc --noEmit`
- `npm run lint`
- `npm run build`

## Browser evidence (preview server must be running)
- `node scripts/capture-p1.mjs` writes screenshots to docs/evidence/P1/
- `node scripts/check-p1-a11y.mjs` writes docs/evidence/P1/a11y-report.json

## Notes
Independent guidance only. Not an application, an approval, or official advice. Uses synthetic profiles and sample schemes.
