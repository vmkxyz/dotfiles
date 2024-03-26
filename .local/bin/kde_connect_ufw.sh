#!/bin/sh
# this script allows ports in ufw that KDE connect requires
# RUN AS ROOT

ufw allow 1714:1764/udp
ufw allow 1714:1764/tcp
ufw reload
