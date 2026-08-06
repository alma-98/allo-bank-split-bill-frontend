import {
useState
} from "react";

import {
createGroup
} from "../../services/GroupService";


export default function CreateGroupForm(){

const [name,setName]=useState("");



async function submit(){

await createGroup({
name
});

alert(
"Group created"
);

}



return (

<div>

<h2>
Create Group
</h2>


<input
placeholder="Group name"
value={name}
onChange={
e=>setName(e.target.value)
}
/>


<button
onClick={submit}
>
Create
</button>


</div>

);

}
