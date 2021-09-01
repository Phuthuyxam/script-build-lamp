#!/bin/bash

# clone code
# cd src/src_source

# git clean -xdf
# git reset --hard
# git checkout develop
# git pull


# cd ../src_deploy
# git clean -xdf
# git reset --hard
# git checkout deploy
# git pull

chmod +x db.sh
chmod +x php.sh
chmod +x apache.sh

db.sh
php.sh
apache.sh