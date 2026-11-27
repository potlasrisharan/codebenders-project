import { Navigate, Outlet, Route, Routes } from "react-router-dom";
import { AppLayout } from "../components/layout/AppLayout";
import { LandingPage } from "./LandingPage";
import { IntakePage } from "./IntakePage";
import { MatchesPage } from "./MatchesPage";
import { SchemeDetailPage } from "./SchemeDetailPage";
import { ChecklistPage } from "./ChecklistPage";
import { TrackerPage } from "./TrackerPage";
import { AdminReviewPage } from "./AdminReviewPage";
import { ProfileProvider } from "../core/profile/ProfileContext";
import { LanguageProvider } from "../core/i18n/LanguageContext";

export function AppRoutes() {
  return (
    <LanguageProvider>
      <ProfileProvider>
        <Routes>
          <Route
            element={
              <AppLayout>
                <Outlet />
              </AppLayout>
            }
          >
            <Route path="/" element={<LandingPage />} />
            <Route path="/intake" element={<IntakePage />} />
            <Route path="/matches" element={<MatchesPage />} />
            <Route path="/scheme/:schemeId" element={<SchemeDetailPage />} />
            <Route path="/checklist" element={<ChecklistPage />} />
            <Route path="/tracker" element={<TrackerPage />} />
            <Route path="/admin-review" element={<AdminReviewPage />} />
          </Route>
          <Route path="*" element={<Navigate to="/intake" replace />} />
        </Routes>
      </ProfileProvider>
    </LanguageProvider>
  );
}
