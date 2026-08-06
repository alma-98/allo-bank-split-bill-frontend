import "./Loading.css";

interface LoadingProps {
  message?: string;
}

export default function Loading({
  message = "Loading rockets..."
}: LoadingProps) {
  return (
    <div className="loading">
      <div className="loading-spinner" />
      <p>{message}</p>
    </div>
  );
}
