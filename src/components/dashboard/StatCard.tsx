interface Props {

title:string;

value:string;

}


export default function StatCard(
{
title,
value
}:Props
){

return (

<div>

<h3>{title}</h3>

<strong>
{value}
</strong>

</div>

);

}
