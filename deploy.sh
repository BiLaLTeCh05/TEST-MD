#!/bin/bash

# Private repository ka URL aur token
REPO_URL="https:                                            
TOKEN="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"

# Plugins aur lib folders ko download karne ke liye
git clone https://github.com/BilalTech05/BILAL-MD.git temp-repo
cp -r temp-repo/plugins .
cp -r temp-repo/lib .
rm -rf temp-repo
