import type { LucideIcon } from "lucide-react";
import { EmptyState } from "../components/ui/EmptyState";

export interface PlaceholderPageProps {
  icon: LucideIcon;
  heading: string;
  description: string;
}

export function PlaceholderPage({ icon, heading, description }: PlaceholderPageProps) {
  return (
    <div className="stack">
      <h1>{heading}</h1>
      <EmptyState
        icon={icon}
        title="Nothing here yet"
        description={description}
        action={{ label: "Back to start", to: "/" }}
      />
    </div>
  );
}
