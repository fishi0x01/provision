#!/bin/bash

ORIGIN=`pwd`
source dotfiles.list

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
if [ -z "$1" ]; then
  ## 'fishi' is the default env
  NIX_PROFILE="fishi"
else
  NIX_PROFILE="$1"
fi
nix-env -irf ./nix/${NIX_PROFILE}.nix 

### Create user bin dir
mkdir -p ${HOME}/bin

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
  ln -s ${ORIGIN}/dotfiles/${dot} ~/${dot}
done

### Install ssh-ident
ln -fs ${HOME}/.nix-profile/bin/ssh-ident ${HOME}/bin/ssh
mkdir -p ${HOME}/.ssh/identities
