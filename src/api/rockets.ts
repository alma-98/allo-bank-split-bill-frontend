import { api } from "./index";

export interface Rocket {
  id: string;
  name: string;
  description: string;
  active: boolean;
  country: string;
  company: string;
  first_flight: string;
  cost_per_launch: number;
  success_rate_pct: number;
  boosters: number;
  stages: number;
  height: {
    meters: number;
    feet: number;
  };
  diameter: {
    meters: number;
    feet: number;
  };
  mass: {
    kg: number;
    lb: number;
  };
  flickr_images: string[];
}

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
