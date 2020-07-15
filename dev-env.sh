#! /usr/bin/env bash
# saner programming env: these switches turn some bugs into errors
set -o errexit -o pipefail -o noclobber -o nounset
DEVELOPMENT_ENVIRONMENT=$(pwd)

if [ $# -ne 1 ]; then
  echo "Usage: dev-env <language>"
  exit 1
fi

language=$1
dir=""
case $language in
  python)
  dir="$DEVELOPMENT_ENVIRONMENT/python"
  ;;
  go)
  dir="$DEVELOPMENT_ENVIRONMENT/go"
  ;;
  node)
  dir="$DEVELOPMENT_ENVIRONMENT/node"
  ;;
esac

echo $dir