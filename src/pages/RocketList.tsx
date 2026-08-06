import { useState } from "react";
import { SearchBar } from "../components/common";
import "./RocketList.css";

export default function RocketList() {
  const [search, setSearch] = useState("");

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
            Browse every SpaceX rocket and explore technical specifications.
          </p>

        </div>
      </div>

      <div className="rocket-list-container">

        <SearchBar
          value={search}
          onChange={setSearch}
          placeholder="Search rocket..."
        />

        <div className="rocket-search-info">
          Search :
          <strong>
            {search || " All Rockets"}
          </strong>
        </div>

        {/* Loading */}

        {/* Error */}

        {/* RocketGrid */}

      </div>
    </section>
  );
}
