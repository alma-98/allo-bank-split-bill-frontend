export interface Group {

    id:string;

    name:string;

    ownerId?:string;

}


export interface Participant {

    id:string;

    name:string;

    email?:string;

}


export interface Expense {

    id:string;

    description:string;

    amount:number;

}


export interface CreateGroupRequest {

    name:string;

}


export interface CreateExpenseRequest {

    description:string;

    amount:number;

}
