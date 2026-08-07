
import {Link} from "react-router-dom";


export default function Navbar(){

return (

<nav className="nav">


<div className="logo">

Allo

</div>


<div>


<Link

className="btn"

to="/login"

>

Login

</Link>


</div>


</nav>

)

}

