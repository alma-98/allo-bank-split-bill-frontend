import Card from "../common/Card";
import "./RocketCard.css";

interface RocketCardProps {
  id?: string;
  name: string;
  description?: string;
  image?: string;
  onClick?: () => void;
}

export default function RocketCard({
  name,
  description,
  image,
  onClick,
}: RocketCardProps) {
  return (
    <Card
      className="rocket-card"
      onClick={onClick}
    >

      {image ? (
        <img
          src={image}
          alt={name}
          className="rocket-card-image"
        />
      ) : (
        <div className="rocket-card-placeholder">
          🚀
        </div>
      )}

      <div className="rocket-card-content">

        <h3 className="rocket-card-title">
          {name}
        </h3>

        <p className="rocket-card-description">
          {description || "No description available."}
        </p>

      </div>

    </Card>
  );
}
