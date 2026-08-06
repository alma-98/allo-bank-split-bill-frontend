

import {
NavLink
} from "react-router-dom";


const menus=[

["Dashboard","/dashboard"],
["Groups","/groups"],
["Expenses","/expenses"],
["Settlement","/settlement"],
["Analytics","/analytics"],
["Users","/users"],
["Admin","/admin"],
["Settings","/settings"]

];


export default function Sidebar(){


return (

<aside

style={{

width:"260px",

minHeight:"100vh",

background:"#000",

color:"#ffc100",

padding:"30px",

flexShrink:0

}}

>


<h2

style={{

fontWeight:800

}}

>

Allo

</h2>


<p>

Split Bill

</p>



<hr/>



{
menus.map(
menu=>(


<NavLink

key={menu[1]}

to={menu[1]}

style={({isActive})=>({

display:"block",

padding:"12px 15px",

margin:"8px 0",

borderRadius:"12px",

color:"#fff",

textDecoration:"none",

background:isActive
?"#ffc100"
:"#111",

})}

>

{menu[0]}


</NavLink>


)

)

}



</aside>

)

}

