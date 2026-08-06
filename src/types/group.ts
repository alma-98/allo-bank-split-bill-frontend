export interface Group {

    id:string;
    name:string;
    ownerId?:string;

}


export interface Expense {

    id:string;
    description:string;
    amount:number;

}


export interface Settlement {

    id:string;
    amount:number;
    status:string;

}
