import { api } from "./index";
import type { Rocket } from "../types/rocket";

export async function getRockets(): Promise<Rocket[]> {
  const { data } = await api.get<Rocket[]>("/rockets");
  return data;
}

export async function getRocket(
  id: string
): Promise<Rocket> {
  const { data } = await api.get<Rocket>(
    `/rockets/${id}`
  );

  return data;
}

const rocketService = {
  getRockets,
  getRocket,
};

export default rocketService;
