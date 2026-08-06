import { useEffect, useState } from "react";
import { useNavigate, useParams } from "react-router-dom";
import { getRocket } from "../services/RocketService";

export default function RocketDetail() {

    const { id } = useParams();

    const navigate = useNavigate();

    const [rocket,setRocket]=useState<any>(null);

    const [loading,setLoading]=useState(true);

    useEffect(()=>{

        if(!id) return;

        getRocket(id)
        .then(res=>setRocket(res.data))
        .finally(()=>setLoading(false));

    },[id]);

    if(loading){
        return(
            <div className="p-8 text-center">
                Loading Rocket...
            </div>
        );
    }

    if(!rocket){
        return(
            <div className="p-8 text-center">
                Rocket Not Found
            </div>
        );
    }

    return(

<div className="max-w-6xl mx-auto p-8">

<button
className="mb-6 px-4 py-2 bg-gray-200 rounded"
onClick={()=>navigate(-1)}
>
← Back
</button>

<img
src={rocket.flickr_images?.[0]}
alt={rocket.name}
className="w-full rounded-xl shadow-lg mb-8"
/>

<h1 className="text-5xl font-bold mb-4">
{rocket.name}
</h1>

<p className="mb-8 text-lg">
{rocket.description}
</p>

<div className="grid md:grid-cols-2 gap-6">

<div className="border rounded-lg p-4">
<h3 className="font-bold">Company</h3>
<p>{rocket.company}</p>
</div>

<div className="border rounded-lg p-4">
<h3 className="font-bold">Country</h3>
<p>{rocket.country}</p>
</div>

<div className="border rounded-lg p-4">
<h3 className="font-bold">First Flight</h3>
<p>{rocket.first_flight}</p>
</div>

<div className="border rounded-lg p-4">
<h3 className="font-bold">Success Rate</h3>
<p>{rocket.success_rate_pct}%</p>
</div>

<div className="border rounded-lg p-4">
<h3 className="font-bold">Height</h3>
<p>{rocket.height?.meters} m</p>
</div>

<div className="border rounded-lg p-4">
<h3 className="font-bold">Diameter</h3>
<p>{rocket.diameter?.meters} m</p>
</div>

<div className="border rounded-lg p-4">
<h3 className="font-bold">Mass</h3>
<p>{rocket.mass?.kg} kg</p>
</div>

<div className="border rounded-lg p-4">
<h3 className="font-bold">Cost Per Launch</h3>
<p>$ {rocket.cost_per_launch?.toLocaleString()}</p>
</div>

</div>

<div className="mt-8">

<a

href={rocket.wikipedia}

target="_blank"

rel="noreferrer"

className="inline-block bg-blue-600 text-white px-6 py-3 rounded-lg"

>

Wikipedia

</a>

</div>

</div>

);

}
