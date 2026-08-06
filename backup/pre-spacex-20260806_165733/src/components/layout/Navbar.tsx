import { Link } from "react-router-dom";

export default function Navbar() {

return(

<nav className="bg-gray-900 text-white shadow">

<div className="max-w-7xl mx-auto flex justify-between items-center p-4">

<Link
to="/"
className="text-2xl font-bold"
>

🚀 SpaceX Explorer

</Link>

<span className="text-sm opacity-80">

Frontend Technical Assignment

</span>

</div>

</nav>

);

}
