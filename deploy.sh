#!/bin/bash

# Permission check aur set karna
if [ ! -x "$0" ]; then
  chmod +x "$0"
fi

# Private repository ka token
TOKEN="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"

# app.json file se variables extract karna
SESSION_ID=$(jq -r '.env.SESSION_ID' app.json)
PREFIX=$(jq -r '.env.PREFIX' app.json)
MODE=$(jq -r '.env.MODE' app.json)
OWNER_NAME=$(jq -r '.env.OWNER_NAME' app.json)
OWNER_NUMBER=$(jq -r '.env.OWNER_NUMBER' app.json)

# Plugins aur lib folders ko download karne ke liye
git clone --depth 1 https://${TOKEN}@github.com/BilalTech05/BILAL-MD.git
cp -r BILAL-MD/* .
rm -rf BILAL-MD

# Node application ko start karne ke liye
npm install
pm2 start index.js --deep-monitoring --attach --name BILAL-MD

# config.json file ko update karne ke liye
sed -i "s/\"sessionId\": \".*\"/\"sessionId\": \"$SESSION_ID\"/g" config.json
sed -i "s/\"PREFIX\": \".*\"/\"PREFIX\": \"$PREFIX\"/g" config.json
sed -i "s/\"MODE\": \".*\"/\"MODE\": \"$MODE\"/g" config.json
sed -i "s/\"OWNER_NAME\": \".*\"/\"OWNER_NAME\": \"$OWNER_NAME\"/g" config.json
sed -i "s/\"OWNER_NUMBER\": \".*\"/\"OWNER_NUMBER\": \"$OWNER_NUMBER\"/g" config.json

# Changes ko private repository mein push karne ke liye
git init
git remote add origin https://${TOKEN}@github.com/BilalTech05/BILAL-MD.git
git config --global user.email "example@example.com"
git config --global user.name "Example User"
git add .
git commit -m "Update files"
git push -f origin master
