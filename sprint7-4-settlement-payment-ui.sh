#!/bin/bash

set -e

echo "====================================="
echo " SPRINT 7.4 SETTLEMENT PAYMENT UI "
echo "====================================="


echo ""
echo "=== 1. CREATE SETTLEMENT TYPES ==="

mkdir -p src/services src/types src/components/settlement


cat > src/types/settlement.ts <<'TS'
export interface Settlement {

    id:string;

    fromParticipant:string;

    toParticipant:string;

    amount:number;

    status:string;

}


export interface SettlementHistory {

    id:string;

    amount:number;

    status:string;

    createdAt?:string;

}
TS



echo ""
echo "=== 2. CREATE SETTLEMENT SERVICE ==="


cat > src/services/SettlementService.ts <<'TS'
import client from "../api/client";


import type {
Settlement,
SettlementHistory
} from "../types/settlement";



export async function generateSettlement(
groupId:string
){

const response =
await client.post<Settlement[]>(
`/groups/${groupId}/settlements/generate`
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



export async function markPaid(
id:string
){

const response =
await client.patch(
`/settlements/${id}/paid`
);


return response.data;

}



export async function cancelSettlement(
id:string
){

const response =
await client.patch(
`/settlements/${id}/cancel`
);


return response.data;

}



export async function getSettlementHistory(
groupId:string
){

const response =
await client.get<SettlementHistory[]>(
`/groups/${groupId}/settlements/history`
);


return response.data;

}
TS



echo ""
echo "=== 3. SETTLEMENT CARD COMPONENT ==="


cat > src/components/settlement/SettlementCard.tsx <<'TSX'
import type {
Settlement
} from "../../types/settlement";


interface Props {

settlement:Settlement;

onPaid:()=>void;

}



export default function SettlementCard(
{
settlement,
onPaid
}:Props
){

return (

<div>


<h3>
Settlement
</h3>


<p>

{settlement.fromParticipant}

{" owes "}

{settlement.toParticipant}

</p>


<strong>
Rp {settlement.amount}
</strong>


<p>
Status:
{settlement.status}
</p>


<button
onClick={onPaid}
>
Mark Paid
</button>


</div>

);

}
TSX



echo ""
echo "=== 4. SETTLEMENT PAGE ==="


cat > src/pages/Settlement.tsx <<'TSX'
import {
useState
} from "react";


import SettlementCard
from "../components/settlement/SettlementCard";


import {
generateSettlement,
markPaid
} from "../services/SettlementService";


import type {
Settlement as SettlementType
} from "../types/settlement";



export default function SettlementPage(){


const groupId =
"demo-group-id";


const [settlements,setSettlements] =
useState<SettlementType[]>([]);



async function generate(){


const data =
await generateSettlement(
groupId
);


setSettlements(data);

}



async function paid(
id:string
){

await markPaid(id);


alert(
"Settlement Paid"
);

}



return (

<div>


<h1>
Settlement
</h1>


<button
onClick={generate}
>
Generate Settlement
</button>



{
settlements.map(
item=>

<SettlementCard

key={item.id}

settlement={item}

onPaid={
()=>paid(item.id)
}

/>

)
}



</div>

);

}
TSX



echo ""
echo "=== 5. FINANCIAL SUMMARY COMPONENT ==="


cat > src/components/settlement/FinancialSummary.tsx <<'TSX'
export default function FinancialSummary(){

return (

<div>

<h2>
Financial Summary
</h2>


<p>
Total Settlement: Rp 0
</p>


<p>
Outstanding Payment: Rp 0
</p>


</div>

);

}
TSX



echo ""
echo "=== 6. UPDATE ROUTER ==="


python3 <<'PY'
from pathlib import Path

p=Path("src/router/AppRouter.tsx")

s=p.read_text()

if 'Settlement' not in s:
    s=s.replace(
'import GroupDetail from "../pages/GroupDetail";',
'import GroupDetail from "../pages/GroupDetail";\nimport Settlement from "../pages/Settlement";'
    )

    s=s.replace(
'</Routes>',
'''
<Route
path="/groups/:id/settlements"
element={
<ProtectedRoute>
<Settlement/>
</ProtectedRoute>
}
/>


</Routes>
'''
    )

p.write_text(s)

print("router updated")
PY



echo ""
echo "=== 7. BUILD VALIDATION ==="


npm run build



echo ""
echo "====================================="
echo " SPRINT 7.4 COMPLETE "
echo " SETTLEMENT PAYMENT UI READY "
echo "====================================="

