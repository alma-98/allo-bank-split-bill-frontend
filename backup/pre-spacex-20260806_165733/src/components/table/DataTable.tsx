
export default function DataTable(
{
columns,
data
}:{
columns:string[],
data:any[]
}){


return (

<div className="card">


<table

style={{

width:"100%",
borderCollapse:"collapse"

}}

>


<thead>

<tr>

{
columns.map(col=>(

<th

key={col}

style={{

textAlign:"left",
padding:"14px",
borderBottom:"1px solid #ddd"

}}

>

{col}

</th>

))
}

</tr>

</thead>



<tbody>


{
data.map((row,index)=>(

<tr key={index}>


{
Object.values(row).map((value:any)=>(

<td

key={String(value)}

style={{

padding:"14px",
borderBottom:"1px solid #eee"

}}

>

{value}

</td>

))

}


</tr>

))

}


</tbody>


</table>


</div>

)

}

