#!/bin/bash
set -e

/code/ansible/install/fedora40.sh
make -C /code install-dotfiles
make -C /code/ansible test-fedora
/code/scripts/install/install-nix.sh
source ${HOME}/.nix-profile/etc/profile.d/nix.sh
make -C /code delete-dotfiles

