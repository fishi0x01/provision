#!/bin/bash
## This script could be used like 'curl https://raw.githubusercontent.com/fishi0x01/provision/master/fetch-and-install.sh | sh'
## For security reasons it is prefered though to copy/paste and check locally before executing it

{ # Prevent execution if this script was only partially downloaded
  # TODO: asc
  mkdir -p ./provision;
  curl -sL https://github.com/fishi0x01/provision/tarball/master | tar xz -C /tmp/provision --strip-components=1;
  /tmp/provision/scripts/install/install-nix.sh;
  . ~/.nix-profile/etc/profile.d/nix.sh;
  /tmp/provision/nix/installer/install-env.sh;
  git clone https://github.com/fishi0x01/provision.git ~/provision;
  make -C ~/provision/ install-dotfiles;
  echo "Please run source ~/.nix-profile/etc/profile.d/nix.sh";
}

