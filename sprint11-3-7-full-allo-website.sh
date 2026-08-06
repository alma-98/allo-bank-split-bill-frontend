#!/bin/bash

set -e

echo "======================================"
echo " FULL ALLO SPLIT BILL WEBSITE "
echo "======================================"


mkdir -p src/components/public
mkdir -p src/styles


cat > src/styles/website.css <<'CSS'

@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700;800&display=swap');


*{
box-sizing:border-box;
}


body{

margin:0;

font-family:'Poppins',sans-serif;

}


.website{

background:#ffc100;

color:#000;

}


.container{

padding:80px 8%;

}



.navbar{

height:80px;

display:flex;

align-items:center;

justify-content:space-between;

padding:0 8%;

background:#ffc100;

}



.logo{

font-size:32px;

font-weight:800;

}



.logo span{

color:#000;

}



.login-btn{

background:#000;

color:#ffc100;

padding:14px 35px;

border-radius:14px;

text-decoration:none;

font-weight:700;

}



.hero{

display:grid;

grid-template-columns:1fr 1fr;

gap:60px;

align-items:center;

min-height:600px;

}



.hero h1{

font-size:72px;

line-height:1.1;

font-weight:800;

margin:0;

}



.hero p{

font-size:22px;

line-height:1.6;

}



.button{

background:#000;

color:white;

padding:16px 40px;

border-radius:15px;

display:inline-block;

text-decoration:none;

font-weight:700;

}



.dashboard-preview{

background:white;

border-radius:30px;

padding:30px;

box-shadow:
0 20px 60px rgba(0,0,0,.25);

}



.sidebar-preview{

background:#000;

color:white;

padding:20px;

border-radius:20px;

}



.stats{

background:white;

display:grid;

grid-template-columns:repeat(4,1fr);

}



.stat{

padding:40px;

text-align:center;

}



.features{

background:#000;

color:white;

}



.feature-grid{

display:grid;

grid-template-columns:repeat(4,1fr);

gap:25px;

}



.card{

background:#fff;

color:#000;

padding:30px;

border-radius:25px;

}



.feature-card{

border:1px solid #555;

padding:30px;

border-radius:20px;

}



.steps{

display:grid;

grid-template-columns:repeat(3,1fr);

gap:30px;

}



.cta{

background:#ffc100;

display:flex;

justify-content:space-between;

align-items:center;

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

text-align:center;

}



.stats{

grid-template-columns:1fr 1fr;

}



.feature-grid{

grid-template-columns:1fr 1fr;

}



.steps{

grid-template-columns:1fr;

}


}



@media(max-width:600px){


.navbar{

padding:20px;

}



.hero h1{

font-size:42px;

}



.container{

padding:50px 20px;

}



.stats{

grid-template-columns:1fr;

}



.feature-grid{

grid-template-columns:1fr;

}


}



CSS



cat > src/pages/public/Landing.tsx <<'TSX'

import {
Link
} from "react-router-dom";


import "../../styles/website.css";


export default function Landing(){


return (

<div className="website">


<nav className="navbar">


<div className="logo">

Allo <span>Split Bill</span>

</div>


<Link

className="login-btn"

to="/login"

>

Login

</Link>


</nav>




<section className="container hero">


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

className="button"

to="/login"

>

START NOW

</Link>


</div>




<div className="dashboard-preview">


<h2>

Allo Dashboard

</h2>


<div className="sidebar-preview">

Dashboard

<br/>

Groups

<br/>

Expenses

<br/>

Settlement

</div>


<h2>

Rp 2.500.000

</h2>


<p>

12 Members

<br/>

8 Expenses

</p>


</div>


</section>




<section className="stats">


<div className="stat">

<h1>

10K+

</h1>

Users

</div>


<div className="stat">

<h1>

50K+

</h1>

Transactions

</div>


<div className="stat">

<h1>

5K+

</h1>

Groups

</div>


<div className="stat">

<h1>

99%

</h1>

Accuracy

</div>


</section>





<section className="container features">


<h1>

Powerful Features

</h1>



<div className="feature-grid">


<div className="feature-card">

<h3>
Expense Tracking
</h3>

<p>
Monitor every expense.
</p>

</div>


<div className="feature-card">

<h3>
Group Management
</h3>

<p>
Manage members.
</p>

</div>


<div className="feature-card">

<h3>
Smart Settlement
</h3>

<p>
Calculate balances.
</p>

</div>


<div className="feature-card">

<h3>
Payment Monitoring
</h3>

<p>
Track payments.
</p>

</div>


</div>


</section>





<section className="container">


<h1>

How It Works

</h1>



<div className="steps">


<div className="card">

<h2>
1
</h2>

Create Group

</div>


<div className="card">

<h2>
2
</h2>

Add Expense

</div>


<div className="card">

<h2>
3
</h2>

Settle Payment

</div>


</div>


</section>




<section className="container cta">


<div>

<h2>

Ready to simplify your payments?

</h2>

<p>

Join Allo Split Bill today.

</p>

</div>


<Link

className="button"

to="/login"

>

GET STARTED

</Link>


</section>




<footer className="footer">

© 2026 Allo Bank Split Bill

</footer>



</div>

)

}

TSX



npm run build


echo ""
echo "======================================"
echo " FULL WEBSITE COMPLETE "
echo " RESPONSIVE READY "
echo "======================================"

