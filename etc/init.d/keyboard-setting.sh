#!/bin/sh

readonly SCRIPT_DIR=$(cd $(dirname $0); pwd)
readonly X11_XORG_CONF_D=X11/xorg.conf.d
readonly TARGET=/etc/${X11_XORG_CONF_D}

case "$1" in
		install)
				if [ ! -d "${TARGET}" ]; then
						mkdir ${TARGET}
				fi
				for var in `ls -1 ${SCRIPT_DIR}/../${X11_XORG_CONF_D}/*`
				do
						ln -snv $(realpath ${var}) ${TARGET}
				done
		;;
		uninstall)
				for var in `ls -1 ${SCRIPT_DIR}/../${X11_XORG_CONF_D}`
				do
						rm -fv ${TARGET}/${var}
				done
		;;
		*)
				echo "Usage: $0 {install|uninstall}"
		;;
esac

