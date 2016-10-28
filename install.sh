#!/usr/bin/env bash
#
# _________        ____  ____________         _______ ___________________
# ______  /__________  |/ /___  ____/________ ___    |__  ____/___  ____/
# _  __  / __  ___/__    / ______ \  ___  __ \__  /| |_  /     __  __/
# / /_/ /  _  /    _    |   ____/ /  __  /_/ /_  ___ |/ /___   _  /___
# \__,_/   /_/     /_/|_|  /_____/   _  .___/ /_/  |_|\____/   /_____/
#                                    /_/           drxspace@gmail.com
#
#
#set -e

cd "$(dirname "$0")"

[[ -f ${XDG_CONFIG_HOME:-~/.config}/user-dirs.dirs ]] && source ${XDG_CONFIG_HOME:-~/.config}/user-dirs.dirs
[[ ! -f "${XDG_DESKTOP_DIR:-$HOME/Desktop}"/vboxremnt.desktop ]] && {
  cp -v vboxremnt.desktop "${XDG_DESKTOP_DIR:-$HOME/Desktop}";
  chmod +x "${XDG_DESKTOP_DIR:-$HOME/Desktop}"/vboxremnt.desktop;
}

if [[ $EUID -ne 0 ]]; then
	if [ -t 0 ]; then
		sudo -E "$0"
	else
		gksudo --preserve-env --sudo-mode "$0"
	fi
	exit $?
fi

{	cp -v vboxremnt /usr/local/bin/ &&
	cp -v vboxremnt.png /usr/share/pixmaps/ &&
	chown -R root:root /usr/share/icons/hicolor/ &&
	desktop-file-install vboxremnt.desktop;
} || {
	notify-send "VBox Remounter" "Installation's failed..." -i face-worried;
	exit 1;
}

notify-send "VBox Remounter" "Installation's done okay\!" -i face-wink

exit 0
