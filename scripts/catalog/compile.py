#!/usr/bin/env python3
"""
scripts/catalog/compile.py
Compiles, validates, and merges all Central and State schemes into final production JSON datasets.
"""

import json
import os
import sys

from .central_data import CENTRAL_SCHEMES
from .central_data_2 import CENTRAL_SCHEMES_2
from .central_data_3 import CENTRAL_SCHEMES_3
from .state_data import STATE_SCHEMES_PART1
from .state_data_2 import STATE_SCHEMES_PART2
from .state_data_3 import STATE_SCHEMES_PART3
from .state_data_4 import STATE_SCHEMES_PART4

project_root = os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
data_dir = os.path.join(project_root, "scripts", "data")
os.makedirs(data_dir, exist_ok=True)

central_json_path = os.path.join(data_dir, "central-schemes.json")
state_json_path = os.path.join(data_dir, "state-schemes.json")

def load_json(path):
    if os.path.exists(path):
        with open(path, "r", encoding="utf-8") as f:
            try:
                return json.load(f)
            except Exception as e:
                print(f"Warning loading {path}: {e}")
                return []
    return []

def validate_scheme(s):
    required_fields = [
        "id", "slug", "name", "shortDescription", "category",
        "jurisdiction", "state", "portalUrl", "feeStatus",
        "benefitDetails", "eligibilitySummary", "rules", "documents", "applicationSteps"
    ]
    for rf in required_fields:
        if rf not in s or s[rf] is None or s[rf] == "":
            raise ValueError(f"Scheme {s.get('id', 'UNKNOWN')} missing field '{rf}'")
            
    if not isinstance(s["rules"], list) or len(s["rules"]) == 0:
        raise ValueError(f"Scheme {s['id']} has empty rules")
    if not isinstance(s["documents"], list) or len(s["documents"]) == 0:
        raise ValueError(f"Scheme {s['id']} has empty documents")
    if not isinstance(s["applicationSteps"], list) or len(s["applicationSteps"]) == 0:
        raise ValueError(f"Scheme {s['id']} has empty applicationSteps")

def main():
    print("🔄 Compiling Comprehensive Indian Government Schemes Catalog...")
    
    # 1. Compile Central Schemes
    existing_central = load_json(central_json_path)
    central_map = {s["id"]: s for s in existing_central}
    
    for s in CENTRAL_SCHEMES:
        central_map[s["id"]] = s
    for s in CENTRAL_SCHEMES_2:
        central_map[s["id"]] = s
    for s in CENTRAL_SCHEMES_3:
        central_map[s["id"]] = s
        
    compiled_central = list(central_map.values())
    for s in compiled_central:
        validate_scheme(s)
        
    with open(central_json_path, "w", encoding="utf-8") as f:
        json.dump(compiled_central, f, indent=2, ensure_ascii=False)
    print(f"✅ Saved {len(compiled_central)} verified Central Government Schemes to {central_json_path}")

    # 2. Compile State Schemes
    existing_state = load_json(state_json_path)
    state_map = {s["id"]: s for s in existing_state}
    
    for s in STATE_SCHEMES_PART1:
        state_map[s["id"]] = s
    for s in STATE_SCHEMES_PART2:
        state_map[s["id"]] = s
    for s in STATE_SCHEMES_PART3:
        state_map[s["id"]] = s
    for s in STATE_SCHEMES_PART4:
        state_map[s["id"]] = s
        
    compiled_state = list(state_map.values())
    for s in compiled_state:
        validate_scheme(s)
        
    with open(state_json_path, "w", encoding="utf-8") as f:
        json.dump(compiled_state, f, indent=2, ensure_ascii=False)
    print(f"✅ Saved {len(compiled_state)} verified State Government Schemes to {state_json_path}")

    # 3. Summary Statistics
    total_schemes = len(compiled_central) + len(compiled_state)
    print(f"\n🎉 Total Schemes in Catalog: {total_schemes}")
    
    # Category Breakdown
    cat_counts = {}
    for s in compiled_central + compiled_state:
        c = s.get("category", "other")
        cat_counts[c] = cat_counts.get(c, 0) + 1
    print("\n📊 Category Distribution:")
    for c, count in sorted(cat_counts.items(), key=lambda x: -x[1]):
        print(f"  - {c}: {count}")

    # State Breakdown
    state_counts = {}
    for s in compiled_state:
        st = s.get("state", "Unknown")
        state_counts[st] = state_counts.get(st, 0) + 1
    print(f"\n🗺️ State Distribution ({len(state_counts)} States & UTs):")
    for st, count in sorted(state_counts.items(), key=lambda x: -x[1]):
        print(f"  - {st}: {count}")

if __name__ == "__main__":
    main()
