#!/bin/bash

set -e


LOGIN=$(find src -name "*Login*.tsx" | head -1)


if [ -z "$LOGIN" ]; then

echo "Login component tidak ditemukan"

exit 1

fi


echo "Updating $LOGIN"


python3 <<PY
from pathlib import Path

p=Path("$LOGIN")

s=p.read_text()


note="""

<div style={{
marginTop:"20px",
padding:"12px",
background:"#f1f5f9",
borderRadius:"8px"
}}>

<h4>
Test Admin Account
</h4>

<p>
Email:
<strong>
admin@system.com
</strong>
</p>

<p>
Password:
<strong>
Admin@12345
</strong>
</p>

<p>
Role:
<strong>
ADMIN
</strong>
</p>

</div>

"""


if "Test Admin Account" not in s:

    s=s.replace(
        "</div>",
        note+"</div>",
        1
    )


p.write_text(s)

PY


npm run build


echo ""
echo "====================================="
echo " LOGIN TEST NOTE ADDED "
echo "====================================="

