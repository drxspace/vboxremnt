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

if [[ $EUID -ne 0 ]]; then
	if [ -t 0 ]; then
		sudo "$0"
	else
		gksudo --sudo-mode --preserve-env "$0"
	fi
	exit $?
fi

test -f ${XDG_CONFIG_HOME:-~/.config}/user-dirs.dirs && source ${XDG_CONFIG_HOME:-~/.config}/user-dirs.dirs

cd "$(dirname "$0")"
{ cp -v remvbox /usr/local/bin/ && \
  cp -v remvbox.png /usr/share/icons/hicolor/48x48/apps/ && \
  desktop-file-install remvbox.desktop && \
  desktop-file-install --dir="${XDG_DESKTOP_DIR:-$HOME/Desktop}" remvbox.desktop ; } || \
{ notify-send "RemVBox Installer" "Installation's failed..." -i face-worried ; exit 2 ; }

notify-send "RemVBox Installer" "Installation's done okay!" -i face-wink
