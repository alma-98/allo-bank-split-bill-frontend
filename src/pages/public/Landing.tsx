
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

