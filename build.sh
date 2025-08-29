#!/bin/sh

# === INSTALL FLUTTER ===
# Set the version you want to use
FLUTTER_VERSION="3.22.2" # Or your project's Flutter version
echo "Installing Flutter SDK v$FLUTTER_VERSION..."
git clone https://github.com/flutter/flutter.git --depth 1 --branch $FLUTTER_VERSION
export PATH="$PATH:`pwd`/flutter/bin"

# === VERIFY INSTALLATION ===
echo "Flutter version `flutter --version` installed."
flutter doctor

# === BUILD THE PROJECT ===
echo "Building Flutter web app..."
flutter pub get
flutter build web

echo "Build finished successfully."