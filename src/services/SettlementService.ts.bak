import client from "../api/client";


import type {
Settlement,
SettlementHistory
} from "../types/settlement";



export async function generateSettlement(
groupId:string
){

const response =
await client.post<Settlement[]>(
`/groups/${groupId}/settlements/generate`
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



export async function markPaid(
id:string
){

const response =
await client.patch(
`/settlements/${id}/paid`
);


return response.data;

}



export async function cancelSettlement(
id:string
){

const response =
await client.patch(
`/settlements/${id}/cancel`
);


return response.data;

}



export async function getSettlementHistory(
groupId:string
){

const response =
await client.get<SettlementHistory[]>(
`/groups/${groupId}/settlements/history`
);


return response.data;

}
