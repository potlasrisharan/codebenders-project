/* eslint-disable @typescript-eslint/no-explicit-any */
import "@testing-library/jest-dom/vitest";

// Browser APIs mocks for jsdom
if (typeof window !== "undefined") {
  if (!window.IntersectionObserver) {
    class MockIntersectionObserver implements IntersectionObserver {
      readonly root: Element | Document | null = null;
      readonly rootMargin: string = "";
      readonly thresholds: ReadonlyArray<number> = [];
      disconnect() {}
      observe() {}
      takeRecords() {
        return [];
      }
      unobserve() {}
    }
    window.IntersectionObserver = MockIntersectionObserver as any;
    global.IntersectionObserver = MockIntersectionObserver as any;
  }

  if (!window.ResizeObserver) {
    class MockResizeObserver implements ResizeObserver {
      disconnect() {}
      observe() {}
      unobserve() {}
    }
    window.ResizeObserver = MockResizeObserver as any;
    global.ResizeObserver = MockResizeObserver as any;
  }

  // Prevent jsdom "Not implemented: HTMLCanvasElement.prototype.getContext" console error
  HTMLCanvasElement.prototype.getContext = (() => null) as any;
}

