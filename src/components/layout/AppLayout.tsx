
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

display:"flex"

}}

>


<Sidebar/>


<div

style={{

flex:1

}}

>


<Header/>


<main>

{children}

</main>


</div>


</div>

)

}

