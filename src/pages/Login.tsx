
import {
useState
} from "react";


import {
login
} from "../auth/AuthService";


export default function Login(){


const [email,setEmail]=useState("");

const [password,setPassword]=useState("");


async function submit(){


await login({

email,
password

});


window.location.href="/";


}



return (

<div

style={{

minHeight:"100vh",

display:"flex",

alignItems:"center",

justifyContent:"center",

background:
"linear-gradient(135deg,#0f172a,#2563eb)"

}}

>


<div

style={{

width:"420px",

background:"white",

borderRadius:"24px",

padding:"40px",

boxShadow:
"0 20px 50px rgba(0,0,0,.25)"

}}

>


<h1

style={{

marginBottom:"5px"

}}

>

Allo Bank

</h1>


<h2>

Split Bill Platform

</h2>


<p

style={{

color:"#64748b"

}}

>

Manage shared expenses easily and securely.

</p>



<input

style={inputStyle}

placeholder="Email"

value={email}

onChange={
e=>setEmail(e.target.value)
}

/>



<input

style={inputStyle}

placeholder="Password"

type="password"

value={password}

onChange={
e=>setPassword(e.target.value)
}

/>



<button

style={{

width:"100%",

padding:"14px",

background:"#2563eb",

color:"white",

border:0,

borderRadius:"12px",

fontSize:"16px",

fontWeight:700

}}

onClick={submit}

>

Login

</button>




<div

style={{

marginTop:"25px",

padding:"18px",

borderRadius:"14px",

background:"#f1f5f9"

}}

>


<b>

Demo Account

</b>


<p>

Email:

<br/>

<strong>
admin@system.com
</strong>

</p>


<p>

Password:

<br/>

<strong>
Admin@12345
</strong>

</p>


<span

style={{

color:"#16a34a",

fontWeight:700

}}

>

ADMIN ACCESS

</span>


</div>



</div>


</div>

)

}



const inputStyle={

width:"100%",

padding:"14px",

margin:"10px 0",

borderRadius:"12px",

border:
"1px solid #cbd5e1",

fontSize:"15px"

};


