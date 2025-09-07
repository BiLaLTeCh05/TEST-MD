#!/bin/bash

# Private repository ka token
TOKEN="your-github-token"

# Plugins aur lib folders ko download karne ke liye
git clone https://${TOKEN}@github.com/your-username/private-repo.git temp-repo
cp -r temp-repo/plugins .
cp -r temp-repo/lib .
rm -rf temp-repo

# Node application ko start karne ke liye
node index.js
