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
