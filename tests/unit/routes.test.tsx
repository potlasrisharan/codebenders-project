import { render, screen } from "@testing-library/react";
import { MemoryRouter } from "react-router-dom";
import { afterEach, beforeEach, describe, expect, it, vi } from "vitest";
import { AppRoutes } from "../../src/routes/Routes";

const cases: { path: string; name: RegExp }[] = [
  { path: "/", name: /LabhSaathi/i },
  { path: "/intake", name: /Intake/i },
  { path: "/matches", name: /Matches|Schemes/i },
  { path: "/scheme/test", name: /Scheme detail/i },
  { path: "/checklist", name: /Checklist/i },
  { path: "/tracker", name: /Tracker/i },
  { path: "/admin-review", name: /Admin review/i },
];

describe("AppRoutes", () => {
  let errorSpy: ReturnType<typeof vi.spyOn>;

  beforeEach(() => {
    errorSpy = vi.spyOn(console, "error").mockImplementation(() => {});
  });

  afterEach(() => {
    errorSpy.mockRestore();
  });

  it.each(cases)("renders the header for $path", ({ path, name }) => {
    render(
      <MemoryRouter initialEntries={[path]}>
        <AppRoutes />
      </MemoryRouter>,
    );
    expect(screen.getByRole("heading", { level: 1, name })).toBeInTheDocument();
    expect(errorSpy).not.toHaveBeenCalled();
  });
});
