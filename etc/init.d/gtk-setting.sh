#!/bin/sh

#readonly SCRIPT_DIR=$(cd $(dirname $0); pwd)

readonly USER_HOME=/home/${SUDO_USER}
readonly CONFIG=.config
readonly USER_GTK2_GTKRC=.gtkrc-2.0
readonly GLOBAL_GTK2_GTKRC=gtk-2.0/gtkrc
readonly GTK3_SETTINGS=gtk-3.0/settings.ini


case "$1" in
	install)
		ln -snv ${USER_HOME}/${USER_GTK2_GTKRC} /etc/${GLOBAL_GTK2_GTKRC}
		ln -snv ${USER_HOME}/${CONFIG}/${GTK3_SETTINGS} /etc/${GTK3_SETTINGS}
		;;
	uninstall)
		rm -fv /etc/${GLOBAL_GTK2_GTKRC}
		rm -fv /etc/${GTK3_SETTINGS}
		;;
	*)
		echo "Usage: $0 {install|uninstall}"
		;;
esac

