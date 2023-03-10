#!/bin/bash

CURR_VERSION=firebridge-v`awk '/^version: /{print $2}' packages/firebridge/pubspec.yaml`

# iOS & macOS
APPLE_HEADER="release_tag_name = '$CURR_VERSION' # generated; do not edit"
sed -i.bak "1 s/.*/$APPLE_HEADER/" packages/flutter_firebridge/ios/flutter_firebridge.podspec
sed -i.bak "1 s/.*/$APPLE_HEADER/" packages/flutter_firebridge/macos/flutter_firebridge.podspec
rm packages/flutter_firebridge/macos/*.bak packages/flutter_firebridge/ios/*.bak

# CMake platforms (Linux, Windows, and Android)
CMAKE_HEADER="set(LibraryVersion \"$CURR_VERSION\") # generated; do not edit"
for CMAKE_PLATFORM in android linux windows
do
    sed -i.bak "1 s/.*/$CMAKE_HEADER/" packages/flutter_firebridge/$CMAKE_PLATFORM/CMakeLists.txt
    rm packages/flutter_firebridge/$CMAKE_PLATFORM/*.bak
done

git add packages/flutter_firebridge/
