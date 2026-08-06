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
