export interface SkeletonProps {
  width?: string;
  height?: string;
}

export function Skeleton({ width = "100%", height = "1rem" }: SkeletonProps) {
  return <span className="skeleton" aria-hidden="true" style={{ width, height }} />;
}
