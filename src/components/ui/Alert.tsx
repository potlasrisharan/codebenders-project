import { Info } from "lucide-react";
import type { ReactNode } from "react";

export function Alert({ children }: { children: ReactNode }) {
  return (
    <div className="alert" role="status">
      <Info aria-hidden="true" size={20} />
      <div>{children}</div>
    </div>
  );
}
