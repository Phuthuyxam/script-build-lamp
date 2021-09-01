#!/bin/bash

# clone code
cd src/src_source

git clean -xdf
git reset --hard
git checkout develop
git pull

cd ..
cd src_deploy
git clean -xdf
git reset --hard
git checkout deploy
git pull



db.sh

php.sh

apache.sh