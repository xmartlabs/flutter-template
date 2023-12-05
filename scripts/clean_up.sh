#!/bin/bash
echo ':: flutter clean ::'
fvm flutter clean

echo ':: flutter pub get ::'
fvm flutter pub get

echo ':: flutter pub run build_runner build --delete-conflicting-outputs ::'
fvm flutter pub run build_runner build --delete-conflicting-outputs

echo ':: flutter pub run build_runner build --delete-conflicting-outputs in models::'
cd packages/models
fvm flutter pub run build_runner build --delete-conflicting-outputs
echo ':: flutter pub run build_runner build --delete-conflicting-outputs in services::'
cd ../services
fvm flutter pub run build_runner build --delete-conflicting-outputs

echo ':: flutter pub run build_runner build --delete-conflicting-outputs in services::'
cd ../repositories
fvm flutter pub run build_runner build --delete-conflicting-outputs
