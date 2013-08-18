#!/bin/bash
#
# _________        ____  ____________         _______ ___________________
# ______  /__________  |/ /___  ____/________ ___    |__  ____/___  ____/
# _  __  / __  ___/__    / ______ \  ___  __ \__  /| |_  /     __  __/
# / /_/ /  _  /    _    |   ____/ /  __  /_/ /_  ___ |/ /___   _  /___
# \__,_/   /_/     /_/|_|  /_____/   _  .___/ /_/  |_|\____/   /_____/
#                                    /_/           drxspace@gmail.com
#
#

if [ $EUID -ne 0 ] ; then
	notify-send "This script needs to be run as root." -i face-angry
	exit 1
fi

cd "$(dirname "$0")"
{ cp remvbox /usr/local/bin/ && \
  cp remvbox.png /usr/share/icons/hicolor/48x48/apps/ && \
  cp remvbox.desktop /usr/share/applications && \
  cp remvbox.desktop ~/Desktop; } || exit 2

notify-send "Installer" "Installation's done Okay!" -i face-wink
exit 0
