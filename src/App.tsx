import AppRouter from "./router/AppRouter";

import {
AuthProvider
} from "./auth/AuthContext";

import ErrorBoundary
from "./components/common/ErrorBoundary";


function App(){

return (

<ErrorBoundary>

<AuthProvider>

<AppRouter/>

</AuthProvider>

</ErrorBoundary>

);

}


export default App;
