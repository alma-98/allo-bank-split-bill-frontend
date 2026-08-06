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
