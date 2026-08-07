interface Props{
 value:string;
 onChange:(value:string)=>void;
}

export default function SearchBar({value,onChange}:Props){

return(

<input
className="w-full border rounded-lg p-3 mb-6"
placeholder="Search Rocket..."
value={value}
onChange={(e)=>onChange(e.target.value)}
/>

);

}
