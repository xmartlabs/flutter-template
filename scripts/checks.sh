#!/bin/bash
RED='\033[0;31m'

echo ':: Sorting translation files ::'

fvm flutter pub run arb_utils:sort lib/l10n/intl_en.arb; 

echo ':: Check code format ::'
fvm flutter format --set-exit-if-changed . || { 
  echo -e "${RED}Invalid format" ; exit 1; 
}

echo ':: Run linter ::'
fvm flutter analyze . || { echo -e "${RED}Linter error" ; exit 1; }

result=$(fvm flutter pub run dart_code_metrics:metrics analyze lib  --fatal-style --fatal-performance --fatal-warnings)
echo "$result"
[[ $result == '✔ no issues found!' ]] || { echo -e "${RED}Linter error" ; exit 1; }

fvm flutter pub run dart_code_metrics:metrics check-unused-code lib --fatal-unused || { echo -e "${RED}Linter error" ; exit 1; }

fvm flutter pub run dart_code_metrics:metrics check-unused-files lib --fatal-unused || { echo -e "${RED}Linter error" ; exit 1; }
