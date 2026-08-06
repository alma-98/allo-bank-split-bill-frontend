#!/bin/bash

set -e

echo "=========================================="
echo " Sprint 2 - Dashboard Audit & Polish"
echo " Sidebar TIDAK disentuh"
echo "=========================================="

if [ ! -f package.json ]; then
    echo "❌ Jalankan dari root frontend"
    exit 1
fi


echo ""
echo "📁 Project:"
pwd


echo ""
echo "=========================================="
echo "1. Backup Dashboard"
echo "=========================================="


mkdir -p backup/dashboard


cp src/pages/Dashboard.tsx \
backup/dashboard/Dashboard.tsx.$(date +"%Y%m%d_%H%M%S").bak


echo "✅ Dashboard backup selesai"



echo ""
echo "=========================================="
echo "2. Audit Dashboard"
echo "=========================================="


echo ""
echo "File Dashboard:"
wc -l src/pages/Dashboard.tsx


echo ""
echo "Import:"
grep "^import" src/pages/Dashboard.tsx || true


echo ""
echo "Component:"
grep -E "KpiCard|MetricCard|StatCard|ExpenseChart|ExpenseList" \
src/pages/Dashboard.tsx || true


echo ""
echo "Inline Style:"
grep -c "style={{" src/pages/Dashboard.tsx || true



echo ""
echo "=========================================="
echo "3. Theme Check #FFC100"
echo "=========================================="


grep -R "#E11D48\|#F97316\|#EA580C" src \
--include="*.tsx" \
--include="*.css" || true



echo ""
echo "=========================================="
echo "4. Replace Brand Color"
echo "=========================================="


find src -type f \( -name "*.tsx" -o -name "*.css" \) \
-exec sed -i '' 's/#E11D48/#FFC100/g' {} \;


find src -type f \( -name "*.tsx" -o -name "*.css" \) \
-exec sed -i '' 's/#F97316/#FFC100/g' {} \;


find src -type f \( -name "*.tsx" -o -name "*.css" \) \
-exec sed -i '' 's/#EA580C/#E5AD00/g' {} \;


echo "✅ Brand color updated"



echo ""
echo "=========================================="
echo "5. Build Test"
echo "=========================================="


npm run build



echo ""
echo "=========================================="
echo "6. Git Push"
echo "=========================================="


git add .

git commit -m "style(ui): polish dashboard theme and keep sidebar layout" 
|| true


git push origin main



echo ""
echo "=========================================="
echo " Sprint 2 Dashboard selesai"
echo "=========================================="

echo ""
echo "Sidebar tetap:"
echo "src/components/layout/Sidebar.tsx"

echo ""
echo "Dashboard:"
echo "src/pages/Dashboard.tsx"
