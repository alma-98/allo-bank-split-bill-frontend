import { useMemo, useState } from "react";

import useRockets from "../hooks/useRockets";

import {
  SearchBar,
  Loading,
  ErrorState,
} from "../components/common";

import {
  RocketGrid,
} from "../components/rocket";

import "./RocketList.css";

export default function RocketList() {

  const [search, setSearch] = useState("");

  const {
    rockets,
    loading,
    error,
    refetch,
  } = useRockets();

  const filteredRockets = useMemo(() => {
    const keyword = search.trim().toLowerCase();

    if (!keyword) {
      return rockets;
    }

    return rockets.filter((rocket) =>
      rocket.name.toLowerCase().includes(keyword)
    );
  }, [rockets, search]);

  if (loading) {
    return <Loading />;
  }

  if (error) {
    return (
      <ErrorState
        message={error}
        onRetry={() => {
          void refetch();
        }}
      />
    );
  }

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
          placeholder="Search rockets..."
        />

        <RocketGrid
          rockets={filteredRockets}
        />

      </div>

    </section>
  );
}
