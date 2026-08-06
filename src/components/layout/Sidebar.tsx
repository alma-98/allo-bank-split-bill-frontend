

const menus=[

"Dashboard",
"Groups",
"Expenses",
"Settlement",
"Users",
"Settings"

];


export default function Sidebar(){


return (

<div

style={{

width:"260px",
minHeight:"100vh",
background:"#0f172a",
color:"white",
padding:"25px"

}}

>


<h2>
Allo Split
</h2>


<p>
Bank Expense Platform
</p>


<hr/>


{
menus.map(
item=>

<div

key={item}

style={{

padding:"12px 0",
opacity:.9

}}

>

{item}

</div>

)

}


</div>

)

}

