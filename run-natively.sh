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

./gradlew shim-server:bootRun #CMD
