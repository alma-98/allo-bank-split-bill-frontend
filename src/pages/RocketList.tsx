import { useMemo, useState } from "react";

import { rockets } from "../data";
import { RocketGrid } from "../components/rocket";
import { SearchBar } from "../components/common";

import "./RocketList.css";

export default function RocketList() {

  const [search, setSearch] = useState("");

  const rocketItems = useMemo(
    () =>
      rockets.map((rocket) => ({
        id: rocket.id,
        name: rocket.name,
        description: rocket.description,
        image: rocket.flickr_images?.[0],
      })),
    []
  );

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
            Browse all available SpaceX rockets using local mock data.
          </p>

        </div>

      </div>

      <div className="rocket-list-container">

        <div className="rocket-summary">
          <strong>Total Rockets:</strong> {rocketItems.length}
        </div>

        <div style={{ marginBottom: "24px" }}>
          <SearchBar
            value={search}
            onChange={setSearch}
            placeholder="Search rockets..."
          />
        </div>

        <RocketGrid rockets={rocketItems} />

      </div>

    </section>
  );
}
