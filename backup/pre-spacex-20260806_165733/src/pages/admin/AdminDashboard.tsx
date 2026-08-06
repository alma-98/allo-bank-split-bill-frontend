

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

