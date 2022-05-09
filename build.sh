#!/bin/bash
set -e

INA="device/build/Debug-iphoneos/UnityFramework.framework"
INB="simulator/build/Debug-iphonesimulator/UnityFramework.framework"
OUT="ios/UnityFramework.xcframework"

rm -rf "$OUT" ios.tgz
mkdir -p "$OUT"

xcodebuild -project "simulator/Unity-iPhone.xcodeproj" -target "UnityFramework" -configuration "Debug" -sdk "iphonesimulator"
xcodebuild -project "device/Unity-iPhone.xcodeproj" -target "UnityFramework" -configuration "Debug" -sdk "iphoneos"
xcodebuild -create-xcframework -framework "$INA" -framework "$INB" -output "$OUT"

tar -czvf ios.tgz ios
du -h ios.tgz
