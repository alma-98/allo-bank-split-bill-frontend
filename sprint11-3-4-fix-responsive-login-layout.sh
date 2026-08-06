#!/bin/bash

set -e

echo "======================================"
echo " FIX FULLSCREEN RESPONSIVE LOGIN "
echo "======================================"


cat > src/pages/Login.tsx <<'TSX'
import {
useState
} from "react";


import {
login
} from "../auth/AuthService";


import "../styles/login.css";


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

<div className="login-page">


<div className="login-brand">


<h1>

<span>
Allo
</span>

<br/>

Split Bill

</h1>


<p>

Manage expenses smarter.
<br/>

Simplify payments.

</p>


</div>



<div className="login-card">


<h2>
Login
</h2>



<input

placeholder="Email"

value={email}

onChange={
e=>setEmail(e.target.value)
}

/>



<input

placeholder="Password"

type="password"

value={password}

onChange={
e=>setPassword(e.target.value)
}

/>



<button
onClick={submit}
>

LOGIN

</button>




<div className="demo-box">


<h3>
Demo Account
</h3>


<p>

admin@system.com

</p>


<p>

Admin@12345

</p>


</div>



</div>


</div>

)

}
TSX



cat > src/styles/login.css <<'CSS'

.login-page{

min-height:100vh;

width:100%;

background:#ffc100;

display:flex;

flex-direction:column;

align-items:center;

justify-content:center;

padding:40px 20px;

font-family:Poppins,sans-serif;

overflow:auto;

}



.login-brand{

text-align:center;

margin-bottom:35px;

color:#000;

}



.login-brand h1{

font-size:clamp(40px,7vw,70px);

line-height:1.05;

margin:0;

font-weight:800;

}



.login-brand span{

background:#000;

color:#ffc100;

padding:5px 18px;

border-radius:18px;

display:inline-block;

}



.login-brand p{

font-size:clamp(15px,2vw,20px);

font-weight:500;

}



.login-card{

width:100%;

max-width:430px;

background:#fff;

padding:35px;

border-radius:28px;

box-shadow:
0 20px 50px rgba(0,0,0,.25);

}



.login-card h2{

font-size:30px;

margin-top:0;

}



.login-card input{

width:100%;

height:52px;

margin-bottom:16px;

padding:0 16px;

border-radius:14px;

border:1px solid #ddd;

font-size:16px;

font-family:Poppins;

}



.login-card button{

width:100%;

height:52px;

background:#000;

color:#ffc100;

border:0;

border-radius:14px;

font-size:16px;

font-weight:800;

cursor:pointer;

}



.demo-box{

margin-top:25px;

background:#000;

color:white;

padding:20px;

border-radius:18px;

}



.demo-box h3{

margin-top:0;

color:#ffc100;

}



.demo-box p{

margin:8px 0;

}



@media(max-width:600px){


.login-page{

padding:20px 15px;

}


.login-brand{

margin-bottom:20px;

}


.login-card{

padding:25px;

border-radius:22px;

}


.login-card h2{

font-size:24px;

}


}



CSS



npm run build


echo "======================================"
echo " LOGIN RESPONSIVE FIX COMPLETE "
echo "======================================"

