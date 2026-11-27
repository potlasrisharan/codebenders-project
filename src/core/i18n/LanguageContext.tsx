import { createContext, useContext, useState, useEffect } from 'react';
import type { ReactNode, ElementType } from 'react';
import { SupportedLanguage, SUPPORTED_LANGUAGES, TRANSLATIONS, LanguageOption } from './translations';

export interface DualTextResult {
  primary: string;
  secondary?: string;
}

interface LanguageContextType {
  language: SupportedLanguage;
  setLanguage: (lang: SupportedLanguage) => void;
  t: (key: string, fallback?: string) => string;
  tDual: (key: string, fallback?: string) => DualTextResult;
  languages: LanguageOption[];
}

const LanguageContext = createContext<LanguageContextType | undefined>(undefined);

export function LanguageProvider({ children }: { children: ReactNode }) {
  const [language, setLanguageState] = useState<SupportedLanguage>(() => {
    try {
      const saved = localStorage.getItem('labhsaathi_lang');
      if (saved === 'en' || saved === 'te' || saved === 'hi') {
        return saved;
      }
    } catch {
      // LocalStorage not available or restricted
    }
    return 'en';
  });

  const setLanguage = (lang: SupportedLanguage) => {
    setLanguageState(lang);
    try {
      localStorage.setItem('labhsaathi_lang', lang);
    } catch {
      // Ignore storage errors
    }
  };

  useEffect(() => {
    try {
      document.documentElement.lang = language;
    } catch {
      // Ignore DOM document errors in non-browser env
    }
  }, [language]);

  const t = (key: string, fallback?: string): string => {
    const langDict = TRANSLATIONS[language];
    if (langDict && langDict[key]) {
      return langDict[key];
    }
    // Fallback to English if translation missing in chosen language
    const enDict = TRANSLATIONS.en;
    if (enDict && enDict[key]) {
      return enDict[key];
    }
    return fallback || key;
  };

  const tDual = (key: string, fallback?: string): DualTextResult => {
    const primary = t(key, fallback);
    const english = TRANSLATIONS.en[key] || fallback || key;

    if (language === 'en' || primary === english) {
      return { primary };
    }
    return { primary, secondary: english };
  };

  return (
    <LanguageContext.Provider
      value={{
        language,
        setLanguage,
        t,
        tDual,
        languages: SUPPORTED_LANGUAGES,
      }}
    >
      {children}
    </LanguageContext.Provider>
  );
}

export function useLanguage(): LanguageContextType {
  const context = useContext(LanguageContext);
  if (!context) {
    throw new Error('useLanguage must be used within a LanguageProvider');
  }
  return context;
}

export function T({
  id,
  fallback,
  className = '',
  primaryClassName = '',
  secondaryClassName = '',
  inline = false,
  as: Component = 'span',
}: {
  id: string;
  fallback?: string;
  className?: string;
  primaryClassName?: string;
  secondaryClassName?: string;
  inline?: boolean;
  as?: ElementType;
}) {
  const { language, t } = useLanguage();
  const primary = t(id, fallback);
  const english = TRANSLATIONS.en[id] || fallback || id;
  const combinedPrimaryClass = [className, primaryClassName].filter(Boolean).join(' ');

  if (language === 'en' || primary === english) {
    return <Component className={combinedPrimaryClass}>{primary}</Component>;
  }

  if (inline) {
    return (
      <Component className={className}>
        <span className={primaryClassName}>{primary}</span>{' '}
        <span className={`text-[0.82em] font-normal text-zinc-500 opacity-85 ${secondaryClassName}`}>
          ({english})
        </span>
      </Component>
    );
  }

  return (
    <Component className={className}>
      <span className={`block ${primaryClassName}`}>{primary}</span>
      <span className={`block text-[0.8em] font-normal text-zinc-500 tracking-normal opacity-85 mt-0.5 ${secondaryClassName}`}>
        {english}
      </span>
    </Component>
  );
}
