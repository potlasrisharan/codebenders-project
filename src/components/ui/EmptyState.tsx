import type { LucideIcon } from "lucide-react";
import { ButtonLink } from "./Button";

export interface EmptyStateProps {
  icon: LucideIcon;
  title: string;
  description: string;
  action: { label: string; to: string };
}

export function EmptyState({ icon: Icon, title, description, action }: EmptyStateProps) {
  return (
    <div className="empty-state">
      <Icon aria-hidden="true" size={32} />
      <h2>{title}</h2>
      <p>{description}</p>
      <ButtonLink to={action.to} variant="primary">
        {action.label}
      </ButtonLink>
    </div>
  );
}
