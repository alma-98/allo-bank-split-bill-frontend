import { Link } from "react-router-dom";

export default function Navbar() {
  return (
    <header className="navbar">
      <div className="container navbar-content">
        <Link to="/" className="logo">
          🚀 SpaceX Rocket Explorer
        </Link>
      </div>
    </header>
  );
}
