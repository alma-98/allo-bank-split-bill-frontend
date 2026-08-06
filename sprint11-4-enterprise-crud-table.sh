#!/bin/bash

set -e


echo "======================================"
echo " SPRINT 11.4 ENTERPRISE CRUD TABLE "
echo "======================================"


mkdir -p src/components/table
mkdir -p src/components/ui



echo "=== DATATABLE COMPONENT ==="


cat > src/components/table/DataTable.tsx <<'TSX'

export default function DataTable(
{
columns,
data
}:{
columns:string[],
data:any[]
}){


return (

<div className="card">


<table

style={{

width:"100%",
borderCollapse:"collapse"

}}

>


<thead>

<tr>

{
columns.map(col=>(

<th

key={col}

style={{

textAlign:"left",
padding:"14px",
borderBottom:"1px solid #ddd"

}}

>

{col}

</th>

))
}

</tr>

</thead>



<tbody>


{
data.map((row,index)=>(

<tr key={index}>


{
Object.values(row).map((value:any)=>(

<td

key={String(value)}

style={{

padding:"14px",
borderBottom:"1px solid #eee"

}}

>

{value}

</td>

))

}


</tr>

))

}


</tbody>


</table>


</div>

)

}

TSX



echo "=== MODAL ==="


cat > src/components/ui/Modal.tsx <<'TSX'


export default function Modal(
{
open,
children,
onClose
}:{
open:boolean;
children:React.ReactNode;
onClose:()=>void;
}){


if(!open)return null;


return (

<div

style={{

position:"fixed",
inset:0,
background:"rgba(0,0,0,.5)",
display:"flex",
alignItems:"center",
justifyContent:"center"

}}

>


<div

className="card"

style={{

width:"400px"

}}

>


<button

onClick={onClose}

>

X

</button>


{children}


</div>


</div>

)

}

TSX



echo "=== GROUP CRUD PAGE ==="


cat > src/pages/Groups.tsx <<'TSX'

import {
useState
} from "react";


import DataTable
from "../components/table/DataTable";


import Modal
from "../components/ui/Modal";



export default function Groups(){


const [open,setOpen]=useState(false);



const data=[

{
Name:"Allo Engineering Dinner",
Members:5,
Expense:"Rp 500.000",
Status:"Active"
}

];



return (

<div className="container">


<div

style={{

display:"flex",
justifyContent:"space-between"

}}

>


<h1>
Groups
</h1>


<button

onClick={()=>setOpen(true)}

>

+ Create Group

</button>


</div>




<input

placeholder="Search group..."

style={{

padding:"12px",
width:"300px",
margin:"20px 0"

}}

/>



<DataTable

columns={[

"Name",
"Members",
"Expense",
"Status"

]}

data={data}

/>




<Modal

open={open}

onClose={()=>setOpen(false)}

>


<h2>

Create Group

</h2>


<input

placeholder="Group Name"

/>


<br/><br/>


<button>

Save

</button>


</Modal>



</div>

)

}

TSX



echo "=== EXPENSE CRUD PAGE ==="


cat > src/pages/Expenses.tsx <<'TSX'


import DataTable
from "../components/table/DataTable";


export default function Expenses(){


const data=[

{
Description:"Dinner Jakarta",
Amount:"Rp500.000",
PaidBy:"Alma",
Status:"Paid"
}

];


return (

<div className="container">


<h1>

Expenses

</h1>


<button>

+ Add Expense

</button>



<br/><br/>


<DataTable

columns={[

"Description",
"Amount",
"PaidBy",
"Status"

]}

data={data}

/>


</div>

)

}

TSX



echo "=== USERS CRUD PAGE ==="


cat > src/pages/Users.tsx <<'TSX'


import DataTable
from "../components/table/DataTable";


export default function Users(){


const data=[

{
Name:"Admin",
Email:"admin@system.com",
Role:"ADMIN",
Status:"Active"
}

];


return (

<div className="container">


<h1>

Users

</h1>


<DataTable

columns={[

"Name",
"Email",
"Role",
"Status"

]}

data={data}

/>


</div>

)

}

TSX



echo "=== BUILD ==="


npm run build



echo ""
echo "======================================"
echo " SPRINT 11.4 COMPLETE "
echo " CRUD TABLE SYSTEM READY "
echo "======================================"

