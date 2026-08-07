

import {
logout
} from "../../auth/AuthService";


export default function Header(){


return (

<header

style={{

height:"70px",

background:"white",

display:"flex",

justifyContent:"space-between",

alignItems:"center",

padding:"0 30px",

boxShadow:
"0 2px 10px rgba(0,0,0,.08)"

}}

>


<h3>
Allo Bank Split Bill
</h3>



<div>


<span
style={{
marginRight:"20px"
}}
>

ADMIN

</span>



<button

onClick={()=>{

logout();

window.location.href="/login";

}}

>

Logout

</button>



</div>


</header>

)

}

