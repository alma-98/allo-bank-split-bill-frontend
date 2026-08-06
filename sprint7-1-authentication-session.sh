#!/bin/bash

set -e

echo "====================================="
echo " SPRINT 7.1 AUTHENTICATION SESSION "
echo "====================================="


echo ""
echo "=== 1. CREATE AUTH SERVICE ==="


mkdir -p src/auth


cat > src/auth/AuthService.ts <<'TS'
import client from "../api/client";


export interface LoginRequest {
    email:string;
    password:string;
}


export interface LoginResponse {
    token:string;
}


export async function login(
    data:LoginRequest
){

    const response =
        await client.post<LoginResponse>(
            "/auth/login",
            data
        );


    localStorage.setItem(
        "token",
        response.data.token
    );


    return response.data;

}


export function logout(){

    localStorage.removeItem(
        "token"
    );

}


export function isAuthenticated(){

    return Boolean(
        localStorage.getItem("token")
    );

}
TS



echo ""
echo "=== 2. CREATE AUTH CONTEXT ==="


cat > src/auth/AuthContext.tsx <<'TSX'
import {
createContext,
useContext,
useState
} from "react";


import {
isAuthenticated,
logout
} from "./AuthService";


interface AuthContextType {

    authenticated:boolean;

    signOut:()=>void;

}


const AuthContext =
createContext<AuthContextType | null>(null);



export function AuthProvider(
{
children
}:{
children:React.ReactNode
}){


const [authenticated,setAuthenticated] =
useState(
    isAuthenticated()
);



function signOut(){

    logout();

    setAuthenticated(false);

}


return (

<AuthContext.Provider
value={{
    authenticated,
    signOut
}}
>

{children}

</AuthContext.Provider>

);

}



export function useAuth(){

const context =
useContext(AuthContext);


if(!context){

throw new Error(
"AuthProvider missing"
);

}


return context;

}
TSX



echo ""
echo "=== 3. PROTECTED ROUTE ==="


cat > src/router/ProtectedRoute.tsx <<'TSX'
import {
Navigate
} from "react-router-dom";


import {
isAuthenticated
} from "../auth/AuthService";


export default function ProtectedRoute(
{
children
}:{
children:React.ReactNode
}){


if(!isAuthenticated()){

return <Navigate to="/login"/>;

}


return children;

}
TSX



echo ""
echo "=== 4. UPDATE LOGIN PAGE ==="


cat > src/pages/Login.tsx <<'TSX'
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
TSX



echo ""
echo "=== 5. UPDATE ROUTER ==="


cat > src/router/AppRouter.tsx <<'TSX'
import {
BrowserRouter,
Routes,
Route
} from "react-router-dom";


import Dashboard from "../pages/Dashboard";
import Login from "../pages/Login";
import ProtectedRoute from "./ProtectedRoute";


export default function AppRouter(){


return (

<BrowserRouter>

<Routes>


<Route
path="/login"
element={<Login/>}
/>


<Route
path="/"
element={
<ProtectedRoute>
<Dashboard/>
</ProtectedRoute>
}
/>


</Routes>

</BrowserRouter>

);

}
TSX



echo ""
echo "=== 6. UPDATE APP PROVIDER ==="


cat > src/App.tsx <<'TSX'
import AppRouter from "./router/AppRouter";
import {
AuthProvider
} from "./auth/AuthContext";


function App(){

return (

<AuthProvider>

<AppRouter/>

</AuthProvider>

);

}


export default App;
TSX



echo ""
echo "=== 7. BUILD CHECK ==="


npm run build



echo ""
echo "====================================="
echo " SPRINT 7.1 COMPLETE "
echo " AUTH SESSION READY "
echo "====================================="

