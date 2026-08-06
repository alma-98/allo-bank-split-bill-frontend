#!/bin/bash

set -e

echo "======================================"
echo " ALLO BRAND THEME UPDATE "
echo "======================================"


mkdir -p src/styles


cat > src/styles/design-system.css <<'CSS'

@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700;800&display=swap');


:root {

--allo-yellow:#ffc100;

--black:#000000;

--white:#ffffff;

--gray:#333333;

--background:#ffc100;

--card:#ffffff;


font-family:
'Poppins',
sans-serif;

}


*{

box-sizing:border-box;

}


body{

margin:0;

background:
var(--allo-yellow);

color:
var(--black);

font-family:
'Poppins',
sans-serif;

}


h1,h2,h3,h4{

font-family:
'Poppins',
sans-serif;

font-weight:700;

}


.card{

background:white;

border-radius:20px;

padding:24px;

color:black;

box-shadow:
0 10px 30px rgba(0,0,0,.15);

}


button{

font-family:
'Poppins',
sans-serif;

background:black;

color:white;

border:none;

border-radius:12px;

font-weight:600;

}


CSS



echo "=== UPDATE HERO ==="


cat > src/components/public/Hero.tsx <<'TSX'

import {
Link
} from "react-router-dom";


export default function Hero(){

return (

<section

style={{

padding:"100px 60px",

textAlign:"center",

background:"#ffc100",

color:"#000"

}}

>


<h1

style={{

fontSize:"56px",

fontWeight:800

}}

>

<span
style={{
color:"#ffc100",
background:"#000",
padding:"5px 15px",
borderRadius:"10px"
}}
>
Allo
</span>

<br/>

Split Bill

</h1>



<p

style={{

fontSize:"22px",

fontWeight:500

}}

>

Split Bills.
Simplify Payments.

</p>



<p>

Manage expenses,
track payments,
and settle bills easily.

</p>



<Link

to="/login"

style={{

display:"inline-block",

marginTop:"30px",

padding:"16px 40px",

background:"#000",

color:"#fff",

borderRadius:"14px",

textDecoration:"none",

fontWeight:700

}}

>

START NOW

</Link>


</section>

)

}

TSX



echo "=== UPDATE NAVBAR ==="


python3 <<'PY'

from pathlib import Path

p=Path("src/components/public/Navbar.tsx")

if p.exists():

 s=p.read_text()

 s=s.replace(
 "Allo Split Bill",
 "<span style={{color:'#ffc100'}}>Allo</span> Split Bill"
 )

 p.write_text(s)

PY



echo "=== BUILD ==="

npm run build


echo ""
echo "======================================"
echo " ALLO BRAND THEME READY "
echo "======================================"

