import json, collections
REQ = ["id","slug","name","category","jurisdiction","state","rules","documents","applicationSteps"]
files = ["scripts/data/central-schemes.json", "scripts/data/state-schemes.json"]
counts = {}
ids = collections.Counter()
missing = []
for f in files:
    data = json.load(open(f))
    counts[f] = len(data)
    for i, rec in enumerate(data):
        ids[rec.get("id")] += 1
        m = [k for k in REQ if k not in rec]
        if m:
            missing.append((f, i, rec.get("id"), m))
print("counts:", counts, "total:", sum(counts.values()))
dups = {k: v for k, v in ids.items() if v > 1}
print("duplicate ids:", dups if dups else "none")
print("records missing fields:", len(missing))
for x in missing[:20]:
    print("  ", x)
