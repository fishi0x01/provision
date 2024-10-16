#!/bin/bash

PLUGINS_DIR=$HOME/.asdf/plugins
. $HOME/.asdf/asdf.sh

# Terraform
# https://github.com/asdf-community/asdf-hashicorp
if [ ! -d "$PLUGINS_DIR/terraform" ]; then
    echo "Installing terraform plugin"
    asdf plugin-add terraform https://github.com/asdf-community/asdf-hashicorp.git
fi

# Python
# https://github.com/asdf-community/asdf-python
if [ ! -d "$PLUGINS_DIR/python" ]; then
    echo "Installing python plugin"
    asdf plugin-add python
fi

# Golang
# https://github.com/kennyp/asdf-golang
if [ ! -d "$PLUGINS_DIR/golang" ]; then
    echo "Installing golang plugin"
    asdf plugin-add golang
fi

# Ruby
# https://github.com/asdf-vm/asdf-ruby
if [ ! -d "$PLUGINS_DIR/ruby" ]; then
    echo "Installing ruby plugin"
    asdf plugin add ruby https://github.com/asdf-vm/asdf-ruby.git
fi

# NodeJS
# https://github.com/asdf-vm/asdf-nodejs
if [ ! -d "$PLUGINS_DIR/nodejs" ]; then
    echo "Installing nodejs plugin"
    asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
fi

# Flutter
# https://github.com/oae/asdf-flutter
if [ ! -d "$PLUGINS_DIR/flutter" ]; then
    echo "Installing flutter plugin"
    asdf plugin-add flutter
fi

# Stern
# https://github.com/stern/stern
if [ ! -d "$PLUGINS_DIR/stern" ]; then
    echo "Installing stern plugin"
    asdf plugin-add stern
fi

# awscli
# https://github.com/MetricMike/asdf-awscli
if [ ! -d "$PLUGINS_DIR/awscli" ]; then
    asdf plugin add awscli
fi

# vault
# https://github.com/asdf-community/asdf-hashicorp
if [ ! -d "$PLUGINS_DIR/vault" ]; then
    echo "Installing vault plugin"
    asdf plugin-add vault https://github.com/asdf-community/asdf-hashicorp.git
fi

# packer
# https://github.com/asdf-community/asdf-hashicorp
if [ ! -d "$PLUGINS_DIR/packer" ]; then
    echo "Installing packer plugin"
    asdf plugin-add packer https://github.com/asdf-community/asdf-hashicorp.git
fi

# vagrant
# https://github.com/asdf-community/asdf-hashicorp
if [ ! -d "$PLUGINS_DIR/vagrant" ]; then
    echo "Installing vagrant plugin"
    asdf plugin-add vagrant https://github.com/asdf-community/asdf-hashicorp.git
fi

# tekton-cli
# https://github.com/johnhamelink/asdf-tekton-cli
if [ ! -d "$PLUGINS_DIR/tekton-cli" ]; then
    echo "Installing tekton-cli plugin"
    asdf plugin-add tekton-cli https://github.com/johnhamelink/asdf-tekton-cli
fi

# kustomize
# https://github.com/Banno/asdf-kustomize
if [ ! -d "$PLUGINS_DIR/kustomize" ]; then
    echo "Installing kustomize plugin"
    asdf plugin-add kustomize https://github.com/Banno/asdf-kustomize.git
fi

# just
# https://github.com/ggilmore/asdf-just
if [ ! -d "$PLUGINS_DIR/just" ]; then
    echo "Installing just plugin"
    asdf plugin-add just
fi

# kubectl
# https://github.com/asdf-community/asdf-kubectl.git
if [ ! -d "$PLUGINS_DIR/kubectl" ]; then
    echo "Installing kubectl plugin"
    asdf plugin-add kubectl https://github.com/asdf-community/asdf-kubectl.git
fi

# grpcurl
# https://github.com/asdf-community/asdf-grpcurl.git
if [ ! -d "$PLUGINS_DIR/grpcurl" ]; then
    echo "Installing grpcurl plugin"
    asdf plugin-add grpcurl https://github.com/asdf-community/asdf-grpcurl.git
fi

# poetry
# https://github.com/asdf-community/asdf-poetry.git
if [ ! -d "$PLUGINS_DIR/poetry" ]; then
    echo "Installing poetry plugin"
    asdf plugin-add poetry https://github.com/asdf-community/asdf-poetry.git
fi

# shellchec
if [ ! -d "$PLUGINS_DIR/shellcheck" ]; then
    echo "Installing shellcheck plugin"
    asdf plugin-add shellcheck
fi

# shfmt
if [ ! -d "$PLUGINS_DIR/shfmt" ]; then
    echo "Installing shfmt plugin"
    asdf plugin-add shfmt
fi

