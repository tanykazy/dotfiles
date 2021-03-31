#!/bin/sh

# set -ue


readonly SCRIPT_NAME=$(basename $0)
readonly SCRIPT_DIR=$(cd $(dirname $0); pwd)
readonly DOTFILESPATH=$(cd $(dirname ${SCRIPT_DIR}); pwd)

readonly MESSAGE="Update from $(uname -a) at $(date)"


helpmsg() {
  command echo "Usage: $0 [--help | -h]" 0>&2
  command echo ""
}

upload() {
	readonly BRANCHNAME=feature/$(uname -snr)
	git branch ${BRANCHNAME}
	git checkout ${BRANCHNAME}
	git add -v ${DOTFILESPATH}
	git commit -v -m "${MESSAGE}"
	git push -v origin ${BRANCHNAME}
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

