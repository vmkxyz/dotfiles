#!/usr/bin/env sh
# This script installs the meson build of rofi (not a fork, just a differend build)
# should work without uninstalling old rofi

git clone https://github.com/lbonn/rofi.git
cd rofi
meson setup build
ninja -C build
sudo ninja -C build install
cd ..

# cleanup
rm -rf rofi
