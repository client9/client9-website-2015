#!/bin/sh
set -ex
# http://gohugo.io/tutorials/github_pages_blog/

GITHUBIO="/go/src/github.com/client9/client9.github.io"
echo $GITHUBIO

# Commit changes.
msg="rebuilding site `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi

hugo --destination=/go/src/github.com/client9/client9.github.io

echo -e "Deploying updates to GitHub: $msg"


(cd ${GITHUBIO}; git commit -am "$msg"; git push)


