#!/bin/sh

set -e

check_credentials() {
  echo "Check credentials"
  if [ -z "$1" ]; then
    echo "Missing credential"
    exit 1
  fi
  echo "OK"
}

copy_credential() {
  echo "Copy credentials"
  mkdir -p ~/Library/Application\ Support/dart
  cat <<EOF > ~/Library/Application\ Support/dart/pub-credentials.json
$1
EOF
  mkdir -p ~/.pub-cache
  ln -s ~/Library/Application\ Support/dart/pub-credentials.json credentials.json
  echo "OK"
}

switch_working_directory() {
  echo "Switching to package directory"
  cd "$2"
}

test_dart() {
  echo "Run test for dart"
  dart pub get
  dart run test
}

test_flutter() {
  echo "Run test for flutter"
  flutter pub get
  flutter test
}

run_test_if_needed() {
  if "${3}"; then
    echo 'Skip test'
  else
    if "${4}"; then
      test_flutter
    else
      test_dart
    fi
  fi
}

create_prefix() {
  EXECUTABLE_PREFIX="dart"
  if "${4}"; then
    EXECUTABLE_PREFIX="flutter"
  fi
}

dry_run() {
  echo "Executing package validation"
  $5 pub publish --dry-run
}

publish_package() {
  dry_run
  if [ "${6}" = false ]; then
    echo "Publish package to Pub"
    $5 pub publish -f
  fi
}

check_credentials
copy_credential
switch_working_directory
run_test_if_needed
create_prefix
publish_package
