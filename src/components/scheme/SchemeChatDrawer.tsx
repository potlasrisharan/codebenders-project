import { useState, useRef, useEffect } from 'react';
import {
  Send,
  Loader2,
  Sparkles,
  ShieldAlert,
  ExternalLink,
  ChevronDown,
  ChevronUp,
  Bot,
  User,
} from 'lucide-react';
import { Button } from '../ui/Button';
import { Card } from '../ui/Card';

interface ChatMessage {
  id: string;
  role: 'user' | 'assistant';
  content: string;
  timestamp: string;
  model?: string;
}

interface SchemeChatDrawerProps {
  schemeId: string;
  schemeName: string;
  portalUrl?: string;
}

export function SchemeChatDrawer({ schemeId, schemeName, portalUrl }: SchemeChatDrawerProps) {
  const [isOpen, setIsOpen] = useState(true);
  const [messages, setMessages] = useState<ChatMessage[]>(() => [
    {
      id: 'welcome',
      role: 'assistant',
      content: `Hello! I am your **LabhSaathi Civic Assistant**. Ask me any question about **${schemeName}**—such as eligibility rules, MeeSeva documents, income caps, or application steps. All answers are strictly grounded in published government gazettes.`,
      timestamp: new Date().toLocaleTimeString([], { hour: '2-digit', minute: '2-digit' }),
      model: 'Grounded Assistant',
    },
  ]);
  const [inputMessage, setInputMessage] = useState('');
  const [isLoading, setIsLoading] = useState(false);
  const messagesEndRef = useRef<HTMLDivElement | null>(null);

  const suggestedQuestions = [
    'What documents do I need from MeeSeva?',
    'Is there any application fee or agent fee?',
    'Can I apply if my family income is ₹2 Lakhs?',
    'How do I apply on the official portal?',
  ];

  const scrollToBottom = () => {
    if (typeof messagesEndRef.current?.scrollIntoView === 'function') {
      messagesEndRef.current.scrollIntoView({ behavior: 'smooth' });
    }
  };

  useEffect(() => {
    if (isOpen) {
      scrollToBottom();
    }
  }, [messages, isOpen]);

  const handleSendMessage = async (textToSend?: string) => {
    const query = (textToSend || inputMessage).trim();
    if (!query || isLoading) return;

    const userMsg: ChatMessage = {
      id: `user-${Date.now()}`,
      role: 'user',
      content: query,
      timestamp: new Date().toLocaleTimeString([], { hour: '2-digit', minute: '2-digit' }),
    };

    setMessages((prev) => [...prev, userMsg]);
    setInputMessage('');
    setIsLoading(true);

    try {
      const history = messages.slice(-4).map((m) => ({
        role: m.role,
        content: m.content,
      }));

      const res = await fetch(`/api/v1/schemes/${encodeURIComponent(schemeId)}/chat`, {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({
          message: query,
          history,
        }),
      });

      if (!res.ok) {
        throw new Error(`Chat assistant returned status ${res.status}`);
      }

      const data = await res.json() as {
        success: boolean;
        reply: string;
        model?: string;
        provider?: string;
        portalUrl?: string;
      };

      const assistantMsg: ChatMessage = {
        id: `asst-${Date.now()}`,
        role: 'assistant',
        content: data.reply || 'No response generated from scheme criteria.',
        timestamp: new Date().toLocaleTimeString([], { hour: '2-digit', minute: '2-digit' }),
        model: data.model || 'Groq Llama 3.3',
      };

      setMessages((prev) => [...prev, assistantMsg]);
    } catch {
      const errorMsg: ChatMessage = {
        id: `err-${Date.now()}`,
        role: 'assistant',
        content: `I could not connect to the scheme reasoning service. Please check your network or visit the official portal: ${portalUrl || 'Official Government Portal'}.`,
        timestamp: new Date().toLocaleTimeString([], { hour: '2-digit', minute: '2-digit' }),
        model: 'Offline Fallback',
      };
      setMessages((prev) => [...prev, errorMsg]);
    } finally {
      setIsLoading(false);
    }
  };

  return (
    <Card className="bg-white border-zinc-200/90 shadow-xs overflow-hidden rounded-2xl">
      {/* Header bar */}
      <div
        onClick={() => setIsOpen(!isOpen)}
        className="p-4 bg-gradient-to-r from-zinc-900 via-zinc-800 to-indigo-950 text-white flex items-center justify-between cursor-pointer select-none transition-all"
      >
        <div className="flex items-center gap-2.5">
          <div className="w-8 h-8 rounded-lg bg-white/10 flex items-center justify-center text-emerald-400">
            <Sparkles className="w-4 h-4" />
          </div>
          <div>
            <div className="flex items-center gap-2">
              <h3 className="font-extrabold text-sm tracking-tight text-white">Ask LabhSaathi Q&amp;A</h3>
              <span className="text-[10px] font-bold px-2 py-0.5 rounded-full bg-emerald-500/20 text-emerald-300 border border-emerald-500/30">
                Groq Fast Inference
              </span>
            </div>
            <p className="text-[11px] text-zinc-300">Grounded exclusively in verified government regulations</p>
          </div>
        </div>

        <div className="flex items-center gap-2">
          {isOpen ? <ChevronUp className="w-4 h-4 text-zinc-400" /> : <ChevronDown className="w-4 h-4 text-zinc-400" />}
        </div>
      </div>

      {isOpen && (
        <div className="p-4 space-y-4">
          {/* Middleman Protection Micro-Notice */}
          <div className="flex items-center justify-between text-[11px] bg-amber-50 text-amber-900 border border-amber-200/80 px-3 py-2 rounded-lg">
            <span className="flex items-center gap-1.5 font-medium">
              <ShieldAlert className="w-3.5 h-3.5 text-amber-600 flex-shrink-0" />
              Official government guidance is 100% Free. Never pay money to touts or agents.
            </span>
            {portalUrl && (
              <a
                href={portalUrl}
                target="_blank"
                rel="noopener noreferrer"
                className="text-amber-800 underline font-bold inline-flex items-center gap-0.5 flex-shrink-0 ml-2"
              >
                Official Portal <ExternalLink className="w-3 h-3" />
              </a>
            )}
          </div>

          {/* Suggested question chips */}
          <div className="space-y-1.5">
            <span className="text-[11px] font-bold uppercase tracking-wider text-zinc-500">
              Suggested Questions:
            </span>
            <div className="flex flex-wrap gap-1.5">
              {suggestedQuestions.map((q, idx) => (
                <button
                  key={idx}
                  type="button"
                  disabled={isLoading}
                  onClick={() => handleSendMessage(q)}
                  className="text-left text-[11px] px-2.5 py-1 rounded-md bg-zinc-100 hover:bg-zinc-200 text-zinc-700 border border-zinc-200 transition-colors btn-tactile"
                >
                  {q}
                </button>
              ))}
            </div>
          </div>

          {/* Chat Messages Stream */}
          <div className="space-y-3 max-h-80 overflow-y-auto p-3 bg-zinc-50/70 rounded-xl border border-zinc-200/80">
            {messages.map((m) => (
              <div
                key={m.id}
                className={`flex gap-2.5 ${m.role === 'user' ? 'justify-end' : 'justify-start'}`}
              >
                {m.role === 'assistant' && (
                  <div className="w-6 h-6 rounded-full bg-zinc-900 text-white flex items-center justify-center flex-shrink-0 mt-0.5">
                    <Bot className="w-3.5 h-3.5" />
                  </div>
                )}

                <div
                  className={`max-w-[85%] rounded-2xl px-3.5 py-2.5 text-xs leading-relaxed ${
                    m.role === 'user'
                      ? 'bg-zinc-900 text-white rounded-tr-xs'
                      : 'bg-white text-zinc-800 border border-zinc-200/90 shadow-2xs rounded-tl-xs'
                  }`}
                >
                  <div className="whitespace-pre-wrap">{m.content}</div>
                  <div
                    className={`text-[9px] mt-1 flex items-center justify-between gap-2 ${
                      m.role === 'user' ? 'text-zinc-400' : 'text-zinc-400'
                    }`}
                  >
                    <span>{m.timestamp}</span>
                    {m.model && <span>{m.model}</span>}
                  </div>
                </div>

                {m.role === 'user' && (
                  <div className="w-6 h-6 rounded-full bg-indigo-600 text-white flex items-center justify-center flex-shrink-0 mt-0.5">
                    <User className="w-3.5 h-3.5" />
                  </div>
                )}
              </div>
            ))}

            {isLoading && (
              <div className="flex gap-2.5 justify-start">
                <div className="w-6 h-6 rounded-full bg-zinc-900 text-white flex items-center justify-center flex-shrink-0">
                  <Bot className="w-3.5 h-3.5" />
                </div>
                <div className="bg-white text-zinc-700 border border-zinc-200/90 rounded-2xl px-3.5 py-2.5 text-xs flex items-center gap-2 shadow-2xs">
                  <Loader2 className="w-3.5 h-3.5 animate-spin text-zinc-600" />
                  <span>Grounding answer against scheme clauses...</span>
                </div>
              </div>
            )}
            <div ref={messagesEndRef} />
          </div>

          {/* Input text box */}
          <form
            onSubmit={(e) => {
              e.preventDefault();
              handleSendMessage();
            }}
            className="flex items-center gap-2 pt-1"
          >
            <input
              type="text"
              value={inputMessage}
              onChange={(e) => setInputMessage(e.target.value)}
              placeholder="Ask anything about this scheme in English, Telugu, or Hindi..."
              disabled={isLoading}
              className="flex-1 text-xs p-2.5 border border-zinc-300 rounded-lg bg-zinc-50/70 focus:bg-white focus:ring-1 focus:ring-zinc-900 focus:outline-none transition-colors"
            />
            <Button
              type="submit"
              variant="primary"
              disabled={!inputMessage.trim() || isLoading}
              className="flex items-center gap-1 text-xs py-2 px-3.5 bg-zinc-900 hover:bg-zinc-800 text-white rounded-lg btn-tactile"
            >
              {isLoading ? <Loader2 className="w-3.5 h-3.5 animate-spin" /> : <Send className="w-3.5 h-3.5" />}
              <span>Ask</span>
            </Button>
          </form>
        </div>
      )}
    </Card>
  );
}
