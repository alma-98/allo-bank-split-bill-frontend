import { Link } from "react-router-dom";

export default function NotFound() {
  return (
    <div
      style={{
        minHeight: "100vh",
        display: "flex",
        alignItems: "center",
        justifyContent: "center",
        flexDirection: "column",
        gap: 20,
      }}
    >
      <h1 style={{ fontSize: 72, margin: 0 }}>404</h1>

      <h2>Page Not Found</h2>

      <p>The page you're looking for doesn't exist.</p>

      <Link to="/dashboard">
        Back to Dashboard
      </Link>
    </div>
  );
}
