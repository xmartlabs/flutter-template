#!/bin/bash

echo ':: Get dependencies ::'
fastlane fetch_dependencies

echo ':: Lints ::'
fastlane lints || { echo -e "${RED}Lint errors" ; exit 1; }
echo ':: Run tests ::'
fastlane tests || { echo -e "${RED}Test error" ; exit 1; }

echo ':: Build flutter android ::'
# shellcheck disable=SC2164
cd android
fastlane android build_dev_debug_apk || { echo -e "${RED}Build error" ; exit 1; }
# shellcheck disable=SC2103
cd ..
