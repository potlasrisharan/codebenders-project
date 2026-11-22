from reportlab.lib import colors
from reportlab.lib.pagesizes import A4
from reportlab.lib.styles import getSampleStyleSheet, ParagraphStyle
from reportlab.lib.enums import TA_LEFT, TA_CENTER
from reportlab.lib.units import mm
from reportlab.platypus import SimpleDocTemplate, Paragraph, Spacer, Table, TableStyle, PageBreak, KeepTogether, HRFlowable
from reportlab.pdfbase import pdfmetrics
from reportlab.pdfbase.ttfonts import TTFont
from reportlab.lib.colors import HexColor
from pathlib import Path

ROOT = Path('/mnt/data/LabhSaathi_Agent_Harness')
OUT = ROOT / 'LabhSaathi_Phase_Control.pdf'

# Use a widely available Unicode font; all document content is ASCII-oriented for renderer consistency.
font_regular = '/usr/share/fonts/truetype/dejavu/DejaVuSans.ttf'
font_bold = '/usr/share/fonts/truetype/dejavu/DejaVuSans-Bold.ttf'
pdfmetrics.registerFont(TTFont('DV', font_regular))
pdfmetrics.registerFont(TTFont('DV-Bold', font_bold))

NAVY = HexColor('#152238')
NAVY2 = HexColor('#223550')
ORANGE = HexColor('#F97316')
TEAL = HexColor('#0F766E')
GREEN = HexColor('#15803D')
RED = HexColor('#B91C1C')
AMBER = HexColor('#B45309')
INK = HexColor('#243247')
MUTED = HexColor('#5B687A')
PALE = HexColor('#F3F6FA')
PALE_BLUE = HexColor('#EAF0F8')
PALE_ORANGE = HexColor('#FFF2E8')
PALE_GREEN = HexColor('#EAF6EF')
LINE = HexColor('#D7DFE8')
WHITE = colors.white

styles = getSampleStyleSheet()
styles.add(ParagraphStyle(name='CoverKicker', fontName='DV-Bold', fontSize=9, leading=12, textColor=ORANGE, spaceAfter=10, tracking=1.2))
styles.add(ParagraphStyle(name='CoverTitle', fontName='DV-Bold', fontSize=34, leading=39, textColor=WHITE, spaceAfter=12))
styles.add(ParagraphStyle(name='CoverSub', fontName='DV', fontSize=13, leading=19, textColor=HexColor('#DBE5F0'), spaceAfter=10))
styles.add(ParagraphStyle(name='H1x', fontName='DV-Bold', fontSize=21, leading=26, textColor=NAVY, spaceBefore=3, spaceAfter=9))
styles.add(ParagraphStyle(name='H2x', fontName='DV-Bold', fontSize=13, leading=17, textColor=NAVY2, spaceBefore=8, spaceAfter=5))
styles.add(ParagraphStyle(name='H3x', fontName='DV-Bold', fontSize=10, leading=13, textColor=TEAL, spaceBefore=5, spaceAfter=3))
styles.add(ParagraphStyle(name='Bodyx', fontName='DV', fontSize=8.3, leading=12, textColor=INK, spaceAfter=5))
styles.add(ParagraphStyle(name='Smallx', fontName='DV', fontSize=7.2, leading=10, textColor=MUTED, spaceAfter=3))
styles.add(ParagraphStyle(name='SmallBoldx', fontName='DV-Bold', fontSize=7.4, leading=10, textColor=INK, spaceAfter=2))
styles.add(ParagraphStyle(name='TableHeadx', fontName='DV-Bold', fontSize=7.5, leading=9, textColor=WHITE))
styles.add(ParagraphStyle(name='TableCellx', fontName='DV', fontSize=7.2, leading=9.5, textColor=INK))
styles.add(ParagraphStyle(name='TableCellBoldx', fontName='DV-Bold', fontSize=7.2, leading=9.5, textColor=NAVY))
styles.add(ParagraphStyle(name='PhaseBadge', fontName='DV-Bold', fontSize=8.5, leading=11, textColor=WHITE, alignment=TA_CENTER))
styles.add(ParagraphStyle(name='Calloutx', fontName='DV-Bold', fontSize=8.5, leading=12, textColor=NAVY, spaceAfter=1))
styles.add(ParagraphStyle(name='CenterSmall', fontName='DV', fontSize=7, leading=9, textColor=MUTED, alignment=TA_CENTER))

P = lambda txt, sty='Bodyx': Paragraph(txt, styles[sty])

phases = [
('P0','Workspace audit & harness baseline','Understand the actual Codebenders workspace before changing it.','Inspect repository and toolchain; map PS5 requirements to screens, APIs, data and tests; verify local run/test/build commands; record baseline failures; propose architecture and P1 plan.','Workspace inventory; stack/constraints; PS5 matrix; verified local commands or blockers; baseline failure list; architecture proposal; bounded P1 plan.','No app implementation, remote AI, bulk ingestion, Cloudflare provisioning or deployment.','Owner approves stack and architecture before P1.'),
('P1','Application shell & design system','Build a coherent, accessible responsive shell without eligibility logic.','Create app layout, navigation and tokens; reusable inputs/cards/status chips/alerts; landing explanation; route placeholders for intake, matches, details, checklist, tracker and admin; mobile and keyboard basics.','App starts locally; routes load; mobile/desktop layouts work; keyboard focus and labels visible; reusable design tokens; no regressions to existing features.','No real profile processing, scheme data, AI or rules.','Owner approves visual shell before P2.'),
('P2','Privacy boundary & Sensitive-ID Shield','Prevent sensitive identifiers reaching persistence, logs, analytics or AI.','Implement client and server boundary filters; detect Aadhaar-like/PAN-like patterns; redact/block before any side effect; safe warning/retry; inspect logs/telemetry/share path; create negative tests with storage/logger/AI mocks.','Formatted and compact test patterns blocked; benign text allowed; no raw blocked string reaches storage/logs/analytics/provider mocks; user receives explanation; false positives are described carefully; no ID fields requested.','No identity verification and no collection of identity numbers/documents.','Privacy boundary must pass before AI-backed intake or profile persistence.'),
('P3','Scheme data foundation & source governance','Establish trustworthy editable, versioned scheme records.','Create scheme/jurisdiction/version/source/rule-candidate/fee/document/step schemas; migrations and repositories; source verification states; review/publish flow; curate small pilot dataset; validation and duplicate checks.','Clean migrations; every active scheme has jurisdiction, source, verification date, version and review state; candidate extraction cannot self-publish; fee supports free/fee/unknown; history is inspectable.','No mass scraping, national completeness claims or AI autopublishing.','Owner reviews first curated scheme records before matching.'),
('P4','Conversational intake & profile review','Convert natural-language descriptions into minimal, correctable non-sensitive profiles.','Define attributes needed by verified rules; typed intake; structured extraction; adaptive questions; explicit I do not know; Why we ask this; review/edit step; shield before AI/storage.','Synthetic scenario extracts profile candidates; user can correct; unknown persists; every question has reason; no long compulsory form; shield runs before side effects.','Voice is deferred until typed flow is stable; no sensitive ID fields.','Owner approves profile schema and questions before P5.'),
('P5','Three-valued eligibility engine & golden tests','Make rule evaluation deterministic and explainable.','Implement true/false/unknown predicates and AND/OR/NOT; separate citizen unknowns from rule/source uncertainty; centralise four labels; retain predicate trace; build six synthetic personas; test forbidden wording.','Operators pass; unknown is not false; four labels only; rule/source uncertainty => Cannot tell yet; missing citizen facts => Need to confirm where appropriate; failed mandatory condition => Unlikely; Likely eligible only when all required conditions pass trusted rules.','No LLM eligibility decisions, What-If UI or inference of undocumented exceptions.','No scheme result flow ships before P5 approval.'),
('P6','Scheme discovery & Near-Match','Find relevant candidate schemes without confusing relevance with qualification.','Filter by user-selected Indian jurisdiction, coverage status and target group; add keyword search; optional semantic retrieval behind interface; dedupe; run canonical evaluator; rank with transparent signals; build Near-Match from evaluation traces.','Results stay in scope; fixed label on each; trace/source visible; semantic score cannot override rules; Near-Match reuses same engine; useful empty state.','No semantic similarity as proof of eligibility.','Owner approves discovery relevance before P7.'),
('P7','Documents, application guidance & Middleman Shield','Move from potential match to informed application preparation.','Generate mandatory/conditional/optional checklist from approved records; source-backed instructions; official portal links; fee states; scam warning; independent-product disclaimer.','No invented documents/steps; each step has source; fee statement follows evidence; scam warning appears on every detail page; no implication of government approval or privileged processing.','No invented alternative documents or unsupported fee-free claims.','Owner approves scheme-page public claims before P8.'),
('P8','Claim tracker, renewal calendar & WhatsApp','Make guidance actionable over time.','Save schemes and track stages; deadline records only when verified; academic-year renewal events; local reminder simulation; preview-first WhatsApp wa.me share using allow-listed public content.','No invented deadlines; renewal has academic year/source; share contains no personal or sensitive data; preview and user click required; tracker never implies portal submission.','No WhatsApp API or automatic message send.','Owner approves claim workflow before P9.'),
('P9','Unified Eligibility Action Graph','Expose eligibility reasoning and follow-through in one component.','One graph: Profile -> Scheme -> Conditions -> Documents -> Application -> Follow-up; use canonical traces and task status; clickable evidence nodes; accessible list fallback.','One graph only; every node reconciles to canonical state; source/verification and explanations available; unknown distinct; mobile fallback works.','Graph cannot calculate eligibility independently.','Owner approves signature graph before P10.'),
('P10','What-If & Scheme Change Radar','Demonstrate rule reuse and controlled change awareness.','Hypothetical non-sensitive profile changes; same rule engine; before/after trace; preserve original profile; compare controlled scheme versions; identify prior runs for reassessment.','Simulator calls canonical engine; hypothetical clearly marked; saved profile unchanged unless confirmed; rule diff has evidence; prior results are flagged, not silently overwritten.','Do not claim live government monitoring when using demo changes.','Owner approves differentiators before P11.'),
('P11','Demo hardening & PS5 acceptance','Make the product reliable, honest and judge-ready.','Run PS5 matrix, test suite, typecheck/lint/build; accessibility and responsive review; verify sources/fees/deadlines; run six persona journeys; privacy audit; demo script and business-model slide.','All P0 requirements pass; six personas pass; no critical privacy issue; sources and dates visible; no invented fees/deadlines; no forbidden wording; repeatable local demo; monetisation clearly labelled as hypothesis.','Freeze new P1/P2 features after acceptance unless owner reopens scope.','Owner accepts hackathon build.'),
('P12','Cloudflare migration (separate approval)','Replace local adapters with Cloudflare-backed services without rewriting domain logic.','Audit interfaces and schema; confirm account approval; create D1 migrations, Workers bindings, R2 policies; optional Vectorize/Workers AI/Queues/Workflows when justified; secrets, staging, tests, rollback and cost controls.','Explicit approval recorded; no committed secrets; D1 migrations verified; eligibility/privacy golden tests pass on cloud adapters; private data protected; source terms observed; rollback documented.','No remote resource creation before this phase and explicit approval.','Separate written approval required for provisioning and production deployment.'),
]

story=[]
# Cover panel
cover = Table([
    [P('PRODUCT DELIVERY CONTROL SYSTEM  /  VERSION 1.0','CoverKicker')],
    [P('LabhSaathi','CoverTitle')],
    [P('Phase Control & Release Gates','CoverSub')],
    [P('A controlled, feature-by-feature build plan for the ACE BUILDERS 2026 PS5 pilot. Local first. Evidence before completion. Human approval between phases.','CoverSub')],
    [Spacer(1,14)],
    [P('PILOT SCOPE','TableHeadx')],
    [P('National, state-aware product for users across India. Hackathon demo: low-income college students in Telangana with relevant Central and Telangana schemes. Show verified state/category coverage; do not claim nationwide completeness.','CoverSub')],
    [Spacer(1,20)],
    [P('DELIVERY RULE','TableHeadx')],
    [P('One active phase at a time. No automatic phase advancement. No Cloudflare deployment until P12 and explicit owner approval.','CoverSub')],
], colWidths=[165*mm])
cover.setStyle(TableStyle([
    ('BACKGROUND',(0,0),(-1,-1),NAVY),('BOX',(0,0),(-1,-1),0,NAVY),
    ('LEFTPADDING',(0,0),(-1,-1),18*mm),('RIGHTPADDING',(0,0),(-1,-1),18*mm),
    ('TOPPADDING',(0,0),(-1,0),20*mm),('BOTTOMPADDING',(0,-1),(-1,-1),20*mm),
]))
story += [Spacer(1,16*mm), cover, Spacer(1,10*mm), P('Prepared for the LabhSaathi lead architect agent in Codebenders Nexen. Companion source: PHASE_CONTROL.md.','CenterSmall'), PageBreak()]

story += [P('1. How phase control works','H1x'), P('The PRD defines what the product must do. This document controls when and how the agent may do it. A phase closes only after its acceptance criteria are evidenced and the product owner explicitly approves the gate.'),]
state_data = [[P('STATE','TableHeadx'),P('MEANING','TableHeadx'),P('AGENT PERMISSION','TableHeadx')],
              [P('NOT_STARTED','TableCellBoldx'),P('No work has begun.','TableCellx'),P('Inspect and plan only.','TableCellx')],
              [P('IN_PROGRESS','TableCellBoldx'),P('Owner approved this phase.','TableCellx'),P('Work inside the phase scope.','TableCellx')],
              [P('BLOCKED','TableCellBoldx'),P('Missing fact, source, permission or tool.','TableCellx'),P('Report blocker; do not guess.','TableCellx')],
              [P('DONE_PENDING_APPROVAL','TableCellBoldx'),P('Technical gate has evidence.','TableCellx'),P('Present checkpoint; wait.','TableCellx')],
              [P('APPROVED','TableCellBoldx'),P('Owner accepted the gate.','TableCellx'),P('May plan next phase.','TableCellx')]]
t=Table(state_data, colWidths=[38*mm,62*mm,65*mm], repeatRows=1)
t.setStyle(TableStyle([('BACKGROUND',(0,0),(-1,0),NAVY2),('GRID',(0,0),(-1,-1),0.4,LINE),('VALIGN',(0,0),(-1,-1),'TOP'),('ROWBACKGROUNDS',(0,1),(-1,-1),[WHITE,PALE]),('LEFTPADDING',(0,0),(-1,-1),7),('RIGHTPADDING',(0,0),(-1,-1),7),('TOPPADDING',(0,0),(-1,-1),6),('BOTTOMPADDING',(0,0),(-1,-1),6)]))
story += [t, Spacer(1,8), P('Global stop conditions','H2x')]
stops = [
'Sensitive identifiers could reach storage, logs, analytics or an AI provider.',
'A rule, fee, deadline, document requirement or portal URL lacks sufficient source evidence.',
'An official source conflicts with another and the conflict is unresolved.',
'The agent is about to provision or deploy Cloudflare without explicit approval.',
'A destructive edit, schema change or migration could affect existing user data.',
'Nexen credit use is unexpectedly high or an autonomous loop repeats work without progress.'
]
for s in stops: story.append(P('• '+s,'Bodyx'))
story += [Spacer(1,6), P('Always-on product safeguards','H2x'), P('The four citizen-facing labels are exactly: <b>Likely eligible</b>, <b>Need to confirm</b>, <b>Unlikely</b>, and <b>Can\'t tell yet</b>. The rule engine returns true/false/unknown. AI does not decide eligibility. The Sensitive-ID Shield runs before side effects at client and server boundaries. Fee and deadline claims require source evidence. WhatsApp shares are preview-first and exclude profile details.','Bodyx'), PageBreak()]

story += [P('2. Phase map','H1x'), P('Phases are deliberately ordered to establish trust and testability before advanced experiences. P0 through P11 are the local hackathon build. P12 is a later, separately approved Cloudflare migration.' )]
summary = [[P('PHASE','TableHeadx'),P('NAME','TableHeadx'),P('MAIN OUTPUT','TableHeadx'),P('GATE','TableHeadx')]]
for code,name,goal,tasks,accept,exclude,gate in phases:
    short = {
    'P0':'Workspace audit, stack baseline and requirement matrix','P1':'Responsive shell and design system','P2':'Sensitive-ID Shield and privacy boundary','P3':'Editable, versioned scheme data + source review','P4':'Adaptive intake and reviewed profile','P5':'Three-valued engine + fixed labels + golden tests','P6':'Jurisdiction-aware discovery + Near-Match','P7':'Checklist, application steps and Middleman Shield','P8':'Tracker, academic renewal and WhatsApp share','P9':'Unified Eligibility Action Graph','P10':'What-If and controlled Scheme Change Radar','P11':'PS5 acceptance and repeatable demo','P12':'Cloudflare adapters, migration and deployment controls'}[code]
    summary.append([P(code,'TableCellBoldx'),P(name,'TableCellx'),P(short,'TableCellx'),P(gate,'TableCellx')])
t=Table(summary, colWidths=[16*mm,43*mm,62*mm,44*mm], repeatRows=1)
t.setStyle(TableStyle([('BACKGROUND',(0,0),(-1,0),NAVY2),('GRID',(0,0),(-1,-1),0.35,LINE),('VALIGN',(0,0),(-1,-1),'TOP'),('ROWBACKGROUNDS',(0,1),(-1,-1),[WHITE,PALE]),('LEFTPADDING',(0,0),(-1,-1),5),('RIGHTPADDING',(0,0),(-1,-1),5),('TOPPADDING',(0,0),(-1,-1),5),('BOTTOMPADDING',(0,0),(-1,-1),5)]))
story += [t, Spacer(1,8), P('Priority rule','H2x'), P('Finish P0 PS5 requirements, privacy controls and golden tests before optional P1 polish or P2 expansion. If credits or time become constrained, defer future work first; do not weaken the safety or evidence gates.','Bodyx'), PageBreak()]

for idx, (code,name,goal,tasks,accept,exclude,gate) in enumerate(phases):
    story += [P(f'{code}  /  {name}','H1x'), P(goal,'Bodyx')]
    badge = Table([[P(code,'PhaseBadge'),P('PHASE OBJECTIVE','SmallBoldx'),P(goal,'Bodyx')]], colWidths=[18*mm,36*mm,111*mm])
    badge.setStyle(TableStyle([('BACKGROUND',(0,0),(0,0),ORANGE),('BACKGROUND',(1,0),(-1,0),PALE_ORANGE),('BOX',(0,0),(-1,-1),0.5,LINE),('VALIGN',(0,0),(-1,-1),'MIDDLE'),('LEFTPADDING',(0,0),(-1,-1),8),('RIGHTPADDING',(0,0),(-1,-1),8),('TOPPADDING',(0,0),(-1,-1),7),('BOTTOMPADDING',(0,0),(-1,-1),7)]))
    story += [badge, Spacer(1,7), P('Implementation checklist','H2x')]
    for task in tasks.split('; '):
        story.append(P('☐ '+task,'Bodyx'))
    story += [P('Acceptance criteria','H2x')]
    for criterion in accept.split('; '):
        story.append(P('☐ '+criterion,'Bodyx'))
    story += [Spacer(1,4)]
    ex = Table([[P('OUT OF SCOPE','SmallBoldx'),P(exclude,'Smallx')],[P('GATE','SmallBoldx'),P(gate,'Smallx')]], colWidths=[28*mm,137*mm])
    ex.setStyle(TableStyle([('BACKGROUND',(0,0),(0,-1),PALE_BLUE),('BOX',(0,0),(-1,-1),0.5,LINE),('INNERGRID',(0,0),(-1,-1),0.3,LINE),('VALIGN',(0,0),(-1,-1),'TOP'),('LEFTPADDING',(0,0),(-1,-1),7),('RIGHTPADDING',(0,0),(-1,-1),7),('TOPPADDING',(0,0),(-1,-1),6),('BOTTOMPADDING',(0,0),(-1,-1),6)]))
    story += [ex, Spacer(1,7), P('Evidence to attach to the phase ledger','H3x'), P('Record the exact test/build commands and their actual output, changed files, screenshots where UI changes, source/data verification evidence, privacy review, known limitations and actual Nexen credit usage if available.','Smallx')]
    if code == 'P2':
        call = Table([[P('P2 is a security gate: no AI-backed intake or profile persistence proceeds until the raw sensitive fixture is proven absent from every downstream mock.','Calloutx')]], colWidths=[165*mm])
        call.setStyle(TableStyle([('BACKGROUND',(0,0),(-1,-1),PALE_ORANGE),('BOX',(0,0),(-1,-1),0.7,ORANGE),('LEFTPADDING',(0,0),(-1,-1),9),('RIGHTPADDING',(0,0),(-1,-1),9),('TOPPADDING',(0,0),(-1,-1),8),('BOTTOMPADDING',(0,0),(-1,-1),8)]))
        story += [Spacer(1,5),call]
    if code == 'P5':
        call = Table([[P('P5 is the policy logic gate: all later discovery, Near-Match, What-If and graph views must use this same evaluator.','Calloutx')]], colWidths=[165*mm])
        call.setStyle(TableStyle([('BACKGROUND',(0,0),(-1,-1),PALE_GREEN),('BOX',(0,0),(-1,-1),0.7,GREEN),('LEFTPADDING',(0,0),(-1,-1),9),('RIGHTPADDING',(0,0),(-1,-1),9),('TOPPADDING',(0,0),(-1,-1),8),('BOTTOMPADDING',(0,0),(-1,-1),8)]))
        story += [Spacer(1,5),call]
    story += [PageBreak()]

story += [P('6. Feature-level task contract','H1x'), P('Every feature task must be small enough to plan, test and review independently. If it cannot be verified, it is not ready to implement.'),]
contract = [
('Feature ID / name','What exactly is being built?'),('PRD requirements','Which requirement IDs and phase scope apply?'),('User value','What citizen outcome changes?'),('In scope / out of scope','What is deliberately excluded?'),('Data/source dependencies','Which verified records, versions and providers are needed?'),('Files/modules','Which existing files are expected to change? Verify paths first.'),('Tests first','Which failing test will demonstrate the missing behavior?'),('Acceptance criteria','What observable result means done?'),('Privacy/security','What crosses storage, log, analytics, AI and share boundaries?'),('Verification','Exact commands/actions and actual results.'),('Rollback','How can the change be disabled or reversed safely?'),('Credit impact','Low/medium/high; record IDE-reported usage if visible.')]
ct = [[P('FIELD','TableHeadx'),P('REQUIRED DETAIL','TableHeadx')]] + [[P(a,'TableCellBoldx'),P(b,'TableCellx')] for a,b in contract]
t=Table(ct, colWidths=[43*mm,122*mm], repeatRows=1)
t.setStyle(TableStyle([('BACKGROUND',(0,0),(-1,0),NAVY2),('GRID',(0,0),(-1,-1),0.35,LINE),('VALIGN',(0,0),(-1,-1),'TOP'),('ROWBACKGROUNDS',(0,1),(-1,-1),[WHITE,PALE]),('LEFTPADDING',(0,0),(-1,-1),7),('RIGHTPADDING',(0,0),(-1,-1),7),('TOPPADDING',(0,0),(-1,-1),6),('BOTTOMPADDING',(0,0),(-1,-1),6)]))
story += [t, Spacer(1,8), P('7. Credit protection policy','H1x'), P('The product owner reported approximately 16 million Codebenders credits available. Treat the amount as finite and do not invent exact costs. The agent must record actual usage when Nexen exposes it.'),]
for x in [
'Use one lead agent by default; do not launch parallel agents on overlapping work.',
'Prefer local fixtures, deterministic scripts and cached outputs over remote AI calls.',
'Ask before bulk scheme ingestion, large embedding jobs, whole-codebase rewrites, long autonomous loops or Cloudflare provisioning.',
'If reserves become constrained, defer P2 and optional P1 first; protect P0, privacy and golden tests.',
'When a task repeats without progress, stop and diagnose rather than retrying blindly.'
]: story.append(P('• '+x,'Bodyx'))
story += [Spacer(1,6), P('8. Cloudflare migration guard','H1x'), P('P12 is deliberately separate from the local hackathon build. It may begin only after P11 is approved and the account owner explicitly approves provisioning/deployment. Use D1, R2, Workers, Vectorize, Workers AI, Queues and Workflows only when the use case and cost justify them. Run adapter parity tests and the complete privacy/eligibility golden suite after migration.','Bodyx'), PageBreak(), P('9. Final release checklist','H1x')]
for x in [
'All five PS5 must-haves have a working, tested journey.',
'Every published scheme has an official source, verification state and rule version.',
'Sensitive-ID Shield blocks before every side effect at client and server boundaries.',
'Only the four fixed likelihood labels appear as result statuses.',
'Three-valued engine and six synthetic golden personas pass.',
'Fee state is source-backed; unknown fees are not called free.',
'Deadlines/renewals are verified or explicitly unverified.',
'WhatsApp share is preview-first and excludes personal/sensitive data.',
'Unified graph, What-If and Change Radar use canonical data/rule state.',
'Local demo is repeatable; limitations and proposed business model are disclosed.'
]: story.append(P('☐ '+x,'Bodyx'))
story += [Spacer(1,8), P('Phase gate sign-off','H2x')]
sign = Table([[P('CHECKPOINT','TableHeadx'),P('OWNER DECISION','TableHeadx'),P('DATE / NOTES','TableHeadx')],[P('P0 baseline','TableCellBoldx'),P('APPROVED / NEEDS CHANGES','TableCellx'),P('____________________________','TableCellx')],[P('P11 hackathon release','TableCellBoldx'),P('APPROVED / NEEDS CHANGES','TableCellx'),P('____________________________','TableCellx')],[P('P12 Cloudflare provisioning','TableCellBoldx'),P('APPROVED / NOT APPROVED','TableCellx'),P('____________________________','TableCellx')]], colWidths=[42*mm,61*mm,62*mm])
sign.setStyle(TableStyle([('BACKGROUND',(0,0),(-1,0),NAVY2),('GRID',(0,0),(-1,-1),0.4,LINE),('ROWBACKGROUNDS',(0,1),(-1,-1),[WHITE,PALE]),('VALIGN',(0,0),(-1,-1),'MIDDLE'),('LEFTPADDING',(0,0),(-1,-1),7),('RIGHTPADDING',(0,0),(-1,-1),7),('TOPPADDING',(0,0),(-1,-1),8),('BOTTOMPADDING',(0,0),(-1,-1),8)]))
story += [sign, Spacer(1,8), HRFlowable(width='100%', thickness=0.8, color=LINE), Spacer(1,6), P('Companion files: `PRD_LabhSaathi.md`, `AGENTS.md`, `agent/BOOTSTRAP_PROMPT.md`, `agent/SKILL_REGISTRY.md` and `agent/PHASE_LEDGER_TEMPLATE.md`. Use the Markdown phase control file as the editable source of truth; this PDF is the printable control copy.','Smallx')]

def header_footer(canvas, doc):
    canvas.saveState()
    w,h = A4
    if doc.page > 1:
        canvas.setFillColor(NAVY)
        canvas.rect(0, h-13*mm, w, 13*mm, fill=1, stroke=0)
        canvas.setFont('DV-Bold', 7.5)
        canvas.setFillColor(WHITE)
        canvas.drawString(18*mm, h-8.5*mm, 'LABHSAATHI  /  PHASE CONTROL')
        canvas.setFont('DV', 7)
        canvas.setFillColor(HexColor('#D7E2EF'))
        canvas.drawRightString(w-18*mm, h-8.5*mm, 'LOCAL-FIRST  |  OWNER-GATED')
    canvas.setStrokeColor(LINE)
    canvas.setLineWidth(0.5)
    canvas.line(18*mm, 14*mm, w-18*mm, 14*mm)
    canvas.setFont('DV', 7)
    canvas.setFillColor(MUTED)
    canvas.drawString(18*mm, 9*mm, 'Version 1.0  |  22 Nov 2026  |  Internal project control')
    canvas.drawRightString(w-18*mm, 9*mm, f'Page {doc.page}')
    canvas.restoreState()


doc = SimpleDocTemplate(str(OUT), pagesize=A4, rightMargin=18*mm, leftMargin=18*mm, topMargin=20*mm, bottomMargin=20*mm, title='LabhSaathi Phase Control and Release Gates', author='LabhSaathi Project Team', subject='Phase-by-phase delivery control for ACE BUILDERS PS5')
doc.build(story, onFirstPage=header_footer, onLaterPages=header_footer)
print(OUT)
