#!/bin/bash

### Remove nix
rm -rf ~/.nix-profile
rm -rf ~/.config/nixpkgs
sudo rm -rf /nix/ # oh my o.O

### Set original dotfiles
source dotfiles.list

for dot in "${DOTFILES[@]}"
do
  if [ -L "${HOME}/${dot}" ]; then
    echo "Remove link for ${dot}"
    rm ${HOME}/${dot}
    if [ -f "${HOME}/${dot}.old" ]; then
      echo "Set old ${dot}"
      mv ${HOME}/${dot}.old ${HOME}/${dot}
    fi
  fi
done
