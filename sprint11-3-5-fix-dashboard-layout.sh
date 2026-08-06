#!/bin/bash

set -e

echo "======================================"
echo " FIX DASHBOARD SIDEBAR LAYOUT "
echo "======================================"


echo "=== FIX APP LAYOUT ==="


cat > src/components/layout/AppLayout.tsx <<'TSX'

import Sidebar from "./Sidebar";
import Header from "./Header";


export default function AppLayout(
{
children
}:{
children:React.ReactNode;
}){


return (

<div

style={{

display:"flex",

minHeight:"100vh",

background:"#f8fafc"

}}

>


<Sidebar/>


<div

style={{

flex:1,

display:"flex",

flexDirection:"column"

}}

>


<Header/>


<main

style={{

flex:1,

padding:"30px"

}}

>

{children}

</main>


</div>


</div>

)

}

TSX



echo "=== FIX DASHBOARD ROUTE ==="


cat > src/router/AppRouter.tsx <<'TSX'

import {
BrowserRouter,
Routes,
Route
} from "react-router-dom";


import Landing from "../pages/public/Landing";

import Login from "../pages/Login";


import Dashboard from "../pages/Dashboard";
import Groups from "../pages/Groups";
import Expenses from "../pages/Expenses";
import Settlement from "../pages/Settlement";
import Analytics from "../pages/Analytics";
import Users from "../pages/Users";
import Admin from "../pages/Admin";
import Settings from "../pages/Settings";


import ProtectedRoute from "./ProtectedRoute";

import AppLayout from "../components/layout/AppLayout";



function PrivateLayout(
{
children
}:{
children:React.ReactNode;
}){

return (

<ProtectedRoute>

<AppLayout>

{children}

</AppLayout>

</ProtectedRoute>

)

}



export default function AppRouter(){


return (

<BrowserRouter>


<Routes>


{/* PUBLIC */}

<Route

path="/"

element={<Landing/>}

/>


<Route

path="/login"

element={<Login/>}

/>



{/* PRIVATE */}


<Route

path="/dashboard"

element={

<PrivateLayout>

<Dashboard/>

</PrivateLayout>

}

/>



<Route

path="/groups"

element={

<PrivateLayout>

<Groups/>

</PrivateLayout>

}

/>



<Route

path="/expenses"

element={

<PrivateLayout>

<Expenses/>

</PrivateLayout>

}

/>



<Route

path="/settlement"

element={

<PrivateLayout>

<Settlement/>

</PrivateLayout>

}

/>



<Route

path="/analytics"

element={

<PrivateLayout>

<Analytics/>

</PrivateLayout>

}

/>



<Route

path="/users"

element={

<PrivateLayout>

<Users/>

</PrivateLayout>

}

/>



<Route

path="/admin"

element={

<PrivateLayout>

<Admin/>

</PrivateLayout>

}

/>



<Route

path="/settings"

element={

<PrivateLayout>

<Settings/>

</PrivateLayout>

}

/>



</Routes>


</BrowserRouter>

)

}

TSX



echo "=== UPDATE SIDEBAR STYLE ==="


cat > src/components/layout/Sidebar.tsx <<'TSX'


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

TSX



npm run build


echo ""
echo "======================================"
echo " DASHBOARD SIDEBAR FIX COMPLETE "
echo "======================================"

