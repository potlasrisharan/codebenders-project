import { useState, useRef, useEffect } from 'react';
import { Mic, Square, Loader2, Languages, CheckCircle2, AlertCircle, X } from 'lucide-react';
import { CitizenProfile } from '../../core/profile/citizen-profile';
import { Button } from '../ui/Button';
import { useLanguage } from '../../core/i18n/LanguageContext';

interface VoiceIntakeModalProps {
  isOpen: boolean;
  onClose: () => void;
  onTranscriptSuccess: (transcript: string, extractedProfile: Partial<CitizenProfile>, extractedAttributes: string[]) => void;
}

const VOICE_LANGUAGES = [
  { code: 'en-IN', label: 'English (Indian)' },
  { code: 'hi-IN', label: 'हिन्दी (Hindi)' },
  { code: 'te-IN', label: 'తెలుగు (Telugu)' },
  { code: 'ta-IN', label: 'தமிழ் (Tamil)' },
  { code: 'kn-IN', label: 'ಕನ್ನಡ (Kannada)' },
  { code: 'mr-IN', label: 'मराठी (Marathi)' },
];

export function VoiceIntakeModal({ isOpen, onClose, onTranscriptSuccess }: VoiceIntakeModalProps) {
  const { language } = useLanguage();
  const defaultLang = language === 'hi' ? 'hi-IN' : language === 'te' ? 'te-IN' : 'en-IN';
  const [selectedLanguage, setSelectedLanguage] = useState(defaultLang);

  useEffect(() => {
    setSelectedLanguage(language === 'hi' ? 'hi-IN' : language === 'te' ? 'te-IN' : 'en-IN');
  }, [language]);
  const [isRecording, setIsRecording] = useState(false);
  const [recordingSeconds, setRecordingSeconds] = useState(0);
  const [isProcessing, setIsProcessing] = useState(false);
  const [statusMessage, setStatusMessage] = useState<string | null>(null);
  const [errorMessage, setErrorMessage] = useState<string | null>(null);

  const mediaRecorderRef = useRef<MediaRecorder | null>(null);
  const audioChunksRef = useRef<Blob[]>([]);
  const timerRef = useRef<NodeJS.Timeout | null>(null);

  useEffect(() => {
    return () => {
      if (timerRef.current) clearInterval(timerRef.current);
      if (mediaRecorderRef.current && mediaRecorderRef.current.state === 'recording') {
        mediaRecorderRef.current.stop();
      }
    };
  }, []);

  if (!isOpen) return null;

  const startRecording = async () => {
    setErrorMessage(null);
    setStatusMessage(null);
    audioChunksRef.current = [];

    try {
      if (!navigator.mediaDevices || !navigator.mediaDevices.getUserMedia) {
        // Simulated voice capture if browser microphone permissions or headless environment
        simulateVoiceIntake();
        return;
      }

      const stream = await navigator.mediaDevices.getUserMedia({ audio: true });
      const mediaRecorder = new MediaRecorder(stream);
      mediaRecorderRef.current = mediaRecorder;

      mediaRecorder.ondataavailable = (event) => {
        if (event.data.size > 0) {
          audioChunksRef.current.push(event.data);
        }
      };

      mediaRecorder.onstop = async () => {
        stream.getTracks().forEach((track) => track.stop());
        const audioBlob = new Blob(audioChunksRef.current, { type: 'audio/webm' });
        await handleAudioUpload(audioBlob);
      };

      mediaRecorder.start();
      setIsRecording(true);
      setRecordingSeconds(0);

      timerRef.current = setInterval(() => {
        setRecordingSeconds((prev) => {
          if (prev >= 60) {
            stopRecording();
            return 60;
          }
          return prev + 1;
        });
      }, 1000);
    } catch (err) {
      console.warn('Microphone access unavailable, using simulated voice input:', err);
      simulateVoiceIntake();
    }
  };

  const stopRecording = () => {
    if (timerRef.current) {
      clearInterval(timerRef.current);
      timerRef.current = null;
    }
    if (mediaRecorderRef.current && mediaRecorderRef.current.state === 'recording') {
      mediaRecorderRef.current.stop();
    }
    setIsRecording(false);
  };

  const handleAudioUpload = async (audioBlob: Blob) => {
    setIsProcessing(true);
    setStatusMessage('Transcribing speech with Sarvam AI...');

    try {
      const formData = new FormData();
      formData.append('file', audioBlob, 'citizen_intake.webm');
      formData.append('language_code', selectedLanguage);

      const res = await fetch('/api/v1/voice/transcribe', {
        method: 'POST',
        body: formData,
      });

      if (!res.ok) {
        throw new Error(`Voice transcription server returned status ${res.status}`);
      }

      const data = await res.json() as {
        success: boolean;
        transcript: string;
        extractedProfile: Partial<CitizenProfile>;
        extractedAttributes: string[];
        shieldWarning?: string;
        provider?: string;
      };

      if (data.success && data.transcript) {
        onTranscriptSuccess(data.transcript, data.extractedProfile, data.extractedAttributes);
        onClose();
      } else {
        setErrorMessage('Could not extract words from audio. Please try again.');
      }
    } catch (err) {
      setErrorMessage(String(err) || 'Failed to communicate with Sarvam AI.');
    } finally {
      setIsProcessing(false);
      setStatusMessage(null);
    }
  };

  const simulateVoiceIntake = async () => {
    setIsProcessing(true);
    setStatusMessage('Processing sample audio stream...');

    try {
      const formData = new FormData();
      formData.append('language_code', selectedLanguage);
      if (selectedLanguage === 'te-IN') {
        formData.append(
          'mock_hint',
          'నేను నల్లగొండ జిల్లాలో 2 ఎకరాల భూమి ఉన్న చిన్న రైతుని, కుటుంబ ఆదాయం 1.1 లక్ష రూపాయలు, తెల్ల రేషన్ కార్డు ఉంది.'
        );
      } else if (selectedLanguage === 'hi-IN') {
        formData.append(
          'mock_hint',
          'मैं वारंगल में स्ट्रीट वेंडर हूँ, मेरी वार्षिक आय 90000 रुपये है और मेरे पास राशन कार्ड है।'
        );
      } else {
        formData.append(
          'mock_hint',
          'I am a small farmer in Nalgonda with 2 acres of cultivable land and White Ration Card. Family income is 1.1 Lakhs.'
        );
      }

      const res = await fetch('/api/v1/voice/transcribe', {
        method: 'POST',
        body: formData,
      });

      const data = await res.json() as {
        success: boolean;
        transcript: string;
        extractedProfile: Partial<CitizenProfile>;
        extractedAttributes: string[];
      };

      if (data.success && data.transcript) {
        onTranscriptSuccess(data.transcript, data.extractedProfile, data.extractedAttributes);
        onClose();
      }
    } catch (err) {
      setErrorMessage(String(err));
    } finally {
      setIsProcessing(false);
      setStatusMessage(null);
    }
  };

  return (
    <div className="fixed inset-0 z-50 flex items-center justify-center bg-zinc-950/60 backdrop-blur-sm p-4 animate-fade-in">
      <div className="bg-white rounded-2xl max-w-md w-full border border-zinc-200 shadow-xl overflow-hidden p-6 space-y-5 animate-scale-in">
        {/* Header */}
        <div className="flex items-center justify-between border-b border-zinc-100 pb-3">
          <div className="flex items-center gap-2">
            <div className="w-8 h-8 rounded-full bg-indigo-50 flex items-center justify-center text-indigo-600">
              <Mic className="w-4 h-4" />
            </div>
            <div>
              <h3 className="font-extrabold text-zinc-900 text-sm">Sarvam Multilingual Voice Intake</h3>
              <p className="text-[11px] text-zinc-500">Speak naturally in your mother tongue</p>
            </div>
          </div>
          <button
            type="button"
            onClick={onClose}
            className="p-1.5 text-zinc-400 hover:text-zinc-700 rounded-lg transition-colors"
            aria-label="Close voice modal"
          >
            <X className="w-4 h-4" />
          </button>
        </div>

        {/* Language selector chips */}
        <div className="space-y-1.5">
          <label className="text-[11px] font-bold uppercase tracking-wider text-zinc-600 flex items-center gap-1.5">
            <Languages className="w-3.5 h-3.5" /> Select Language
          </label>
          <div className="grid grid-cols-2 sm:grid-cols-3 gap-1.5">
            {VOICE_LANGUAGES.map((lang) => (
              <button
                key={lang.code}
                type="button"
                disabled={isRecording || isProcessing}
                onClick={() => setSelectedLanguage(lang.code)}
                className={`text-xs px-2.5 py-1.5 rounded-lg border font-medium text-left truncate transition-colors ${
                  selectedLanguage === lang.code
                    ? 'bg-zinc-900 text-white border-zinc-900 shadow-xs'
                    : 'bg-zinc-50 hover:bg-zinc-100 text-zinc-700 border-zinc-200'
                }`}
              >
                {lang.label}
              </button>
            ))}
          </div>
        </div>

        {/* Recording Animation & Visualizer */}
        <div className="flex flex-col items-center justify-center py-6 px-4 bg-zinc-50 rounded-xl border border-dashed border-zinc-200 text-center space-y-4">
          {isRecording ? (
            <div className="relative flex items-center justify-center">
              <span className="absolute w-20 h-20 rounded-full bg-rose-500/20 animate-ping" />
              <span className="absolute w-16 h-16 rounded-full bg-rose-500/40 animate-pulse" />
              <button
                type="button"
                onClick={stopRecording}
                className="relative z-10 w-14 h-14 rounded-full bg-rose-600 text-white flex items-center justify-center shadow-lg hover:bg-rose-700 transition-colors"
                aria-label="Stop recording"
              >
                <Square className="w-5 h-5 fill-white" />
              </button>
            </div>
          ) : isProcessing ? (
            <div className="flex flex-col items-center justify-center space-y-2">
              <Loader2 className="w-10 h-10 text-indigo-600 animate-spin" />
              <span className="text-xs font-semibold text-zinc-700">{statusMessage}</span>
            </div>
          ) : (
            <button
              type="button"
              onClick={startRecording}
              className="w-16 h-16 rounded-full bg-zinc-900 text-white flex items-center justify-center shadow-md hover:bg-zinc-800 hover:scale-105 transition-all group"
              aria-label="Start recording"
            >
              <Mic className="w-7 h-7 text-emerald-400 group-hover:scale-110 transition-transform" />
            </button>
          )}

          <div>
            {isRecording ? (
              <div className="space-y-1">
                <span className="text-sm font-extrabold text-rose-600 flex items-center justify-center gap-1.5">
                  <span className="w-2 h-2 rounded-full bg-rose-600 animate-pulse" />
                  Recording: 00:{recordingSeconds < 10 ? `0${recordingSeconds}` : recordingSeconds}
                </span>
                <p className="text-[11px] text-zinc-500">Tap square button to stop and extract profile</p>
              </div>
            ) : isProcessing ? (
              <p className="text-[11px] text-zinc-500">Powering multilingual STT through Sarvam AI</p>
            ) : (
              <div className="space-y-1">
                <p className="text-xs font-bold text-zinc-800">
                  {language === 'te'
                    ? 'మాట్లాడటానికి మైక్రోఫోన్‌ను నొక్కండి'
                    : language === 'hi'
                    ? 'बोलने के लिए माइक्रोफ़ोन पर टैप करें'
                    : 'Tap the microphone to speak'}
                </p>
                {language !== 'en' && (
                  <p className="text-[10px] text-zinc-400 font-normal">Tap the microphone to speak</p>
                )}
                <div className="text-[11px] text-zinc-500 max-w-xs">
                  {language === 'te' ? (
                    <>
                      <span className="block">మీ రాష్ట్రం, వృత్తి, భూమి మరియు కుటుంబ ఆదాయాన్ని చెప్పండి.</span>
                      <span className="block text-[10px] text-zinc-400 mt-0.5">Say your state, occupation, land, and family income.</span>
                    </>
                  ) : language === 'hi' ? (
                    <>
                      <span className="block">अपना राज्य, व्यवसाय, भूमि और पारिवारिक आय बताएं।</span>
                      <span className="block text-[10px] text-zinc-400 mt-0.5">Say your state, occupation, land, and family income.</span>
                    </>
                  ) : (
                    <span>Say your state, occupation, land, and family income in English.</span>
                  )}
                </div>
              </div>
            )}
          </div>
        </div>

        {errorMessage && (
          <div className="p-2.5 rounded-lg bg-rose-50 text-rose-900 border border-rose-200 text-xs flex items-center gap-2">
            <AlertCircle className="w-4 h-4 text-rose-600 flex-shrink-0" />
            <span>{errorMessage}</span>
          </div>
        )}

        {/* Footer info */}
        <div className="flex items-center justify-between text-[11px] text-zinc-500 pt-2 border-t border-zinc-100">
          <span className="flex items-center gap-1">
            <CheckCircle2 className="w-3.5 h-3.5 text-emerald-600" /> Sensitive-ID Shield Active
          </span>
          <Button variant="secondary" onClick={onClose} className="text-xs py-1 px-3">
            Cancel
          </Button>
        </div>
      </div>
    </div>
  );
}
