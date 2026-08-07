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
