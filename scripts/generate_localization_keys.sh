#!/bin/bash

echo ':: Generate localization keys ::'
fvm flutter pub run easy_localization:generate -S assets/translations -O lib/gen -f keys -o locale_keys.g.dart
