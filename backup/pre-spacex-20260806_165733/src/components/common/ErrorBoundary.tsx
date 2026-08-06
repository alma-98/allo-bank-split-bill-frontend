import React from "react";


interface State {

hasError:boolean;

}


export default class ErrorBoundary
extends React.Component<
React.PropsWithChildren,
State
>{


constructor(
props:React.PropsWithChildren
){

super(props);

this.state={
hasError:false
};

}



static getDerivedStateFromError(){

return {
hasError:true
};

}



render(){

if(this.state.hasError){

return (

<div>

<h2>
Something went wrong
</h2>

<p>
Please refresh the application
</p>

</div>

);

}


return this.props.children;

}

}
