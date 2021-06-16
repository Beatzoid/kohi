#!/bin/bash
# Build script for rebuilding everything
set echo on

source /home/beatzoid/vulkan/1.2.176.1/setup-env.sh
echo "Building everything..."


pushd engine
source scripts/build.sh
popd

ERRORLEVEL=$?
if [ $ERRORLEVEL -ne 0 ]
then
echo "Error:"$ERRORLEVEL && exit
fi

pushd testbed
source scripts/build.sh
popd
ERRORLEVEL=$?
if [ $ERRORLEVEL -ne 0 ]
then
echo "Error:"$ERRORLEVEL && exit
fi

echo "All assemblies built successfully."