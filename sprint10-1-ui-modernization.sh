#!/bin/bash

set -e

echo "====================================="
echo " SPRINT 10.1 UI MODERNIZATION "
echo "====================================="


mkdir -p src/components/layout
mkdir -p src/components/ui
mkdir -p src/styles


echo "=== GLOBAL STYLE ==="


cat > src/styles/global.css <<'CSS'

:root{

--primary:#0f172a;
--secondary:#2563eb;
--background:#f8fafc;
--card:white;
--text:#1e293b;

font-family:
Inter,
Arial,
sans-serif;

}


*{
box-sizing:border-box;
}


body{

margin:0;
background:var(--background);
color:var(--text);

}


button{

cursor:pointer;

}


.card{

background:white;

border-radius:16px;

padding:24px;

box-shadow:
0 10px 30px rgba(0,0,0,.08);

}

CSS


echo "=== DASHBOARD CARD ==="


cat > src/components/ui/Card.tsx <<'TSX'

export default function Card(
{
title,
value
}:{
title:string;
value:string|number;
}){

return (

<div className="card">

<h3>
{title}
</h3>

<h1>
{value}
</h1>

</div>

)

}

TSX


echo "=== SIDEBAR ==="


cat > src/components/layout/Sidebar.tsx <<'TSX'


export default function Sidebar(){

return (

<aside style={{

width:"240px",
minHeight:"100vh",
background:"#0f172a",
color:"white",
padding:"24px"

}}>


<h2>
Allo Split Bill
</h2>


<p>
Dashboard
</p>


<p>
Groups
</p>


<p>
Expenses
</p>


<p>
Settlement
</p>


<p>
AI Insight
</p>


<p>
Admin
</p>


</aside>

)

}

TSX


echo "=== DASHBOARD UPDATE ==="


cat > src/pages/Dashboard.tsx <<'TSX'

import Card from "../components/ui/Card";


export default function Dashboard(){

return (

<div style={{

padding:"32px"

}}>


<h1>
Allo Bank Split Bill Dashboard
</h1>


<div style={{

display:"grid",
gridTemplateColumns:
"repeat(3,1fr)",
gap:"20px",
marginTop:"30px"

}}>


<Card
title="Groups"
value="0"
/>


<Card
title="Expenses"
value="0"
/>


<Card
title="Settlements"
value="0"
/>


</div>


<div className="card"

style={{
marginTop:"30px"
}}

>


<h2>
Expense Activity
</h2>


<p>
No expenses available
</p>


</div>


</div>

)

}

TSX


echo "=== LOGIN UI ==="


cat > src/pages/Login.tsx <<'TSX'

import {
useState
} from "react";

import {
login
} from "../auth/AuthService";


export default function Login(){


const [email,setEmail]=useState("");

const [password,setPassword]=useState("");


async function submit(){

await login({
email,
password
});


window.location.href="/";

}


return (

<div style={{

minHeight:"100vh",
display:"flex",
alignItems:"center",
justifyContent:"center"

}}>


<div className="card"

style={{
width:"380px"
}}

>


<h1>
Allo Bank Split Bill
</h1>


<input

style={{
width:"100%",
padding:"12px",
margin:"8px 0"
}}

placeholder="Email"

value={email}

onChange={
e=>setEmail(e.target.value)
}

/>


<input

style={{
width:"100%",
padding:"12px",
margin:"8px 0"
}}

type="password"

placeholder="Password"

value={password}

onChange={
e=>setPassword(e.target.value)
}

/>


<button

style={{

width:"100%",
padding:"12px",
background:"#2563eb",
color:"white",
border:0,
borderRadius:"8px"

}}

onClick={submit}

>

Login

</button>



<div style={{

marginTop:"20px",
background:"#f1f5f9",
padding:"12px",
borderRadius:"10px"

}}>

<b>
Demo Admin
</b>

<p>
admin@system.com
</p>

<p>
Admin@12345
</p>


</div>


</div>


</div>

)

}

TSX



echo "=== IMPORT GLOBAL CSS ==="


if ! grep -q "global.css" src/main.tsx
then

sed -i '' '1i\
import "./styles/global.css";
' src/main.tsx

fi



npm run build


echo ""
echo "====================================="
echo " SPRINT 10.1 COMPLETE "
echo " UI MODERNIZATION READY "
echo "====================================="

