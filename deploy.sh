#!/bin/bash

# Private repository ka token
TOKEN="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"

# Plugins aur lib folders ko download karne ke liye
git clone https://github.com/BilalTech05/BILAL-MD.git
cp -r private-repo/* .
rm -rf private-repo

# Node application ko start karne ke liye
npm install
pm2 start index.js --deep-monitoring --attach --name BILAL-MD
