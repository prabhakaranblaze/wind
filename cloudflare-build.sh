#!/bin/bash

# Cloudflare Pages build script for Flutter Web
set -e  # Exit on error

echo "=== Installing Flutter ==="

# Clone Flutter repository
if [ ! -d "flutter" ]; then
  git clone https://github.com/flutter/flutter.git -b stable --depth 1
else
  echo "Flutter already exists, skipping clone..."
fi

# Add Flutter to PATH
export PATH="$PATH:`pwd`/flutter/bin"

# Verify Flutter installation
flutter --version

# Enable Flutter web
echo "=== Configuring Flutter for web ==="
flutter config --enable-web --no-analytics

# Get dependencies
echo "=== Installing dependencies ==="
flutter pub get

# Build web app
echo "=== Building Flutter web app ==="
flutter build web \
  --release \
  --web-renderer html \
  --base-href /

echo "=== Build complete! ==="
echo "Output directory: build/web/"
ls -la build/web/
