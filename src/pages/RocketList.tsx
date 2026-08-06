import { rockets } from "../data";
import "./RocketList.css";

export default function RocketList() {
  return (
    <section className="rocket-list-page">
      <div className="rocket-hero">
        <div className="rocket-hero-content">
          <span className="rocket-badge">
            🚀 SpaceX Rocket Explorer
          </span>

          <h1 className="rocket-title">
            SpaceX Rocket Explorer
          </h1>

          <p className="rocket-subtitle">
            Browse all available SpaceX rockets using
            local mock data.
          </p>
        </div>
      </div>

      <div className="rocket-list-container">

        <div className="rocket-summary">
          <strong>Total Rockets :</strong> {rockets.length}
        </div>

        <div className="rocket-list">

          {rockets.map((rocket) => (
            <article
              key={rocket.id}
              className="rocket-item"
            >
              <h2>{rocket.name}</h2>

              <p>{rocket.description}</p>

              <small>
                {rocket.country}
              </small>
            </article>
          ))}

        </div>

      </div>
    </section>
  );
}
