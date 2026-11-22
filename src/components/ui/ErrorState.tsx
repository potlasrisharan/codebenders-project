export type ErrorStateProps = {
  title: string;
  description: string;
  retryLabel?: string;
  onRetry?: () => void;
};

export function ErrorState({ title, description, retryLabel, onRetry }: ErrorStateProps) {
  return (
    <div role="alert" className="alert">
      <h2>{title}</h2>
      <p>{description}</p>
      {retryLabel && onRetry ? (
        <button type="button" className="btn btn--secondary" onClick={onRetry}>
          {retryLabel}
        </button>
      ) : null}
    </div>
  );
}
