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

environments=(
  python
  go
  node
  rust
)

function print_environments {
  echo "Valid environments:"
  for environment in "${environments[@]}"; do
    echo -e "\t$environment"
  done
}

function valid_environment {
  for env in "${environments[@]}";do
    if [ $env = $1 ];then
      return 0
    fi
  done
  return 1
}

# Check valid environment
environment=$1
if ! valid_environment $environment;then
  echo "Invalid environment $environment"
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
echo "Copying $environment environment to $path"
cp -r "$environment/.devcontainer" "$path"
