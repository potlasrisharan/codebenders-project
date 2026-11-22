import { render, screen } from "@testing-library/react";
import { STATUS_LABELS, StatusChip } from "../../src/components/ui/StatusChip";

describe("StatusChip", () => {
  it.each(STATUS_LABELS)("renders the %s label", (status) => {
    render(<StatusChip status={status} />);
    expect(screen.getByText(status)).toBeInTheDocument();
  });
});
