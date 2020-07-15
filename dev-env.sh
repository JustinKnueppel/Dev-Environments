#! /usr/bin/env bash
# saner programming env: these switches turn some bugs into errors
set -o errexit -o pipefail -o noclobber -o nounset

# Get path of script
dev_dir=$(dirname $(readlink -f "${BASH_SOURCE[0]}"))

# Ensure script called with language and path
if [ $# -ne 2 ]; then
  echo "Usage: dev-env <language> <path>"
  exit 1
fi

# Map language to directory
language=$1
dir=""
case $language in
  python)
  dir="$dev_dir/python"
  ;;
  go)
  dir="$dev_dir/go"
  ;;
  node)
  dir="$dev_dir/node"
  ;;
esac

# Fail early if bad language
if [ -z "$dir" ];then
  echo "Environment does not exist"
  exit 1
fi

# Ensure path does not contain a file
path=$2
if [ -f $path ]; then
  echo "File exists at path"
  exit 1
fi

# Create path if it does not exist
if [ ! -d $path ]; then
  echo "Creating directory $path"
  mkdir -p "$path"
fi

# Copy .devcontainer directory to target directory
echo "Copying $language environment to $path"
cp -r "$dir/.devcontainer" "$path"
