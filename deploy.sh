#!/bin/bash
# http://gohugo.io/tutorials/github_pages_blog/

set -e


echo -e "Deploying updates to GitHub..."

# Build the project.
hugo

# Go To Public folder
cd public
# Add changes to git.
git add -A

# Commit changes.
msg="rebuilding site `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"

# Push source and build repos.
git push origin master

# Come Back
cd ..

