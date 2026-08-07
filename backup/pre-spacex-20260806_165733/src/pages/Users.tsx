

import DataTable
from "../components/table/DataTable";


export default function Users(){


const data=[

{
Name:"Admin",
Email:"admin@system.com",
Role:"ADMIN",
Status:"Active"
}

];


return (

<div className="container">


<h1>

Users

</h1>


<DataTable

columns={[

"Name",
"Email",
"Role",
"Status"

]}

data={data}

/>


</div>

)

}

