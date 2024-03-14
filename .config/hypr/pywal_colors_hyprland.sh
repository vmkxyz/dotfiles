#!/bin/sh

# A scrip to make a file with pywal generated colors
# that hyprland.conf can use
#                    __
#      _  __ __ _   / /__
#     | |/ //  ' \ /  '_/
# by  |___//_/_/_//_/\_\
# @vmkxyz on gitlab and github

# Define the source file and the destination file
source_file="$HOME/.cache/wal/colors.scss"
destination_file="$(dirname "$source_file")/colors-hyprland.conf"

# Make a copy of the source file
cp "$source_file" "$destination_file"

# Delete every instance of #
sed -i 's/#//g' "$destination_file"

# Replace instances of // with #, : with space before =, and SCSS with hyprland
sed -i 's,//,#,g; s/:/ =/g; s/SCSS/hyprland/g' "$destination_file"

# Delete every instance of ;
sed -i 's/;//g' "$destination_file"
