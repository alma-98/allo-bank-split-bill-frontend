

export default function KpiCard(
{
title,
value,
icon
}:{
title:string;
value:string|number;
icon:string;
}){


return (

<div className="card">


<div

style={{

fontSize:"30px"

}}

>

{icon}

</div>


<p>

{title}

</p>


<h1>

{value}

</h1>


</div>

)

}

