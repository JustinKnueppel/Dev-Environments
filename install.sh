#! /usr/bin/env bash

# Clone repository
git clone https://github.com/JustinKnueppel/Dev-Environments.git ~/.dev-environments

# Add symbolic link
echo "Root required to add symbolic link"
sudo ln -s "$(readlink -f ~/.dev-environments)/dev-env.sh" /usr/bin/dev-env

echo "Installation complete"