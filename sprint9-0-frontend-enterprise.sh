#!/bin/bash

set -e


echo "====================================="
echo " FRONTEND ENTERPRISE ENHANCEMENT "
echo "====================================="


mkdir -p src/pages/enterprise
mkdir -p src/components/analytics
mkdir -p src/components/notification



echo ""
echo "=== ANALYTICS CARD ==="


cat > src/components/analytics/AnalyticsCard.tsx <<'TSX'

export default function AnalyticsCard(){

return (

<div>

<h3>
Expense Analytics
</h3>


<p>
Total Expense : Rp 0
</p>


<p>
Transactions : 0
</p>


</div>

)

}

TSX



echo ""
echo "=== NOTIFICATION CENTER ==="


cat > src/components/notification/NotificationCenter.tsx <<'TSX'

export default function NotificationCenter(){

return (

<div>

<h3>
Notification Center
</h3>


<p>
No notification
</p>


</div>

)

}

TSX



echo ""
echo "=== ENTERPRISE DASHBOARD ==="


cat > src/pages/enterprise/EnterpriseDashboard.tsx <<'TSX'

import AnalyticsCard
from "../../components/analytics/AnalyticsCard";


import NotificationCenter
from "../../components/notification/NotificationCenter";


export default function EnterpriseDashboard(){

return (

<div>


<h1>
Enterprise Dashboard
</h1>


<AnalyticsCard/>


<NotificationCenter/>


</div>

)

}

TSX



echo ""
echo "=== BUILD ==="


npm run build



echo ""
echo "====================================="
echo " SPRINT 9.0 COMPLETE "
echo " ENTERPRISE FOUNDATION READY "
echo "====================================="

