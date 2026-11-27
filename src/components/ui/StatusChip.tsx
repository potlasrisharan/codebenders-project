import { CheckCircle2, HelpCircle, XCircle, Clock, type LucideIcon } from "lucide-react";

export const STATUS_LABELS = ["Likely eligible", "Need to confirm", "Unlikely", "Can't tell yet"] as const;
export type StatusLabel = (typeof STATUS_LABELS)[number];

const STATUS_CONFIG: Record<
  StatusLabel,
  {
    icon: LucideIcon;
    bgClass: string;
    textClass: string;
    borderClass: string;
    dotClass: string;
  }
> = {
  "Likely eligible": {
    icon: CheckCircle2,
    bgClass: "bg-emerald-50/90",
    textClass: "text-emerald-900",
    borderClass: "border-emerald-300 shadow-xs",
    dotClass: "bg-emerald-500 animate-pulse",
  },
  "Need to confirm": {
    icon: HelpCircle,
    bgClass: "bg-amber-50/90",
    textClass: "text-amber-900",
    borderClass: "border-amber-300 shadow-xs",
    dotClass: "bg-amber-500",
  },
  Unlikely: {
    icon: XCircle,
    bgClass: "bg-zinc-100/90",
    textClass: "text-zinc-700",
    borderClass: "border-zinc-300",
    dotClass: "bg-zinc-400",
  },
  "Can't tell yet": {
    icon: Clock,
    bgClass: "bg-sky-50/90",
    textClass: "text-sky-900",
    borderClass: "border-sky-300 shadow-xs",
    dotClass: "bg-sky-500",
  },
};

export function StatusChip({ status }: { status: StatusLabel }) {
  const config = STATUS_CONFIG[status] || STATUS_CONFIG["Can't tell yet"];
  const Icon = config.icon;

  return (
    <span
      className={`chip inline-flex items-center gap-1.5 px-2.5 py-1 text-xs rounded-full border transition-all ${config.bgClass} ${config.textClass} ${config.borderClass}`}
    >
      <span className={`w-1.5 h-1.5 rounded-full ${config.dotClass}`} aria-hidden="true" />
      <Icon aria-hidden="true" size={14} className="flex-shrink-0" />
      <span className="font-semibold tracking-tight">{status}</span>
    </span>
  );
}
