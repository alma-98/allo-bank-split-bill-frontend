#!/bin/bash

set -e

echo "====================================="
echo " SPRINT 7.5 FINAL FRONTEND PRODUCTION "
echo "====================================="


echo ""
echo "=== 1. UPDATE ENVIRONMENT CONFIG ==="


cat > .env.production <<ENV
VITE_API_URL=http://localhost:8080/api
ENV


cat > .env.example <<ENV
VITE_API_URL=http://localhost:8080/api
ENV



echo ""
echo "=== 2. CREATE GLOBAL ERROR HANDLER ==="


mkdir -p src/components/common


cat > src/components/common/ErrorBoundary.tsx <<'TSX'
import React from "react";


interface State {

hasError:boolean;

}


export default class ErrorBoundary
extends React.Component<
React.PropsWithChildren,
State
>{


constructor(
props:React.PropsWithChildren
){

super(props);

this.state={
hasError:false
};

}



static getDerivedStateFromError(){

return {
hasError:true
};

}



render(){

if(this.state.hasError){

return (

<div>

<h2>
Something went wrong
</h2>

<p>
Please refresh the application
</p>

</div>

);

}


return this.props.children;

}

}
TSX



echo ""
echo "=== 3. CREATE LOADING COMPONENT ==="


cat > src/components/common/PageLoading.tsx <<'TSX'
export default function PageLoading(){

return (

<div>

Loading...

</div>

);

}
TSX



echo ""
echo "=== 4. UPDATE APP WITH ERROR BOUNDARY ==="


cat > src/App.tsx <<'TSX'
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
TSX



echo ""
echo "=== 5. CREATE PRODUCTION LAYOUT ==="


mkdir -p src/layouts


cat > src/layouts/MainLayout.tsx <<'TSX'
import {
Outlet
} from "react-router-dom";


export default function MainLayout(){

return (

<div>


<header>

<h2>
Allo Bank Split Bill
</h2>

</header>


<main>

<Outlet/>

</main>


<footer>

<p>
Allo Bank Split Bill API v1.0.0
</p>

</footer>


</div>

);

}
TSX



echo ""
echo "=== 6. UPDATE DASHBOARD EMPTY STATE ==="


python3 <<'PY'
from pathlib import Path

p=Path("src/pages/Dashboard.tsx")

s=p.read_text()

s=s.replace(
'''
<ExpenseList
expenses={expenses}
/>
''',
'''
{
expenses.length === 0 ?

<p>
No expenses available
</p>

:

<ExpenseList
expenses={expenses}
/>

}
'''
)

p.write_text(s)

print("dashboard updated")
PY



echo ""
echo "=== 7. CREATE VERSION FILE ==="


cat > VERSION <<VERSION
1.0.0
VERSION



echo ""
echo "=== 8. PRODUCTION BUILD ==="


npm run build



echo ""
echo "====================================="
echo " SPRINT 7.5 COMPLETE "
echo " FRONTEND PRODUCTION READY "
echo "====================================="

