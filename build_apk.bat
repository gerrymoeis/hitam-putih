@echo off
echo ===================================
echo Building Hitam Putih APK
echo ===================================
echo.

echo Step 1: Getting dependencies...
call flutter pub get

echo.
echo Step 2: Generating app icons...
call flutter pub run flutter_launcher_icons

echo.
echo Step 3: Building release APK...
call flutter build apk --release

echo.
echo ===================================
echo Build completed!
echo.
echo APK location: build\app\outputs\flutter-apk\app-release.apk
echo ===================================
echo.
pause
