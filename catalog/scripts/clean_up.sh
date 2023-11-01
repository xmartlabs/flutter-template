#!/bin/bash
echo ':: flutter clean ::'
fvm flutter clean

echo ':: flutter pub get ::'
fvm flutter pub get

echo ':: flutter pub run build_runner build --delete-conflicting-outputs ::'
fvm flutter pub run build_runner build --delete-conflicting-outputs
