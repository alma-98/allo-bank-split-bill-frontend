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
