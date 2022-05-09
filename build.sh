#!/bin/bash
set -e

INA="device/build/Debug-iphoneos/UnityFramework.framework"
INB="simulator/build/Debug-iphonesimulator/UnityFramework.framework"
OUT="build/UnityFramework.framework"

xcodebuild -project "simulator/Unity-iPhone.xcodeproj" -target "UnityFramework" -configuration "Debug" -sdk "iphonesimulator"
xcodebuild -project "device/Unity-iPhone.xcodeproj" -target "UnityFramework" -configuration "Debug" -sdk "iphoneos"

rm -rf "$OUT"
mkdir -p "$OUT"
cp -R "$INB"/* "$OUT"
lipo -create "$INA/UnityFramework" "$INB/UnityFramework" -output "$OUT/UnityFramework"
