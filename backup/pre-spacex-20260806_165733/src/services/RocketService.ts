import api from "../api/spacex";

export const getRockets = () => api.get("/rockets");

export const getRocket = (id:string) =>
    api.get("/rockets/" + id);
