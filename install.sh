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
#set -e

cd "$(dirname "$0")"

[[ -f ${XDG_CONFIG_HOME:-~/.config}/user-dirs.dirs ]] && source ${XDG_CONFIG_HOME:-~/.config}/user-dirs.dirs
[[ ! -f "${XDG_DESKTOP_DIR:-$HOME/Desktop}"/remvbox.desktop ]] && {
  cp -v remvbox.desktop "${XDG_DESKTOP_DIR:-$HOME/Desktop}";
  chmod +x "${XDG_DESKTOP_DIR:-$HOME/Desktop}"/remvbox.desktop;
}

if [[ $EUID -ne 0 ]]; then
	if [ -t 0 ]; then
		sudo -E "$0"
	else
		gksudo --preserve-env --sudo-mode "$0"
	fi
	exit $?
fi

{
	cp -v remvbox /usr/local/bin/ &&
	tar xzvf remvbox_icons.tar.gz -C /usr/share/icons/ &&
	chown -R root:root /usr/share/icons/hicolor/ &&
	{ ls -1 /usr/share/icons/*/{.,}icon-theme.cache 2>/dev/null | sudo xargs -n1 rm -f;
	  ls -d1 /usr/share/icons/*/ | sudo xargs -n1 gtk-update-icon-cache -ft; }
	desktop-file-install remvbox.desktop;
} || {
	notify-send "VBox Remounter" "Installation's failed..." -i face-worried;
	exit 1;
}

notify-send "VBox Remounter" "Installation's done okay\!" -i face-wink

exit 0
