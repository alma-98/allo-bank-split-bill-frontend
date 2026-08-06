import { Link } from "react-router-dom";

interface Rocket {
  id: string;
  name: string;
  country: string;
  company: string;
  first_flight: string;
  flickr_images: string[];
}

export default function RocketCard({ rocket }: { rocket: Rocket }) {
  return (
    <Link
      to={"/rocket/" + rocket.id}
      className="block rounded-xl border bg-white shadow hover:shadow-lg overflow-hidden"
    >
      <img
        src={rocket.flickr_images?.[0]}
        alt={rocket.name}
        className="w-full h-52 object-cover"
      />

      <div className="p-4">
        <h2 className="text-xl font-bold">{rocket.name}</h2>

        <p>{rocket.company}</p>

        <p>{rocket.country}</p>

        <p>{rocket.first_flight}</p>
      </div>
    </Link>
  );
}
