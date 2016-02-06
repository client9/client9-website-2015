#!/bin/bash
# http://gohugo.io/tutorials/github_pages_blog/

GITHUBIO="/Users/nickg/client9-github/client9.github.io/"
echo $GITHUBIO

find . -name '*~' | xargs rm -f

# Commit changes.
msg="rebuilding site `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi

echo -e "Deploying updates to GitHub: $msg"

hugo

(cd public; cp -r * ${GITHUBIO})

(cd ${GITHUBIO}; git commit -am "$msg"; git push)


