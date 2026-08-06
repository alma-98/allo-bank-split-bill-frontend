import { Link } from "react-router-dom";

export default function NotFound() {
  return (
    <div className="flex flex-col items-center justify-center min-h-screen">
      <h1 className="text-5xl font-bold">404</h1>
      <p className="mt-4">Page Not Found</p>
      <Link
        to="/"
        className="mt-6 rounded bg-blue-600 px-4 py-2 text-white"
      >
        Back to Dashboard
      </Link>
    </div>
  );
}
