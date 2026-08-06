#!/bin/bash

set -e

echo "======================================"
echo " SPRINT 11.3 FULL WEBSITE EXPERIENCE "
echo "======================================"


mkdir -p src/pages/public
mkdir -p src/components/public
mkdir -p src/layouts


echo "=== PUBLIC NAVBAR ==="


cat > src/components/public/Navbar.tsx <<'TSX'

import {
Link
} from "react-router-dom";


export default function Navbar(){

return (

<nav

style={{

height:"70px",
display:"flex",
alignItems:"center",
justifyContent:"space-between",
padding:"0 60px",
background:"white"

}}

>

<h2>
Allo Split Bill
</h2>


<div>


<Link
to="/login"
style={{
textDecoration:"none"
}}
>

Login

</Link>


</div>


</nav>

)

}

TSX



echo "=== HERO ==="


cat > src/components/public/Hero.tsx <<'TSX'


import {
Link
} from "react-router-dom";


export default function Hero(){

return (

<section

style={{

padding:"80px 60px",
textAlign:"center",
background:
"linear-gradient(135deg,#0f172a,#2563eb)",
color:"white"

}}

>


<h1

style={{

fontSize:"52px"

}}

>

Split Bills.
Simplify Payments.

</h1>


<p

style={{

fontSize:"20px",
opacity:.9

}}

>

Manage group expenses,
track payments,
and settle bills easily.

</p>



<Link

to="/login"

style={{

display:"inline-block",
marginTop:"30px",
padding:"15px 30px",
background:"white",
color:"#2563eb",
borderRadius:"12px",
textDecoration:"none",
fontWeight:700

}}

>

Start Now

</Link>


</section>

)

}

TSX



echo "=== FEATURES ==="


cat > src/components/public/Features.tsx <<'TSX'


const items=[

"Expense Tracking",

"Group Management",

"Smart Settlement",

"Payment Monitoring"

];


export default function Features(){


return (

<section

style={{

padding:"60px"

}}

>


<h2>
Powerful Features
</h2>



<div

style={{

display:"grid",
gridTemplateColumns:
"repeat(4,1fr)",
gap:"20px"

}}

>


{

items.map(item=>(

<div

className="card"

key={item}

>


<h3>
{item}
</h3>


<p>

Built for modern expense management.

</p>


</div>

))

}


</div>


</section>

)

}

TSX



echo "=== FOOTER ==="


cat > src/components/public/Footer.tsx <<'TSX'


export default function Footer(){


return (

<footer

style={{

padding:"30px",
textAlign:"center",
background:"#0f172a",
color:"white"

}}

>

© 2026 Allo Bank Split Bill

</footer>

)

}

TSX



echo "=== LANDING PAGE ==="


cat > src/pages/public/Landing.tsx <<'TSX'


import Navbar
from "../../components/public/Navbar";


import Hero
from "../../components/public/Hero";


import Features
from "../../components/public/Features";


import Footer
from "../../components/public/Footer";


export default function Landing(){


return (

<>

<Navbar/>

<Hero/>

<Features/>

<Footer/>


</>

)

}

TSX



echo "=== PUBLIC ROUTER UPDATE ==="


cat > src/router/AppRouter.tsx <<'TSX'

import {
BrowserRouter,
Routes,
Route
} from "react-router-dom";


import Landing
from "../pages/public/Landing";


import Login
from "../pages/Login";


import Dashboard
from "../pages/Dashboard";


import ProtectedRoute
from "./ProtectedRoute";


import AppLayout
from "../components/layout/AppLayout";



export default function AppRouter(){


return (

<BrowserRouter>


<Routes>


<Route

path="/"

element={<Landing/>}

/>



<Route

path="/login"

element={<Login/>}

/>



<Route

path="/dashboard"

element={

<ProtectedRoute>

<AppLayout>

<Dashboard/>

</AppLayout>

</ProtectedRoute>

}

/>



</Routes>


</BrowserRouter>

)

}

TSX



echo "=== BUILD TEST ==="


npm run build



echo ""
echo "======================================"
echo " SPRINT 11.3 COMPLETE "
echo " FULL WEBSITE READY "
echo "======================================"

