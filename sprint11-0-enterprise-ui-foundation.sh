#!/bin/bash

set -e

echo "======================================"
echo " SPRINT 11.0 ENTERPRISE UI FOUNDATION "
echo "======================================"


mkdir -p src/components/layout
mkdir -p src/components/ui
mkdir -p src/styles


echo "=== DESIGN SYSTEM ==="


cat > src/styles/design-system.css <<'CSS'

:root {

--primary:#2563eb;
--primary-dark:#1d4ed8;

--background:#f8fafc;
--surface:#ffffff;

--text:#0f172a;
--muted:#64748b;

--success:#16a34a;
--warning:#f59e0b;
--danger:#dc2626;


--sidebar:#0f172a;

--radius:16px;


--shadow:
0 10px 30px rgba(15,23,42,.08);


font-family:
Inter,
system-ui,
Arial,
sans-serif;

}


*{

box-sizing:border-box;

}


body{

margin:0;

background:
var(--background);

color:
var(--text);

}



.card{

background:
var(--surface);

border-radius:
var(--radius);

box-shadow:
var(--shadow);

padding:
24px;

}



.container{

padding:
32px;

}


CSS


echo "=== UI COMPONENTS ==="


cat > src/components/ui/Button.tsx <<'TSX'

export default function Button(
{
children,
onClick
}:{
children:React.ReactNode;
onClick?:()=>void;
}){


return (

<button

onClick={onClick}

style={{

background:"#2563eb",
color:"white",
border:"none",
padding:"12px 20px",
borderRadius:"10px",
fontWeight:600

}}

>

{children}

</button>

)

}

TSX



cat > src/components/ui/Badge.tsx <<'TSX'

export default function Badge(
{
children,
type="default"
}:{
children:React.ReactNode;
type?:string;
}){


const color =
type==="success"
?"#16a34a"
:"#2563eb";


return (

<span

style={{

background:color,
color:"white",
padding:"5px 12px",
borderRadius:"20px",
fontSize:"12px"

}}

>

{children}

</span>

)

}

TSX



cat > src/components/ui/EmptyState.tsx <<'TSX'

export default function EmptyState(
{
message
}:{
message:string;
}){


return (

<div

className="card"

style={{

textAlign:"center",
padding:"40px"

}}

>


<h3>
No Data
</h3>


<p>
{message}
</p>


</div>

)

}

TSX



echo "=== SIDEBAR ==="


cat > src/components/layout/Sidebar.tsx <<'TSX'


const menus=[

"Dashboard",
"Groups",
"Expenses",
"Settlement",
"Users",
"Settings"

];


export default function Sidebar(){


return (

<div

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


<p>
Bank Expense Platform
</p>


<hr/>


{
menus.map(
item=>

<div

key={item}

style={{

padding:"12px 0",
opacity:.9

}}

>

{item}

</div>

)

}


</div>

)

}

TSX



echo "=== HEADER ==="


cat > src/components/layout/Header.tsx <<'TSX'


export default function Header(){


return (

<header

style={{

height:"70px",
background:"white",
display:"flex",
alignItems:"center",
justifyContent:"space-between",
padding:"0 30px",
boxShadow:
"0 2px 10px rgba(0,0,0,.05)"

}}

>


<h3>
Allo Bank Split Bill
</h3>


<div>

ADMIN

</div>


</header>

)

}

TSX



echo "=== APPLICATION SHELL ==="


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


<main>

{children}

</main>


</div>


</div>

)

}

TSX



echo "=== IMPORT CSS ==="


if ! grep -q "design-system.css" src/main.tsx
then

sed -i '' '1i\
import "./styles/design-system.css";
' src/main.tsx

fi



echo "=== BUILD TEST ==="

npm run build


echo ""
echo "======================================"
echo " SPRINT 11.0 COMPLETE "
echo " ENTERPRISE UI FOUNDATION READY "
echo "======================================"

