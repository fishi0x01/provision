#!/bin/bash

PLUGINS_DIR=$HOME/.asdf/plugins
. $HOME/.asdf/asdf.sh

# Terraform
# https://github.com/asdf-community/asdf-hashicorp
if [ ! -d "$PLUGINS_DIR/terraform" ]; then
    asdf plugin-add terraform https://github.com/asdf-community/asdf-hashicorp.git
fi

# Python
# https://github.com/asdf-community/asdf-python
if [ ! -d "$PLUGINS_DIR/python" ]; then
    asdf plugin-add python
fi

# Golang
# https://github.com/kennyp/asdf-golang
if [ ! -d "$PLUGINS_DIR/golang" ]; then
    asdf plugin-add golang
fi

# Ruby
# https://github.com/asdf-vm/asdf-ruby
if [ ! -d "$PLUGINS_DIR/ruby" ]; then
    asdf plugin add ruby https://github.com/asdf-vm/asdf-ruby.git
fi

# NodeJS
# https://github.com/asdf-vm/asdf-nodejs
if [ ! -d "$PLUGINS_DIR/nodejs" ]; then
    asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
fi

# Flutter
# https://github.com/oae/asdf-flutter
if [ ! -d "$PLUGINS_DIR/flutter" ]; then
    asdf plugin-add flutter
fi

# Stern
# https://github.com/stern/stern
if [ ! -d "$PLUGINS_DIR/stern" ]; then
    asdf plugin-add stern
fi
