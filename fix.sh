#!/bin/sh 

# useful if public folder get damaged
rm -f /Users/nickg/client9-github/client9-website-2015/.git/index.lock
rm -rf public
git submodule add git@github.com:client9/client9.github.io.git public
hugo
cd public
git pull
