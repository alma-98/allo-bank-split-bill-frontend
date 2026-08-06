#!/bin/bash

set -e

echo "======================================"
echo " PREMIUM RESPONSIVE LOGIN PAGE "
echo "======================================"


cat > src/pages/Login.tsx <<'TSX'

import {
useState
} from "react";


import {
login
} from "../auth/AuthService";


import "../styles/landing.css";



export default function Login(){


const [email,setEmail]=useState("");

const [password,setPassword]=useState("");



async function submit(){

await login({

email,
password

});


window.location.href="/dashboard";


}



return (

<div

style={{

minHeight:"100vh",

background:"#ffc100",

display:"flex",

alignItems:"center",

justifyContent:"center",

padding:"30px",

fontFamily:"Poppins,sans-serif"

}}

>


<div

style={{

width:"100%",

maxWidth:"450px"

}}

>


<div

style={{

textAlign:"center",

marginBottom:"35px"

}}

>


<h1

style={{

fontSize:"56px",

fontWeight:800,

margin:0

}}

>


<span

style={{

background:"#000",

color:"#ffc100",

padding:"5px 15px",

borderRadius:"15px"

}}

>

Allo

</span>


<br/>

Split Bill


</h1>



<p

style={{

fontSize:"18px",

fontWeight:500

}}

>

Manage expenses smarter.
<br/>

Simplify payments.

</p>


</div>





<div

style={{

background:"#fff",

borderRadius:"30px",

padding:"35px",

boxShadow:
"0 20px 50px rgba(0,0,0,.2)"

}}

>


<h2>

Login

</h2>



<input

style={input}

placeholder="Email"

value={email}

onChange={
e=>setEmail(e.target.value)
}

/>



<input

style={input}

placeholder="Password"

type="password"

value={password}

onChange={
e=>setPassword(e.target.value)
}

/>




<button

style={button}

onClick={submit}

>

LOGIN

</button>




<div

style={{

marginTop:"25px",

background:"#000",

color:"#fff",

borderRadius:"18px",

padding:"20px"

}}

>


<h3>

Demo Account

</h3>


<p>

Email:

<br/>

<b>

admin@system.com

</b>

</p>



<p>

Password:

<br/>

<b>

Admin@12345

</b>

</p>



</div>


</div>


</div>


</div>

)

}



const input={

width:"100%",

padding:"15px",

marginBottom:"15px",

borderRadius:"14px",

border:
"1px solid #ddd",

fontSize:"16px",

fontFamily:"Poppins"

};



const button={

width:"100%",

padding:"15px",

background:"#000",

color:"#ffc100",

border:"none",

borderRadius:"14px",

fontWeight:800,

fontSize:"16px",

fontFamily:"Poppins",

cursor:"pointer"

};


TSX



npm run build


echo ""
echo "======================================"
echo " LOGIN PAGE UPDATED "
echo " RESPONSIVE ALLO THEME READY "
echo "======================================"

