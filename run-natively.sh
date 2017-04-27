#!/bin/bash

BASEDIR=`pwd`

isNpmPackageInstalled() {
  npm list --depth 1 -g $1 > /dev/null 2>&1
}

# check dependencies
if ! hash "npm" 2>/dev/null;
then
    echo "npm can't be found"
    exit 1
fi

if ! isNpmPackageInstalled grunt-cli
then
    echo Installing Grunt, you may be asked for your password to run sudo...
    sudo npm install -g grunt-cli #CMD
else
    echo Grunt is already installed, skipping...
fi

if ! isNpmPackageInstalled bower
then
    echo Installing Bower, you may be asked for your password to run sudo...
    sudo npm install -g bower #CMD
else
    echo Bower is already installed, skipping...
fi

echo Installing npm dependencies...
npm install #CMD

echo Installing Bower dependencies...
bower install #CMD

echo Building the console...
grunt build #CMD

./gradlew shim-server:bootRun #CMD
