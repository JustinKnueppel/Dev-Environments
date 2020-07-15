FROM golang

RUN go get github.com/mdempsky/gocode \ 
  github.com/uudashr/gopkgs/v2/cmd/gopkgs \ 
  github.com/ramya-rao-a/go-outline \ 
  github.com/stamblerre/gocode \ 
  github.com/rogpeppe/godef \ 
  github.com/sqs/goreturns \ 
  golang.org/x/lint/golint \
  golang.org/x/tools/cmd/gorename

ARG USERNAME=vscode
ARG USER_UID=1000
ARG USER_GID=$USER_UID

# Create the user
RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
    && usermod --shell /bin/bash $USERNAME

USER $USERNAME