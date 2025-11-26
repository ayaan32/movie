#!/bin/bash
# Build script for generating code files

echo "Running build_runner to generate code files..."
fvm flutter pub run build_runner build --delete-conflicting-outputs

echo "Build complete!"

