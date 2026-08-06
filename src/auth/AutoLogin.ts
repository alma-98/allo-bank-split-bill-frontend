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

