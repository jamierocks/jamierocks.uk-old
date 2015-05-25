#!/usr/bin/env bash

DOCS_REPO=${DOCS_REPO:-"git@github.com:jamierocks/jamierocks.github.io.git"}
LEX_DEPLOY=https://github.com/LexBot/Deploy.git
DEPLOY_SCRIPTS=/tmp/histacom/deploy

# Get the deploy scripts
git clone $LEX_DEPLOY $DEPLOY_SCRIPTS

# Initialize the ssh-agent so we can use Git later for deploying
eval $(ssh-agent)

# Set up our Git environment
$DEPLOY_SCRIPTS/setup_git

# Fetch last build
git clone $DOCS_REPO lastbuild
git fetch
git checkout master
cp -R ./lastbuild/. public/

# Build the docs
hexo generate

# Copy static files
cp -R ./etc/static/. public/

# Clone repo
cd public
git init
git remote add origin $DOCS_REPO
git checkout master

# If we're on the master branch, do deploy
if [[ $TRAVIS_BRANCH = source ]]; then
    # Deploy
    git add --all .
    git commit -q -m "Deploy $(date)"
    git push -q -f origin master
    echo "Done! Successfully published docs!"
fi

# Kill the ssh-agent because we're done with deploying
eval $(ssh-agent -k)

exit 0
