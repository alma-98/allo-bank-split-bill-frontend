

export default function Modal(
{
open,
children,
onClose
}:{
open:boolean;
children:React.ReactNode;
onClose:()=>void;
}){


if(!open)return null;


return (

<div

style={{

position:"fixed",
inset:0,
background:"rgba(0,0,0,.5)",
display:"flex",
alignItems:"center",
justifyContent:"center"

}}

>


<div

className="card"

style={{

width:"400px"

}}

>


<button

onClick={onClose}

>

X

</button>


{children}


</div>


</div>

)

}

