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
