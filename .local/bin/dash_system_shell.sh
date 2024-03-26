#!/bin/sh
# this scripts installs dash if needed and sets it as the system shell
# RUN AS ROOT

pacman -Syu --needed dash
ln -s /bin/dash /bin/sh
