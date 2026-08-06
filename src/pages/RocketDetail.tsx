import { Link, useParams } from "react-router-dom";
import { rockets } from "../data";
import "../styles/rocket-detail.css";

export default function RocketDetail() {
  const { id } = useParams();

  const rocket = rockets.find(r => r.id === id);

  if (!rocket) {
    return (
      <section className="rocket-detail-page">

        <div className="rocket-not-found">

          <h1>🚀 Rocket Not Found</h1>

          <p>The rocket you're looking for doesn't exist.</p>

          <Link className="back-button" to="/rockets">
            ← Back to Rocket List
          </Link>

        </div>
      </section>
    );
  }

  return (
    <section className="rocket-detail-page">

      <div className="rocket-detail-card">

        <img
          src={rocket.flickr_images[0]}
          alt={rocket.name}
          className="rocket-image"
        />

        <div className="rocket-content">

          <div className="rocket-header">

            <h1>{rocket.name}</h1>

            <span
              className={
                rocket.active
                  ? "status active"
                  : "status inactive"
              }
            >
              {rocket.active ? "ACTIVE" : "RETIRED"}
            </span>

          </div>

          <p className="rocket-description">
            {rocket.description}
          </p>

          <div className="rocket-grid">

            <div className="info-card">
              <h4>Company</h4>
              <span>{rocket.company}</span>
            </div>

            <div className="info-card">
              <h4>Country</h4>
              <span>{rocket.country}</span>
            </div>

            <div className="info-card">
              <h4>First Flight</h4>
              <span>{rocket.first_flight}</span>
            </div>

            <div className="info-card">
              <h4>Success Rate</h4>
              <span>{rocket.success_rate_pct}%</span>
            </div>

            <div className="info-card">
              <h4>Cost / Launch</h4>
              <span>
                ${rocket.cost_per_launch.toLocaleString()}
              </span>
            </div>

            <div className="info-card">
              <h4>Stages</h4>
              <span>{rocket.stages}</span>
            </div>

            <div className="info-card">
              <h4>Boosters</h4>
              <span>{rocket.boosters}</span>
            </div>

            <div className="info-card">
              <h4>Height</h4>
              <span>{rocket.height.meters} m</span>
            </div>

            <div className="info-card">
              <h4>Diameter</h4>
              <span>{rocket.diameter.meters} m</span>
            </div>

            <div className="info-card">
              <h4>Mass</h4>
              <span>
                {rocket.mass.kg.toLocaleString()} kg
              </span>
            </div>

          </div>

          <Link className="back-button" to="/rockets">
            ← Back to Rocket List
          </Link>

        </div>

      </div>

    </section>
  );
}
