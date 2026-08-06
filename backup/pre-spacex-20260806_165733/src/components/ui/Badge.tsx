
export default function Badge(
{
children,
type="default"
}:{
children:React.ReactNode;
type?:string;
}){


const color =
type==="success"
?"#16a34a"
:"#2563eb";


return (

<span

style={{

background:color,
color:"white",
padding:"5px 12px",
borderRadius:"20px",
fontSize:"12px"

}}

>

{children}

</span>

)

}

