#!/bin/bash

set -e

echo "======================================"
echo " SPRINT 11.2 NAVIGATION SHELL "
echo "======================================"


mkdir -p src/pages


echo "=== SIDEBAR ==="


cat > src/components/layout/Sidebar.tsx <<'TSX'

import {
NavLink
} from "react-router-dom";


const menus=[

{
name:"Dashboard",
path:"/"
},

{
name:"Groups",
path:"/groups"
},

{
name:"Expenses",
path:"/expenses"
},

{
name:"Settlement",
path:"/settlement"
},

{
name:"Analytics",
path:"/analytics"
},

{
name:"Users",
path:"/users"
},

{
name:"Admin",
path:"/admin"
},

{
name:"Settings",
path:"/settings"
}

];



export default function Sidebar(){


return (

<aside

style={{

width:"260px",
minHeight:"100vh",
background:"#0f172a",
color:"white",
padding:"25px"

}}

>


<h2>
Allo Split
</h2>


<p
style={{
color:"#94a3b8"
}}
>
Expense Platform
</p>



<hr/>


{
menus.map(menu=>(

<NavLink

key={menu.path}

to={menu.path}

style={({

isActive

})=>({

display:"block",

padding:"12px",

margin:"8px 0",

borderRadius:"10px",

color:"white",

textDecoration:"none",

background:
isActive
?"#2563eb"
:"transparent"

})}

>

{menu.name}

</NavLink>

))

}



</aside>

)

}

TSX



echo "=== HEADER ==="


cat > src/components/layout/Header.tsx <<'TSX'


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

TSX



echo "=== APP LAYOUT ==="


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

display:"flex"

}}

>


<Sidebar/>


<div

style={{

flex:1

}}

>


<Header/>


{children}


</div>


</div>

)

}

TSX



echo "=== CREATE PAGES ==="


for page in Groups Expenses Settlement Analytics Users Admin Settings
do

cat > src/pages/$page.tsx <<TSX
export default function $page(){

return (

<div className="container">


<h1>

$page

</h1>


<div className="card">

<p>

$page management module ready.

</p>


<p>

Coming in next sprint.

</p>


</div>


</div>

)

}

TSX

done



echo "=== UPDATE ROUTER ==="


cat > src/router/AppRouter.tsx <<'TSX'

import {
BrowserRouter,
Routes,
Route
} from "react-router-dom";


import Dashboard from "../pages/Dashboard";

import Login from "../pages/Login";

import Groups from "../pages/Groups";

import Expenses from "../pages/Expenses";

import Settlement from "../pages/Settlement";

import Analytics from "../pages/Analytics";

import Users from "../pages/Users";

import Admin from "../pages/Admin";

import Settings from "../pages/Settings";


import ProtectedRoute from "./ProtectedRoute";

import AppLayout from "../components/layout/AppLayout";


export default function AppRouter(){


return (

<BrowserRouter>


<Routes>


<Route

path="/login"

element={<Login/>}

/>



<Route

path="*"

element={

<ProtectedRoute>


<AppLayout>


<Routes>


<Route path="/" element={<Dashboard/>}/>

<Route path="/groups" element={<Groups/>}/>

<Route path="/expenses" element={<Expenses/>}/>

<Route path="/settlement" element={<Settlement/>}/>

<Route path="/analytics" element={<Analytics/>}/>

<Route path="/users" element={<Users/>}/>

<Route path="/admin" element={<Admin/>}/>

<Route path="/settings" element={<Settings/>}/>


</Routes>


</AppLayout>


</ProtectedRoute>

}

/>



</Routes>


</BrowserRouter>

)

}

TSX



echo "=== BUILD ==="

npm run build


echo ""
echo "======================================"
echo " SPRINT 11.2 COMPLETE "
echo " ENTERPRISE MENU READY "
echo "======================================"

