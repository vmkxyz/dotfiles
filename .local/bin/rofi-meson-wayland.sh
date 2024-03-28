#!/bin/sh
# This script installs the meson build of rofi (not a fork, just a differend build)
# should work without uninstalling old rofi
# Warning: there is a rm -rf command in this script

git clone https://github.com/lbonn/rofi.git || printf 'error: git clone failed'
cd rofi || printf 'error: cd failed'
meson setup build
ninja -C build
sudo ninja -C build install
cd ..

# cleanup
rm -rf rofi # scary!
