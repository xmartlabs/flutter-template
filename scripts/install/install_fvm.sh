#!/bin/bash
dart pub global activate fvm --verbose
# shellcheck disable=SC2140
export PATH="$PATH":"$HOME/.pub-cache/bin"
# shellcheck disable=SC2046
ln -s $(which fvm) /usr/local/bin/fvm
fvm install
fvm doctor
