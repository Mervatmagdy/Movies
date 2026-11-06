
#!/usr/bin/env bash
set -euo pipefail

# Install Flutter
git clone --depth 1 -b stable \
  https://github.com/flutter/flutter.git \
  /tmp/flutter-sdk

export PATH="/tmp/flutter-sdk/bin:$PATH"

# Enable web support
flutter config --enable-web

# Generate missing Flutter Web configuration
flutter create . --platforms web

# Install dependencies
flutter pub get

# Build Flutter Web
flutter build web --release

# Verify output
test -f build/web/index.html

echo "Flutter Web build successful!"
