
import Sidebar from "./Sidebar";
import Header from "./Header";


export default function AppLayout(
{
children
}:{
children:React.ReactNode;
}){


return (

<div

style={{

display:"flex",

minHeight:"100vh",

background:"#f8fafc"

}}

>


<Sidebar/>


<div

style={{

flex:1,

display:"flex",

flexDirection:"column"

}}

>


<Header/>


<main

style={{

flex:1,

padding:"30px"

}}

>

{children}

</main>


</div>


</div>

)

}

