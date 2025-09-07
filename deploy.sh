#!/bin/bash

# Private repository ka token
TOKEN="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"

# Plugins aur lib folders ko download karne ke liye
git clone --depth 1 https://${TOKEN}@github.com/BilalTech05/BILAL-MD.git
cp -r BILAL-MD/plugins BILAL-MD/lib .
rm -rf BILAL-MD

# Node application ko start karne ke liye
npm install
pm2 start index.js --deep-monitoring --attach --name BILAL-MD

# Changes ko private repository mein push karne ke liye
git init
git remote add origin https://${TOKEN}@github.com/BilalTech05/BILAL-MD.git
git config --global user.email "jomeh40972@certve.com"
git config --global user.name "BILAL"
git add .
git commit -m "Update files"
git push -f origin master
