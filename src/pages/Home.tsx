import { Link } from "react-router-dom";

export default function Home() {
  return (
    <section
      style={{
        maxWidth: "900px",
        margin: "0 auto",
        padding: "80px 24px",
        textAlign: "center",
      }}
    >
      <h1>🚀 SpaceX Rocket Explorer</h1>

      <p style={{ marginTop: 20 }}>
        Explore SpaceX rockets with a modern React + TypeScript application.
      </p>

      <p style={{ marginTop: 12 }}>
        Browse rocket information, specifications, and mission history.
      </p>

      <div style={{ marginTop: 40 }}>
        <Link
          to="/rockets"
          style={{
            display: "inline-block",
            padding: "14px 28px",
            background: "#2563eb",
            color: "#fff",
            borderRadius: "10px",
            textDecoration: "none",
            fontWeight: 600,
          }}
        >
          Explore Rockets →
        </Link>
      </div>
    </section>
  );
}
