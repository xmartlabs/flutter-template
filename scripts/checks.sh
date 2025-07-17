#!/bin/bash
error () {
  echo -e "\033[0;31m$1"
  exit 1
}

echo ':: Sorting translation files ::'
if ! command -v dart >/dev/null 2>&1 || ! dart pub global list | grep -q arb_utils; then
  echo "arb_utils is missing. Installing..."
  dart pub global activate arb_utils 0.8.3
fi
arb_utils sort lib/l10n/intl_en.arb

echo ':: Check code format ::'
# https://github.com/dart-lang/dart_style/issues/864#issuecomment-1092199174
fvm dart format --set-exit-if-changed lib || error "Linter error: Invalid format"

echo ':: Run linter ::'
fvm flutter analyze . || error "Linter error - Flutter Analyze error"

result=$(fvm dart run dart_code_linter:metrics analyze lib  --fatal-style --fatal-performance --fatal-warnings)
echo "$result"
[[ $result == *'✔ no issues found!'* ]] || error "Linter error - Dart Code Metrics linter error"

fvm dart run dart_code_linter:metrics check-unused-code lib --fatal-unused || error "Linter error - Dart Code Metrics unused code error"

echo ':: Run Design System checks'

echo ':: Run linter design system ::'
fvm flutter analyze design_system || error "Linter error - Flutter Analyze error - Design System gallery"
fvm flutter analyze design_system/design_system_gallery || error "Linter error - Flutter Analyze error - Design System gallery"
