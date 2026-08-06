
const features=[

{
title:"Expense Tracking",
desc:"Record and monitor every shared expense."
},

{
title:"Group Management",
desc:"Create groups and manage members easily."
},

{
title:"Smart Settlement",
desc:"Calculate who owes whom automatically."
},

{
title:"Payment Monitoring",
desc:"Track payment status transparently."
}

];


export default function Features(){

return (

<section

style={{

padding:"80px",

background:"#000"

}}

>


<h2

style={{

color:"#ffc100",

textAlign:"center",

fontSize:"36px"

}}

>

Powerful Features

</h2>



<div

style={{

display:"grid",

gridTemplateColumns:"repeat(4,1fr)",

gap:"25px",

marginTop:"50px"

}}

>


{
features.map(item=>(


<div

key={item.title}

style={{

background:"#fff",

padding:"30px",

borderRadius:"24px"

}}

>


<h3>

{item.title}

</h3>


<p>

{item.desc}

</p>


</div>


))

}



</div>


</section>

)

}
