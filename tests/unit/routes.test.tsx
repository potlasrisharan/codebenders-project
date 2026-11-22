import { render, screen } from "@testing-library/react";
import { MemoryRouter } from "react-router-dom";
import { afterEach, beforeEach, describe, expect, it, vi } from "vitest";
import { AppRoutes } from "../../src/routes/Routes";

const cases: { path: string; heading: string }[] = [
  { path: "/", heading: "LabhSaathi" },
  { path: "/intake", heading: "Intake" },
  { path: "/matches", heading: "Matches" },
  { path: "/scheme/test", heading: "Scheme detail" },
  { path: "/checklist", heading: "Checklist" },
  { path: "/tracker", heading: "Tracker" },
  { path: "/admin-review", heading: "Admin review" },
];

describe("AppRoutes", () => {
  let errorSpy: ReturnType<typeof vi.spyOn>;

  beforeEach(() => {
    errorSpy = vi.spyOn(console, "error").mockImplementation(() => {});
  });

  afterEach(() => {
    errorSpy.mockRestore();
  });

  it.each(cases)("renders the $heading placeholder at $path", ({ path, heading }) => {
    render(
      <MemoryRouter initialEntries={[path]}>
        <AppRoutes />
      </MemoryRouter>,
    );
    expect(screen.getByRole("heading", { level: 1, name: heading })).toBeInTheDocument();
    expect(errorSpy).not.toHaveBeenCalled();
  });
});
