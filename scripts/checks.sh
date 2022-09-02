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