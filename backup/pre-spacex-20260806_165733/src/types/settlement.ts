export interface Settlement {

    id:string;

    fromParticipant:string;

    toParticipant:string;

    amount:number;

    status:string;

}


export interface SettlementHistory {

    id:string;

    amount:number;

    status:string;

    createdAt?:string;

}
