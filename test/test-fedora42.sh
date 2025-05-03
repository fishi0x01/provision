#!/bin/bash
set -e

/code/ansible/install/fedora42.sh
make -C /code install-dotfiles
make -C /code/ansible test-fedora
source ${HOME}/.nix-profile/etc/profile.d/nix.sh
make -C /code delete-dotfiles

