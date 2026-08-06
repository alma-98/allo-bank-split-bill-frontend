import { useParams, Link } from "react-router-dom";

export default function RocketDetail() {
  const { id } = useParams();

  return (
    <section className="container" style={{ padding: "48px 24px" }}>
      <h1>Rocket Detail</h1>

      <p>
        Rocket ID: <strong>{id}</strong>
      </p>

      <p>
        Detail page integration will be completed in Sprint 10.4.
      </p>

      <Link to="/">
        ← Back to Rocket List
      </Link>
    </section>
  );
}
