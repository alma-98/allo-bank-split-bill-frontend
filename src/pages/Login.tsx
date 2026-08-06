import {
useState
} from "react";


import {
login
} from "../auth/AuthService";


export default function Login(){


const [email,setEmail] =
useState("");

const [password,setPassword] =
useState("");



async function submit(){

await login({
    email,
    password
});


window.location.href="/";

}



return (

<div>

<h1>
Login
</h1>


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
Login
</button>


</div>

);

}
