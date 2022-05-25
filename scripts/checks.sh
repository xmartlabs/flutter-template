#!/bin/bash
RED='\033[0;31m'

echo ':: Get dependencies ::'
fvm flutter pub get

echo ':: Check code format ::'
fvm flutter format --set-exit-if-changed . || { echo -e "${RED}Invalid format" ; exit 1; }

echo ':: Run linter ::'
fvm flutter analyze . || { echo -e "${RED}Linter error" ; exit 1; }

echo ':: Run tests ::'
fvm flutter test || { echo -e "${RED}Test error" ; exit 1; }

echo ':: Build flutter android ::'
fvm flutter build apk --flavor development || { echo -e "${RED}Android building error" ; exit 1; }
