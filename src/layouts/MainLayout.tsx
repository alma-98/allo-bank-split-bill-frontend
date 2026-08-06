import {
Outlet
} from "react-router-dom";


export default function MainLayout(){

return (

<div>


<header>

<h2>
Allo Bank Split Bill
</h2>

</header>


<main>

<Outlet/>

</main>


<footer>

<p>
Allo Bank Split Bill API v1.0.0
</p>

</footer>


</div>

);

}
