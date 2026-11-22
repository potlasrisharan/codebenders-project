import { Activity, FileText, Info, ListChecks, Search, ShieldCheck } from "lucide-react";
import { Navigate, Outlet, Route, Routes } from "react-router-dom";
import { AppLayout } from "../components/layout/AppLayout";
import { PlaceholderPage } from "./PlaceholderPage";

export function AppRoutes() {
  return (
    <Routes>
      <Route
        element={
          <AppLayout>
            <Outlet />
          </AppLayout>
        }
      >
        <Route
          path="/intake"
          element={
            <PlaceholderPage
              icon={FileText}
              heading="Intake"
              description="Tell us a little about your household to see possible schemes."
            />
          }
        />
        <Route
          path="/matches"
          element={
            <PlaceholderPage
              icon={Search}
              heading="Matches"
              description="Schemes that may fit your answers will appear here."
            />
          }
        />
        <Route
          path="/scheme/:schemeId"
          element={
            <PlaceholderPage
              icon={Info}
              heading="Scheme detail"
              description="Details, requirements and documents for this scheme will appear here."
            />
          }
        />
        <Route
          path="/checklist"
          element={
            <PlaceholderPage
              icon={ListChecks}
              heading="Checklist"
              description="Your application checklist will appear here."
            />
          }
        />
        <Route
          path="/tracker"
          element={
            <PlaceholderPage
              icon={Activity}
              heading="Tracker"
              description="Track the status of your applications here."
            />
          }
        />
        <Route
          path="/admin-review"
          element={
            <PlaceholderPage
              icon={ShieldCheck}
              heading="Admin review"
              description="Admin review tools will appear here."
            />
          }
        />
      </Route>
      <Route path="*" element={<Navigate to="/intake" replace />} />
    </Routes>
  );
}
