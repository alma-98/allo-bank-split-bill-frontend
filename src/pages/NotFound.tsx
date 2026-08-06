import { Link } from "react-router-dom";

export default function NotFound() {
  return (
    <section className="hero">
      <h1>404</h1>

      <p>Page not found.</p>

      <Link to="/">
        Back Home
      </Link>
    </section>
  );
}
