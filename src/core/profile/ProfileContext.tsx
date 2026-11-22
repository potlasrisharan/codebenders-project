import React, { createContext, useContext, useState, useEffect } from 'react';
import { CitizenProfile, EMPTY_CITIZEN_PROFILE, GOLDEN_PERSONAS } from './citizen-profile';

interface ProfileContextType {
  profile: CitizenProfile;
  setProfile: (profile: CitizenProfile) => void;
  updateProfile: (updates: Partial<CitizenProfile>) => void;
  loadGoldenPersona: (index: number) => void;
  resetProfile: () => void;
  activePersonaName?: string;
}

const ProfileContext = createContext<ProfileContextType | undefined>(undefined);

export const ProfileProvider: React.FC<{ children: React.ReactNode }> = ({ children }) => {
  // Initialize with Priya (Telangana student pilot persona) by default for seamless demo
  const [profile, setProfileState] = useState<CitizenProfile>(() => {
    if (typeof window !== 'undefined' && window.localStorage) {
      try {
        const saved = window.localStorage.getItem('labhsaathi_active_profile_v1');
        if (saved) return JSON.parse(saved);
      } catch {
        // fallback
      }
    }
    return GOLDEN_PERSONAS[0].profile;
  });

  const [activePersonaName, setActivePersonaName] = useState<string | undefined>(GOLDEN_PERSONAS[0].name);

  useEffect(() => {
    if (typeof window !== 'undefined' && window.localStorage) {
      try {
        window.localStorage.setItem('labhsaathi_active_profile_v1', JSON.stringify(profile));
      } catch {
        // ignore
      }
    }
  }, [profile]);

  const setProfile = (newProfile: CitizenProfile) => {
    setProfileState(newProfile);
    setActivePersonaName(undefined);
  };

  const updateProfile = (updates: Partial<CitizenProfile>) => {
    setProfileState((prev) => ({ ...prev, ...updates }));
    setActivePersonaName(undefined);
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
  };

  return (
    <ProfileContext.Provider
      value={{
        profile,
        setProfile,
        updateProfile,
        loadGoldenPersona,
        resetProfile,
        activePersonaName,
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
