import { useCallback, useEffect, useState } from "react";
import { rocketService } from "../api";
import type { Rocket } from "../types";

export interface UseRocketsResult {
  rockets: Rocket[];
  loading: boolean;
  error: string | null;
  refetch: () => Promise<void>;
}

export default function useRockets(): UseRocketsResult {
  const [rockets, setRockets] = useState<Rocket[]>([]);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState<string | null>(null);

  const fetchRockets = useCallback(async () => {
    try {
      setLoading(true);
      setError(null);

      const data = await rocketService.getRockets();

      setRockets(data);
    } catch (err) {
      const message =
        err instanceof Error
          ? err.message
          : "Failed to fetch rockets.";

      setError(message);
    } finally {
      setLoading(false);
    }
  }, []);

  useEffect(() => {
    void fetchRockets();
  }, [fetchRockets]);

  return {
    rockets,
    loading,
    error,
    refetch: fetchRockets,
  };
}
