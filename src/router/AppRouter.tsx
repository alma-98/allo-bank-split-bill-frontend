import {
BrowserRouter,
Routes,
Route
} from "react-router-dom";


import Dashboard from "../pages/Dashboard";

import Login from "../pages/Login";

import GroupDetail from "../pages/GroupDetail";
import Settlement from "../pages/Settlement";

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


<Route
path="/groups/:id"
element={
<ProtectedRoute>
<GroupDetail/>
</ProtectedRoute>
}
/>



<Route
path="/groups/:id/settlements"
element={
<ProtectedRoute>
<Settlement/>
</ProtectedRoute>
}
/>


</Routes>


</BrowserRouter>

);

}
