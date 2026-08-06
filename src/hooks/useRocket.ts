import { useEffect, useState } from "react";
import { getRocket } from "../services/RocketService";

export function useRocket(id?: string) {
  const [rocket, setRocket] = useState(null);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    if (!id) return;

    getRocket(id)
      .then((res) => setRocket(res.data))
      .finally(() => setLoading(false));
  }, [id]);

  return { rocket, loading };
}
