
export default function Button(
{
children,
onClick
}:{
children:React.ReactNode;
onClick?:()=>void;
}){


return (

<button

onClick={onClick}

style={{

background:"#2563eb",
color:"white",
border:"none",
padding:"12px 20px",
borderRadius:"10px",
fontWeight:600

}}

>

{children}

</button>

)

}

