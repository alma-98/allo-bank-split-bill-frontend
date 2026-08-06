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
