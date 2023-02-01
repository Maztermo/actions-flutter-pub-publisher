#!/bin/sh -l

cd /docker-action
echo "creating docker image with Flutter version: $INPUT_FLUTTER_VERSION"

inp
# here we can make the construction of the image as customizable as we need
# and if we need parameterizable values it is a matter of sending them as inputs
docker build -t docker-action --build-arg flutter_version=$INPUT_FLUTTER_VERSION INPUT_CREDENTIAL=$INPUT_CREDENTIAL INPUT_PACKAGE_DIRECTORY=$INPUT_PACKAGE_DIRECTORY INPUT_SKIP_TEST=$INPUT_SKIP_TEST INPUT_FLUTTER_PACKAGE=$INPUT_FLUTTER_PACKAGE EXECUTABLE_PREFIX=$EXECUTABLE_PREFIX INPUT_DRY_RUN=$INPUT_DRY_RUN . && docker run docker-action
