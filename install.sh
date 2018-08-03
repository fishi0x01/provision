#!/bin/bash

ORIGIN=`pwd`
source dotfile.list

### Install nix
if [ ! -d "/nix" ] || [[ $* == *--reinstall* ]]; then
  curl https://nixos.org/nix/install | sh # This will ask for sudo to set /nix
  source ${HOME}/.nix-profile/etc/profile.d/nix.sh
fi

### Set user nix-config
NIX_CONFIG="${HOME}/.config/nixpkgs/config.nix"
mkdir -p ${HOME}/.config/nixpkgs
if [ -f "${NIX_CONFIG}" ] && [ ! -L "${NIX_CONFIG}" ]; then
  echo "Save previous ${NIX_CONFIG} to ${NIX_CONFIG}.old"
  mv ${NIX_CONFIG} ${NIX_CONFIG}.old
elif [ -L "${NIX_CONFIG}" ]; then
  rm "${NIX_CONFIG}"
fi
ln -fs ${ORIGIN}/nix/user.config.nix ${NIX_CONFIG}

### Set Channels
nix-channel --add https://nixos.org/channels/nixpkgs-unstable
nix-channel --update

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
  ln -s ${ORIGIN}/${dot} ~/${dot}
done

