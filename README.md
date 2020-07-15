# Development Environments

The purpose of this repository is to hold `.devcontainer` directories for various programming environments. These are to be used to with the Visual Studio Code Remote Containers extension that allows development to be done from within Docker containers. The extension `ms-vscode-remote.remote-containers` must be installed in the user's installation of Visual Studio Code.

## Installation

```bash
curl -L https://raw.githubusercontent.com/JustinKnueppel/Dev-Environments/master/install.sh | bash
```

## Usage

`dev-env <environment> <directory>`

Currently supported environments:

* Python - python
* Node.js - node
* Golang - go
