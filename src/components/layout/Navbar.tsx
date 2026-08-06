import { Link, NavLink } from "react-router-dom";
import "./Navbar.css";

export default function Navbar() {
  return (
    <header className="navbar">
      <div className="navbar-container">

        <Link to="/" className="navbar-logo">
          🚀 SpaceX Rocket Explorer
        </Link>

        <nav className="navbar-menu">

          <NavLink
            to="/"
            className={({ isActive }) =>
              isActive ? "active" : ""
            }
          >
            Home
          </NavLink>

          <NavLink
            to="/rockets"
            className={({ isActive }) =>
              isActive ? "active" : ""
            }
          >
            Rockets
          </NavLink>

        </nav>

      </div>
    </header>
  );
}
