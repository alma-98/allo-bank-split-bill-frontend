#!/bin/bash

set -e

echo "======================================"
echo " FIX LANDING HERO TYPOGRAPHY "
echo "======================================"


cat > src/components/public/Hero.tsx <<'TSX'
import { Link } from "react-router-dom";


export default function Hero(){

return (

<section className="hero-section">


<div className="hero-content">


<h1>

Split Bills.
<br/>

<span>
Simplify Payments.
</span>


</h1>



<p className="hero-description">

Manage group expenses,
track payments,
and settle bills instantly.

</p>



<Link

to="/login"

className="hero-button"

>

START NOW

</Link>


</div>



<div className="hero-preview">


<div className="preview-card">

<h3>
Allo Dashboard
</h3>


<div>

Total Expense

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


</div>


</section>

)

}
TSX



cat > src/styles/landing.css <<'CSS'


.landing{

background:#ffc100;

color:#000;

font-family:Poppins,sans-serif;

overflow:hidden;

}



.hero-section{


min-height:90vh;

padding:

80px 8%;


display:grid;

grid-template-columns:

1fr 1fr;


align-items:center;


gap:60px;


}



.hero-content{


max-width:650px;


}



.hero-content h1{


font-size:

clamp(42px,6vw,72px);


line-height:

1.15;


font-weight:

800;


margin:

0 0 30px 0;


letter-spacing:

-1px;


}



.hero-content h1 span{


display:inline-block;


}



.hero-description{


font-size:

clamp(18px,2vw,24px);


line-height:

1.7;


max-width:

520px;


margin-bottom:

40px;


font-weight:

500;


}



.hero-button{


display:inline-block;


background:#000;


color:#ffc100;


padding:

16px 40px;


border-radius:

16px;


text-decoration:none;


font-weight:

700;


}



.hero-preview{


display:flex;

justify-content:center;


}



.preview-card{


background:white;


width:100%;


max-width:380px;


padding:35px;


border-radius:30px;


box-shadow:

0 25px 60px rgba(0,0,0,.25);


}



.preview-card h2{


font-size:36px;


}



@media(max-width:900px){


.hero-section{


grid-template-columns:

1fr;


text-align:center;


padding:

60px 25px;


}



.hero-content{


max-width:

100%;


}



.hero-description{


margin-left:auto;

margin-right:auto;


}



.hero-preview{


margin-top:30px;


}


}



@media(max-width:500px){


.hero-content h1{


font-size:

40px;


}



.hero-description{


font-size:

17px;


line-height:

1.6;


}


}



CSS



npm run build


echo ""
echo "======================================"
echo " LANDING HERO FIX COMPLETE "
echo "======================================"

