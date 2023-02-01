#!/bin/sh -l

set -e

cd /docker-action
echo "creating docker image with Flutter version: $INPUT_FLUTTER_VERSION"

# here we can make the construction of the image as customizable as we need
# and if we need parameterizable values it is a matter of sending them as inputs
docker build -t docker-action --build-arg flutter_version=$INPUT_FLUTTER_VERSION . && docker run docker-action -e INPUT_CREDENTIAL=$INPUT_CREDENTIAL -e INPUT_PACKAGE_DIRECTORY=$INPUT_PACKAGE_DIRECTORY -e INPUT_FLUTTER_PACKAGE=$INPUT_FLUTTER_PACKAGE -e INPUT_SKIP_TEST=$INPUT_SKIP_TEST -e INPUT_DRY_RUN=$INPUT_DRY_RUN
