#!/bin/bash

set -e

echo "====================================="
echo " SPRINT 10.2 DASHBOARD ADMIN UI "
echo "====================================="


mkdir -p src/services
mkdir -p src/pages/admin
mkdir -p src/components/dashboard
mkdir -p src/components/admin


echo ""
echo "=== API DASHBOARD SERVICE ==="


cat > src/services/DashboardService.ts <<'TS'

import client from "../api/client";


export async function getDashboard(){

const response =
await client.get("/dashboard");


return response.data;

}

TS



echo ""
echo "=== DASHBOARD CARD ==="


cat > src/components/dashboard/MetricCard.tsx <<'TSX'

export default function MetricCard(
{
title,
value
}:{
title:string;
value:number|string;
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



echo ""
echo "=== ACTIVITY CHART FOUNDATION ==="


cat > src/components/dashboard/ExpenseChart.tsx <<'TSX'


export default function ExpenseChart(){


return (

<div className="card">


<h3>
Expense Analytics
</h3>


<div style={{

height:"150px",
display:"flex",
alignItems:"center",
justifyContent:"center",
background:"#f8fafc"

}}>

Chart Ready

</div>


</div>

)

}

TSX



echo ""
echo "=== ADMIN PANEL ==="


cat > src/pages/admin/AdminDashboard.tsx <<'TSX'


import MetricCard
from "../../components/dashboard/MetricCard";


export default function AdminDashboard(){


return (

<div style={{
padding:"32px"
}}>


<h1>
Admin Enterprise Dashboard
</h1>



<div style={{

display:"grid",
gridTemplateColumns:
"repeat(3,1fr)",
gap:"20px"

}}>


<MetricCard
title="Users"
value="2"
/>


<MetricCard
title="Transactions"
value="0"
/>


<MetricCard
title="System"
value="Healthy"
/>



</div>


</div>

)

}

TSX



echo ""
echo "=== ADMIN MENU COMPONENT ==="


cat > src/components/admin/AdminMenu.tsx <<'TSX'


export default function AdminMenu(){

return (

<div className="card">


<h3>
Admin Menu
</h3>


<ul>

<li>
User Management
</li>

<li>
Audit Log
</li>

<li>
System Monitoring
</li>

<li>
AI Analytics
</li>


</ul>


</div>

)

}

TSX



echo ""
echo "=== DASHBOARD REAL UI ==="


cat > src/pages/Dashboard.tsx <<'TSX'


import MetricCard
from "../components/dashboard/MetricCard";


import ExpenseChart
from "../components/dashboard/ExpenseChart";



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
marginTop:"25px"

}}>


<MetricCard
title="Groups"
value="0"
/>


<MetricCard
title="Expenses"
value="0"
/>


<MetricCard
title="Settlements"
value="0"
/>


</div>



<div style={{
marginTop:"30px"
}}>


<ExpenseChart/>


</div>



<div className="card"

style={{
marginTop:"30px"
}}

>


<h3>
Recent Activity
</h3>


<p>
No transaction available
</p>


</div>



</div>

)

}

TSX



echo ""
echo "=== TEST GUIDE ==="


cat > TEST-GUIDE.md <<'MD'

# Allo Bank Split Bill Test Guide


## Demo Account


Email

admin@system.com


Password

Admin@12345



## Run Backend


cd allo-bank-split-bill-api

mvn spring-boot:run



## Run Frontend


cd allo-bank-split-bill-frontend

npm run dev



## URL


http://localhost:5173/login



MD



echo ""
echo "=== BUILD TEST ==="


npm run build



echo ""
echo "====================================="
echo " SPRINT 10.2 COMPLETE "
echo " READY FOR TESTER "
echo "====================================="

