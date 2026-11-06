
#!/usr/bin/env bash
set -euo pipefail

git clone --depth 1 -b stable \
  https://github.com/flutter/flutter.git \
  /tmp/flutter-sdk

export PATH="/tmp/flutter-sdk/bin:$PATH"

flutter config --enable-web
flutter pub get
flutter build web --release

test -f build/web/index.html
echo "Flutter Web build successful"
