#!/bin/bash

set -e

echo "=== ENABLE AUTO LOGIN DEMO ==="


cat > src/auth/AutoLogin.ts <<'TS'
import { login } from "./AuthService";


export async function autoLogin(){

const token =
localStorage.getItem("token");


if(token){

return true;

}


try{

await login({

email:"admin@system.com",

password:"Admin@12345"

});


return true;


}catch(error){

console.error(
"Auto login failed",
error
);


return false;

}


}

TS


echo ""
echo "AutoLogin created"


