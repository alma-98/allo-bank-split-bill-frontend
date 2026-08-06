import { useEffect, useState } from "react";
import { useNavigate, useParams } from "react-router-dom";
import { getRocket } from "../services/RocketService";

export default function RocketDetail() {
  const { id } = useParams();
  const navigate = useNavigate();

  const [rocket, setRocket] = useState<any>(null);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    if (!id) return;

    getRocket(id)
      .then((res) => setRocket(res.data))
      .finally(() => setLoading(false));
  }, [id]);

  if (loading) return <div className="p-8">Loading...</div>;
  if (!rocket) return <div className="p-8">Rocket Not Found</div>;

  return (
    <div className="max-w-6xl mx-auto p-8">
      <button
        onClick={() => navigate(-1)}
        className="mb-6 px-4 py-2 rounded bg-gray-200"
      >
        ← Back
      </button>

      <img
        src={rocket.flickr_images?.[0]}
        alt={rocket.name}
        className="w-full rounded-xl mb-6"
      />

      <h1 className="text-5xl font-bold mb-4">{rocket.name}</h1>

      <p>{rocket.description}</p>
    </div>
  );
}
