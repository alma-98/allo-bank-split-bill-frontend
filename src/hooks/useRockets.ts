import { useEffect, useState } from "react";
import { getRockets } from "../services/RocketService";

export function useRockets() {
  const [rockets, setRockets] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState("");

  useEffect(() => {
    getRockets()
      .then((res) => setRockets(res.data))
      .catch(() => setError("Failed to load rockets"))
      .finally(() => setLoading(false));
  }, []);

  return { rockets, loading, error };
}
