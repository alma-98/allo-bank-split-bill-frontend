

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

