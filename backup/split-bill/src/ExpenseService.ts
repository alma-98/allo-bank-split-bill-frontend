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

export async function getExpenses(groupId?: string) {
  const url = groupId
    ? `/groups/${groupId}/expenses`
    : "/expenses";

  const response = await client.get(url);
  return response.data;
}
