#!/bin/bash
# Build script for rebuilding everything
set echo on
echo $CI

if [ -z $CI ]; then
    echo "CI = false"
    source /home/beatzoid/vulkan/1.2.176.1/setup-env.sh
fi

echo "Building everything..."

if [ -z $CI ]; then
    cd engine
else
    cd ../engine
fi
source scripts/build.sh
cd ../

ERRORLEVEL=$?
if [ $ERRORLEVEL -ne 0 ]
then
echo "Error:"$ERRORLEVEL && exit
fi

cd testbed
source scripts/build.sh
cd ../

ERRORLEVEL=$?
if [ $ERRORLEVEL -ne 0 ]
then
echo "Error:"$ERRORLEVEL && exit
fi

echo "All assemblies built successfully."