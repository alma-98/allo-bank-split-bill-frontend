import { Button } from "./index";
import "./ErrorState.css";

interface ErrorStateProps {
  message: string;
  onRetry: () => void;
}

export default function ErrorState({
  message,
  onRetry,
}: ErrorStateProps) {
  return (
    <div className="error-state">
      <h3>Something went wrong</h3>

      <p>{message}</p>

      <Button
        variant="primary"
        onClick={onRetry}
      >
        Retry
      </Button>
    </div>
  );
}
