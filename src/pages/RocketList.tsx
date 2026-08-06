import {useEffect,useState} from "react";

import Layout from "../components/layout/Layout";
import RocketCard from "../components/rocket/RocketCard";
import SearchBar from "../components/common/SearchBar";
import Loading from "../components/common/Loading";
import Error from "../components/common/Error";

import {getRockets} from "../services/RocketService";

export default function RocketList(){

const [rockets,setRockets]=useState([]);
const [search,setSearch]=useState("");

const [loading,setLoading]=useState(true);
const [error,setError]=useState("");

useEffect(()=>{

getRockets()

.then(res=>{

setRockets(res.data);

})

.catch(()=>{

setError("Failed to load SpaceX API");

})

.finally(()=>{

setLoading(false);

});

},[]);

if(loading){

return <Loading/>;

}

if(error){

return <Error message={error}/>;

}

const filtered=rockets.filter((rocket:any)=>

rocket.name.toLowerCase().includes(search.toLowerCase())

);

return(
<Layout>
<div className="max-w-7xl mx-auto p-6 md:p-8">

<h1 className="text-4xl font-bold mb-6">

🚀 SpaceX Rocket Explorer

</h1>

<SearchBar

value={search}

onChange={setSearch}

/>

{

filtered.length===0?

(

<div className="text-center py-20">

Rocket Not Found

</div>

)

:

(

<div className="grid md:grid-cols-3 gap-6">

{

filtered.map((rocket:any)=>

<RocketCard

key={rocket.id}

rocket={rocket}

/>

)

}

</div>

)

}

</div>

);

}
