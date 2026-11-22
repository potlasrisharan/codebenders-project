import { CircleCheck, CircleHelp, CircleX, Clock, type LucideIcon } from "lucide-react";

export const STATUS_LABELS = ["Likely eligible", "Need to confirm", "Unlikely", "Can't tell yet"] as const;
export type StatusLabel = (typeof STATUS_LABELS)[number];

const STATUS_ICONS: Record<StatusLabel, LucideIcon> = {
  "Likely eligible": CircleCheck,
  "Need to confirm": CircleHelp,
  Unlikely: CircleX,
  "Can't tell yet": Clock,
};

export function StatusChip({ status }: { status: StatusLabel }) {
  const Icon = STATUS_ICONS[status];
  return (
    <span className="chip">
      <Icon aria-hidden="true" size={16} />
      <span>{status}</span>
    </span>
  );
}
