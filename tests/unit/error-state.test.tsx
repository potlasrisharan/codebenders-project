import { fireEvent, render, screen } from "@testing-library/react";
import { ErrorState } from "../../src/components/ui/ErrorState";

describe("ErrorState", () => {
  it("renders the title and description inside the alert", () => {
    render(<ErrorState title="Something went wrong" description="Please try again later." />);
    const alert = screen.getByRole("alert");
    expect(alert).toHaveTextContent("Something went wrong");
    expect(alert).toHaveTextContent("Please try again later.");
  });

  it("renders a retry button that calls onRetry once when clicked", () => {
    const onRetry = vi.fn();
    render(
      <ErrorState
        title="Something went wrong"
        description="Please try again later."
        retryLabel="Retry"
        onRetry={onRetry}
      />,
    );
    const button = screen.getByRole("button", { name: "Retry" });
    fireEvent.click(button);
    expect(onRetry).toHaveBeenCalledTimes(1);
  });

  it("renders no button when onRetry is not provided", () => {
    render(<ErrorState title="Something went wrong" description="Please try again later." retryLabel="Retry" />);
    expect(screen.queryByRole("button")).not.toBeInTheDocument();
  });
});
