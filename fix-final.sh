#!/bin/bash
set -e

echo "======================================"
echo " FINAL FIX"
echo "======================================"

#########################################
# Fix App.tsx
#########################################

if [ -f src/App.tsx ]; then
    sed -i '' \
    's|"\./router/AppRouter"|"./routes/AppRouter"|g' \
    src/App.tsx
fi

#########################################
# Fix Layout.tsx
#########################################

if [ -f src/components/layout/Layout.tsx ]; then
    sed -i '' \
    's/import { ReactNode } from "react";/import type { ReactNode } from "react";/' \
    src/components/layout/Layout.tsx
fi

#########################################
# Ignore backup for ESLint Flat Config
#########################################

perl -0pi -e \
"s/globalIgnores\\(\\['dist'\\]\\)/globalIgnores(['dist','backup','node_modules'])/" \
eslint.config.js

#########################################
# Build
#########################################

npm run lint || true

npm run build

git add .

git commit -m "fix: final spacex assignment" || true

git push origin feature/spacex-assignment

echo ""
echo "======================================"
echo "DONE"
echo "======================================"

