import { useEffect, useState } from "react";
import RocketCard from "../components/rocket/RocketCard";
import { getRockets } from "../services/RocketService";

export default function RocketList() {

  const [rockets,setRockets]=useState([]);
  const [loading,setLoading]=useState(true);

  useEffect(()=>{

      getRockets()
      .then(res=>setRockets(res.data))
      .finally(()=>setLoading(false));

  },[]);

  if(loading){
      return <h2 className="p-8">Loading...</h2>;
  }

  return(

    <div className="max-w-7xl mx-auto p-8">

        <h1 className="text-4xl font-bold mb-8">
            🚀 SpaceX Rocket Explorer
        </h1>

        <div className="grid md:grid-cols-3 gap-6">

            {rockets.map((rocket:any)=>(
                <RocketCard
                    key={rocket.id}
                    rocket={rocket}
                />
            ))}

        </div>

    </div>

  );

}
