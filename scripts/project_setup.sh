#!/bin/bash
echo ':: flutter pub get ::'
fvm flutter pub get

echo ':: Flavor setup: Project name, properties BundleId & Application id ::'
fvm flutter pub run flutter_flavorizr

echo ':: App icons setup ::'
fvm flutter pub run flutter_launcher_icons:main

echo ':: Splash screen setup ::'
fvm flutter pub run flutter_native_splash:create
