interface Props{
message:string;
}

export default function Error({message}:Props){

return(

<div className="text-center py-10 text-red-500">

<h2>{message}</h2>

</div>

);

}
