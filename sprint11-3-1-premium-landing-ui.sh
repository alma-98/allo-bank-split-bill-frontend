#!/bin/bash

set -e

echo "======================================"
echo " SPRINT 11.3.1 PREMIUM LANDING UI "
echo "======================================"


mkdir -p src/components/public


cat > src/components/public/Navbar.tsx <<'TSX'
import { Link } from "react-router-dom";


export default function Navbar(){

return (

<nav

style={{

height:"80px",

display:"flex",

alignItems:"center",

justifyContent:"space-between",

padding:"0 80px",

background:"#ffc100"

}}

>


<div

style={{

fontSize:"28px",

fontWeight:800

}}

>

<span>

Allo

</span>

<span>

 Split Bill

</span>


</div>



<Link

to="/login"

style={{

background:"#000",

color:"#fff",

padding:"12px 28px",

borderRadius:"14px",

textDecoration:"none",

fontWeight:700

}}

>

Login

</Link>


</nav>

)

}
TSX



cat > src/components/public/Hero.tsx <<'TSX'
import { Link } from "react-router-dom";


export default function Hero(){

return (

<section

style={{

padding:"90px 80px",

textAlign:"center",

background:"#ffc100"

}}

>


<h1

style={{

fontSize:"64px",

lineHeight:1.1,

fontWeight:800,

margin:0

}}

>

<span

style={{

background:"#000",

color:"#ffc100",

padding:"8px 20px",

borderRadius:"18px"

}}

>

Allo

</span>


<br/>

Split Bill

</h1>



<p

style={{

fontSize:"24px",

fontWeight:500,

marginTop:"30px"

}}

>

Split bills smarter.
<br/>

Manage expenses easier.

</p>



<p

style={{

fontSize:"18px"

}}

>

Track payments, manage groups,
and settle expenses effortlessly.

</p>



<Link

to="/login"

style={{

display:"inline-block",

marginTop:"35px",

padding:"16px 45px",

background:"#000",

color:"#fff",

borderRadius:"16px",

textDecoration:"none",

fontWeight:700,

fontSize:"18px"

}}

>

START NOW

</Link>


</section>

)

}
TSX



cat > src/components/public/Features.tsx <<'TSX'

const features=[

{
title:"Expense Tracking",
desc:"Record and monitor every shared expense."
},

{
title:"Group Management",
desc:"Create groups and manage members easily."
},

{
title:"Smart Settlement",
desc:"Calculate who owes whom automatically."
},

{
title:"Payment Monitoring",
desc:"Track payment status transparently."
}

];


export default function Features(){

return (

<section

style={{

padding:"80px",

background:"#000"

}}

>


<h2

style={{

color:"#ffc100",

textAlign:"center",

fontSize:"36px"

}}

>

Powerful Features

</h2>



<div

style={{

display:"grid",

gridTemplateColumns:"repeat(4,1fr)",

gap:"25px",

marginTop:"50px"

}}

>


{
features.map(item=>(


<div

key={item.title}

style={{

background:"#fff",

padding:"30px",

borderRadius:"24px"

}}

>


<h3>

{item.title}

</h3>


<p>

{item.desc}

</p>


</div>


))

}



</div>


</section>

)

}
TSX



cat > src/components/public/Footer.tsx <<'TSX'

export default function Footer(){

return (

<footer

style={{

padding:"35px",

background:"#ffc100",

textAlign:"center",

fontWeight:600

}}

>

© 2026 Allo Bank Split Bill

</footer>

)

}

TSX



cat > src/pages/public/Landing.tsx <<'TSX'

import Navbar from "../../components/public/Navbar";

import Hero from "../../components/public/Hero";

import Features from "../../components/public/Features";

import Footer from "../../components/public/Footer";


export default function Landing(){

return (

<div>

<Navbar/>

<Hero/>

<Features/>

<Footer/>

</div>

)

}

TSX



npm run build


echo ""
echo "======================================"
echo " PREMIUM LANDING UI COMPLETE "
echo "======================================"

