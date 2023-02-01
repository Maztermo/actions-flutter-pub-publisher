#!/bin/sh -l

cd /docker-action
echo "creating docker image with Flutter version: $INPUT_FLUTTER_VERSION"

# here we can make the construction of the image as customizable as we need
# and if we need parameterizable values it is a matter of sending them as inputs
docker build -t docker-action --build-arg flutter_version=$INPUT_FLUTTER_VERSION --build-arg INPUT_CREDENTIAL=$INPUT_CREDENTIAL --build-arg INPUT_PACKAGE_DIRECTORY=$INPUT_PACKAGE_DIRECTORY --build-arg INPUT_SKIP_TEST=$INPUT_SKIP_TEST --build-arg INPUT_FLUTTER_PACKAGE=$INPUT_FLUTTER_PACKAG --build-arg EXECUTABLE_PREFIX=$EXECUTABLE_PREFIX --build-arg INPUT_DRY_RUN=$INPUT_DRY_RUN . && docker run docker-action
