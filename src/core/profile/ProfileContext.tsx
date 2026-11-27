import React, { createContext, useContext, useState, useEffect } from 'react';
import { CitizenProfile, EMPTY_CITIZEN_PROFILE, GOLDEN_PERSONAS } from './citizen-profile';

interface ProfileContextType {
  profile: CitizenProfile;
  setProfile: (profile: CitizenProfile) => void;
  updateProfile: (updates: Partial<CitizenProfile>) => void;
  loadGoldenPersona: (index: number) => void;
  resetProfile: () => void;
  activePersonaName?: string;
  hasCompletedIntake: boolean;
}

const ProfileContext = createContext<ProfileContextType | undefined>(undefined);

export const ProfileProvider: React.FC<{ children: React.ReactNode }> = ({ children }) => {
  // Start with clean empty profile by default until citizen takes intake or loads demo persona
  const [profile, setProfileState] = useState<CitizenProfile>(() => {
    if (typeof window !== 'undefined' && window.localStorage) {
      try {
        const saved = window.localStorage.getItem('labhsaathi_active_profile_v1');
        if (saved) return JSON.parse(saved);
      } catch {
        // fallback
      }
    }
    return EMPTY_CITIZEN_PROFILE;
  });

  const [activePersonaName, setActivePersonaName] = useState<string | undefined>(() => {
    if (typeof window !== 'undefined' && window.localStorage) {
      try {
        const saved = window.localStorage.getItem('labhsaathi_active_persona_name');
        if (saved) return saved;
      } catch {
        // fallback
      }
    }
    return undefined;
  });

  useEffect(() => {
    if (typeof window !== 'undefined' && window.localStorage) {
      try {
        window.localStorage.setItem('labhsaathi_active_profile_v1', JSON.stringify(profile));
        if (activePersonaName) {
          window.localStorage.setItem('labhsaathi_active_persona_name', activePersonaName);
        } else {
          window.localStorage.removeItem('labhsaathi_active_persona_name');
        }
      } catch {
        // ignore
      }
    }
  }, [profile, activePersonaName]);

  const setProfile = (newProfile: CitizenProfile) => {
    setProfileState(newProfile);
    setActivePersonaName(undefined);
  };

  const updateProfile = (updates: Partial<CitizenProfile>) => {
    setProfileState((prev) => ({ ...prev, ...updates }));
  };

  const loadGoldenPersona = (index: number) => {
    if (GOLDEN_PERSONAS[index]) {
      setProfileState({ ...GOLDEN_PERSONAS[index].profile });
      setActivePersonaName(GOLDEN_PERSONAS[index].name);
    }
  };

  const resetProfile = () => {
    setProfileState({ ...EMPTY_CITIZEN_PROFILE });
    setActivePersonaName(undefined);
    if (typeof window !== 'undefined' && window.localStorage) {
      try {
        window.localStorage.removeItem('labhsaathi_active_profile_v1');
        window.localStorage.removeItem('labhsaathi_active_persona_name');
      } catch {
        // ignore
      }
    }
  };

  const hasCompletedIntake = Boolean(profile.occupation || activePersonaName);

  return (
    <ProfileContext.Provider
      value={{
        profile,
        setProfile,
        updateProfile,
        loadGoldenPersona,
        resetProfile,
        activePersonaName,
        hasCompletedIntake,
      }}
    >
      {children}
    </ProfileContext.Provider>
  );
};

export function useCitizenProfile(): ProfileContextType {
  const context = useContext(ProfileContext);
  if (!context) {
    throw new Error('useCitizenProfile must be used within a ProfileProvider');
  }
  return context;
}
