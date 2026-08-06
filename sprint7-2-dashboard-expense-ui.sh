#!/bin/bash

set -e

echo "====================================="
echo " SPRINT 7.2 DASHBOARD EXPENSE UI "
echo "====================================="


echo ""
echo "=== 1. CREATE TYPES ==="

mkdir -p src/types src/services src/components/dashboard


cat > src/types/group.ts <<'TS'
export interface Group {

    id:string;
    name:string;
    ownerId?:string;

}


export interface Expense {

    id:string;
    description:string;
    amount:number;

}


export interface Settlement {

    id:string;
    amount:number;
    status:string;

}
TS



echo ""
echo "=== 2. CREATE GROUP SERVICE ==="


cat > src/services/GroupService.ts <<'TS'
import client from "../api/client";

import {
Group,
Expense,
Settlement
} from "../types/group";


export async function getGroup(
groupId:string
){

const response =
await client.get<Group>(
`/groups/${groupId}`
);


return response.data;

}



export async function getSettlements(
groupId:string
){

const response =
await client.get<Settlement[]>(
`/groups/${groupId}/settlements`
);


return response.data;

}



export async function createExpense(
groupId:string,
data:Expense
){

const response =
await client.post(
`/groups/${groupId}/expenses`,
data
);


return response.data;

}
TS



echo ""
echo "=== 3. DASHBOARD CARD COMPONENT ==="


cat > src/components/dashboard/StatCard.tsx <<'TSX'
interface Props {

title:string;

value:string;

}


export default function StatCard(
{
title,
value
}:Props
){

return (

<div>

<h3>{title}</h3>

<strong>
{value}
</strong>

</div>

);

}
TSX



echo ""
echo "=== 4. EXPENSE LIST COMPONENT ==="


cat > src/components/dashboard/ExpenseList.tsx <<'TSX'

import {
Expense
} from "../../types/group";


export default function ExpenseList(
{
expenses
}:{
expenses:Expense[]
}
){


return (

<div>

<h2>
Expenses
</h2>


{
expenses.map(
expense=>

<div key={expense.id}>

{expense.description}

:
{expense.amount}

</div>

)
}


</div>

);


}
TSX



echo ""
echo "=== 5. DASHBOARD PAGE ==="


cat > src/pages/Dashboard.tsx <<'TSX'
import {
useState
} from "react";


import StatCard from "../components/dashboard/StatCard";

import ExpenseList from "../components/dashboard/ExpenseList";


export default function Dashboard(){


const [expenses] =
useState([]);



return (

<div>


<h1>
Allo Bank Split Bill Dashboard
</h1>



<div>

<StatCard
title="Groups"
value="0"
/>


<StatCard
title="Expenses"
value={
String(expenses.length)
}
/>


<StatCard
title="Settlements"
value="0"
/>


</div>



<ExpenseList
expenses={expenses}
/>



</div>

);

}
TSX



echo ""
echo "=== 6. LOADING COMPONENT ==="


cat > src/components/dashboard/Loading.tsx <<'TSX'
export default function Loading(){

return (

<p>
Loading...
</p>

);

}
TSX



echo ""
echo "=== 7. ERROR COMPONENT ==="


cat > src/components/dashboard/ErrorMessage.tsx <<'TSX'
export default function ErrorMessage(
{
message
}:{
message:string
}
){

return (

<p>

{message}

</p>

);

}
TSX



echo ""
echo "=== 8. BUILD VALIDATION ==="


npm run build



echo ""
echo "====================================="
echo " SPRINT 7.2 COMPLETE "
echo " DASHBOARD EXPENSE UI READY "
echo "====================================="

