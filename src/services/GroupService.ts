import client from "../api/client";

import type {
Group,
Expense,
Settlement
} from "../types/group";


export async function getGroup(
groupId:string
){

const response =
await client.get<Group>(
`/groups/${groupId}`
);


return response.data;

}



export async function getSettlements(
groupId:string
){

const response =
await client.get<Settlement[]>(
`/groups/${groupId}/settlements`
);


return response.data;

}



export async function createExpense(
groupId:string,
data:Expense
){

const response =
await client.post(
`/groups/${groupId}/expenses`,
data
);


return response.data;

}
