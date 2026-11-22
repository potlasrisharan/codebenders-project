import { Hono } from 'hono';
import { defaultSchemeRepository } from '../../src/core/data/repository';
import { mapDbRowToScheme } from './schemes';
import type { Env, SchemeDbRow } from '../types';

export const chatRouter = new Hono<{ Bindings: Env }>();

interface ChatMessage {
  role: 'user' | 'assistant' | 'system';
  content: string;
}

interface SchemeChatContext {
  id: string;
  name: string;
  jurisdiction: string;
  state: string;
  department?: string;
  ministry?: string;
  portalUrl?: string;
  feeStatus?: string;
  shortDescription?: string;
  benefitDetails?: string;
  eligibilitySummary?: string;
  scamWarning?: string;
  sources?: Array<{ portalUrl?: string; department?: string }>;
  rules?: Array<{ conditionName: string; operator: string; expectedValue: unknown; sourceClause?: string }>;
  documents?: Array<{ name: string; issuingAuthority?: string; requirementType?: string; sourceEvidence?: string }>;
  applicationSteps?: Array<{ stepNumber?: number; title: string; description?: string; portalUrl?: string }>;
}

/**
 * Builds grounded deterministic response when Groq API key is not present
 */
function buildDeterministicGroundingResponse(
  query: string,
  scheme: SchemeChatContext
): string {
  if (!scheme) return 'Scheme information could not be retrieved.';

  const q = query.toLowerCase();
  const name = scheme.name;
  const portal = scheme.portalUrl || scheme.sources?.[0]?.portalUrl || 'https://www.india.gov.in';
  const benefit = scheme.benefitDetails || scheme.shortDescription || 'Government financial and welfare benefit';
  const scamWarn = scheme.scamWarning || 'Never pay middlemen or unofficial agents. Official government processing is 100% free.';

  if (q.includes('fee') || q.includes('cost') || q.includes('pay') || q.includes('డబ్బులు') || q.includes('ఫీజు')) {
    return `**Fee Transparency:** Application for **${name}** is **100% Free** on the official government portal (${portal}). There are no official application charges. ${scamWarn}`;
  }

  if (q.includes('document') || q.includes('certificate') || q.includes('meeseva') || q.includes('పత్రాలు') || q.includes('సర్టిఫికేట్')) {
    const docs = scheme.documents && Array.isArray(scheme.documents) ? scheme.documents : [];
    if (docs.length > 0) {
      const docList = docs.map((d: { name: string; issuingAuthority?: string }) => `• **${d.name}** (Issued by: ${d.issuingAuthority || 'Competent Authority'})`).join('\n');
      return `**Required Documents for ${name}:**\n\n${docList}\n\n*Apply directly at ${portal}. Never submit original certificates to unauthorized agents.*`;
    }
  }

  if (q.includes('income') || q.includes('eligible') || q.includes('qualify') || q.includes('ఆదాయం') || q.includes('అర్హత')) {
    const rules = scheme.rules && Array.isArray(scheme.rules) ? scheme.rules : [];
    const ruleList = rules.length > 0
      ? rules.map((r: { conditionName: string; sourceClause?: string }) => `• **${r.conditionName}** (${r.sourceClause || 'Official Rules'})`).join('\n')
      : scheme.eligibilitySummary || 'Check published official guidelines.';

    return `**Eligibility Criteria for ${name}:**\n\n${ruleList}\n\n*Summary:* ${scheme.eligibilitySummary || benefit}\n\nFor official determinations, visit: ${portal}`;
  }

  if (q.includes('apply') || q.includes('step') || q.includes('how') || q.includes('ఎలా') || q.includes('దరఖాస్తు')) {
    const steps = scheme.applicationSteps && Array.isArray(scheme.applicationSteps) ? scheme.applicationSteps : [];
    if (steps.length > 0) {
      const stepList = steps.map((s: { stepNumber?: number; title: string; description?: string }) => `${s.stepNumber || 1}. **${s.title}**: ${s.description || ''}`).join('\n');
      return `**How to Apply for ${name}:**\n\n${stepList}\n\nOfficial Portal Link: [${portal}](${portal})`;
    }
  }

  // General grounded summary
  return `**${name}**\n\n` +
    `• **Benefit:** ${benefit}\n` +
    `• **Jurisdiction:** ${scheme.jurisdiction === 'central' ? 'Central Scheme (All India)' : `${scheme.state} State Scheme`}\n` +
    `• **Official Portal:** [${portal}](${portal})\n` +
    `• **Fee Status:** 100% Free Verified\n\n` +
    `*Protection Notice:* ${scamWarn}\n\n` +
    `Do you have a specific question about documents, income limits, or application steps?`;
}

/**
 * POST /api/v1/schemes/:id/chat
 * Grounded conversational Q&A assistant using Groq Cloud API (Llama 3.3 70B Versatile)
 */
chatRouter.post('/:id/chat', async (c) => {
  const schemeId = c.req.param('id');
  const apiKey = c.env?.GROQ_API_KEY || (typeof process !== 'undefined' ? process.env?.GROQ_API_KEY : undefined);
  const db = c.env?.DB;

  let body: { message?: string; history?: ChatMessage[] } = {};
  try {
    body = await c.req.json();
  } catch {
    body = {};
  }

  const userMessage = body.message?.trim();
  if (!userMessage) {
    return c.json({ success: false, error: 'Message parameter is required' }, 400);
  }

  // 1. Retrieve scheme from D1 database or in-memory repository
  let scheme: ReturnType<typeof mapDbRowToScheme> | ReturnType<typeof defaultSchemeRepository.getById> | undefined;

  if (db) {
    try {
      const row = await db
        .prepare('SELECT * FROM schemes WHERE id = ? OR slug = ? LIMIT 1')
        .bind(schemeId, schemeId)
        .first<SchemeDbRow>();
      if (row) {
        scheme = mapDbRowToScheme(row);
      }
    } catch (err) {
      console.warn('D1 lookup in chat failed, using repository fallback:', err);
    }
  }

  if (!scheme) {
    scheme = defaultSchemeRepository.getById(schemeId) || defaultSchemeRepository.getBySlug(schemeId);
  }

  if (!scheme) {
    return c.json({ success: false, error: `Scheme not found: ${schemeId}` }, 404);
  }

  const s = scheme as unknown as SchemeChatContext;
  const portalUrl = s.portalUrl || s.sources?.[0]?.portalUrl || 'https://www.india.gov.in';

  // 2. Format official grounding context for the LLM
  const contextRules = Array.isArray(s.rules)
    ? s.rules.map((r: { conditionName: string; operator: string; expectedValue: unknown; sourceClause?: string }) =>
        `- ${r.conditionName} (${r.operator} ${JSON.stringify(r.expectedValue)}) [Source: ${r.sourceClause || 'Govt Gazette'}]`
      ).join('\n')
    : 'No rules enumerated.';

  const contextDocs = Array.isArray(s.documents)
    ? s.documents.map((d: { name: string; issuingAuthority?: string; requirementType?: string }) =>
        `- ${d.name} (${d.requirementType || 'mandatory'}, Issuing Authority: ${d.issuingAuthority || 'Revenue Dept'})`
      ).join('\n')
    : 'Standard identification documents.';

  const contextSteps = Array.isArray(s.applicationSteps)
    ? s.applicationSteps.map((step: { stepNumber?: number; title: string; description?: string }) =>
        `${step.stepNumber || 1}. ${step.title}: ${step.description || ''}`
      ).join('\n')
    : 'Online portal registration.';

  const systemPrompt = `You are LabhSaathi Civic Assistant, an expert, transparent, and empathetic guide for Indian public schemes.
You are helping a citizen understand the government scheme "${s.name}".

OFFICIAL GROUNDING DATA (VERIFIED BY GOVERNMENT GAZETTE / PORTAL):
- Scheme Name: ${s.name}
- Jurisdiction: ${s.jurisdiction} (${s.state})
- Department: ${s.department || s.ministry || 'State Government'}
- Official Portal: ${portalUrl}
- Fee Status: ${s.feeStatus || 'free_verified'} (100% Free on official government portal)
- Benefit Details: ${s.benefitDetails || s.shortDescription}
- Eligibility Summary: ${s.eligibilitySummary || s.shortDescription}
- Statutory Rules:
${contextRules}
- Required Documents:
${contextDocs}
- Application Steps:
${contextSteps}
- Anti-Middleman Warning: ${s.scamWarning || 'Never pay any middleman or unauthorized agent.'}

STRICT INSTRUCTIONS:
1. Ground your answer SOLELY in the verified official data provided above.
2. If the citizen asks a question whose specific answer is NOT covered in the provided data, state clearly that it is not specified in published rules, and direct them to check the official portal: ${portalUrl}.
3. NEVER promise or guarantee benefit approval or eligibility. State that LabhSaathi provides informational guidance, while final approval is made exclusively by designated government officers.
4. If asked about fees, emphasize that the official application is 100% FREE and warn against middlemen.
5. Answer in the same language the citizen used (e.g. Telugu, Hindi, or English). If asked in Telugu, answer in clean Telugu; if in English, answer in clear English.
6. Keep answers concise, factual, and formatted with bullet points for readability.`;

  // 3. Call Groq Cloud API if GROQ_API_KEY is available
  if (apiKey) {
    try {
      const messages: ChatMessage[] = [
        { role: 'system', content: systemPrompt },
        ...(body.history || []).slice(-6), // include last 6 turns of context
        { role: 'user', content: userMessage },
      ];

      const candidateModels = [
        c.env?.GROQ_MODEL,
        'qwen/qwen3.8-27b',
        'openai/gpt-oss-120b',
        'llama-3.3-70b-versatile',
      ].filter(Boolean) as string[];

      for (const modelToTry of candidateModels) {
        const groqRes = await fetch('https://api.groq.com/openai/v1/chat/completions', {
          method: 'POST',
          headers: {
            'Authorization': `Bearer ${apiKey}`,
            'Content-Type': 'application/json',
          },
          body: JSON.stringify({
            model: modelToTry,
            messages,
            temperature: 0.1,
            max_tokens: 800,
          }),
        });

        if (groqRes.ok) {
          const groqData = await groqRes.json() as {
            choices?: Array<{ message?: { content?: string } }>;
          };
          const reply = groqData.choices?.[0]?.message?.content;
          if (reply) {
            return c.json({
              success: true,
              schemeId: s.id,
              schemeName: s.name,
              reply,
              provider: 'groq',
              model: modelToTry,
              portalUrl,
              feeStatus: s.feeStatus || 'free_verified',
            });
          }
        }
      }
    } catch (groqErr) {
      console.warn('Groq API fetch error, falling back to deterministic answer:', groqErr);
    }
  }

  // 4. Grounded deterministic fallback (offline / tests / no API key)
  const deterministicReply = buildDeterministicGroundingResponse(userMessage, s);

  return c.json({
    success: true,
    schemeId: s.id,
    schemeName: s.name,
    reply: deterministicReply,
    provider: 'grounded_deterministic',
    model: 'rule_grounded',
    portalUrl,
    feeStatus: s.feeStatus || 'free_verified',
    notice: apiKey ? undefined : 'GROQ_API_KEY not set in environment. Used grounded deterministic responder.',
  });
});
