
import type {
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
