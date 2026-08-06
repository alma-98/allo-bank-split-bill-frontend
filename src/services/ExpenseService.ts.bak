import client from "../api/client";

import type {
CreateExpenseRequest,
Expense
} from "../types/group";


export async function createExpense(
groupId:string,
data:CreateExpenseRequest
){

const response =
await client.post<Expense>(
`/groups/${groupId}/expenses`,
data
);


return response.data;

}
