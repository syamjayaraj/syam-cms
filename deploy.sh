#!/bin/bash
set -e
export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
cd "/root/syam-cms"
echo "[deploy] Pulling latest changes from main..."
git fetch origin main
git reset --hard origin/main
echo "[deploy] Installing dependencies if needed..."
npm install --production=false --legacy-peer-deps
echo "[deploy] Building Strapi application..."
npm run build
echo "[deploy] Reloading PM2 process..."
pm2 reload "syam-cms" --update-env || pm2 restart "syam-cms" --update-env --force || pm2 restart "syam-cms" --update-env || pm2 restart "syam-cms" --update-env --force || pm2 restart "syam-cms" --update-env || pm2 restart "syam-cms" --update-env --force || pm2 restart "syam-cms" --update-env || pm2 restart "syam-cms" --update-env
echo "[deploy] syam-cms deployed successfully."
