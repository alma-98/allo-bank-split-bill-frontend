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
