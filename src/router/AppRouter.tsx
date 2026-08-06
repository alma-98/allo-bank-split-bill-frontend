import {
BrowserRouter,
Routes,
Route
} from "react-router-dom";


import Dashboard from "../pages/Dashboard";
import Login from "../pages/Login";


export default function AppRouter(){

return (

<BrowserRouter>

<Routes>

<Route path="/login" element={<Login/>}/>

<Route path="/" element={<Dashboard/>}/>

</Routes>

</BrowserRouter>

);

}
