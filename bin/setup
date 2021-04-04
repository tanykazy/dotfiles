#!/bin/sh

# set -ue


#readonly SCRIPT_NAME=$(basename $0)
#readonly SCRIPT_DIR=$(cd $(dirname $0); pwd)
#readonly DOTFILESPATH=$(cd $(dirname ${SCRIPT_DIR}); pwd)

#readonly MESSAGE="update from $(uname -a) at $(date)"

readonly PACKAGES="screen git vim dwm fluxbox"


helpmsg() {
  command echo "Usage: $0 [--help | -h]" 0>&2
  command echo ""
}

setup() {
	sudo apt install ${PACKAGES}
}

while [ $# -gt 0 ];do
  case ${1} in
    --debug|-d)
      set -uex
      ;;
    --help|-h)
      helpmsg
      exit 1
      ;;
    *)
      ;;
  esac
  shift
done

setup
