#!/bin/bash

ORIGIN=`pwd`
source dotfile.list

### Install nix
# TODO: uncomment
curl https://nixos.org/nix/install | sh

### Setup my env packages
nix-env -f ./nix/default.nix -i fishi

### Link .dotfiles
for dot in "${DOTFILES[@]}"
do
  if [ -f "${HOME}/${dot}" ] && [ ! -L "${HOME}/${dot}" ]; then
    echo "Save previous ${HOME}/${dot} to ${HOME}/${dot}.old"
    mv ${HOME}/${dot} ${HOME}/${dot}.old
  elif [ -L "${HOME}/${dot}" ]; then
    rm "${HOME}/${dot}"
  fi
  echo "Set ${dot}"
  ln -s ${ORIGIN}/.tmux.conf ~/${dot}
done

