
export default function MetricCard(
{
title,
value
}:{
title:string;
value:number|string;
}){


return (

<div className="card">


<h3>
{title}
</h3>


<h1>
{value}
</h1>


</div>

)

}

