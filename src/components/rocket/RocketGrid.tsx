import RocketCard from "./RocketCard";
import "./RocketGrid.css";

export interface RocketItem {
  id: string;
  name: string;
  description?: string;
  image?: string;
}

interface RocketGridProps {
  rockets: RocketItem[];
  onSelect?: (rocket: RocketItem) => void;
}

export default function RocketGrid({
  rockets,
  onSelect,
}: RocketGridProps) {
  if (rockets.length === 0) {
    return (
      <div className="rocket-grid-empty">
        <h3>No rockets found</h3>
        <p>Try another search keyword.</p>
      </div>
    );
  }

  return (
    <section className="rocket-grid">
      {rockets.map((rocket) => (
        <RocketCard
          key={rocket.id}
          id={rocket.id}
          name={rocket.name}
          description={rocket.description}
          image={rocket.image}
          onClick={() => onSelect?.(rocket)}
        />
      ))}
    </section>
  );
}
