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
