/**
 * Cloudflare Workers & LabhSaathi D1 Environment Types
 */

export interface D1Result<T = unknown> {
  results: T[];
  success: boolean;
  error?: string;
  meta?: Record<string, unknown>;
}

export interface D1PreparedStatement {
  bind(...values: unknown[]): D1PreparedStatement;
  first<T = unknown>(colName?: string): Promise<T | null>;
  run<T = unknown>(): Promise<D1Result<T>>;
  all<T = unknown>(): Promise<D1Result<T>>;
  raw<T = unknown>(): Promise<T[]>;
}

export interface D1ExecResult {
  count: number;
  duration: number;
}

export interface D1Database {
  prepare(query: string): D1PreparedStatement;
  dump(): Promise<ArrayBuffer>;
  batch<T = unknown>(statements: D1PreparedStatement[]): Promise<D1Result<T>[]>;
  exec(query: string): Promise<D1ExecResult>;
}

export interface Env {
  DB?: D1Database;
  ASSETS?: { fetch: (req: Request) => Promise<Response> };
}

/**
 * Raw Scheme row as stored in the Cloudflare D1 `schemes` table
 */
export interface SchemeDbRow {
  id: string;
  slug?: string;
  name: string;
  short_description: string;
  full_description?: string | null;
  category: string;
  jurisdiction: string;
  state: string;
  ministry?: string | null;
  department?: string | null;
  portal_url?: string | null;
  fee_status?: string | null;
  benefit_details?: string | null;
  eligibility_summary?: string | null;
  rules_json?: string | null;
  documents_json?: string | null;
  steps_json?: string | null;
  created_at?: string;
  updated_at?: string;
  rank?: number;
}
