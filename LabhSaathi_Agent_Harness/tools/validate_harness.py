from pathlib import Path
import json, re, sys
try:
    import yaml
except Exception as e:
    print('PyYAML unavailable:', e)
    sys.exit(1)
root = Path(__file__).resolve().parents[1]
errors=[]
skill_files=sorted((root/'skills').glob('*/SKILL.md'))
seen=set()
for f in skill_files:
    s=f.read_text(encoding='utf-8')
    if not s.startswith('---\n'):
        errors.append(f'{f}: missing YAML frontmatter')
        continue
    parts=s.split('---',2)
    if len(parts)<3:
        errors.append(f'{f}: malformed frontmatter')
        continue
    try: meta=yaml.safe_load(parts[1]) or {}
    except Exception as e:
        errors.append(f'{f}: invalid YAML: {e}')
        continue
    expected=f.parent.name
    if meta.get('name') != expected:
        errors.append(f'{f}: name mismatch {meta.get("name")} != {expected}')
    if not meta.get('description'):
        errors.append(f'{f}: empty description')
    if len(str(meta.get('description',''))) > 1024:
        errors.append(f'{f}: description > 1024 chars')
    if len(s.splitlines()) > 500:
        errors.append(f'{f}: exceeds 500 lines')
    if expected in seen:
        errors.append(f'duplicate skill {expected}')
    seen.add(expected)

registry=(root/'agent/SKILL_REGISTRY.md').read_text(encoding='utf-8')
for name in sorted(seen):
    if f'`{name}`' not in registry:
        errors.append(f'{name}: absent from skill registry')

evals=json.loads((root/'evals/skill-evals.json').read_text(encoding='utf-8'))
eval_names={x['skill_name'] for x in evals['skills']}
if eval_names != seen:
    errors.append(f'eval names mismatch: missing={sorted(seen-eval_names)} extra={sorted(eval_names-seen)}')
for item in evals['skills']:
    if len(item.get('evals',[])) < 2:
        errors.append(f'{item.get("skill_name")}: fewer than 2 eval prompts')

required_files=['AGENTS.md','PS5_REQUIREMENTS.md','PRD_LabhSaathi.md','PHASE_CONTROL.md','LabhSaathi_Phase_Control.pdf','README.md','agent/NEXEN_SYSTEM_PROMPT.md','agent/BOOTSTRAP_PROMPT.md','agent/SKILL_REGISTRY.md','agent/INSTALLING_IN_NEXEN.md']
for f in required_files:
    if not (root/f).exists(): errors.append(f'missing required file: {f}')

prd=(root/'PRD_LabhSaathi.md').read_text(encoding='utf-8')
for token in ['FR-SEC-01','FR-ELIG-01','FR-TRUST-01','FR-TRACK-05','FR-SHARE-01','FR-GRAPH-01','P12','Likely eligible','Need to confirm','Unlikely',"Can't tell yet"]:
    if token not in prd: errors.append(f'PRD missing {token}')
phase=(root/'PHASE_CONTROL.md').read_text(encoding='utf-8')
for p in range(13):
    if f'P{p} —' not in phase and f'P{p} —' not in phase:
        errors.append(f'phase control missing P{p}')

all_text='\n'.join(p.read_text(encoding='utf-8',errors='ignore') for p in root.rglob('*.md'))
if 'Pasted text(20261121-202306).txt' in all_text:
    errors.append('stray pasted-text file reference found')

try:
    from pypdf import PdfReader
    pages=len(PdfReader(str(root/'LabhSaathi_Phase_Control.pdf')).pages)
    if pages < 10: errors.append(f'phase control PDF unexpectedly short: {pages} pages')
except Exception as e:
    pages='not checked: '+str(e)

print(f'Skills: {len(skill_files)}')
print(f'Initial eval prompts: {sum(len(x.get("evals",[])) for x in evals["skills"])}')
print(f'Phase control PDF pages: {pages}')
print(f'Required files checked: {len(required_files)}')
if errors:
    print('\nVALIDATION ERRORS:')
    for x in errors: print('-',x)
    sys.exit(1)
print('HARNESS VALIDATION: PASS')
