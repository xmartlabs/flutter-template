#!/bin/bash
echo ':: flutter clean ::'
fvm flutter clean

echo ':: flutter pub get ::'
fvm flutter pub get

echo ':: flutter pub run build_runner build --delete-conflicting-outputs ::'
fvm dart run build_runner build --delete-conflicting-outputs

echo ':: flutter pub run easy_localization:generate -f keys -o locale_keys.g.dart ::'
fvm flutter pub run easy_localization:generate -S assets/translations -O lib/gen -f keys -o locale_keys.g.dart
