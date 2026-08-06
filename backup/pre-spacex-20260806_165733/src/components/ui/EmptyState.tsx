
export default function EmptyState(
{
message
}:{
message:string;
}){


return (

<div

className="card"

style={{

textAlign:"center",
padding:"40px"

}}

>


<h3>
No Data
</h3>


<p>
{message}
</p>


</div>

)

}

