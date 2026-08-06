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
