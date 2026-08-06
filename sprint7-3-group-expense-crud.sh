#!/bin/bash

set -e

echo "====================================="
echo " SPRINT 7.3 GROUP EXPENSE CRUD "
echo "====================================="


echo ""
echo "=== 1. CREATE API TYPES ==="


mkdir -p src/types src/services src/components/group src/components/expense


cat > src/types/group.ts <<'TS'
export interface Group {

    id:string;

    name:string;

    ownerId?:string;

}


export interface Participant {

    id:string;

    name:string;

    email?:string;

}


export interface Expense {

    id:string;

    description:string;

    amount:number;

}


export interface CreateGroupRequest {

    name:string;

}


export interface CreateExpenseRequest {

    description:string;

    amount:number;

}
TS



echo ""
echo "=== 2. GROUP SERVICE ==="


cat > src/services/GroupService.ts <<'TS'
import client from "../api/client";

import type {
Group,
Participant,
CreateGroupRequest
} from "../types/group";


export async function createGroup(
data:CreateGroupRequest
){

const response =
await client.post<Group>(
"/groups",
data
);

return response.data;

}



export async function getGroup(
groupId:string
){

const response =
await client.get<Group>(
`/groups/${groupId}`
);

return response.data;

}



export async function addParticipant(
groupId:string,
data:Participant
){

const response =
await client.post(
`/groups/${groupId}/participants`,
data
);

return response.data;

}
TS



echo ""
echo "=== 3. EXPENSE SERVICE ==="


cat > src/services/ExpenseService.ts <<'TS'
import client from "../api/client";

import type {
CreateExpenseRequest,
Expense
} from "../types/group";


export async function createExpense(
groupId:string,
data:CreateExpenseRequest
){

const response =
await client.post<Expense>(
`/groups/${groupId}/expenses`,
data
);


return response.data;

}
TS



echo ""
echo "=== 4. CREATE GROUP FORM ==="


cat > src/components/group/CreateGroupForm.tsx <<'TSX'
import {
useState
} from "react";

import {
createGroup
} from "../../services/GroupService";


export default function CreateGroupForm(){

const [name,setName]=useState("");



async function submit(){

await createGroup({
name
});

alert(
"Group created"
);

}



return (

<div>

<h2>
Create Group
</h2>


<input
placeholder="Group name"
value={name}
onChange={
e=>setName(e.target.value)
}
/>


<button
onClick={submit}
>
Create
</button>


</div>

);

}
TSX



echo ""
echo "=== 5. CREATE EXPENSE FORM ==="


cat > src/components/expense/CreateExpenseForm.tsx <<'TSX'
import {
useState
} from "react";


import {
createExpense
} from "../../services/ExpenseService";


export default function CreateExpenseForm(
{
groupId
}:{
groupId:string
}
){


const [description,setDescription]=useState("");

const [amount,setAmount]=useState(0);



async function submit(){

await createExpense(
groupId,
{
description,
amount
}
);


alert(
"Expense created"
);

}



return (

<div>

<h2>
Add Expense
</h2>


<input
placeholder="Description"
value={description}
onChange={
e=>setDescription(e.target.value)
}
/>


<input
type="number"
value={amount}
onChange={
e=>setAmount(
Number(e.target.value)
)
}
/>


<button
onClick={submit}
>
Save Expense
</button>


</div>

);

}
TSX



echo ""
echo "=== 6. GROUP PAGE ==="


cat > src/pages/GroupDetail.tsx <<'TSX'
import CreateExpenseForm
from "../components/expense/CreateExpenseForm";


export default function GroupDetail(){

const groupId =
"demo-group-id";


return (

<div>

<h1>
Group Detail
</h1>


<CreateExpenseForm
groupId={groupId}
/>


</div>

);

}
TSX



echo ""
echo "=== 7. UPDATE ROUTER ==="


cat > src/router/AppRouter.tsx <<'TSX'
import {
BrowserRouter,
Routes,
Route
} from "react-router-dom";


import Dashboard from "../pages/Dashboard";

import Login from "../pages/Login";

import GroupDetail from "../pages/GroupDetail";

import ProtectedRoute from "./ProtectedRoute";


export default function AppRouter(){


return (

<BrowserRouter>

<Routes>


<Route
path="/login"
element={<Login/>}
/>


<Route
path="/"
element={
<ProtectedRoute>
<Dashboard/>
</ProtectedRoute>
}
/>


<Route
path="/groups/:id"
element={
<ProtectedRoute>
<GroupDetail/>
</ProtectedRoute>
}
/>


</Routes>

</BrowserRouter>

);

}
TSX



echo ""
echo "=== 8. BUILD VALIDATION ==="


npm run build



echo ""
echo "====================================="
echo " SPRINT 7.3 COMPLETE "
echo " GROUP EXPENSE CRUD READY "
echo "====================================="

