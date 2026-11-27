#!/usr/bin/env python3
"""
scripts/generate-comprehensive-schemes.py
Generates a comprehensive catalog of 250+ verified Central & State Indian Government Schemes
for LabhSaathi & Cloudflare D1 with FTS5 search.
"""

import json
import os

project_root = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
data_dir = os.path.join(project_root, "scripts", "data")
os.makedirs(data_dir, exist_ok=True)

print(f"Generating comprehensive schemes into {data_dir}...")
