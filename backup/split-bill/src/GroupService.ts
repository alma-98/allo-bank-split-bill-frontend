import client from "../api/client";

import type {
Group,
Participant,
CreateGroupRequest
} from "../types/group";


export async function createGroup(
data:CreateGroupRequest
){

const response =
await client.post<Group>(
"/groups",
data
);

return response.data;

}



export async function getGroup(
groupId:string
){

const response =
await client.get<Group>(
`/groups/${groupId}`
);

return response.data;

}



export async function addParticipant(
groupId:string,
data:Participant
){

const response =
await client.post(
`/groups/${groupId}/participants`,
data
);

return response.data;

}

export async function getGroups() {
  const response = await client.get<Group[]>("/groups");
  return response.data;
}
