#!/bin/bash

fastlane fetch_dependencies
cd android && fastlane fetch_dependencies && cd -
cd ios && fastlane fetch_dependencies && cd -
