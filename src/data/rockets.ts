import type { Rocket } from "../types";

export const rockets: Rocket[] = [
  {
    id: "falcon1",
    name: "Falcon 1",
    description:
      "The first rocket developed by SpaceX.",
    active: false,
    country: "United States",
    company: "SpaceX",
    first_flight: "2006-03-24",
    cost_per_launch: 6700000,
    success_rate_pct: 40,
    boosters: 0,
    stages: 2,
    height: { meters: 22.25, feet: 73 },
    diameter: { meters: 1.68, feet: 5.5 },
    mass: { kg: 30146, lb: 66460 },
    flickr_images: [
      "https://imgur.com/DaCfMsj.jpg"
    ]
  },
  {
    id: "falcon9",
    name: "Falcon 9",
    description:
      "Reusable medium-lift launch vehicle.",
    active: true,
    country: "United States",
    company: "SpaceX",
    first_flight: "2010-06-04",
    cost_per_launch: 50000000,
    success_rate_pct: 98,
    boosters: 0,
    stages: 2,
    height: { meters: 70, feet: 229.6 },
    diameter: { meters: 3.7, feet: 12 },
    mass: { kg: 549054, lb: 1207920 },
    flickr_images: [
      "https://imgur.com/azYafd8.jpg"
    ]
  },
  {
    id: "falconheavy",
    name: "Falcon Heavy",
    description:
      "The world's most powerful operational rocket.",
    active: true,
    country: "United States",
    company: "SpaceX",
    first_flight: "2018-02-06",
    cost_per_launch: 90000000,
    success_rate_pct: 100,
    boosters: 2,
    stages: 2,
    height: { meters: 70, feet: 229.6 },
    diameter: { meters: 12.2, feet: 39.9 },
    mass: { kg: 1420788, lb: 3125735 },
    flickr_images: [
      "https://imgur.com/BrW201S.jpg"
    ]
  }
];
