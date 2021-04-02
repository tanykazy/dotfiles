#!/bin/sh

# set -ue


readonly SCRIPT_NAME=$(basename $0)
readonly SCRIPT_DIR=$(cd $(dirname $0); pwd)
readonly DOTFILESPATH=$(cd $(dirname ${SCRIPT_DIR}); pwd)

readonly MESSAGE="Update from $(uname -snr) at $(date)"


helpmsg() {
  command echo "Usage: $0 [--help | -h]" 0>&2
  command echo ""
}

upload() {
	readonly NODENAME=$(uname --nodename)
	readonly KERNELRELEASE=$(uname --kernel-release)
	git branch ${NODENAME}/${KERNELRELEASE}
	git checkout ${NODENAME}/${KERNELRELEASE}
	git add -v ${DOTFILESPATH}
	git commit -v -m "${MESSAGE}"
	git push -v origin ${NODENAME}/${KERNELRELEASE}
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

upload

