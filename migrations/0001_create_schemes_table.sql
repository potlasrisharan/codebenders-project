-- Migration: 0001_create_schemes_table.sql
-- Description: Core schemes table with full-text search (FTS5) and synchronization triggers

CREATE TABLE IF NOT EXISTS schemes (
  id TEXT PRIMARY KEY,
  slug TEXT UNIQUE,
  name TEXT NOT NULL,
  short_description TEXT NOT NULL,
  full_description TEXT,
  category TEXT NOT NULL,
  jurisdiction TEXT NOT NULL,
  state TEXT NOT NULL,
  ministry TEXT,
  department TEXT,
  portal_url TEXT,
  fee_status TEXT DEFAULT 'free_verified',
  benefit_details TEXT,
  eligibility_summary TEXT,
  rules_json TEXT,
  documents_json TEXT,
  steps_json TEXT,
  created_at TEXT DEFAULT CURRENT_TIMESTAMP,
  updated_at TEXT DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX IF NOT EXISTS idx_schemes_category ON schemes(category);
CREATE INDEX IF NOT EXISTS idx_schemes_state ON schemes(state);
CREATE INDEX IF NOT EXISTS idx_schemes_jurisdiction ON schemes(jurisdiction);

-- SQLite FTS5 Virtual Table for full-text search
CREATE VIRTUAL TABLE IF NOT EXISTS schemes_fts USING fts5(
  id UNINDEXED,
  name,
  short_description,
  full_description,
  category,
  state,
  ministry,
  department,
  eligibility_summary,
  tokenize = 'porter unicode61'
);

-- Triggers to synchronize schemes_fts with schemes table
CREATE TRIGGER IF NOT EXISTS schemes_ai AFTER INSERT ON schemes BEGIN
  DELETE FROM schemes_fts WHERE id = new.id;
  INSERT INTO schemes_fts (
    id,
    name,
    short_description,
    full_description,
    category,
    state,
    ministry,
    department,
    eligibility_summary
  ) VALUES (
    new.id,
    new.name,
    new.short_description,
    new.full_description,
    new.category,
    new.state,
    new.ministry,
    new.department,
    new.eligibility_summary
  );
END;

CREATE TRIGGER IF NOT EXISTS schemes_ad AFTER DELETE ON schemes BEGIN
  DELETE FROM schemes_fts WHERE id = old.id;
END;

CREATE TRIGGER IF NOT EXISTS schemes_au AFTER UPDATE ON schemes BEGIN
  DELETE FROM schemes_fts WHERE id = old.id;
  INSERT INTO schemes_fts (
    id,
    name,
    short_description,
    full_description,
    category,
    state,
    ministry,
    department,
    eligibility_summary
  ) VALUES (
    new.id,
    new.name,
    new.short_description,
    new.full_description,
    new.category,
    new.state,
    new.ministry,
    new.department,
    new.eligibility_summary
  );
END;
