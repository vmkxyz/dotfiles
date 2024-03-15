#!/bin/sh
# this script allows ports in ufw that KDE connect requires

ufw allow 1714:1764/udp
ufw allow 1714:1764/tcp
ufw reload
