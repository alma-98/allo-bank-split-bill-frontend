#!/bin/bash

set -e


echo "====================================="
echo " FULL RESPONSIVE WEBSITE EXPERIENCE "
echo "====================================="


mkdir -p src/components/public
mkdir -p src/styles



cat > src/styles/landing.css <<'CSS'

.landing{

background:#ffc100;
color:#000;
font-family:Poppins,sans-serif;

}


.section{

padding:80px 8%;

}


.nav{

display:flex;
justify-content:space-between;
align-items:center;
padding:25px 8%;

}


.logo{

font-size:32px;
font-weight:800;

}


.btn{

background:#000;
color:white;
padding:14px 30px;
border-radius:14px;
text-decoration:none;
font-weight:700;

}


.hero{

display:grid;
grid-template-columns:1fr 1fr;
gap:40px;
align-items:center;

}


.hero h1{

font-size:70px;
line-height:1.1;

}


.mock{

background:#fff;
border-radius:30px;
padding:30px;
box-shadow:0 20px 50px rgba(0,0,0,.2);

}


.grid{

display:grid;
grid-template-columns:repeat(4,1fr);
gap:25px;

}


.card{

background:white;
padding:30px;
border-radius:24px;

}



.steps{

display:grid;
grid-template-columns:repeat(3,1fr);
gap:25px;

}



.footer{

background:#000;
color:white;
padding:40px;
text-align:center;

}



@media(max-width:900px){


.hero{

grid-template-columns:1fr;

}


.hero h1{

font-size:45px;

}


.grid{

grid-template-columns:1fr 1fr;

}


.steps{

grid-template-columns:1fr;

}


}


@media(max-width:600px){


.nav{

flex-direction:column;
gap:20px;

}


.grid{

grid-template-columns:1fr;

}


.section{

padding:50px 20px;

}


.hero h1{

font-size:38px;

}


}


CSS



cat > src/components/public/Navbar.tsx <<'TSX'

import {Link} from "react-router-dom";


export default function Navbar(){

return (

<nav className="nav">


<div className="logo">

Allo

</div>


<div>


<Link

className="btn"

to="/login"

>

Login

</Link>


</div>


</nav>

)

}

TSX



cat > src/pages/public/Landing.tsx <<'TSX'

import Navbar from "../../components/public/Navbar";

import "../../styles/landing.css";


import {Link} from "react-router-dom";


export default function Landing(){

return (

<div className="landing">


<Navbar/>



<section className="section hero">


<div>


<h1>

Split Bills.
<br/>

Simplify Payments.

</h1>


<p>

Manage group expenses,
track payments,
and settle bills instantly.

</p>


<Link

className="btn"

to="/login"

>

Start Now

</Link>


</div>



<div className="mock">


<h2>

Allo Dashboard

</h2>


<p>

Total Expense

</p>


<h1>

Rp 2.500.000

</h1>


<p>

12 Members
<br/>

8 Expenses

</p>


</div>


</section>





<section className="section">


<h2>

Trusted Expense Platform

</h2>


<div className="grid">


<div className="card">

<h2>10K+</h2>

Users

</div>


<div className="card">

<h2>50K+</h2>

Transactions

</div>


<div className="card">

<h2>5K+</h2>

Groups

</div>


<div className="card">

<h2>99%</h2>

Accuracy

</div>


</div>


</section>





<section className="section">


<h2>

Powerful Features

</h2>


<div className="grid">


<div className="card">

<h3>
Expense Tracking
</h3>

<p>
Monitor every payment.
</p>

</div>


<div className="card">

<h3>
Group Management
</h3>

<p>
Manage members easily.
</p>

</div>


<div className="card">

<h3>
Smart Settlement
</h3>

<p>
Calculate balances.
</p>

</div>


<div className="card">

<h3>
Payment Monitoring
</h3>

<p>
Track settlement status.
</p>

</div>


</div>


</section>





<section className="section">


<h2>

How It Works

</h2>


<div className="steps">


<div className="card">

<h2>1</h2>

Create Group

</div>


<div className="card">

<h2>2</h2>

Add Expense

</div>


<div className="card">

<h2>3</h2>

Settle Payment

</div>


</div>


</section>




<section className="section">


<div className="mock">


<h2>

Ready to Split?

</h2>


<p>

Start managing expenses smarter.

</p>


<Link

className="btn"

to="/login"

>

Get Started

</Link>


</div>


</section>





<footer className="footer">

© 2026 Allo Bank Split Bill

</footer>


</div>

)

}

TSX



npm run build


echo "====================================="
echo " RESPONSIVE WEBSITE COMPLETE "
echo "====================================="

