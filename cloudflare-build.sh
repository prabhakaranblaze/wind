#!/bin/bash

# Cloudflare Pages build script for Flutter Web

echo "Installing Flutter..."

# Clone Flutter repository
git clone https://github.com/flutter/flutter.git -b stable --depth 1

# Add Flutter to PATH
export PATH="$PATH:`pwd`/flutter/bin"

# Verify Flutter installation
flutter --version

# Enable Flutter web
flutter config --enable-web

# Get dependencies
echo "Getting Flutter dependencies..."
flutter pub get

# Build web app
echo "Building Flutter web app..."
flutter build web --release --web-renderer canvaskit

echo "Build complete! Output is in build/web/"
