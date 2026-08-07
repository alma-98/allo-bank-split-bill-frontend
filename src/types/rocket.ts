export interface RocketDimension {
  meters: number;
  feet: number;
}

export interface RocketMass {
  kg: number;
  lb: number;
}

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

  height: RocketDimension;

  diameter: RocketDimension;

  mass: RocketMass;

  flickr_images: string[];
}

export interface RocketState {
  rockets: Rocket[];

  loading: boolean;

  error: string | null;

  search: string;
}
