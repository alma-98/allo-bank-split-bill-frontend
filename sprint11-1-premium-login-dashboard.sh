#!/bin/bash

set -e


echo "======================================"
echo " SPRINT 11.1 PREMIUM LOGIN + DASHBOARD "
echo "======================================"


mkdir -p src/components/dashboard


echo "=== PREMIUM LOGIN PAGE ==="


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

<div

style={{

minHeight:"100vh",

display:"flex",

alignItems:"center",

justifyContent:"center",

background:
"linear-gradient(135deg,#0f172a,#2563eb)"

}}

>


<div

style={{

width:"420px",

background:"white",

borderRadius:"24px",

padding:"40px",

boxShadow:
"0 20px 50px rgba(0,0,0,.25)"

}}

>


<h1

style={{

marginBottom:"5px"

}}

>

Allo Bank

</h1>


<h2>

Split Bill Platform

</h2>


<p

style={{

color:"#64748b"

}}

>

Manage shared expenses easily and securely.

</p>



<input

style={inputStyle}

placeholder="Email"

value={email}

onChange={
e=>setEmail(e.target.value)
}

/>



<input

style={inputStyle}

placeholder="Password"

type="password"

value={password}

onChange={
e=>setPassword(e.target.value)
}

/>



<button

style={{

width:"100%",

padding:"14px",

background:"#2563eb",

color:"white",

border:0,

borderRadius:"12px",

fontSize:"16px",

fontWeight:700

}}

onClick={submit}

>

Login

</button>




<div

style={{

marginTop:"25px",

padding:"18px",

borderRadius:"14px",

background:"#f1f5f9"

}}

>


<b>

Demo Account

</b>


<p>

Email:

<br/>

<strong>
admin@system.com
</strong>

</p>


<p>

Password:

<br/>

<strong>
Admin@12345
</strong>

</p>


<span

style={{

color:"#16a34a",

fontWeight:700

}}

>

ADMIN ACCESS

</span>


</div>



</div>


</div>

)

}



const inputStyle={

width:"100%",

padding:"14px",

margin:"10px 0",

borderRadius:"12px",

border:
"1px solid #cbd5e1",

fontSize:"15px"

};


TSX



echo "=== DASHBOARD KPI COMPONENT ==="


cat > src/components/dashboard/KpiCard.tsx <<'TSX'


export default function KpiCard(
{
title,
value,
icon
}:{
title:string;
value:string|number;
icon:string;
}){


return (

<div className="card">


<div

style={{

fontSize:"30px"

}}

>

{icon}

</div>


<p>

{title}

</p>


<h1>

{value}

</h1>


</div>

)

}

TSX



echo "=== ANALYTICS DASHBOARD ==="


cat > src/pages/Dashboard.tsx <<'TSX'


import KpiCard
from "../components/dashboard/KpiCard";


export default function Dashboard(){


return (

<div className="container">


<h1>

Dashboard

</h1>


<p>

Financial overview and expense analytics

</p>




<div

style={{

display:"grid",

gridTemplateColumns:
"repeat(4,1fr)",

gap:"20px",

marginTop:"30px"

}}

>


<KpiCard

title="Total Groups"

value="0"

icon="👥"

/>


<KpiCard

title="Expenses"

value="Rp 0"

icon="💳"

/>


<KpiCard

title="Settlement"

value="Rp 0"

icon="💰"

/>


<KpiCard

title="Members"

value="0"

icon="👤"

/>


</div>





<div

style={{

marginTop:"30px"

}}

className="card"

>


<h2>

Expense Analytics

</h2>


<div

style={{

height:"180px",

display:"flex",

alignItems:"center",

justifyContent:"center",

background:"#f8fafc",

borderRadius:"12px"

}}

>

Chart Visualization Ready

</div>


</div>




<div

style={{

marginTop:"30px"

}}

className="card"

>


<h2>

Recent Transactions

</h2>


<table

style={{

width:"100%"

}}

>

<thead>

<tr>

<th>
Description
</th>

<th>
Amount
</th>

<th>
Status
</th>


</tr>

</thead>


<tbody>


<tr>

<td>
No transaction
</td>

<td>
-
</td>

<td>
-
</td>

</tr>


</tbody>


</table>


</div>




</div>

)

}

TSX



echo "=== BUILD VALIDATION ==="


npm run build


echo ""
echo "======================================"
echo " SPRINT 11.1 COMPLETE "
echo " PREMIUM UI READY "
echo "======================================"

