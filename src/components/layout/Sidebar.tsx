import { NavLink } from "react-router-dom";

import {
LayoutDashboard,
Users,
Receipt,
Wallet,
BarChart3,
Shield,
Settings,
} from "lucide-react";

const menus = [

{
title:"Overview",
items:[
{
label:"Dashboard",
icon:LayoutDashboard,
to:"/dashboard"
}
]
},

{
title:"Operations",
items:[
{
label:"Groups",
icon:Users,
to:"/groups"
},
{
label:"Expenses",
icon:Receipt,
to:"/expenses"
},
{
label:"Settlement",
icon:Wallet,
to:"/settlement"
}
]
},

{
title:"Insights",
items:[
{
label:"Analytics",
icon:BarChart3,
to:"/analytics"
}
]
},

{
title:"Administration",
items:[
{
label:"Users",
icon:Users,
to:"/users"
},
{
label:"Admin",
icon:Shield,
to:"/admin"
},
{
label:"Settings",
icon:Settings,
to:"/settings"
}
]
}

];

export default function Sidebar(){

return(

<aside
style={{

width:280,

minHeight:"100vh",

background:"#0F172A",

color:"#fff",

padding:24,

display:"flex",

flexDirection:"column",

borderRight:"1px solid #1E293B",

flexShrink:0

}}
>

<div
style={{
marginBottom:30
}}
>

<h2
style={{
margin:0,
fontSize:24,
fontWeight:800,
color:"#fff"
}}
>
Split Bill
</h2>

<p
style={{
marginTop:6,
fontSize:13,
color:"#94A3B8"
}}
>
Enterprise Dashboard
</p>

</div>

{

menus.map(section=>(

<div
key={section.title}
style={{
marginBottom:28
}}
>

<div
style={{
fontSize:12,
fontWeight:700,
color:"#64748B",
marginBottom:10,
textTransform:"uppercase"
}}
>
{section.title}
</div>

{

section.items.map(item=>{

const Icon=item.icon;

return(

<NavLink

key={item.to}

to={item.to}

style={({isActive})=>({

display:"flex",

alignItems:"center",

gap:12,

padding:"12px 14px",

marginBottom:8,

borderRadius:12,

textDecoration:"none",

background:isActive
?"#E11D48"
:"transparent",

color:"#fff",

fontWeight:isActive
?700
:500,

transition:"all .2s"

})}

>

<Icon size={18}/>

<span>

{item.label}

</span>

</NavLink>

);

})

}

</div>

))

}

<div
style={{
marginTop:"auto",
paddingTop:20,
borderTop:"1px solid #334155",
fontSize:12,
color:"#94A3B8"
}}
>

Split Bill v1.0

</div>

</aside>

);

}
