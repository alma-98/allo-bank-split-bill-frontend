
import {
useState
} from "react";


import DataTable
from "../components/table/DataTable";


import Modal
from "../components/ui/Modal";



export default function Groups(){


const [open,setOpen]=useState(false);



const data=[

{
Name:"Allo Engineering Dinner",
Members:5,
Expense:"Rp 500.000",
Status:"Active"
}

];



return (

<div className="container">


<div

style={{

display:"flex",
justifyContent:"space-between"

}}

>


<h1>
Groups
</h1>


<button

onClick={()=>setOpen(true)}

>

+ Create Group

</button>


</div>




<input

placeholder="Search group..."

style={{

padding:"12px",
width:"300px",
margin:"20px 0"

}}

/>



<DataTable

columns={[

"Name",
"Members",
"Expense",
"Status"

]}

data={data}

/>




<Modal

open={open}

onClose={()=>setOpen(false)}

>


<h2>

Create Group

</h2>


<input

placeholder="Group Name"

/>


<br/><br/>


<button>

Save

</button>


</Modal>



</div>

)

}

