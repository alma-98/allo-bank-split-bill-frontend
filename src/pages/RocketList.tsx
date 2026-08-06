import "./RocketList.css";

export default function RocketList() {
  return (
    <section className="rocket-list-page">

      <div className="rocket-hero">

        <div className="rocket-hero-content">

          <span className="rocket-badge">
            🚀 SpaceX Explorer
          </span>

          <h1 className="rocket-title">
            Discover SpaceX Rockets
          </h1>

          <p className="rocket-subtitle">
            Browse every SpaceX rocket, explore technical
            specifications, and view launch information in
            one modern interface.
          </p>

          <div className="rocket-actions">
            <button
              className="hero-primary-button"
              type="button"
            >
              Explore Rockets
            </button>

            <button
              className="hero-secondary-button"
              type="button"
            >
              Learn More
            </button>
          </div>

        </div>

      </div>

      <div className="rocket-list-container">

        <main className="rocket-list-content">

          {/* SearchBar */}

          {/* Loading */}

          {/* Error */}

          {/* RocketGrid */}

        </main>

      </div>

    </section>
  );
}
