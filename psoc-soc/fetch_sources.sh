#!/bin/bash

echo "Removing old src folder"
rm -rf src

REVISION=$(cat REVISION)
echo "Checking out sources for revision $REVISION"

git clone https://github.com/kit-kch/psoc-soc.git src
pushd src
git checkout $REVISION
git submodule init
git submodule update
popd

echo "Removing .git folders"
find . -type d -name ".git" -exec rm -rf {} +